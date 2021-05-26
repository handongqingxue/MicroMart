package com.microMart.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.microMart.dao.*;
import com.microMart.entity.*;
import com.microMart.service.*;

@Service
public class ModuleTagServiceImpl implements ModuleTagService {

	@Autowired
	private ModuleTagMapper moduleTagDao;
	
	@Override
	public List<ModuleTag> selectPhoneList() {
		// TODO Auto-generated method stub
		return moduleTagDao.selectPhoneList();
	}

}
