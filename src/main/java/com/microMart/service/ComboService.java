package com.microMart.service;

import java.util.List;

import com.microMart.entity.Combo;

public interface ComboService {

	List<Combo> selectPhoneList(int goodsId);

}
