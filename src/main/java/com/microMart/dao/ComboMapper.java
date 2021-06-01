package com.microMart.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.microMart.entity.*;

public interface ComboMapper {

	List<Combo> selectPhoneList(@Param("goodsId") int goodsId);

}
