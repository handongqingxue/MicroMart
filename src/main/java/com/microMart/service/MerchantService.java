package com.microMart.service;

import com.microMart.entity.*;

public interface MerchantService {

	boolean checkPassWord(String password, String userName);

	int updatePwdById(String password, Integer id);

	int edit(Merchant merchant);
}
