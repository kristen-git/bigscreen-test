package com.screen.controller;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.screen.services.ETCServices;
import com.screen.vo.EchartVo;

@Controller
@RequestMapping(value = "/api/screen")
public class ETCController {
	@Autowired
	private ETCServices etcServices;
	
	@RequestMapping(value="/etcs", method=RequestMethod.GET)
	public String infos() {
		return JSON.toJSONString(etcServices.listETC());
	}
	
	@RequestMapping("/index")
    public String websocketEcharts() {
        return "index";
    }
	
	@RequestMapping("/bigscreen")
    public String bigScreenDispaly() {
        return "index";
    }

}
