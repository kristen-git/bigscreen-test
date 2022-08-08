//package com.screen.interceptor;
//
///**
// * @Author: zhuangxin
// * @CreateTime: 2022-08-05  10:01
// * @Description: TODO
// */
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.redis.core.RedisTemplate;
//import org.springframework.http.server.ServerHttpRequest;
//import org.springframework.http.server.ServerHttpResponse;
//import org.springframework.http.server.ServletServerHttpRequest;
//import org.springframework.web.socket.WebSocketHandler;
//import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;
//
//import java.util.Map;
//
//
//public class MyWebSocketInterceptor extends HttpSessionHandshakeInterceptor {
//
//    private final Logger logger = LoggerFactory.getLogger(getClass());
//
//    @Autowired
//    private RedisTemplate redisTemplate;
//
//    @Override
//    public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Map<String, Object> attributes) throws Exception {
//        logger.info("[MyWebSocketInterceptor#BeforeHandshake] Request from " + request.getRemoteAddress().getHostString());
//        if (request instanceof ServletServerHttpRequest){
//            ServletServerHttpRequest serverHttpRequest = (ServletServerHttpRequest) request;
//            // 第一种取header中的值
//            // String token = serverHttpRequest.getServletRequest().getHeader("token");
//            // 第二种取url中的值
//            // String token = ((ServletServerHttpRequest) request).getServletRequest().getParameter("token");
//            // 第三种 需要返回相同的header
//            String token = serverHttpRequest.getServletRequest().getHeader("Sec-WebSocket-Protocol");
//            response.getHeaders().set("Sec-WebSocket-Protocol", token);
//
//            //这里做一个简单的鉴权，只有符合条件的鉴权才能握手成功
//            if (redisTemplate.opsForValue().get("token").equals(token)){
//                return super.beforeHandshake(request, response, wsHandler, attributes);
//            }else {
//                return false;
//            }
//        }
//        return super.beforeHandshake(request, response, wsHandler, attributes);
//    }
//
//    @Override
//    public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Exception ex) {
//        logger.info("[MyWebSocketInterceptor#afterHandshake] Request from " + request.getRemoteAddress().getHostString());
//    }
//}