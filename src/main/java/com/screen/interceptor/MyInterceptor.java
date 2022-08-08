package com.screen.interceptor;

/**
 * @Author: zhuangxin
 * @CreateTime: 2022-08-07  23:25
 * @Description: TODO
 */

/*
 * *
 *  * blog.coder4j.cn
 *  * Copyright (C) 2016-2019 All Rights Reserved.
 *
 */

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.HttpHeaders;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

import java.util.HashMap;
import java.util.Map;

@Component
public class MyInterceptor implements HandshakeInterceptor {

    @Autowired
    private RedisTemplate redisTemplate;

    @Autowired
    private JwtUtils jwtUtils;

    @Override
    public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Map<String, Object> attributes) throws Exception {
        System.out.println("握手开始");
        // 通过URL获得请求参数
//        ServletServerHttpRequest serverHttpRequest = (ServletServerHttpRequest) request;
//
//        Object token = serverHttpRequest.getServletRequest().getParameter("token");
        //握手时验证token是否有效
        String token = request.getHeaders().get("token").get(0);

        //通过协议获得token
//        Object token = request.getHeaders().get("sec-websocket-protocol").get(0);
        String uid = redisTemplate.opsForValue().get(token).toString();
        if (!uid.isEmpty()) {
            // 放入属性域
            attributes.put("token",token);

            System.out.println("用户" + uid + token+ " 握手成功！");
            return true;
        }else{
            System.out.println("用户登录已失效");
        }

        return false;
    }

    /**
     * 握手后
     *
     * @param request
     * @param response
     * @param wsHandler
     * @param exception
     */
    @Override
    public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Exception exception) {
        System.out.println("握手完成");
    }

}

