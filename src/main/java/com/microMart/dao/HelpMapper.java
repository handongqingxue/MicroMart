package com.microMart.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.microMart.entity.*;

public interface HelpMapper {

	List<Help> selectPhoneList(@Param("merchantId") int merchantId);

}
