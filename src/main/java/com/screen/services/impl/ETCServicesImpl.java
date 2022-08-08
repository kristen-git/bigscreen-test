package com.screen.services.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.screen.entity.CreditCardEo;
import com.screen.entity.ETCEo;
import com.screen.mapper.CreditCardMapper;
import com.screen.mapper.ETCMapper;
import com.screen.services.ETCServices;
import com.screen.vo.EchartVo;

@Service
public class ETCServicesImpl implements ETCServices {
	private int index = 0;
	private int rankIndex = 0;

	@Autowired
	private ETCMapper etcMapper;

	@Autowired
	private CreditCardMapper creditCardMapper;

	//将echarts的三个图展示在此
	@Override
	public EchartVo echarts() {

		return null;
	}

	@Override
	public EchartVo listETC() {
		// 按照ETC的办卡总量，将各个省份排序，由高到低高亮显示
		int provinceId=0;
		List<Integer> rank = rankETC();		
		if(rank!=null && rank.size()>0) {
			if(rankIndex == rank.size()-1) {
				rankIndex = 0;
			}
		}else {
			return null;
		}
		provinceId = rank.get(rankIndex++);
		
		List<ETCEo> etcEos = etcMapper.listETC(provinceId);

		int etcTotal = 0;
		int creditCardCapacityTotal = 0;
		int creditCardActiveTotal = 0;

		String provinceName = "";
		HashMap<String, String> month = null;
		EchartVo vo = new EchartVo();

		// MonthVolume - ETC按照省份，展示月份信息
		List<HashMap<String, String>> monthVolume = new ArrayList<HashMap<String, String>>();
		for (ETCEo eo : etcEos) {
			provinceName = eo.getBracnhName();
			month = new HashMap<String, String>();
			etcTotal = etcTotal + eo.getVolume();
			month.put("month", eo.getMonth());
			month.put("value", String.valueOf(eo.getVolume()));
			monthVolume.add(month);
		}
		vo.setMonthlVolume(monthVolume);

		// Top10ETC - 息公司开户、社保信息
		String monthStr = getMonth(index);
		if (index == 8) {
			index = 0;
		} else {
			index++;
		}
		List<ETCEo> topETC = etcMapper.top10ETC(monthStr);
		vo.setMonth(monthStr);
		List<HashMap<String, String>> top10ETC = new ArrayList<HashMap<String, String>>();
		HashMap<String, String> top = null;
		for (ETCEo eo : topETC) {
			top = new HashMap<String, String>();
			top.put("province", eo.getBracnhName());
			top.put("value", String.valueOf(eo.getVolume()));
			top10ETC.add(top);
		}
		vo.setTop10ETC(top10ETC);

		// creditCardInfo - 信用卡开卡量和激活量
		List<HashMap<String, String>> creditCardInfo = new ArrayList<HashMap<String, String>>();
		HashMap<String, String> creditCard = null;
		List<CreditCardEo> creditCardEos = creditCardMapper.listCreditCard(provinceId);
		for (CreditCardEo eo : creditCardEos) {
			creditCard = new HashMap<String, String>();
			creditCard.put("month", eo.getMonth());
			creditCard.put("cardCapacity", String.valueOf(eo.getCardCapacity()));
			creditCard.put("activeCapacity", String.valueOf(eo.getActiveCapacity()));
			
			creditCardCapacityTotal = creditCardCapacityTotal + eo.getCardCapacity();
			creditCardActiveTotal =  creditCardActiveTotal + eo.getActiveCapacity();

			creditCardInfo.add(creditCard);
		}
		vo.setCreditCardInfo(creditCardInfo);

		// MapInfo - 地图展示信息
		vo.setProvince(provinceName);
		List<HashMap<String, String>> mapInfos = new ArrayList<HashMap<String, String>>();
		
		HashMap<String, String> mapEtcInfo = new HashMap<String, String>();
		mapEtcInfo.put("label", "ETC签约数");
		mapEtcInfo.put("value", String.valueOf(etcTotal));
		mapInfos.add(mapEtcInfo);
		
		HashMap<String, String> mapCreditCardCapacityInfo = new HashMap<String, String>();
		mapCreditCardCapacityInfo.put("label", "信用卡开卡数");
		mapCreditCardCapacityInfo.put("value", String.valueOf(creditCardCapacityTotal));
		mapInfos.add(mapCreditCardCapacityInfo);
		
		HashMap<String, String> mapCreditCardActiveInfo = new HashMap<String, String>();
		mapCreditCardActiveInfo.put("label", "信用卡激活数");
		mapCreditCardActiveInfo.put("value", String.valueOf(creditCardActiveTotal));
		mapInfos.add(mapCreditCardActiveInfo);
		
		// TODO Hardcode 数据，需要真实数据填充
		Random rand = new Random();
		
		HashMap<String, String> mapSocialSecurityNumberInfo = new HashMap<String, String>();
		mapSocialSecurityNumberInfo.put("label", "社保卡办理数");
		mapSocialSecurityNumberInfo.put("value", String.valueOf(rand.nextInt(100000)));
		mapInfos.add(mapSocialSecurityNumberInfo);
		
		HashMap<String, String> mapCompanyOpenInfo = new HashMap<String, String>();
		mapCompanyOpenInfo.put("label", "公司开户数");
		mapCompanyOpenInfo.put("value", String.valueOf(rand.nextInt(100000)));
		mapInfos.add(mapCompanyOpenInfo);

		vo.setMapInfo(mapInfos);
		
		// 总量统计信息
		vo.setEtcTotal(etcMapper.totalETC());
		vo.setCreditCardCapacity(creditCardMapper.totalCreditCardCapacity());
		vo.setCreditCardActive(creditCardMapper.totalCreditCardActive());
		
		// TODO: 社保信息和公司开户，目前hardcode，不是真实数据
		vo.setSocialSecurityNumber(65003214);
		vo.setCompanyOpenNumber(8963631);

		rankETC();
		
		return vo;

	}

	private String getMonth(int index) {

		List<String> list = Arrays.asList("201901", "201902", "201903", "201904", "201905", "201906", "201907",
				"201908", "201909");

		return list.get(index);
	}

	@Override
	public EchartVo top10ETC(String month) {

		return null;
	}

	@Override
	public List<Integer> rankETC() {
		List<Integer> rank = etcMapper.rankETC();
		
		return rank;
	}

}
