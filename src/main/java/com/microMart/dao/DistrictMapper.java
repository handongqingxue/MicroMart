package com.microMart.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.microMart.entity.District;

public interface DistrictMapper {

	int selectForInt(@Param("name")String name, @Param("cityId")Integer cityId);

	List<District> selectList(@Param("name")String name, @Param("cityId")Integer cityId, @Param("start")int start, @Param("rows")int rows, String sort, String order);

	int add(District district);

}
