package com.helloworks.spring.attendance.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.helloworks.spring.attendance.model.service.AttendanceService;
import com.helloworks.spring.attendance.model.vo.Attendance;
import com.helloworks.spring.employee.model.vo.Employee;

@Controller
public class AttendanceController {

	@Autowired
	private AttendanceService attendanceService;
	
	@RequestMapping("attendanceApiView.ps")
	public String attendanceApiView() {
		System.out.println("근태현황 api  페이지 전환");
		return "attendance/AttendanceApiView";
	}
	
	//출근시간 등록
	@RequestMapping("intime.ps")
	public String insertInTime(String inTime, HttpServletRequest request) {
		 System.out.println("출근시간~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"+inTime);
		 
		 Attendance a = new Attendance();
		 
		 //출근시간set
		 a.setInTime(inTime);
		 
		 //상태set
		 int status = Integer.parseInt(inTime.substring(0, 2));
		 if(status > 9) {
			 a.setPsStatus("지각");
		 }else {
			 a.setPsStatus("정상근무");
		 }
		 
		 //사번 set
		 int empNo =  ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo();		 
		 a.setEmpNo(empNo);		
		 
		
		 attendanceService.insertInTime(a);			 
		 //"redirect:list.nt"; -조회되면 이걸로 바꾸기?
		 
		 return "main/main";
	}
	
	//조회
	@ResponseBody
	@RequestMapping(value="attendance.ps", produces="application/json; charset=UTF-8") 
	public String selectAttendance(int empNo) {
		System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$컨트롤러 탄다~~~~~~~~");
		
		
		 Attendance a = attendanceService.selectAttendance(empNo);			 
		 System.out.println("a######################## +" + a);
		 System.out.println("empNo +" + empNo);
		 
		 
		 return new GsonBuilder().create().toJson(a);
	}
	
	
	
	
}
