package com.helloworks.spring.employee.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.helloworks.spring.employee.model.service.EmployeeService;
import com.helloworks.spring.employee.model.vo.Employee;



@Controller
public class EmployeeController {
	
	
	@Autowired 
	private EmployeeService employeeService;
	
	@RequestMapping(value="login.me", method=RequestMethod.POST)
	public String loginMember(@ModelAttribute Employee m , HttpSession session) {
				System.out.println("~~~~~~~~~~~~~~M  : "+ m);
				
		try {
			Employee loginUser = employeeService.loginMember(m);
			System.out.println("loginUser :  " + loginUser);
			session.setAttribute("loginUser", loginUser);
			return  "main/main"; 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return  "common/errorPage";
		}
	}
	
	@RequestMapping("main.mi")
	public String main() {
		System.out.println("@@@@@@@홈 화면으로 이동");
		return "main/main";
	}


}
