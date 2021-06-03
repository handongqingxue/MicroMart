package com.microMart.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.microMart.dao.*;
import com.microMart.entity.*;
import com.microMart.service.*;

@Service
public class CityServiceImpl implements CityService {

	@Autowired
	private CityMapper cityDao;
	
	@Override
	public int selectForInt(String name, Integer provinceId) {
		// TODO Auto-generated method stub
		return cityDao.selectForInt(name,provinceId);
	}

	@Override
	public List<City> selectList(String name, Integer provinceId, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return cityDao.selectList(name, provinceId, (page-1)*rows, rows, sort, order);
	}

	@Override
	public int add(City city) {
		// TODO Auto-generated method stub
		return cityDao.add(city);
	}

	@Override
	public int edit(City city) {
		// TODO Auto-generated method stub
		return cityDao.edit(city);
	}

}
