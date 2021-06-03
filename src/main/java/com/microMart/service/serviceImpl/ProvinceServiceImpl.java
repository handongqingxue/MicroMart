package com.microMart.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.microMart.dao.*;
import com.microMart.entity.*;
import com.microMart.service.*;

@Service
public class ProvinceServiceImpl implements ProvinceService {

	@Autowired
	private ProvinceMapper provinceDao;
	
	@Override
	public int selectForInt(String name) {
		// TODO Auto-generated method stub
		return provinceDao.selectForInt(name);
	}

	@Override
	public List<Province> selectList(String name, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return provinceDao.selectList(name, (page-1)*rows, rows, sort, order);
	}

	@Override
	public int add(Province province) {
		// TODO Auto-generated method stub
		return provinceDao.add(province);
	}

	@Override
	public int edit(Province province) {
		// TODO Auto-generated method stub
		return provinceDao.edit(province);
	}

	@Override
	public List<Province> selectCBBData(Boolean ifShow) {
		// TODO Auto-generated method stub
		return provinceDao.selectCBBData(ifShow);
	}

}
