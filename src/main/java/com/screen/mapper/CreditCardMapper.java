package com.screen.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.screen.entity.CreditCardEo;

@Mapper
public interface CreditCardMapper {
	public List<CreditCardEo> listCreditCard(int provinceId);
	
	public int totalCreditCardCapacity();
	public int totalCreditCardActive();
}
