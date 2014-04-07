package com.ask.dental.sales;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ask.dental.member.MemberController;
import com.ask.dental.com.model.SearchModel;

@Controller
@RequestMapping("/sales")
public class SalesController {
	private		final		Log	log	=	LogFactory.getLog(this.getClass());	
	
	@Autowired
	private	SalesService salesService;	
	
	//회원정보 화면 이동.
	@RequestMapping(value="/salesList", method=RequestMethod.GET)
	public String salesList() {
	
        return "sales/salesList.tiles";
	}
}