package com.microMart.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.microMart.entity.City;

public interface CityMapper {

	int selectForInt(@Param("name")String name, @Param("provinceId")Integer provinceId);

	List<City> selectList(@Param("name")String name, @Param("provinceId")Integer provinceId, @Param("start")int start, @Param("rows")int rows, String sort, String order);

	int add(City city);

}
