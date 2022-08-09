package com.screen.interceptor;

/**
 * @Author: zhuangxin
 * @CreateTime: 2022-08-07  23:22
 * @Description: TODO
 */
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Map;


@Component
public class HttpAuthHandler extends TextWebSocketHandler {

    /**
     * 日志
     */
    private static final Logger log = LoggerFactory.getLogger(MyInterceptor.class);

    /**
     * socket 建立成功事件
     */
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        String token = session.getHandshakeHeaders().get("sec-websocket-protocol").get(0);
//        Object token = session.getAttributes().get("token");
        if (token != null) {
            // 用户连接成功，放入在线用户缓存
            WsSessionManager.add(token, session);
            session.sendMessage(new TextMessage("connection to ws succeeded!"));
        } else {
            throw new RuntimeException("用户登录已经失效!");
        }
    }

    /**
     * 接收消息事件
     */
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        // 获得客户端传来的消息
        String payload = message.getPayload();
//        Object token = session.getHandshakeHeaders().get("sec-websocket-protocol");
////        Object token = session.getAttributes().get("token");
//        log.info("server 接收到 " + token + " 发送的 " + payload);
        session.sendMessage(new TextMessage("server 发送给 " + " 消息 " + payload + " " + LocalDateTime.now().toString()));
    }
    /**
     * 发送广播消息
     *
     * @param message 消息内容
     */
    public static void sendTopic(String message) {
        if (WsSessionManager.SESSION_POOL.isEmpty()) {
            return;
        }
        for (Map.Entry<String, WebSocketSession> entry : WsSessionManager.SESSION_POOL.entrySet()) {
            try {
                entry.getValue().sendMessage(new TextMessage(message));
            } catch (IOException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 点对点发送消息
     *
     * @param uid     用户
     * @param message 消息
     */
    public static void sendToUser(String uid, String message) {
        WebSocketSession socketSession = WsSessionManager.SESSION_POOL.get(Integer.parseInt(uid));
        if (socketSession == null) {
            return;
        }
        try {
            socketSession.sendMessage(new TextMessage(message));
        } catch (IOException e) {
            log.error("send to user:{}, error! data:{}", uid, message);
        }
    }

    /**
     * socket 断开连接时
     */
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        Object token = session.getHandshakeHeaders().get("sec-websocket-protocol");
//        Object token = session.getAttributes().get("token");
        if (token == null) {
            // 用户退出，移除缓存
            WsSessionManager.remove(token.toString());
        }
    }

}
