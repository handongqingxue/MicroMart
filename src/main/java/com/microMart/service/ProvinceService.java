package com.microMart.service;

import java.util.List;

import com.microMart.entity.Province;

public interface ProvinceService {

	int selectForInt(String name);

	List<Province> selectList(String name, int page, int rows, String sort, String order);

	int add(Province province);

	int edit(Province province);

}
