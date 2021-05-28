package com.microMart.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.microMart.entity.*;

public interface ModuleAreaMapper {

	List<ModuleArea> selectPhoneList(@Param("levelFlag")int levelFlag);

}
