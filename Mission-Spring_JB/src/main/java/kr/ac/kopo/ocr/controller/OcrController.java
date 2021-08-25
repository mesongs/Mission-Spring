package kr.ac.kopo.ocr.controller;

import org.springframework.beans.factory.support.ReplaceOverride;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import okhttp3.ResponseBody;

@Controller
public class OcrController {
	
	
	@RequestMapping("/ocr")
	public ModelAndView generalOcr() {
		
		
		OkHttpClient client = new OkHttpClient();
		
		
		ModelAndView mav = new ModelAndView("ocr/generalOcr"); 
		
		MediaType mediaType = MediaType.parse("application/json");
		
		RequestBody body = RequestBody.create(mediaType, "{\n\t\"version\" : \"V1\","
				+ "\n\t\"requestId\" : \"test2\","
				+ "\n\t\"timestamp\" : 0,"
				+ "\n\t\"images\" :[{\n\t\t\n\t\t\"format\" : \"png\","
				+ "\n\t\t\"url\" : \"https://kr.object.ncloudstorage.com/testbucke/KakaoTalk_20210815_174210497.png\","
				+ "\n\t\t\"name\" : \"KakaoTalk_20210815_174210497.png\"\n\t}]\n}");
		
		Request request = new Request.Builder()
				.url("https://55c7547061ee4d91891f615ee5e7c101.apigw.ntruss.com/custom/v1/10737/a4ea6ab1e2b24fda85a939e66443d9c380440ecaf6e6e6069e248761c5a0353b/general")
				.post(body)
				.addHeader("content-type", "application/json")
				.addHeader("x-ocr-secret", "cHBIclVDQnZaV3NkQVJBUnRhaGdsaGxMTEllSEtzSkM=")
				.addHeader("cache-control", "no-cache")
//		  		.addHeader("postman-token", "31917011-c262-8273-4761-7a87eef0d3fa")
				.build();
		
		try {
			
			Response response = client.newCall(request).execute();
			ResponseBody responseBody = response.body();

			// general OCR로 받아온 결과값 출력
			
			String result = responseBody.string();
			System.out.println("api로 받아온 general OCR : " + result);
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mav;
		
	}
	
	
	@RequestMapping("/ocr/test")
	@org.springframework.web.bind.annotation.ResponseBody
	public String testOcr() {
		
		String result = "{\"version\":\"V1\",\"requestId\":\"test2\",\"timestamp\":1629871906594,\"images\":[{\"uid\":\"01b88d6d115f4f4c88f0b976feb83f45\",\"name\":\"KakaoTalk_20210815_174210497.png\",\"inferResult\":\"SUCCESS\",\"message\":\"SUCCESS\",\"validationResult\":{\"result\":\"NO_REQUESTED\"},\"fields\":[{\"valueType\":\"ALL\",\"boundingPoly\":{\"vertices\":[{\"x\":17.0,\"y\":19.0},{\"x\":105.0,\"y\":19.0},{\"x\":105.0,\"y\":60.0},{\"x\":17.0,\"y\":60.0}]},\"inferText\":\"SKT\",\"inferConfidence\":1.0},{\"valueType\":\"ALL\",\"boundingPoly\":{\"vertices\":[{\"x\":113.0,\"y\":29.0},{\"x\":153.0,\"y\":29.0},{\"x\":153.0,\"y\":45.0},{\"x\":113.0,\"y\":45.0}]},\"inferText\":\"TALK\",\"inferConfidence\":0.9992},{\"valueType\":\"ALL\",\"boundingPoly\":{\"vertices\":[{\"x\":722.0,\"y\":17.0},{\"x\":811.0,\"y\":17.0},{\"x\":811.0,\"y\":65.0},{\"x\":722.0,\"y\":65.0}]},\"inferText\":\"96%\",\"inferConfidence\":1.0},{\"valueType\":\"ALL\",\"boundingPoly\":{\"vertices\":[{\"x\":852.0,\"y\":12.0},{\"x\":951.0,\"y\":12.0},{\"x\":951.0,\"y\":69.0},{\"x\":852.0,\"y\":69.0}]},\"inferText\":\"오후\",\"inferConfidence\":1.0},{\"valueType\":\"ALL\",\"boundingPoly\":{\"vertices\":[{\"x\":955.0,\"y\":15.0},{\"x\":1053.0,\"y\":15.0}";
				
		// 숫자와 공백을 제외하고 정규식으로 공백으로 치환해보자
		// 원본은 그대로 유지되고, 바뀐 문자열이 새로 생성이 되어서 반환됨, 그래서 항상 바뀐 문자열을 반환값으로 받아야함
		
		String test = result.replaceAll("{", " ");
		System.out.println(test);
		
		
		
		
		return result;
		
	}
	
	
}
		
		
		
		
		

	
	


