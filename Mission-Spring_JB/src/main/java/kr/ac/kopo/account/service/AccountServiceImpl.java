package kr.ac.kopo.account.service;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import kr.ac.kopo.account.vo.PolicyVO;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class AccountServiceImpl implements AccountService {

	// 오픈뱅킹 서비스 이용약관, 파일 read
	@Override
	public List<PolicyVO> policyAgree() {

		List<PolicyVO> policyList = new ArrayList<PolicyVO>();

		String[] fileNames = { "information", "personal", "service", "transaction" };
		String[] policyNames = { "오픈뱅킹 서비스 이용약관", "오픈뱅킹공동업무 금융정보조회 약관", "금융거래정보 제공동의", "개인(신용)정보수집/이용/제공 동의" };

		String line = "";
		String directoy = "C:\\Users\\HP\\git\\Mission-Spring_JB\\Mission-Spring_JB\\src\\main\\webapp\\resources\\policy\\";

		FileReader fr = null;
		BufferedReader br = null;

		try {

			for (int i = 0; i < fileNames.length; i++) {

				String text = "";
				fr = new FileReader(directoy + fileNames[i] + ".txt");
				br = new BufferedReader(fr);

				// readLine()은 String값으로 개행문자를 포함해 한 줄을 전부 읽어오는 방식
				while ((line = br.readLine()) != null) {

					text += line + "\n";
					// text ="", 첫 번째 줄 읽어서 바로 넣어주는데.. 왜 공백이..
				}

				PolicyVO vo = new PolicyVO();
				vo.setName(fileNames[i]); // 파일이름 => id에 부여해서 체크 확인했음
				vo.setTitle(policyNames[i]);
				vo.setContent(text);

				policyList.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				br.close();
				fr.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}

		}

		return policyList;
	}

	// 휴대폰 인증 동의 약관
	@Override
	public List<PolicyVO> authPolicyAgree() {
		List<PolicyVO> policyList = new ArrayList<PolicyVO>();

		String[] fileNames = { "personalAgree", "unique" };
		String[] policyNames = { "개인정보 이용 및 활용 동의", "고유식별정보 처리 동의" };

		String line = "";
		String directoy = "C:\\Users\\HP\\git\\Mission-Spring_JB\\Mission-Spring_JB\\src\\main\\webapp\\resources\\smsPolicy\\";

		FileReader fr = null;
		BufferedReader br = null;

		try {

			for (int i = 0; i < fileNames.length; i++) {

				String text = "";
				fr = new FileReader(directoy + fileNames[i] + ".txt");
				br = new BufferedReader(fr);

				// readLine()은 String값으로 개행문자를 포함해 한 줄을 전부 읽어오는 방식
				while ((line = br.readLine()) != null) {

					text += line + "\n";
					// text ="", 첫 번째 줄 읽어서 바로 넣어주는데.. 왜 공백이..
				}

				PolicyVO vo = new PolicyVO();
				vo.setName(fileNames[i]); // 파일이름 => id에 부여해서 체크 확인했음
				vo.setTitle(policyNames[i]);
				vo.setContent(text);

				policyList.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				br.close();
				fr.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}

		}

		return policyList;
	}

	// 인증번호 발송 - coolsms
	@Override
	public int smsAuth(String phoneNumber) {
		
		// 6자리 인증번호 생성 (100000 ~ 999999)
		int authNo = ThreadLocalRandom.current().nextInt(100000, 1000000); 
		
		String api_key = "NCSRI4WNPD7KEZQ6";
		String api_secret = "WASOT4YPEKCAPHICV7KM1IWKFESCN4EK";

		Message coolsms = new Message(api_key, api_secret);

//		4 params(to, from, type, text) are mandatory. must be filled
//		HashMap<String, String> params = new HashMap<String, String>();
//		params.put("to", "01000000000"); // 수신번호
//   	params.put("from", "01000000000"); // 발신번호
//  	params.put("type", "SMS"); // Message type ( SMS, LMS, MMS, ATA )
//		params.put("text", "Test Message"); // 문자내용
//		params.put("app_version", "JAVA SDK v1.2"); // application name and version(필수아님)

		HashMap<String, String> params = new HashMap<String, String>();
		
		params.put("to", phoneNumber);
		params.put("from", "01090258049");
		params.put("type", "SMS");
		params.put("text", "[하나WITH 인증번호 " + authNo + "]");

		try {
			// json 형식으로 변경해서 api 요청
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());

		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}

		return authNo;
	}

}
