package com.microMart.dao;

import org.apache.ibatis.annotations.Param;

import com.microMart.entity.*;

public interface MerchantMapper {

	public Merchant getMerchant(Merchant Merchant);

	public String getPwdByUserName(@Param("userName")String userName);

	public int updatePwdById(@Param("password")String password, @Param("id")Integer id);

	int edit(Merchant Merchant);
}
