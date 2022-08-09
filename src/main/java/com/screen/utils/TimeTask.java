package com.screen.utils;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;

import com.screen.interceptor.HttpAuthHandler;
import com.screen.interceptor.JwtUtils;
import com.screen.interceptor.WsSessionManager;
import io.jsonwebtoken.Jwt;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.screen.server.WebSocketServer;
import com.screen.services.ETCServices;
import com.screen.vo.EchartVo;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

@Component
@EnableScheduling
public class TimeTask {
    @Autowired
    private JwtUtils jwtUtils;
	
	@Autowired
	private ETCServices etcServices;

	@Autowired
    private RedisTemplate redisTemplate;

    static Log log = LogFactory.getLog(TimeTask.class);

    @Bean
    @Scheduled(cron = "0/3 * * * * ?") // 每分钟执行一次
    public TaskScheduler taskScheduler() {

        System.err.println("*********   定时任务执行   **************");
        ThreadPoolTaskScheduler taskScheduler = new ThreadPoolTaskScheduler();
        taskScheduler.setPoolSize(10);
        taskScheduler.initialize();
//        CopyOnWriteArraySet<WebSocketServer> webSocketSet = WebSocketServer.getWebSocketSet();

        /**
         * 验证 token 是否 到期有效
         */
        //先获得manager对象，在获得session，在map<token,session> for循环中
        //先验证token是否有效，再拿到websocket 的 session比对 userId 是否正确
        // this.session.getBasicRemote().sendText(message);

        ConcurrentHashMap<String, WebSocketSession> map = WsSessionManager.SESSION_POOL;

        if(map.isEmpty()){
            return taskScheduler;
        }

        for (String key:map.keySet()) {
            WebSocketSession webSocketSession = map.get(key);
            if(key!=null){
                try {
                    System.out.println("server发送消息");
                    TextMessage textMessage = new TextMessage("server 发送给 " +
                            redisTemplate.opsForValue().get(key) + " 消息 " + " " + LocalDateTime.now().toString());
                    webSocketSession.sendMessage(textMessage);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            else{
                WsSessionManager.remove(key.toString());
            }
        }

        System.err.println("定时任务完成.......");
        return taskScheduler;
    }
    
}
