package com.helloworks.spring.attendance.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.GsonBuilder;
import com.helloworks.spring.attendance.model.service.AttendanceService;
import com.helloworks.spring.attendance.model.vo.Attendance;
import com.helloworks.spring.attendance.model.vo.SearchAttendance;
import com.helloworks.spring.attendance.model.vo.Statistics;
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
	

	
	//상태수정 새로운창 페이지 전환
	@RequestMapping("updateStatus.ps")
	public String updateStatus(int psaNo, Model model ) {
		
		System.out.println("~~~~~~~~~~~~~"+psaNo);
		
		Attendance update = attendanceService.updateStatus(psaNo);
		
		model.addAttribute("update",update);
		
		return "attendance/UpdateStatus";
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
	
	//소속 부서 출결 조회
	@RequestMapping("checkDeptTime.ps")
	public String checkDeptEmp(String attendanceYear, String attendanceMonth, String attendance_type, String vacation_type, 
								String optionType, String search, Model model,  HttpServletRequest request ){	
		//로그인유저 본인 부서 
		 String dept =  ((Employee)request.getSession().getAttribute("loginUser")).getDeptDname();	 
		
		 SearchAttendance searchCondition = new SearchAttendance();
		ArrayList<Attendance> searchlist = new ArrayList();
		
		searchCondition.setAttendanceYM(attendanceYear+attendanceMonth); //날짜
		searchCondition.setAttendance_type(attendance_type); // 근태구분
		searchCondition.setVacation_type(vacation_type); // 휴가구분
		searchCondition.setOptionType(optionType); // 검색타입
		searchCondition.setSearch(search);//검색 내용 
		searchCondition.setDept(dept); //로그인유저 부서 
		
		if(dept.equals("인사팀")) {
			if(searchCondition.getVacation_type() == null) {		
				searchlist = attendanceService.searchAttendance1(searchCondition);//근태구분 조회
			}else {
				searchlist = attendanceService.searchVacation1(searchCondition); //휴가구분 조회
			}

		}else {			
			if(searchCondition.getVacation_type() == null) {		
				searchlist = attendanceService.searchAttendance(searchCondition);//근태구분 조회
			}else {
				searchlist = attendanceService.searchVacation(searchCondition); //휴가구분 조회
			}			
		}

		model.addAttribute("searchlist",searchlist);

		return "attendance/CheckDeptEmpView";

	}
	
	//소속 부서 출결조회 -전체조회
	@RequestMapping("checkDeptTimeAll.ps")
	public String checkDeptTimeAll(Model model,  HttpServletRequest request ){	
		//로그인유저 본인 부서 
		 String dept =  ((Employee)request.getSession().getAttribute("loginUser")).getDeptDname();	 
		
		ArrayList<Attendance> searchlist = new ArrayList();
		
		if(dept.equals("인사팀")) {
			searchlist = attendanceService.checkDeptTimeAll1(dept);
			
		}else {			
			searchlist = attendanceService.checkDeptTimeAll(dept);
		}
		
		model.addAttribute("searchlist",searchlist);

		return "attendance/CheckDeptEmpView";

	}
	
	//상태변경
    @ResponseBody
	@RequestMapping(value = "changeStatus.ps", method = {RequestMethod.POST})
	public String changeStatus(String changeIntime, String changeOuttime, String changeStatus, int psaNo , int empNo ){
    	
    	Attendance change = attendanceService.selectAttendance(empNo);
    	
       try {
    		//퇴근시간 초로바꾸기
			 int changeIn = (Integer.parseInt(changeIntime.substring(0, 2)))*60*60;
			 int changeOut = (Integer.parseInt(changeOuttime.substring(0, 2)))*60*60;
			 
			 change.setPsaNo(psaNo); //기록번호 
			 change.setAppliedIN(changeIn); //적용 출근시간 변경
			 change.setAppliedOut(changeOut); //적용 퇴근시간 변경 
			 
		     change.setPsStatus(changeStatus); //상태값 변경
		     change.setInTime(changeIntime); // 출근시간 변경 
		     change.setOutTime(changeOuttime); //퇴근시간 변경 
		     
		     if(changeIn != 0) {
		    	 change.setTotal(change.getAppliedOut()-change.getAppliedIN()-3600); //일한시간
			     
			     if(change.getTotal() > 28800) { //야근
			    	 change.setOverTime(change.getTotal()-28800); //야근시간
			    	 change.setWorkingTime(28800); //일한시간
			    	 
			     }else {
			    	 change.setOverTime(0); //야근시간
			    	 change.setWorkingTime(change.getTotal()); //일한시간
			     }
		    	 
		     }else {//출근전 상태로 변경 
		    	 change.setTotal(0);
		    	 change.setOverTime(0);
		    	 change.setWorkingTime(0);
		     }
		     attendanceService.changeStatus(change);
			 
			 
    	} catch(NumberFormatException e) {			 
			 e.printStackTrace();
		 }
    	System.out.println(change);
		String result = "성공!";
		
		return String.valueOf(result);

	}

    //통계 주차 가져오기
    @ResponseBody
   	@RequestMapping(value = "monthselect.ps", method = {RequestMethod.POST})
   	public String monthselect(String monthselect){
       	
    	ArrayList<SearchAttendance> weeklist = attendanceService.monthselect(monthselect);

    	return new GsonBuilder().create().toJson(weeklist);
    }
    
    //통계 전체조회하기
	@RequestMapping("wtStatistics.ps")
	public String wtStatisticsAll(Model model, HttpServletRequest request) {
		
		//본인 부서 
		String dept =  ((Employee)request.getSession().getAttribute("loginUser")).getDeptCode();	
		
		 ArrayList<Statistics> statistics = attendanceService.wtStatisticsAll(dept);
		
		 System.out.println("눈누난나" + statistics);

		model.addAttribute("statistics",statistics);
		
		return "attendance/DeptWTStatistics";
	}
	
//	@ResponseBody
//	@RequestMapping(value = "statisticsSearch.ps", method = {RequestMethod.POST, RequestMethod.GET})
//	public String mainDate(String weekselect, String optionType, String  searchtext, HttpServletRequest request) {
//   	
//		//본인 부서 
//		 String dept =  ((Employee)request.getSession().getAttribute("loginUser")).getDeptCode();	
//		
//		 SearchAttendance search = new SearchAttendance();
//		 
//		 String startDate = weekselect.substring(0, 8); //시작일
//		 String endDate = weekselect.substring(8, 16); //종료일
//		
//		 search.setOptionType(optionType); //검색종류
//		 search.setSearch(searchtext); //검색내용
//		 search.setStart_date(startDate); //검색시작일
//		 search.setEnd_date(endDate); //검색 종료일
//		 search.setDept(dept); //부서
//		
//		 ArrayList<Statistics> statistics = attendanceService.statisticsSearch(search);
//		 
//		 System.out.println("뭐시여" + statistics);
//		 
//	
//	
//	return new GsonBuilder().create().toJson(statistics);
//}
	
	//통계 검색조건
	@RequestMapping("statisticsSearch.ps")
	public String statisticsSearch(String weekselect, String optionType, String  searchtext, 
																	Model model, HttpServletRequest request) {
		//본인 부서 
		 String dept =  ((Employee)request.getSession().getAttribute("loginUser")).getDeptCode();	
		
		 SearchAttendance search = new SearchAttendance();
		 
		 String startDate = weekselect.substring(0, 8); //시작일
		 String endDate = weekselect.substring(8, 16); //종료일
		
		 search.setOptionType(optionType); //검색종류
		 search.setSearch(searchtext); //검색내용
		 search.setStart_date(startDate); //검색시작일
		 search.setEnd_date(endDate); //검색 종료일
		 search.setDept(dept); //부서
		
		 ArrayList<Statistics> statistics = attendanceService.statisticsSearch(search);
		 
		

		model.addAttribute("statistics",statistics);
		
		return "attendance/DeptWTStatistics";
	}
	
	
	//메인에 선택 날짜 띄우기
//    @ResponseBody
//   	@RequestMapping(value = "mainDate.ps", method = {RequestMethod.POST})
//   	public String mainDate(String weekselect){
//       	
//    	System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~제발" + weekselect);
//    	String year = "20"+weekselect.substring(0, 2)+"년 ";
//    	String monthS = weekselect.substring(3,5)+"월 ";
//    	String dayS = weekselect.substring(6,8)+"일 ~ ";
//    	
//    	String monthD = weekselect.substring(11,13)+"월 ";
//    	String dayD = weekselect.substring(14,16)+"일 ";
//    	
//    	//String result = year + monthS + dayS + year + monthD + dayD;
//    	
//    	SearchAttendance result = new SearchAttendance();
//    	result.setAttendanceYM(year);
//    	result.setAttendance_type(monthS);
//    	result.setVacation_type(dayS);
//    	result.setOptionType(monthD);
//    	result.setSearch(dayD);
//    	
//    	
//    	return new GsonBuilder().create().toJson(result);
//    }
   
}
