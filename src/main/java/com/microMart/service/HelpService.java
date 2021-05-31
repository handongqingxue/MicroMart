package com.microMart.service;

import java.util.List;

import com.microMart.entity.*;

public interface HelpService {

	List<Help> selectPhoneList(int merchantId);

}
