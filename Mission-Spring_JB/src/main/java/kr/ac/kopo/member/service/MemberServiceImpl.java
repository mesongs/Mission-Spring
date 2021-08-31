package kr.ac.kopo.member.service;

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
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.vo.LoginVO;
import kr.ac.kopo.member.vo.MemberVO;


@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	// MemberDAO에 해당하는 값 알아서 찾아서 넣어줌
	// Impl2 만들어서 기존의 Impl을 변경해줄 때 유용
	
	public LoginVO login(LoginVO login) {

		LoginVO userVO = memberDAO.login(login);

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
	
	

}
