package kr.ac.kopo.financial.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.ac.kopo.financial.dao.FinancialDAO;
import kr.ac.kopo.financial.vo.salesVO;
import kr.ac.kopo.member.dao.MemberDAO;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;

@Service
public class FinancialServiceImpl implements FinancialService {

	@Autowired
	private FinancialDAO financialDAO;
	
	@Override
	public List<salesVO> getSalesReportService(String businessNo, String dealDate) {
		
		salesVO salesVO = new salesVO();
		List<salesVO> salesList = new ArrayList<salesVO>();
		
		OkHttpClient client = new OkHttpClient();
		
		Request request = new Request.Builder()
		  .url("http://34.145.45.161:9999/jb/sales?dealDate="+ dealDate + "&businessNo=" + businessNo)
		  .get()
		  .addHeader("cache-control", "no-cache")
		  .addHeader("postman-token", "1bf3046c-0bd9-ac1b-fd51-bb8df70e0f9a")
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
				
				salesVO.setBusinessNo(result.get(i).path("businessNo").asText());
				salesVO.setDealDate(result.get(i).path("dealDate").asText());
				salesVO.setApprovalNo(result.get(i).path("approvalNo").asText());
				salesVO.setDealTime(result.get(i).path("dealTime").asText());
				salesVO.setCardName(result.get(i).path("cardName").asText());
				salesVO.setCardNumber(result.get(i).path("cardNumber").asText());
				salesVO.setApprovalAmount(result.get(i).path("approvalAmount").asInt());
				salesVO.setInstallmentPeriod(result.get(i).path("approvalAmount").asText());
				
				salesList.add(salesVO);
			}
			
			//financialDAO.디비에 리스트insert();
			System.out.println(salesList.get(0));
			System.out.println(salesList.get(1));
			System.out.println(salesList.get(2));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return null;
	}


	
	
	
	
	
}
