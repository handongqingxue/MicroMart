package com.microMart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	@Autowired
	private HelpService helpService;
	@Autowired
	private ComboService comboService;
	
	@RequestMapping(value="/order")
	public String order(HttpServletRequest request) {
		
		List<ModuleArea> moduleAreaList=moduleAreaService.selectPhoneList(ModuleArea.PARENT);
		request.setAttribute("moduleAreaList", moduleAreaList);
		
		List<ModuleArea> childModuleAreaList=moduleAreaService.selectPhoneList(ModuleArea.CHILD);
		request.setAttribute("childModuleAreaList", childModuleAreaList);
		StringBuilder cmaListSB=new StringBuilder();
		cmaListSB.append("[");
		for(int i=0;i<childModuleAreaList.size();i++) {
			ModuleArea childModuleArea=childModuleAreaList.get(i);
			cmaListSB.append("{\\\"id\\\":\\\"");
			cmaListSB.append(childModuleArea.getId());
			cmaListSB.append("\\\",\\\"colorRedValue\\\":\\\"");
			cmaListSB.append(childModuleArea.getColorRedValue());
			cmaListSB.append("\\\",\\\"colorGreenValue\\\":\\\"");
			cmaListSB.append(childModuleArea.getColorGreenValue());
			cmaListSB.append("\\\",\\\"colorBlueValue\\\":\\\"");
			cmaListSB.append(childModuleArea.getColorBlueValue());
			cmaListSB.append("\\\",\\\"selectedColorRedValue\\\":\\\"");
			cmaListSB.append(childModuleArea.getSelectedColorRedValue());
			cmaListSB.append("\\\",\\\"selectedColorGreenValue\\\":\\\"");
			cmaListSB.append(childModuleArea.getSelectedColorGreenValue());
			cmaListSB.append("\\\",\\\"selectedColorBlueValue\\\":\\\"");
			cmaListSB.append(childModuleArea.getSelectedColorBlueValue());
			cmaListSB.append("\\\",\\\"lineDivBorderBottomWidthColorRedValue\\\":\\\"");
			cmaListSB.append(childModuleArea.getLineDivBorderBottomWidthColorRedValue());
			cmaListSB.append("\\\",\\\"lineDivBorderBottomWidthColorGreenValue\\\":\\\"");
			cmaListSB.append(childModuleArea.getLineDivBorderBottomWidthColorGreenValue());
			cmaListSB.append("\\\",\\\"lineDivBorderBottomWidthColorBlueValue\\\":\\\"");
			cmaListSB.append(childModuleArea.getLineDivBorderBottomWidthColorBlueValue());
			cmaListSB.append("\\\",\\\"lineDivSelectedBorderBottomWidthColorRedValue\\\":\\\"");
			cmaListSB.append(childModuleArea.getLineDivSelectedBorderBottomWidthColorRedValue());
			cmaListSB.append("\\\",\\\"lineDivSelectedBorderBottomWidthColorGreenValue\\\":\\\"");
			cmaListSB.append(childModuleArea.getLineDivSelectedBorderBottomWidthColorGreenValue());
			cmaListSB.append("\\\",\\\"lineDivSelectedBorderBottomWidthColorBlueValue\\\":\\\"");
			cmaListSB.append(childModuleArea.getLineDivSelectedBorderBottomWidthColorBlueValue());
			cmaListSB.append("\\\"}");
			if(i<childModuleAreaList.size()-1)
				cmaListSB.append(",");
		}
		cmaListSB.append("]");
		//System.out.println(cmaListSB.toString());
		request.setAttribute("childModuleAreaListStr", cmaListSB.toString());
		
		List<ModuleTag> moduleTagList=moduleTagService.selectPhoneList();
		request.setAttribute("moduleTagList", moduleTagList);

		List<Help> helpList=helpService.selectPhoneList(1);
		request.setAttribute("helpList", helpList);
		
		List<Combo> comboList=comboService.selectPhoneList(1);
		request.setAttribute("comboList", comboList);
		
		Map<Integer, ModuleTag> comboModuleTagMap=new HashMap<Integer, ModuleTag>();
		for(int i=0;i<moduleTagList.size();i++) {
			ModuleTag comboModuleTag = moduleTagList.get(i);
			if("comboItem".equals(comboModuleTag.getType())) {
				comboModuleTagMap.put(comboModuleTag.getId(), comboModuleTag);
			}
		}
		request.setAttribute("comboModuleTagMap", comboModuleTagMap);
		
		return "/phone/order";
	}
}
