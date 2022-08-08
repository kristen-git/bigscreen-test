package com.screen.server;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

@ServerEndpoint(value = "/websocket")
@Component
public class WebSocketServer {
	static Log log = LogFactory.getLog(WebSocketServer.class);

	// 静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
	private static int onlineCount = 0;

	// concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。
	private static CopyOnWriteArraySet<WebSocketServer> webSocketSet 
		= new CopyOnWriteArraySet<WebSocketServer>();

	// 与某个客户端的连接会话，需要通过它来给客户端发送数据
	private Session session;
	//map放 token和 websocketserver对象，来区分用户和token
	private static Map<String, WebSocketServer> map=new ConcurrentHashMap<>();
	/**
	 * 连接建立成功调用的方法
	 */
	@OnOpen
	public void onOpen(Session session) {
		Map<String, List<String>> requestParameterMap = session.getRequestParameterMap();
		this.session = session;
		webSocketSet.add(this); // 加入set中
		// 拿到token

		// 把token和this 塞到map里

		addOnlineCount(); // 在线数加1
		
//		ETCVo vo =  new ETCVo();
//		vo.setProvice("Hello");
//		vo.setTotal(100000);
//		 
//		try {
//			sendMessage(JSON.toJSONString(vo));
//			System.out.println(JSON.toJSONString(vo));
//		} catch (IOException e) {
//			System.out.println("IO异常");
//		}
	}

	/**
	 * 连接关闭调用的方法
	 */
	@OnClose
	public void onClose() {
		webSocketSet.remove(this); // 从set中删除
		subOnlineCount(); // 在线数减1
	}

	/**
	 * 收到客户端消息后调用的方法
	 *
	 * @param message 客户端发送过来的消息
	 */
	@OnMessage
	public void onMessage(String message, Session session) {
		System.out.println("来自客户端的消息:" + message);

		// 群发消息
		for (WebSocketServer item : webSocketSet) {
			try {
				item.sendMessage(message);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 发生错误时调用
	 */
	@OnError
	public void onError(Session session, Throwable error) {
		System.out.println("发生错误");
		error.printStackTrace();
	}

	public void sendMessage(String message) throws IOException {
		this.session.getBasicRemote().sendText(message);
	}

	/**
	 * 群发自定义消息
	 */
	public static void sendInfo(String message) throws IOException {
		for (WebSocketServer item : webSocketSet) {
			try {
				item.sendMessage(message);
			} catch (IOException e) {
				continue;
			}
		}
	}

	public static synchronized int getOnlineCount() {
		return onlineCount;
	}

	public static synchronized void addOnlineCount() {
		WebSocketServer.onlineCount++;
	}

	public static synchronized void subOnlineCount() {
		WebSocketServer.onlineCount--;
	}

	public Session getSession() {
		return session;
	}

	public void setSession(Session session) {
		this.session = session;
	}

	public static CopyOnWriteArraySet<WebSocketServer> getWebSocketSet() {
		return webSocketSet;
	}

	public static void setWebSocketSet(CopyOnWriteArraySet<WebSocketServer> webSocketSet) {
		WebSocketServer.webSocketSet = webSocketSet;
	}
}