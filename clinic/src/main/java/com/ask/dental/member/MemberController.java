package com.ask.dental.member;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ask.dental.member.MemberModel;
import com.ask.dental.com.util.pagination.PaginationInfo;


@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	//회원정보 화면 이동.
	@RequestMapping(value="/memberList.do", method=RequestMethod.GET)
	public String memberList() {
	
        return "member/memberGrid.tiles";
	}
	
	@RequestMapping(value="/getMemberListJson.do", method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> getMemberListJson(
			@RequestParam(value = "page", required =false) String pageNo,
			@RequestParam(value = "rows", required =false) String rowsNo,
			@RequestParam(value = "pageSize", required =false) String pageSize,
			ModelMap model, 
			Map<String, Object> commandMap ) throws Exception {
		
		System.out.println("pageNo" + pageNo);

		int currentPageNo;
        try {
            currentPageNo = Integer.parseInt(pageNo);
        } catch (Exception e) {
            currentPageNo = 1;
        }

        int CurrentRowsNo;
        try {
        	CurrentRowsNo = Integer.parseInt(rowsNo);
        } catch (Exception e) {
        	CurrentRowsNo = 20;
        }
        
        int CurrentPageSize;
        try {
        	CurrentPageSize = Integer.parseInt(pageSize);
        } catch (Exception e) {
        	CurrentPageSize = 20;
        }
 
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(currentPageNo);
        paginationInfo.setRecordCountPerPage(CurrentRowsNo);
        paginationInfo.setPageSize(CurrentPageSize);
        
        System.out.println("paginationInfo" + paginationInfo);
        
        commandMap.put("firstIndex", paginationInfo.getFirstRecordIndex());
        commandMap.put("lastIndex", paginationInfo.getLastRecordIndex());
        commandMap.put("recordCountPerPage", paginationInfo.getRecordCountPerPage());


        List<MemberModel> memberlist = memberService.selectMemberList(commandMap);
        int memberCount = memberService.selectMemberCount(commandMap);
        paginationInfo.setTotalRecordCount(memberCount);
        
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
        
        System.out.println("resultMap" + resultMap);
        
        resultMap.put("total", paginationInfo.getTotalPageCount());
        resultMap.put("page", currentPageNo);
        resultMap.put("records", memberCount);
        resultMap.put("rows", memberlist);
		return resultMap;

	}
	
	@RequestMapping(value="/insertMemberJson.do",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> insertMember(
			@ModelAttribute MemberModel Member, 
			BindingResult bindingResult, 
			Model model) {

        boolean memberSuccess = true;
        List<String> message = new ArrayList<String>();
        try {
        	memberService.insertMember(Member);
        } catch (Exception e) {
        	memberSuccess = false;
        	message.add("Insert Fail!!");
        }
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
        
        resultMap.put("success", memberSuccess);
        resultMap.put("message", message);
        
        return resultMap;
	}

	@RequestMapping(value="/updateMemberJson.do",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> updateBbs(
			@ModelAttribute MemberModel Member, 
			BindingResult bindingResult, 
			Model model) {


        boolean bsuccess = true;
        List<String> message = new ArrayList<String>();
        logger.debug("##################################");
        logger.debug("#########" + Member.toString());
        try {
        	memberService.updateMember(Member);
        	
        } catch (Exception e) {
        	bsuccess= false;
        	message.add("Update Fail!!");
        	
        }
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
        
        resultMap.put("success", bsuccess);
        resultMap.put("message", message);
        
        return resultMap;
	}


	@RequestMapping(value="/deleteMemberJson.do",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> deleteBbs(
			@ModelAttribute MemberModel Member, 
			BindingResult bindingResult, 
			Model model) {

        boolean bsuccess = true;
        List<String> message = new ArrayList<String>();
        try {
        	memberService.deleteMember(Member);
        	
        } catch (Exception e) {
        	bsuccess= false;
        	message.add("delete Fail!!");
        	
        }
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
        
        resultMap.put("success", bsuccess);
        resultMap.put("message", message);
        
        return resultMap;
	}
	
}


