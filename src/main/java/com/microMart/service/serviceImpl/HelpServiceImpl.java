package com.microMart.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.microMart.dao.*;
import com.microMart.entity.*;
import com.microMart.service.*;

@Service
public class HelpServiceImpl implements HelpService {

	@Autowired
	private HelpMapper helpDao;
	
	@Override
	public List<Help> selectPhoneList(int merchantId) {
		// TODO Auto-generated method stub
		return helpDao.selectPhoneList(merchantId);
	}

}
