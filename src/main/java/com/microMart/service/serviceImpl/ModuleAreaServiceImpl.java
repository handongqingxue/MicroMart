package com.microMart.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.microMart.dao.*;
import com.microMart.entity.ModuleArea;
import com.microMart.service.*;

@Service
public class ModuleAreaServiceImpl implements ModuleAreaService {

	@Autowired
	private ModuleAreaMapper moduleAreaDao;

	@Override
	public List<ModuleArea> selectPhoneList(int levelFlag) {
		// TODO Auto-generated method stub
		return moduleAreaDao.selectPhoneList(levelFlag);
	}
}