package com.microMart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/phone")
public class PhoneController {

	@RequestMapping(value="/order")
	public String order() {
		
		return "/phone/order";
	}
}
