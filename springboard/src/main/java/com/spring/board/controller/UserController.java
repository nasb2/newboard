package com.spring.board.controller;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.board.domain.UserDto;
import com.spring.board.service.UserService;

@Controller
public class UserController {
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/join.go", method = RequestMethod.GET)
	public String join() throws Exception {
		return "join";
	}
	
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public ModelAndView join(UserDto userDto, HttpServletRequest request) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		userService.insert(userDto);
		modelAndView.setViewName("jsonView");
		modelAndView.addObject("result", "success");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/login.go", method = RequestMethod.GET)
	public String loginForm(HttpSession session, HttpServletResponse response) {
		
		// 로그아웃
		if (session.getAttribute("id") != null) {
            session.invalidate();
        }
		return "login";
	}
	
	@ResponseBody
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(@RequestParam Map<String, Object> map, HttpServletRequest request, HttpServletResponse response) {
		
		String paramId = (String) map.get("id");
		String paramPwd = (String) map.get("pwd");
		
		try {
			
			// 1. 회원이 아닌 경우
			if(userService.select(paramId) == null) {
				return "NONMEMBER";
			}
			
			// 2. 회원인 경우
			if(!userService.select(paramId).getPwd().equals(paramPwd)) {
				return "LOGIN_FAILED";
			}
			
			String id = userService.select(paramId).getId();
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		return "LOGIN_SUCCESS";
	}
	
}
