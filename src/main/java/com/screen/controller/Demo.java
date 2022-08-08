//package com.screen.controller;
//
//import com.screen.server.WebSocketServer;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.web.socket.client.WebSocketClient;
//
//import java.net.URI;
//import java.net.URISyntaxException;
//import java.util.Scanner;
//
///**
// * @Author: zhuangxin
// * @CreateTime: 2022-08-05  10:03
// * @Description: TODO
// */
//
//@Slf4j
//public class Demo {
//    public static void main(String[] args) {
//        String currentPersonId = "wangwu";
//        WebSocketServer webSocketClient = null;
//        try {
//            webSocketClient = new WebSocketServer(new URI("ws://127.0.0.1:8080/websocket/" + currentPersonId));
//        } catch (URISyntaxException e) {
//            e.printStackTrace();
//        }
//        webSocketClient.addHeader("Sec-WebSocket-Protocol", "sadfasdfasdfsdf");
//        webSocketClient.connect();
//        webSocketClient.connectBlocking();
//        log.info("连接成功！");
//        Scanner scanner = new Scanner(System.in);
//        while (true) {
//            System.err.println(currentPersonId + " -> ");
//            String message = scanner.nextLine();
//            webSocketClient.send(message);
//        }
//    }
//}
