package com.ask.dental.clinic;

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

import com.ask.dental.clinic.ClinicModel;
import com.ask.dental.com.util.pagination.PaginationInfo;


@Controller
@RequestMapping("/clinic")
public class ClinicController {

	@Autowired
	private ClinicService clinicService;
	
	private static final Logger logger = LoggerFactory.getLogger(ClinicController.class);
	
	//회원정보 화면 이동.
	@RequestMapping(value="/clinicList", method=RequestMethod.GET)
	public String clinicList() {
	
        return "clinic/clinicList.tiles";
	}
	
	@RequestMapping(value="/getClinicListJson.do", method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> getClinicListJson(
			@RequestParam(value = "page", required =false) String pageNo,
			@RequestParam(value = "rows", required =false) String rowsNo,
			@RequestParam(value = "pageSize", required =false) String pageSize,
			@RequestParam(value = "sidx", required =false) String sidx,
			@RequestParam(value = "sord", required =false) String sord,
			@RequestParam(value = "searchType", required =false) String searchType,
			@RequestParam(value = "searchValue", required =false) String searchValue,
			ModelMap model, 
			Map<String, Object> commandMap ) throws Exception {
		
		System.out.println("pageNo" + pageNo);

		int currentPageNo;
        try {
            currentPageNo = Integer.parseInt(pageNo);
        } catch (Exception e) {
            currentPageNo = 1;
        }

        int CurrentrowsNo;
        try {
        	CurrentrowsNo = Integer.parseInt(rowsNo);
        } catch (Exception e) {
        	CurrentrowsNo = 20;
        }
        
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(currentPageNo);
        paginationInfo.setRecordCountPerPage(CurrentrowsNo);
        
        System.out.println("paginationInfo" + paginationInfo);
        
        commandMap.put("firstIndex", paginationInfo.getFirstRecordIndex());
        commandMap.put("lastIndex", paginationInfo.getLastRecordIndex());
        commandMap.put("searchValue", searchValue);
        commandMap.put("searchType", searchType);

        List<ClinicModel> cliniclist = clinicService.selectClinicList(commandMap);
        int clinicCount = clinicService.selectClinicCount(commandMap);
        paginationInfo.setTotalRecordCount(clinicCount);
        
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
        
        System.out.println("resultMap" + resultMap);
        
        resultMap.put("total", paginationInfo.getTotalPageCount());
        resultMap.put("page", currentPageNo);
        resultMap.put("records", paginationInfo.getRecordCountPerPage());
        resultMap.put("rows", cliniclist);
		return resultMap;

	}
	
	@RequestMapping(value="/insertMemberJson.do",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> insertMember(
			@ModelAttribute ClinicModel Clinic, 
			BindingResult bindingResult, 
			Model model) {

        boolean memberSuccess = true;
        List<String> message = new ArrayList<String>();
        try {
        	clinicService.insertClinic(Clinic);
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
			@ModelAttribute ClinicModel Clinic, 
			BindingResult bindingResult, 
			Model model) {


        boolean bsuccess = true;
        List<String> message = new ArrayList<String>();
        logger.debug("##################################");
        logger.debug("#########" + Clinic.toString());
        try {
        	clinicService.updateClinic(Clinic);
        	
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
			@ModelAttribute ClinicModel Clinic, 
			BindingResult bindingResult, 
			Model model) {

        boolean bsuccess = true;
        List<String> message = new ArrayList<String>();
        try {
        	clinicService.deleteClinic(Clinic);
        	
        } catch (Exception e) {
        	bsuccess= false;
        	message.add("delete Fail!!");
        	
        }
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
        
        resultMap.put("success", bsuccess);
        resultMap.put("message", message);
        
        return resultMap;
	}
	
	/**
     * 병원명 / 코드 조회
     * @param request HttpServletRequest
     * @param response HttpServletResponse
     * @return ModelAndView paging 정보와 리스트 모델을 포함한 리스트 view
     * @throws Exception 
     */
	@RequestMapping(value="/selClinicList.do",method=RequestMethod.GET)
    public ModelAndView selectClinic(HttpServletRequest request,
            HttpServletResponse response)throws Exception{
    	ClinicModel Clinic = new ClinicModel();
        List<ClinicModel> lstSelClinic = clinicService.getSelectClinic(Clinic);
        
        ModelAndView mv = new ModelAndView();
        mv.addObject("lstSelClinic", lstSelClinic);
        mv.setViewName("jsonView");
        
        return mv;
    }
}


