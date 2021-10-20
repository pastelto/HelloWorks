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
	public String insertInTime(String inOutTime, HttpServletRequest request) {
		 System.out.println("출근시간~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"+inOutTime);
		 
		 Attendance a = new Attendance();
		 
		 //출근시간set
		 a.setInTime(inOutTime);
		 
		 //상태set
		 int status = Integer.parseInt(inOutTime.substring(0, 2));
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
		 
		 return "redirect:main.mi";
	}
	
//	   //조회
//	   @RequestMapping("attendance.ps")
//	   public ModelAndView selectAttendance( ModelAndView mv, HttpServletRequest request) {
//		   int empNo =  ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo();	
//	      Attendance a = attendanceService.selectAttendance(empNo);
//	      System.out.println("a######################## +" + a);
//	      System.out.println("empNo +" + empNo);
//	      
//	      mv.addObject("a", a).setViewName("main/main");
//	      
//	      return mv;
//	   }

	
	//조회
//	@ResponseBody
//	@RequestMapping(value="attendance.ps", produces="application/json; charset=UTF-8") 
//	public String selectAttendance(int empNo) {
//		System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$컨트롤러 탄다~~~~~~~~");
//		
//		
//		 ArrayList<Attendance> a = attendanceService.selectAttendance(empNo);			 
//		 System.out.println("a######################## +" + a);
//		 System.out.println("empNo +" + empNo);
//		 
//		 
//		 return new GsonBuilder().create().toJson(a);
//	}
	
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
