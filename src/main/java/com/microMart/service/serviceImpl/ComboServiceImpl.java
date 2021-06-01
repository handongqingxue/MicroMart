package com.microMart.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.microMart.dao.*;
import com.microMart.entity.*;
import com.microMart.service.*;

@Service
public class ComboServiceImpl implements ComboService {

	@Autowired
	private ComboMapper comboDao;
	
	@Override
	public List<Combo> selectPhoneList(int goodsId) {
		// TODO Auto-generated method stub
		return comboDao.selectPhoneList(goodsId);
	}

}
