package com.helloworks.spring.employee.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.helloworks.spring.attendance.model.service.AttendanceService;
import com.helloworks.spring.attendance.model.vo.Attendance;
import com.helloworks.spring.employee.model.service.EmployeeService;
import com.helloworks.spring.employee.model.vo.Employee;



@Controller
public class EmployeeController {
	
	
	@Autowired 
	private EmployeeService employeeService;
	
	@Autowired
	private AttendanceService attendanceService;
	
	@RequestMapping(value="login.me", method=RequestMethod.POST)
	public String loginMember(@ModelAttribute Employee m , HttpSession session) {
				System.out.println("~~~~~~~~~~~~~~M  : "+ m);
				
		try {
			Employee loginUser = employeeService.loginMember(m);
			System.out.println("loginUser :  " + loginUser);
			session.setAttribute("loginUser", loginUser);
			return  "redirect:main.mi"; 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return  "common/errorPage";
		}
	}
	
	@RequestMapping("main.mi")
	public ModelAndView main(ModelAndView mv, HttpServletRequest request) {

		  int empNo =  ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo();	
		  
		  //조아혜
	      Attendance attendance = attendanceService.selectAttendance(empNo);
	      mv.addObject("attendance", attendance);
	      
	      
	      
	      
	      
	      
	      mv.setViewName("main");
	      return mv;
	}


}
