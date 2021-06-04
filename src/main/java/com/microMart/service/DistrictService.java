package com.microMart.service;

import java.util.List;

import com.microMart.entity.*;

public interface DistrictService {

	int selectForInt(String name, Integer cityId);

	List<District> selectList(String name, Integer cityId, int page, int rows, String sort, String order);

	int add(District district);

}
