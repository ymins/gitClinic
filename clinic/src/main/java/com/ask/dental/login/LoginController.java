package com.ask.dental.login;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.view.RedirectView;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ask.dental.member.MemberModel;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private LoginService loginService;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	MemberModel memberModel;
	//회원정보 화면 이동.
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login() {
	
        return "login/login";
	}
	
	 /**
     * 로그인 실행
     * 
     * @param request HttpServletRequest
     * @param response HttpServletResponse
     * @return ModelAndView ModelAndView instance
     * @throws Exception 
     */
	@RequestMapping(value="/goLogin.do", method=RequestMethod.POST)
    public ModelAndView goLogin(HttpServletRequest request,
    		HttpServletResponse response)throws Exception{
		
		HttpSession session = request.getSession();
		//ModelAndView mav = new ModelAndView();
		ModelAndView view = null;
		Map<String, String> map = new HashMap<String, String>();
		
		String memId = request.getParameter("memId");
		String memPw = request.getParameter("memPw");
		
		map.put("memId",memId);
		map.put("memPw", memPw);
		
		int loginValue = 0;
		// login 
		try {  loginValue = loginService.goLogin(map);  } catch (Exception e) { }
		
        // 로그인 성공 시 세션 정보 설정
        if( loginValue == 1 ) {
			memberModel = loginService.getMemberInfo(memId);
			
			session.setAttribute("sessionId", memberModel.getMemId());
			session.setAttribute("sessionNm", memberModel.getMemNm());
			session.setAttribute("sessionAuth", memberModel.getMemAuth());
			session.setAttribute("sessionCompany", memberModel.getMemCompany());
			session.setAttribute("sessionCode", memberModel.getComCode());
			session.setAttribute("sessionRank", memberModel.getMemRank());
			
			logger.info("로그인성공");
			RedirectView rv = new RedirectView("/clinic/clinicList.do");
			rv.setExposeModelAttributes(false);
			return new ModelAndView(rv);
        } else {
        	logger.info("로그인실패");
        	RedirectView rv = new RedirectView("/login/login.do");
			rv.setExposeModelAttributes(false);
			return new ModelAndView(rv);
        }
    }
}
	