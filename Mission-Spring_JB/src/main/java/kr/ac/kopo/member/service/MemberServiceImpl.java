package kr.ac.kopo.member.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.ThreadLocalRandom;

import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.support.RootBeanDefinition;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.vo.LoginVO;
import kr.ac.kopo.member.vo.MemberVO;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import okhttp3.ResponseBody;


@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	// MemberDAO에 해당하는 값 알아서 찾아서 넣어줌
	// Impl2 만들어서 기존의 Impl을 변경해줄 때 유용
	@Override
	public LoginVO login(LoginVO login) {

		LoginVO userVO = memberDAO.login(login);
		
		return userVO;
	}
	
	@Override
	public LoginVO kakaoLogin(LoginVO login) {
		
		LoginVO userVO = memberDAO.kakaoLogin(login);
		
		return userVO;
	}

	@Override
	public String idCheck(String inputId) {

		String valid = memberDAO.idCheck(inputId);

		return valid;
	}

	@Override
	public int emailCheck(String email) {

		// 서비스단에서 email 인증 보내기
		// 6자리 인증번호 생성 (100000 ~ 999999)

		String mail_id = "jb8068049@gmail.com";
		String mail_pwd = "whd806712./!";
		
		int authNo = ThreadLocalRandom.current().nextInt(100000, 1000000);
		
		// 서버 정보 설정
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "465");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(mail_id, mail_pwd);
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(mail_id));

			session.setDebug(true);

			// 수신자 메일 주소
			message.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(email));

			// Subject
			message.setSubject("하나WITH 인증번호 발송 안내 메일입니다.");

			// Text
			message.setText("[하나WITH] 인증번호 6자리 : " + authNo);

			// send the message
			Transport.send(message); //// 전송

			System.out.println("message sent successfully...");
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}

		return authNo;
	}

	@Override
	@Transactional
	public void signUp(MemberVO member) {
		
		// 회원_TB와 사업장_TB insert
		memberDAO.signUpMember(member);
		memberDAO.signUpBusiness(member);
		
	}

	@Override
	public HashMap<String, Object> searchStoreService(Map<String, Object> param) {
		
		HashMap<String, Object> map = new HashMap<>();
		
		String storeMaster = (String)param.get("storeMaster");
		String openDate = (String)param.get("openDate");
		String businessNo = (String)param.get("businessNo");
		
		OkHttpClient client = new OkHttpClient();
		
		MediaType mediaType = MediaType.parse("application/json");
		RequestBody body = RequestBody.create(mediaType, "{\r\n  \"businesses\": [\r\n    {\r\n      \"b_no\": \""+ businessNo +"\",\r\n      \"start_dt\": \""+ openDate +"\",\r\n      \"p_nm\": \""+ storeMaster +"\"\r\n    }\r\n  ]\r\n}");
		Request request = new Request.Builder()
		  .url("https://api.odcloud.kr/api/nts-businessman/v1/validate?serviceKey=cbaVmig8zh5%2FsmanPAXPhBq%2FuFMEwlt3pZ9iq9t4WsoM%2BFQuMoz0Vu1COXfqjuAMjIoi259j6NE6xdoDDNSmNQ%3D%3D")
		  .post(body)
		  .addHeader("content-type", "application/json")
		  .addHeader("cache-control", "no-cache")
		  .build();
		
		try {
			
			Response response = client.newCall(request).execute();
			
			ResponseBody responseBody = response.body();
			
			String result = responseBody.string();
			// {"request_cnt":1,"status_code":"OK","data":[{"b_no":"6052355267","valid":"02","valid_msg":"확인할 수 없습니다.","request_param":{"b_no":"6052355267","start_dt":"ㅇㄴㄹ","p_nm":"ㅇㄹ"}}]}

			ObjectMapper mapper = new ObjectMapper();
			
//			String test = mapper.writeValueAsString(result);
			
//			System.out.println("writeValue한 것 : " + test);
			
			JsonNode root = mapper.readTree(result);
			
			// JsonNode형식을 String으로 바로 형변환 할 수 없음, 그래서 map<String, Object(jsonNode형)>으로 값을 넣어서 반환해줌
			// 그런데 String str = root.path("data").get(0).findValue("valid").asText(); 이렇게 asText()넣으니까 String으로 형변환 가능함
			// findValues하면 List바로 반환할 수 있음
			
			map.put("key", root.path("data").get(0).findValue("valid"));
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return map;
	}
	
	
	
	

}
