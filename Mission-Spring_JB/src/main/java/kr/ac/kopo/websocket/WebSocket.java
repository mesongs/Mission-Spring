package kr.ac.kopo.websocket;
 
import java.util.ArrayList;
import java.util.List;
 
import javax.websocket.server.ServerEndpoint;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
 
import javax.websocket.RemoteEndpoint.Basic;
 
@Controller
@ServerEndpoint(value="/echo")
public class WebSocket {
    
    private static final List<Session> sessionList = new ArrayList<Session>();
    
    public WebSocket() {
        System.out.println("웹소켓(서버) 객체생성");
    }
    
    @RequestMapping(value="/chat.do")
    public ModelAndView getChatViewPage(ModelAndView mav) {
        mav.setViewName("chat");
        return mav;
    }
    
    @OnOpen //클라이언트가 웹소켓에 들어오고 서버에 아무런 문제 없이 들어왔을때 실행하는 메소드
    public void onOpen(Session session) {
        //logger.info("Open session id:"+session.getId());
        try {
            final Basic basic=session.getBasicRemote();
            //basic.sendText("Connection Established");
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
        sessionList.add(session);
    }
    
    /*
     * 모든 사용자에게 메시지를 전달한다.
     * @param self
     * @param message
     */
    private void sendAllSessionToMessage(Session self, String message) {
       String send = message.split(",")[0];
       
        try {
            for(Session session : WebSocket.sessionList) {
                if(!self.getId().equals(session.getId())) {
                    session.getBasicRemote().sendText(send);
                }
            }
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
    }
    
    // 웹 소켓에서 메시지가 날라왔을 때 호출
    @OnMessage //클라이언트에게 메시지가 들어왔을 때, 실행되는 메소드
    public void onMessage(String message, Session session) {
    	
    	System.out.println(message);
    	
        //logger.info("Message From "+message.split(",")[1] + ": "+message.split(",")[0]);
        try {
            final Basic basic=session.getBasicRemote();
            basic.sendText("to : "+ message);
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
        sendAllSessionToMessage(session, message);
    }
    
    @OnError
    public void onError(Throwable e,Session session) {
        
    }
    
    //웹 소켓이 닫혔을 때 호출(또는 브라우저가 닫혔을 때 호출)
    @OnClose // 클라이언트와 웹소켓과의 연결이 끊기면 실행되는 메소드
    public void onClose(Session session) {
       System.out.println("onClose 메소드");
        //logger.info("Session "+session.getId()+" has ended");
        sessionList.remove(session);
    }
}

