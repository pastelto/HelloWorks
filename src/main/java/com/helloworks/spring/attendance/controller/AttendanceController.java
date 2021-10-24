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
	
	//페이지 전환
	@RequestMapping("attendanceApiView.ps")
	public String attendanceApiView() {
		System.out.println("근태현황 api  페이지 전환");
		return "attendance/AttendanceApiView";
	}
	
	@RequestMapping("checkDeptEmp.ps")
	public String checkDeptEmp() {
		System.out.println("부서 출근조회");
		return "attendance/CheckDeptEmpView";
	}
	
	@RequestMapping("wtStatistics.ps")
	public String wtStatistics() {
		System.out.println("부서 출근조회");
		return "attendance/DeptWTStatistics";
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
			 int statushour = Integer.parseInt(inOutTime.substring(0, 2));
			 if(statushour > 9) {
				 attendance.setAppliedIN(sec);
				 attendance.setPsStatus("지각");

				 
//			 	//오전반차결재서류 있다면 
//			    if(반차서류가 있다면  && status < 14) {				    	
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
	public String updateOutTime(String inOutTime, HttpServletRequest request) {
		 System.out.println("퇴근시간~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"+inOutTime);
		 
		 int empNo =  ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo();	 
		 Attendance attendance = attendanceService.selectAttendance(empNo);
		 
		 System.out.println(attendance);
		 
		 //퇴근시간set
		 attendance.setOutTime(inOutTime);
		 
		 try {
			 //퇴근시간 초로바꾸기
			 int hour = (Integer.parseInt(inOutTime.substring(0, 2)))*60*60;
			 int min = (Integer.parseInt(inOutTime.substring(3, 5)))*60;
			 int sec = hour+min+(Integer.parseInt(inOutTime.substring(6, 8)));
			 
			 
			 //상태set
			 int statushour = Integer.parseInt(inOutTime.substring(0, 2));
			 int statusmin = Integer.parseInt(inOutTime.substring(3, 5));
			 
			 //6시 이후 퇴근
			 if(statushour >= 18) { 
				 
				 	 if(statusmin < 10) {//6시 정시 퇴근 
				 		 attendance.setAppliedOut(64800); //6시
				 		 attendance.setTotal(attendance.getAppliedOut()-attendance.getAppliedIN()-3600); //총일한시간(퇴근-출근-점심시간)
				 		 attendance.setWorkingTime(attendance.getTotal()); //일한시간
				 		 attendance.setOverTime(0);//야근없음
				 	 }else {//야근				 	 
				 		 attendance.setAppliedOut(sec); 
				 		 attendance.setTotal(attendance.getAppliedOut()-attendance.getAppliedIN()-3600); //총일한시간(퇴근-출근-점심시간)				 		
				 		 attendance.setOverTime(attendance.getTotal()-28800);//야근시간(총 일한시간 - 8시간)
				 		 attendance.setWorkingTime(28800); //일한시간(8시간
				 	 }
				 	 	
			
			 }else {//6시 이전 퇴근
				 
				 //조퇴
				 attendance.setPsStatus("조퇴");	
		 		 attendance.setAppliedOut(sec); 
		 		 attendance.setTotal(attendance.getAppliedOut()-attendance.getAppliedIN()-3600); //총일한시간(퇴근-출근-점심시간)
		 		 attendance.setWorkingTime(attendance.getTotal()); //일한시간
		 		 attendance.setOverTime(0);//야근없음
				 
//				 	//오후반차결재서류 있다면 
//				    if(반차서류가 있다면) {				    	
//				    	attendance.setPsStatus("반차");	
//					    attendance.setAppliedOut(50400); //2시출근
//					 }else {
//						 attendance.setPsStatus("조퇴");	
//				 		 attendance.setAppliedOut(sec); 
//					 }
 
			 }

		
			//테스트 어떻게 찍힐까
			 System.out.println(attendance);
		 } catch(NumberFormatException e) {			 
			 e.printStackTrace();
		 }
		
		 attendanceService.updateOutTime(attendance);			 
		 
		 return "redirect:main.mi";
	}
	
	
	
	
	//selectAttendanceList.ps
	
}
