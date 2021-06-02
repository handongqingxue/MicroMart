package com.microMart.service.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.microMart.entity.*;
import com.microMart.dao.*;
import com.microMart.service.*;

@Service
public class MerchantServiceImpl implements MerchantService {

	@Autowired
	private MerchantMapper merchantDao;

	@Override
	public boolean checkPassWord(String password, String userName) {
		// TODO Auto-generated method stub
		String pwd = merchantDao.getPwdByUserName(userName);
		if(pwd.equals(password)) {
			return true;
		}
		else
			return false;
	}

	@Override
	public int updatePwdById(String password, Integer id) {
		// TODO Auto-generated method stub
		return merchantDao.updatePwdById(password,id);
	}

	@Override
	public int edit(Merchant merchant) {
		// TODO Auto-generated method stub
		return merchantDao.edit(merchant);
	}
}
