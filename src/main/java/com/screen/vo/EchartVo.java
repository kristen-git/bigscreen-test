package com.screen.vo;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EchartVo {
	private String province;
	private String month;
	//某日交易量前十的券商名称及其证券 两融业务的交易量的map
	private Map<String,List> brokerTradeInfoDay;

	//统计从T日开始，往前十每个交易类型的交易笔数的折线图的日期
	private String[] rowTransdate;

	//统计从T日开始，往前十每个交易类型的交易笔数的折线图的map
	Map<String,int[]> integerMap;

	//统计过去30天每个交易类型的汇总金额
	Map<String, BigDecimal> tradeAmtSumMap;

	public Map<String, List> getBrokerTradeInfoDay() {
		return brokerTradeInfoDay;
	}
	public void setBrokerTradeInfoDay(Map<String, List> brokerTradeInfoDay) {
		this.brokerTradeInfoDay = brokerTradeInfoDay;
	}
	public String[] getRowTransdate() {
		return rowTransdate;
	}
	public void setRowTransdate(String[] rowTransdate) {
		this.rowTransdate = rowTransdate;
	}
	public Map<String, int[]> getIntegerMap() {
		return integerMap;
	}
	public void setIntegerMap(Map<String, int[]> integerMap) {
		this.integerMap = integerMap;
	}
	public Map<String, BigDecimal> getTradeAmtSumMap() {
		return tradeAmtSumMap;
	}
	public void setTradeAmtSumMap(Map<String, BigDecimal> tradeAmtSumMap) {
		this.tradeAmtSumMap = tradeAmtSumMap;
	}


	// 地图展示信息
	private List<HashMap<String, String>> mapInfo;
	// ETC按照省份，展示月份信息
	private List<HashMap<String, String>> monthlVolume;
	// TODO 公司开户、社保信息
	private List<HashMap<String, String>> top10ETC;
	// 信用卡展示信息
	private List<HashMap<String, String>> creditCardInfo;
	
	// ETC 全国签约量
	private int etcTotal;
	
	// 信用卡 开卡量
	private int creditCardCapacity;
	
	// 信用卡 激活量
	private int creditCardActive;
	
	// 社保卡
	private int socialSecurityNumber;
	
	// 公司开户
	private int companyOpenNumber;
	
	public EchartVo() {
		super();
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}
	

	public List<HashMap<String, String>> getMapInfo() {
		return mapInfo;
	}

	public void setMapInfo(List<HashMap<String, String>> mapInfo) {
		this.mapInfo = mapInfo;
	}

	public List<HashMap<String, String>> getMonthlVolume() {
		return monthlVolume;
	}

	public void setMonthlVolume(List<HashMap<String, String>> monthlVolume) {
		this.monthlVolume = monthlVolume;
	}

	public List<HashMap<String, String>> getTop10ETC() {
		return top10ETC;
	}

	public void setTop10ETC(List<HashMap<String, String>> top10etc) {
		top10ETC = top10etc;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public List<HashMap<String, String>> getCreditCardInfo() {
		return creditCardInfo;
	}

	public void setCreditCardInfo(List<HashMap<String, String>> creditCardInfo) {
		this.creditCardInfo = creditCardInfo;
	}

	public int getEtcTotal() {
		return etcTotal;
	}

	public void setEtcTotal(int etcTotal) {
		this.etcTotal = etcTotal;
	}

	public int getCreditCardCapacity() {
		return creditCardCapacity;
	}

	public void setCreditCardCapacity(int creditCardCapacity) {
		this.creditCardCapacity = creditCardCapacity;
	}

	public int getCreditCardActive() {
		return creditCardActive;
	}

	public void setCreditCardActive(int creditCardActive) {
		this.creditCardActive = creditCardActive;
	}

	public int getSocialSecurityNumber() {
		return socialSecurityNumber;
	}

	public void setSocialSecurityNumber(int socialSecurityNumber) {
		this.socialSecurityNumber = socialSecurityNumber;
	}

	public int getCompanyOpenNumber() {
		return companyOpenNumber;
	}

	public void setCompanyOpenNumber(int companyOpenNumber) {
		this.companyOpenNumber = companyOpenNumber;
	}
}
