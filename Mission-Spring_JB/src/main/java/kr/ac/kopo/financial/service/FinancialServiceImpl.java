package kr.ac.kopo.financial.service;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.ac.kopo.financial.dao.FinancialDAO;
import kr.ac.kopo.financial.vo.ReturnPurchaseVO;
import kr.ac.kopo.financial.vo.ReturnSalesVO;
import kr.ac.kopo.financial.vo.SalesReportVO;
import kr.ac.kopo.financial.vo.SalesVO;
import kr.ac.kopo.financial.vo.SmsReportInfoVO;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;

@Service
public class FinancialServiceImpl implements FinancialService {

	@Autowired
	private FinancialDAO financialDAO;
	
	@Override
	public void batchInsertSalesService() {
		
		List<SalesVO> salesList = new ArrayList<SalesVO>();
		
		// 스케줄러에서 파라미터 못 넘겨서 서비스에서 선언
		// 날짜는 전 일로, 매번 전 날 카드 매출 데이터를 insert함
		String dealDate ="20210102";
		
		// 여기서 다른 서비스 호출해서 회원 list 가져온 뒤, 회원들의 정보를 insert
		String businessNo = "6052355236";
		
		OkHttpClient client = new OkHttpClient();
		
		Request request = new Request.Builder()
		  .url("http://34.145.45.161:9999/jb/sales?dealDate="+ dealDate + "&businessNo=" + businessNo)
		  .get()
		  .addHeader("cache-control", "no-cache")
		  .build();
		
		try {
			
			Response response = client.newCall(request).execute();
			
			ResponseBody responseBody = response.body();
				        
			String getResult = responseBody.string();
			
			System.out.println(getResult);
			// parsing한 후, DB에 Insert
			// {"result":[{"businessNo":"6052355236","dealDate":"20210829","approvalNo":"28605377","dealTime":"17:32:36","cardName":"하나카드","cardNumber":"123456789123456","approvalAmount":50000,"installmentPeriod":"3개월"},{"businessNo":"6052355236","dealDate":"20210829","approvalNo":"28665377","dealTime":"17:37:36","cardName":"하나카드","cardNumber":"123456789123456","approvalAmount":80000,"installmentPeriod":"3개월"},{"businessNo":"6052355236","dealDate":"20210829","approvalNo":"26605377","dealTime":"14:29:36","cardName":"하나카드","cardNumber":"123456789123456","approvalAmount":100000,"installmentPeriod":"2개월"}],"status":"OK","timestamp":"2021-09-07T10:53:46.278"}
			
			ObjectMapper mapper = new ObjectMapper();
			
			JsonNode root = mapper.readTree(getResult);
			JsonNode result = root.path("result");
			
			
			System.out.println("결과값 사이즈 : " + result.size());
			
			for(int i=0; i < result.size(); i++) {
				// 객체 새로 만들어서 List에 add
				SalesVO salesVO = new SalesVO();
				
				salesVO.setBusinessNo(result.get(i).path("businessNo").asText());
				salesVO.setDealDate(result.get(i).path("dealDate").asText());
				salesVO.setApprovalNo(result.get(i).path("approvalNo").asText());
				salesVO.setDealTime(result.get(i).path("dealTime").asText());
				salesVO.setCardName(result.get(i).path("cardName").asText());
				salesVO.setCardNumber(result.get(i).path("cardNumber").asText());
				salesVO.setApprovalAmount(result.get(i).path("approvalAmount").asInt());
				salesVO.setInstallmentPeriod(result.get(i).path("installmentPeriod").asText());
//				vo에 값 셋팅하기
				salesList.add(salesVO);
			}
			
//			System.out.println(salesList.get(0));
//			System.out.println(salesList.get(1));
//			System.out.println(salesList.get(2));
			
			
//			HashMap<String, Object> salesListMap = new HashMap<>();

//			salesListMap.put("salesList", salesList);
			
			// List를 map에 담아서 보내야 에러가 발생하지 않음, list로 넣어도됨
//			financialDAO.getSalesReportDao(salesListMap);
			
			
			// 이걸로 실행하면됨
			financialDAO.batchInsertSalesDao(salesList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	// 처음에는 result set을 가져와서 서비스에서 parsing하려고 했음..  그런담에 view에 넘겨주려했음
	// DB에서 처리한 값 map에 넣어서 반환
	@Override
	public HashMap<String, Object> getSalesInfo(String businessNo) {
		
		HashMap<String, Object> map = new HashMap<>();
		
//		List<SalesReportVO> salesReportList = financialDAO.getSalesReportDao(businessNo);	
		
		
//		여기서 dao를 여러 개 호출함, 호출한 값을 map에 저장해서 반환
		
//		최근 7일간 카드사별 결제금액 top5 (파라미터 : 날짜 + 사업장번호 )
//		파라미터를 날짜도 추가해야함 일주일 전 ~ 오늘 날짜
		List<ReturnSalesVO> cardApprovalTop5List = financialDAO.getCardApprovalTop5Dao(businessNo);
		
//		전 날 매출액, 전 전날 매출액, 증감률
		ReturnSalesVO returnSalesVO = financialDAO.getSalesSum(businessNo); 
		
//		지지난 달 매출액, 지난 달 매출액 매출액, 월 매출액 증감률
		
		ReturnSalesVO monthSalesVO = financialDAO.getMonthSales(businessNo);
		
		List<ReturnSalesVO> lastWeekSalesList =financialDAO.getLastWeekSales(businessNo);
		
		
		List<ReturnSalesVO> weekBeforeSalesList = financialDAO.getWeekBeforeSales(businessNo);
		
		int perCutomerSale = financialDAO.getPerCustomerSale(businessNo);
		ReturnSalesVO bytimeSale = financialDAO.getByTime(businessNo);
		ReturnSalesVO bytimeSale2 = financialDAO.getByTime2(businessNo);
		
		
		List<ReturnSalesVO> getCustomerKindSaleList = financialDAO.getCustomerKindSaleList(businessNo);
		List<ReturnSalesVO> getWeekCustomerKindSaleList = financialDAO.getWeekCustomerKindSaleList(businessNo);
		
		map.put("cardApprovalTop5List", cardApprovalTop5List); 
		map.put("returnSalesVO", returnSalesVO);
		map.put("lastWeekSalesList", lastWeekSalesList);
		map.put("weekBeforeSalesList", weekBeforeSalesList);
		map.put("perCutomerSale", perCutomerSale);
		map.put("bytimeSale", bytimeSale);
		map.put("bytimeSale2", bytimeSale2);
		map.put("getCustomerKindSaleList", getCustomerKindSaleList);
		map.put("getWeekCustomerKindSaleList", getWeekCustomerKindSaleList);
		map.put("monthSalesVO", monthSalesVO);
		
		return map;
		
	}

	
	@Override
	public HashMap<String, Object> getPurchaseInfo(String businessNo) {
		
		HashMap<String, Object> map = new HashMap<>();
		// List로 받아온 뒤 map으로 저장 => map의 key값으로 공유영역에 저장
		
		// 최근 7일간 매입내역 건 수, 합계금액, 수
		List<ReturnPurchaseVO> recentWeekPurchaseList = financialDAO.getRecentWeekSalesListDao(businessNo);
		
		List<ReturnPurchaseVO> recentWeekPurchaseTrend = financialDAO.getRecentWeekPurchaseTrendDao(businessNo);
		
		List<ReturnPurchaseVO> getLastTwoWeekPurchaseTrend = financialDAO.getLastTwoWeekPurchaseTrendDao(businessNo);
		
		List<ReturnPurchaseVO> recentMonthPurchaseList = financialDAO.getMonthPurchaseListDao(businessNo);
		
		List<ReturnPurchaseVO> weekDeductionList = financialDAO.weekDeductionDao(businessNo);
		
		List<ReturnPurchaseVO> weekTop3StoreList = financialDAO.weekTop3StoreDao(businessNo);
		
		ReturnPurchaseVO recentWeekSumCountVO = financialDAO.getRecentWeekSumCount(businessNo);
		ReturnPurchaseVO twoWeekSumCountVO = financialDAO.getTwoWeekSumCount(businessNo);
		
		map.put("recentWeekPurchaseList", recentWeekPurchaseList);
		map.put("recentWeekPurchaseTrend", recentWeekPurchaseTrend);
		map.put("getLastTwoWeekPurchaseTrend", getLastTwoWeekPurchaseTrend);
		
		map.put("recentMonthPurchaseList", recentMonthPurchaseList);
		map.put("weekDeductionList", weekDeductionList);
		map.put("weekTop3StoreList", weekTop3StoreList);
		
		map.put("recentWeekSumCountVO", recentWeekSumCountVO);
		map.put("twoWeekSumCountVO", twoWeekSumCountVO);
		
		return map;
	}


	@Override
	public void sendSmsSummary() {
		
		String api_key = "NCSRI4WNPD7KEZQ6";
		String api_secret = "WASOT4YPEKCAPHICV7KM1IWKFESCN4EK";

		Message coolsms = new Message(api_key, api_secret);
		
		// sms정보 수신 동의한 회원들의 정보만 가져옴(전화번호, 사업장명 등)
		SmsReportInfoVO smsCustomerInfo = financialDAO.getPhoneNumber();
		
		String sendStoreName =  smsCustomerInfo.getStoreName();
		String phoneNumber = smsCustomerInfo.getPhone();
		String businessNo = smsCustomerInfo.getBusinessNo();
		
		// 파라미터로 넘길 날짜 추출
		Calendar calendar = new GregorianCalendar();
		SimpleDateFormat SDF = new SimpleDateFormat("yyyyMMdd");
		// 오늘 날짜
		String chkDate = SDF.format(calendar.getTime());		
//		System.out.println("Today : " + chkDate);

		// 날짜에서 요일 추출하기
		String []weeks = {"일","월","화","수","목","금","토"};
		Calendar c= Calendar.getInstance();
		
		// 어제 날짜 구하기(시나리오 시간 6월 30일 => 6월 29일 날짜 구해야함)
		calendar.add(Calendar.DATE, -90);
		String yesterdayDate = SDF.format(calendar.getTime());
		
//		System.out.println("어제 시간 설정하기" + yesterdayDate);
		
		String sendYesterdayDate = getDate(yesterdayDate);
//		System.out.println("날짜추출한거 : "+subYesterdayDate);
		
//		System.out.println("어제날짜 : " + yesterdayDate);
		c.set(Integer.parseInt(yesterdayDate.substring(0,4))
		        ,Integer.parseInt(yesterdayDate.substring(4,6))-1
		        ,Integer.parseInt(yesterdayDate.substring(6,8)) );
		String sendYesterdayWeek= "("+weeks[c.get(Calendar.DAY_OF_WEEK)-1]+")"; 
		
		
		// 그저 께 날짜 구하기, 처음에 -2했는데, 이미 -1되있으니까 여기서 -1만 해주면됨
		calendar.add(Calendar.DATE, -1);		
		String dayBeforeDate = SDF.format(calendar.getTime());	
		
//		System.out.println("그저께 시간 설정하기" + dayBeforeDate);
		
		String sendDayBeforeDate = getDate(dayBeforeDate);
//		System.out.println("그저께 날짜 : " + dayBeforeDate);
		c.set(Integer.parseInt(dayBeforeDate.substring(0,4))
		        ,Integer.parseInt(dayBeforeDate.substring(4,6))-1
		        ,Integer.parseInt(dayBeforeDate.substring(6,8)) );
		String sendDayBeforeWeek= "("+ weeks[c.get(Calendar.DAY_OF_WEEK)-1] + ")";
		
		SmsReportInfoVO requestInfo = new SmsReportInfoVO();
		
		requestInfo.setBusinessNo(businessNo);
		requestInfo.setYesterday(yesterdayDate);
		requestInfo.setDayBefore(dayBeforeDate);
		
		// 사업자번호는 이미 들어있으니까 어제랑 그저께 날짜만 set해서 보내줌
		SmsReportInfoVO sendInfoVO = financialDAO.getYesterdayDayBeforeSales(requestInfo);
		
		
		// storeName변수와 sendInfoVO가지고 있는 값을 문자로 전송함
		// sendInfo에 전 날 매출액 + 전 전날 매출액
		int yesterdaySalesSum = sendInfoVO.getYesterdaySum();
		int dayBeforeSalesSum = sendInfoVO.getDayBeforeSum();
		
		// 숫자 콤마 찍기
		DecimalFormat formatter = new DecimalFormat("###,###");
		
		String sendYesterdaySalesSum = formatter.format(yesterdaySalesSum) + "원";
		String sendDayBeforeSalesSum = formatter.format(dayBeforeSalesSum) + "원";
		String sendfullYesterday = sendYesterdayDate + sendYesterdayWeek;
		String sendfullDayBefore = sendDayBeforeDate + sendDayBeforeWeek;
		

	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", phoneNumber);
	    params.put("from", "01090258049");
	    params.put("type", "LMS");
	    params.put("text", "[사업보고서 업데이트 안내]" + "\n" 
						+ "안녕하세요. 하나WITH입니다." + "\n"
						+ sendStoreName + " 사장님의 사업보고서가 업데이트 되었습니다." + "\n"
						+ sendfullYesterday + " 매출 : " + sendYesterdaySalesSum + "\n"
						+ sendfullDayBefore + " 매출 : " + sendDayBeforeSalesSum + "\n"
						+ "자세한 사항은 하나WITH 홈페이지에서 확인하실 수 있습니다.");	

//[사업보고서 업데이트 안내]
//안녕하세요. 하나WITH입니다.
//미송초밥 사장님의 사업보고서가 업데이트 되었습니다.
//09-24(금요일) 매출액 : 240,000원
//09-23(금요일) 매출액 : 330,000원
//자세한 사항은 하나WITH 홈페이지에서 확인하실 수 있습니다.
			
			
			try {
				// json 형식으로 변경해서 api 요청
				JSONObject obj = (JSONObject) coolsms.send(params);
				System.out.println(obj.toString());

			} catch (CoolsmsException e) {
				System.out.println(e.getMessage());
				System.out.println(e.getCode());
			}
			
		
		
	}

	// 날짜 20210924 => 하이픈 추가(sms로 필요한 것만..), substring으로 09-24이렇게 뽑아내기 
	public static String getDate(String str) {
        
		String monthDay = null ;
		
        if(str == null) {
            return str;
        }
        
        int size = str.length();
        
        if(size==4) {
            return str;
        }else if(size==6) {
            str = str.substring(0,4)+"-"+str.substring(4,6);
        }else if(size==8) {
            str = str.substring(0,4)+"-"+str.substring(4,6)+"-"+str.substring(6,8);
            monthDay = str.substring(5,10);
        }else {
            return str;
        }
        
        return monthDay;
        
    }
	
	
	
	
	
	
}
