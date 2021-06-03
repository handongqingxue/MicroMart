package com.microMart.service;

import java.util.List;

import com.microMart.entity.*;

public interface CityService {

	int selectForInt(String name, Integer provinceId);

	List<City> selectList(String name, Integer provinceId, int page, int rows, String sort, String order);

	int add(City city);

}
