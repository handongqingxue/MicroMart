package com.microMart.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.microMart.service.MerchantService;
import com.microMart.entity.*;
import com.microMart.util.*;

import net.sf.json.JSONObject;

import com.microMart.entity.*;
import com.microMart.util.FileUploadUtils;
import com.microMart.controller.SystemController;

@Controller
@RequestMapping(SystemController.MODULE_NAME)
public class SystemController {

	@Autowired
	private MerchantService merchantService;
	public static final String MODULE_NAME="/background/system";
	
	@RequestMapping(value="/merchant/info")
	public String goSystemMerchantInfo() {
		
		return MODULE_NAME+"/merchant/info";
	}
	
	@RequestMapping(value="/checkPassword")
	@ResponseBody
	public Map<String, Object> checkPassword(String password, String userName) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		boolean bool=merchantService.checkPassWord(password,userName);
		
		if(bool) {
			jsonMap.put("status", "ok");
		}
		else {
			jsonMap.put("status", "no");
			jsonMap.put("message", "原密码错误！");
		}
		return jsonMap;
	}
	
	@RequestMapping(value="/updatePwdById")
	@ResponseBody
	public String updatePwdById(String password) {
		Merchant mer=(Merchant)SecurityUtils.getSubject().getPrincipal();
		Integer id = mer.getId();
		int count = merchantService.updatePwdById(password,id);
		
		PlanResult plan=new PlanResult();
		if(count==0) {
			plan.setStatus(0);
		}
		else {
			plan.setStatus(1);
		}
		return JsonUtil.getJsonFromObject(plan);
	}
	
	/**
	 * 商家编辑
	 * @param merchant
	 * @param logo_inp
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/editMerchant",produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String editMerchant(Merchant merchant,
			@RequestParam(value="logo_inp",required=false) MultipartFile logo_inp,
			HttpServletRequest request) {

		String json=null;;
		try {
			PlanResult plan=new PlanResult();
			MultipartFile[] fileArr=new MultipartFile[1];
			fileArr[0]=logo_inp;
			for (int i = 0; i < fileArr.length; i++) {
				String jsonStr = null;
				if(fileArr[i].getSize()>0) {
					String folder=null;
					switch (i) {
					case 0:
						folder="ShopLogo";
						break;
					}
					jsonStr = FileUploadUtils.appUploadContentImg(request,fileArr[i],folder);
					JSONObject fileJson = JSONObject.fromObject(jsonStr);
					if("成功".equals(fileJson.get("msg"))) {
						JSONObject dataJO = (JSONObject)fileJson.get("data");
						switch (i) {
						case 0:
							merchant.setLogo(dataJO.get("src").toString());
							break;
						}
					}
				}
			
			}
			int count=merchantService.edit(merchant);
			if(count==0) {
				plan.setStatus(0);
				plan.setMsg("编辑商家信息失败！");
				json=JsonUtil.getJsonFromObject(plan);
			}
			else {
				plan.setStatus(1);
				plan.setMsg("商家信息已编辑，请重新登录！");
				json=JsonUtil.getJsonFromObject(plan);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return json;
	}
}
