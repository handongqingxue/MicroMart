package com.microMart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.microMart.controller.SystemController;

@Controller
@RequestMapping(SystemController.MODULE_NAME)
public class SystemController {

	public static final String MODULE_NAME="/background/system";
	
	@RequestMapping(value="/merchant/info")
	public String goSystemMerchantInfo() {
		
		return MODULE_NAME+"/merchant/info";
	}
}
