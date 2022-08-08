package com.screen.entity;

public class CreditCardEo {
	private int provinceId;
	private String bracnhName;
	private String month;
	// 开卡量
	private int cardCapacity;
	// 激活量
	private int activeCapacity;
	
	public CreditCardEo() {
		super();
	}
	public int getProvinceId() {
		return provinceId;
	}
	public void setProvinceId(int provinceId) {
		this.provinceId = provinceId;
	}
	public String getBracnhName() {
		return bracnhName;
	}
	public void setBracnhName(String bracnhName) {
		this.bracnhName = bracnhName;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public int getCardCapacity() {
		return cardCapacity;
	}
	public void setCardCapacity(int cardCapacity) {
		this.cardCapacity = cardCapacity;
	}
	public int getActiveCapacity() {
		return activeCapacity;
	}
	public void setActiveCapacity(int activeCapacity) {
		this.activeCapacity = activeCapacity;
	}
	
	
}
