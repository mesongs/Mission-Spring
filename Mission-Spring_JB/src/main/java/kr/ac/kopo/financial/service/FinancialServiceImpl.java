package kr.ac.kopo.financial.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.ac.kopo.financial.dao.FinancialDAO;
import kr.ac.kopo.financial.vo.ReturnSalesVO;
import kr.ac.kopo.financial.vo.SalesReportVO;
import kr.ac.kopo.financial.vo.SalesVO;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;

@Service
public class FinancialServiceImpl implements FinancialService {

	@Autowired
	private FinancialDAO financialDAO;
	
	@Override
	public void batchInsertSalesService(String businessNo, String dealDate) {
		
		List<SalesVO> salesList = new ArrayList<SalesVO>();
		
		OkHttpClient client = new OkHttpClient();
		
		Request request = new Request.Builder()
		  .url("http://34.145.45.161:9999/jb/sales?dealDate="+ dealDate + "&businessNo=" + businessNo)
		  .get()
		  .addHeader("cache-control", "no-cache")
//		  .addHeader("postman-token", "1bf3046c-0bd9-ac1b-fd51-bb8df70e0f9a")
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
			
			System.out.println(salesList.get(0));
			System.out.println(salesList.get(1));
			System.out.println(salesList.get(2));
			
			
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
		
		return map;
		
	}

	
	
	
	
	
	
}
