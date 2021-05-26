package com.microMart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.microMart.entity.*;
import com.microMart.service.*;

@Controller
@RequestMapping("/phone")
public class PhoneController {

	@Autowired
	private ModuleAreaService moduleAreaService;
	@Autowired
	private ModuleTagService moduleTagService;
	
	@RequestMapping(value="/order")
	public String order(HttpServletRequest request) {
		
		List<ModuleArea> moduleAreaList=moduleAreaService.selectPhoneList();
		request.setAttribute("moduleAreaList", moduleAreaList);
		
		List<ModuleTag> moduleTagList=moduleTagService.selectPhoneList();
		request.setAttribute("moduleTagList", moduleTagList);
		
		return "/phone/order";
	}
}
