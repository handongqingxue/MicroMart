package com.microMart.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.microMart.entity.Province;

public interface ProvinceMapper {

	int selectForInt(@Param("name")String name);

	List<Province> selectList(@Param("name")String name, @Param("start")int start, @Param("rows")int rows, String sort, String order);

	int add(Province province);

	int edit(Province province);

	List<Province> selectCBBData(@Param("ifShow")Boolean ifShow);

}
