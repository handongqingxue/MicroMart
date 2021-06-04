package com.microMart.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.microMart.dao.*;
import com.microMart.entity.*;
import com.microMart.service.*;

@Service
public class DistrictServiceImpl implements DistrictService {

	@Autowired
	private DistrictMapper districtDao;
	
	@Override
	public int selectForInt(String name, Integer cityId) {
		// TODO Auto-generated method stub
		return districtDao.selectForInt(name,cityId);
	}

	@Override
	public List<District> selectList(String name, Integer cityId, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return districtDao.selectList(name, cityId, (page-1)*rows, rows, sort, order);
	}

	@Override
	public int add(District district) {
		// TODO Auto-generated method stub
		return districtDao.add(district);
	}

	@Override
	public int edit(District district) {
		// TODO Auto-generated method stub
		return districtDao.edit(district);
	}

}
