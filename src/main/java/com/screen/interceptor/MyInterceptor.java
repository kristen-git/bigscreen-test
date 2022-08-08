package com.screen.interceptor;

/**
 * @Author: zhuangxin
 * @CreateTime: 2022-08-07  23:25
 * @Description: TODO
 */


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.HttpHeaders;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

@Component
public class MyInterceptor implements HandshakeInterceptor {

    @Autowired
    private RedisTemplate redisTemplate;

    @Autowired
    private JwtUtils jwtUtils;

    @Override
    public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Map<String, Object> attributes) throws Exception {
        System.out.println("握手开始");
        //通过协议获得token
        Object token = request.getHeaders().get("sec-websocket-protocol").get(0);
        if(!Objects.isNull(token)) {
            System.out.println("用户" + token+ " 握手成功！");
            return true;
        }
        return false;
    }

    /**
     * 握手后
     */
    @Override
    public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Exception exception) {
        System.out.println("握手完成");
    }

}

