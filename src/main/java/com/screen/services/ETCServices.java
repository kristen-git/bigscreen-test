package com.screen.services;

import java.util.List;
import java.util.Map;

import com.screen.vo.EchartVo;

public interface ETCServices {
	//柱状图、折线图、饼状图
	public EchartVo echarts();


	// 根据省份，得到月份办理量统计信息
	public EchartVo listETC();
	
	
	public EchartVo top10ETC(String month);
	
	public List<Integer> rankETC();
}
