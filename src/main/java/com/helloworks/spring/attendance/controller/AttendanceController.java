package com.helloworks.spring.attendance.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	public String updateInTime(String inOutTime, HttpServletRequest request) {
		 System.out.println("출근시간~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"+inOutTime);
		 
		 Attendance attendance = new Attendance();
		 
		 try {
			 //출근시간 초로 바꾸기
			 int hour = (Integer.parseInt(inOutTime.substring(0, 2)))*60*60;
			 int min = (Integer.parseInt(inOutTime.substring(3, 5)))*60;
			 int sec = hour+min+(Integer.parseInt(inOutTime.substring(6, 8)));
			 
			 //사번 set
			 int empNo =  ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo();		 
			 attendance.setEmpNo(empNo);					 
			 
			 //출근시간set
			 attendance.setInTime(inOutTime);
			 
			 //상태set
			 int status = Integer.parseInt(inOutTime.substring(0, 2));
			 if(status > 9) {
				 attendance.setAppliedIN(sec);
				 attendance.setPsStatus("지각");

				 
//			 	//반차결재서류 있다면 
//			    if(반차서류가 있다면) {				    	
//			    	attendance.setPsStatus("반차");	
//				    attendance.setAppliedIN(50400); //2시출근
//			    }
				   	 
			 }else {
				 attendance.setAppliedIN(32400);//9시
				 attendance.setPsStatus("정상출근");
			 }
			 
			
			
			 attendanceService.updateInTime(attendance);	
		 
		 } catch(NumberFormatException e) {			 
			 e.printStackTrace();
		 }
		 
		 return "redirect:main.mi";
	}
	
	//퇴근시간 등록
	@RequestMapping("outTime.ps")
	public ModelAndView updateOutTime(Attendance a, String inOutTime, ModelAndView mv, HttpServletRequest request) {
		 System.out.println("퇴근시간~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"+inOutTime);

		 //퇴근시간set
		 a.setOutTime(inOutTime);
		 
		 //출근시간 초로바꾸기
		 int hour1 = (Integer.parseInt(a.getInTime().substring(0, 2)))*60*60;
		 int min1 = (Integer.parseInt(a.getInTime().substring(3, 2)))*60;
		 int sec1 = hour1+min1+(Integer.parseInt(a.getInTime().substring(6, 2)));
		 
		 //퇴근시간 초로바꾸기
		 int hour2 = (Integer.parseInt(inOutTime.substring(0, 2)))*60*60;
		 int min2 = (Integer.parseInt(inOutTime.substring(3, 2)))*60;
		 int sec2 = hour2+min2+(Integer.parseInt(inOutTime.substring(6, 2)));
		 
		 int working = sec2-sec1;
		 int over = 0;
		 
		 //총근로시간
		 a.setTotal(working);
		 
		 //다시~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		 //야근시간 + 일한시간
		 if(working > 28800) { //야근했을때
			 over = working-28800;
			 a.setOverTime(over);
			 a.setWorkingTime(28800);
		 }else {
			 a.setOverTime(0); //야근하지않았을때
			 a.setWorkingTime(working);
			 a.setPsStatus("조퇴");
		 }
	
		//테스트 어떻게 찍힐까
		 System.out.println(a);
		
		 //attendanceService.updateOutTime(a);			 
		 
		 return mv;
	}
	
}
