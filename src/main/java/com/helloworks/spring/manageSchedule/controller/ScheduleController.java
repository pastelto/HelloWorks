package com.helloworks.spring.manageSchedule.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.GsonBuilder;
import com.helloworks.spring.employee.model.vo.Dept;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.manageSchedule.model.service.ScheduleService;
import com.helloworks.spring.manageSchedule.model.vo.ManageSchedule;

@Controller
public class ScheduleController {
	
	@Autowired
	private ScheduleService scheduleService;
	
	// 메뉴바 -> 일정관리 메인화면
	@RequestMapping("schMain.sc")
	public String scheduleMain(Model model) {
		
		List<Dept> deptList = new ArrayList<Dept>();
		
		// 부서목록 구하기
		try {
			deptList = scheduleService.getDeptList();
			System.out.println("deptList" + deptList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		model.addAttribute("deptList", deptList);
		
		System.out.println("일정관리 메인화면으로 이동");
		return "schedule/scheduleMain";
	}
	
	// 일정등록하기 - 페이지
	@RequestMapping("addEventsPage.sc")
	public String addEvents(Model model) {
		
		List<Dept> deptList = getDeptList();
		// 부서목록 구하기
		try {
			deptList = scheduleService.getDeptList();
			System.out.println("deptList" + deptList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		model.addAttribute("deptList", deptList);
		return "schedule/addSchedule";
	}
	
	// 부서 구하는 메소드
	private List<Dept> getDeptList() {
	
		List<Dept> deptList = new ArrayList<Dept>();
		
		// 부서목록 구하기
				try {
					deptList = scheduleService.getDeptList();
					System.out.println("deptList" + deptList);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
		return deptList;
	}

	// 일정등록하기
	@RequestMapping("addEvent.sc")
	public String addEvent(ManageSchedule schedule, HttpServletRequest request, 
						   @RequestParam(value="setEventTime") String setEventTime, String checked, String formType) {
		try {
		Employee myEmp =  ((Employee)request.getSession().getAttribute("loginUser"));	
		int myEmpNo = myEmp.getEmpNo();
		
		ManageSchedule calType = new ManageSchedule();
		String schType = schedule.getSch_type(); // 캘린더타입
		
		// 캘린더 번호와 캘린더 색상 받아오기
		switch(schType) {
		case "PRIVATE" :
			calType.setCal_maker(myEmpNo);
			calType.setCal_type(schType);
			calType = scheduleService.selectPrivateCal(calType);
			System.out.println("Private calType ? " + calType);
			break;
		case "사내 전체" :
			System.out.println("schType ? " + schType);
			schType = "전체";
			calType.setCal_name(schType);
			calType = scheduleService.selectCalType(calType);
			System.out.println("DEPT calType ? " + calType);
			break;
		default : 
			System.out.println("schType ? " + schType);
			calType.setCal_name(schType);
			calType = scheduleService.selectCalType(calType);
			System.out.println("DEPT calType ? " + calType);
			break;
		}
		
		String startDate = null;
		String endDate = null;
		// 일반 일정 등록 / 간편 일정 등록
		switch(formType) {
		case "1": 
			// 시작 날짜 및 시간 ~ 끝 날짜 및 시간
			String[] timeRange = setEventTime.split("-");
			startDate = timeRange[0];
			endDate = timeRange[1];
			break;
		case "2":
			startDate = schedule.getSch_startdate();
			endDate = schedule.getSch_endate();
			break;
		}
		
		String writer = myEmp.getEmpName() + " " + myEmp.getJobName();
		
		schedule.setSch_startdate(startDate);
		schedule.setSch_endate(endDate);
		schedule.setSch_writer(writer);
		schedule.setSch_empno(myEmpNo);
		schedule.setSch_allday(checked);
		schedule.setSch_color(calType.getCal_color());
		schedule.setSch_calNo(calType.getCalNo());
		
		System.out.println("schedule ? " + schedule);
		
		scheduleService.addEvent(schedule);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:schMain.sc";
	}
	
	// 일정 불러오기 ( 전체 / 본부별 / 부서별 / 개인 )
	// 전체 일정 불러오기
	@ResponseBody
	@RequestMapping(value="getAllCalender.cal", produces="application/json; charset=UTF-8")
	public String getAllCalender(String cal_name, HttpServletRequest request) {
		
		System.out.println("cal_name ? " + cal_name);
		
		List<ManageSchedule> allCalList = new ArrayList<ManageSchedule>();
		ManageSchedule calType = new ManageSchedule();
		try {
			// 해당 본부의 캘린더 번호 가져오기
			calType.setCal_name(cal_name);
			calType = scheduleService.selectCalType(calType);
			System.out.println("전체 캘린더 calType ? " + calType);
			
			// 해당 사번 개인 캘린더 내용 목록 가져오기
			int cal_no = calType.getCalNo();
			
			allCalList = scheduleService.getDeptSchedule(cal_no);
			System.out.println("allList ? " + allCalList);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return new GsonBuilder().create().toJson(allCalList);
	}
	
	// 내 일정 불러오기
	@ResponseBody
	@RequestMapping(value="getMyCalender.cal", produces="application/json; charset=UTF-8")
	public String getMyCalender(String cal_type, HttpServletRequest request) {
		
		Employee myEmp =  ((Employee)request.getSession().getAttribute("loginUser"));	
		int myEmpNo = myEmp.getEmpNo();
		
		System.out.println("cal_type ? " + cal_type);
		
		List<ManageSchedule> myCalList = new ArrayList<ManageSchedule>();
		ManageSchedule calType = new ManageSchedule();
		try {
			// 해당 사번 개인 캘린더 번호 가져오기
			calType.setCal_maker(myEmpNo);
			calType.setCal_type(cal_type);
			calType = scheduleService.selectPrivateCal(calType);
			System.out.println("내 캘린더 Private calType ? " + calType);
			
			// 해당 사번 개인 캘린더 내용 목록 가져오기
			HashMap<String, Object> getMyCalender = new HashMap<String, Object>();
			getMyCalender.put("cal_no", calType.getCalNo());	
			getMyCalender.put("myEmpNo", myEmpNo);
			
			myCalList = scheduleService.getMyCalender(getMyCalender);
			System.out.println("myCalList ? " + myCalList);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		 return new GsonBuilder().create().toJson(myCalList);
	}
	
	// 본부 일정 불러오기
	@ResponseBody
	@RequestMapping(value="getUDeptCal.cal", produces="application/json; charset=UTF-8")
	public String getUDeptCal(String cal_name, HttpServletRequest request) {
		
		System.out.println("cal_name ? " + cal_name);
		
		List<ManageSchedule> uDeptList = new ArrayList<ManageSchedule>();
		ManageSchedule calType = new ManageSchedule();
		try {
			// 해당 본부의 캘린더 번호 가져오기
			calType.setCal_name(cal_name);
			calType = scheduleService.selectCalType(calType);
			System.out.println("본부 캘린더 calType ? " + calType);
			
			// 해당 사번 개인 캘린더 내용 목록 가져오기
			int cal_no = calType.getCalNo();
			
			uDeptList = scheduleService.getDeptSchedule(cal_no);
			System.out.println("uDeptList ? " + uDeptList);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return new GsonBuilder().create().toJson(uDeptList);
	}
	
	// 부서별 일정 불러오기
	@ResponseBody
	@RequestMapping(value="getDDeptCal.cal", produces="application/json; charset=UTF-8")
	public String getDDeptCal(String cal_name, HttpServletRequest request) {
		
		System.out.println("cal_name ? " + cal_name);
		
		List<ManageSchedule> dDeptList = new ArrayList<ManageSchedule>();
		ManageSchedule calType = new ManageSchedule();
		try {
			// 해당 본부의 캘린더 번호 가져오기
			calType.setCal_name(cal_name);
			calType = scheduleService.selectCalType(calType);
			System.out.println("부서 캘린더 calType ? " + calType);
			
			// 해당 사번 개인 캘린더 내용 목록 가져오기
			int cal_no = calType.getCalNo();
			
			dDeptList = scheduleService.getDeptSchedule(cal_no);
			System.out.println("uDeptList ? " + dDeptList);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return new GsonBuilder().create().toJson(dDeptList);
	}
	
	// 일정 삭제
	@ResponseBody
	@RequestMapping(value="deleteCal.cal", produces="application/json; charset=UTF-8")
	public String deleteCal(int schNo) {
		
		int result = 0;
		System.out.println("일정 삭제 schNo ? " + schNo);
		
		try {
			
			result = scheduleService.deleteCal(schNo);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		System.out.println("일정 삭제 result ? " + result);
		return String.valueOf(result);
	}
	
	// 수정 - 일정 내용 가져오기
	@RequestMapping("getUpdateCal.sc")
	public String getUpdateCal(int schNo, Model model) {
		
		System.out.println("수정 캘린더 schNo : " + schNo);
		ManageSchedule sch = new ManageSchedule();
		List<Dept> deptList = getDeptList();
		try {
			
			sch = scheduleService.getUpdateCal(schNo);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("sch", sch);
		model.addAttribute("deptList", deptList);
		return "schedule/updateSchedule";
	}
	
	@RequestMapping("updateEvent.sc")
	public String updateEvent(ManageSchedule schedule, HttpServletRequest request, 
			   @RequestParam(value="setEventTime") String setEventTime, String checked) {
		try {
		Employee myEmp =  ((Employee)request.getSession().getAttribute("loginUser"));	
		int myEmpNo = myEmp.getEmpNo();
		
		ManageSchedule calType = new ManageSchedule();
		String schType = schedule.getSch_type(); // 캘린더타입
		
		// 캘린더 번호와 캘린더 색상 받아오기
		switch(schType) {
		case "PRIVATE" :
			calType.setCal_maker(myEmpNo);
			calType.setCal_type(schType);
			calType = scheduleService.selectPrivateCal(calType);
			System.out.println("Private calType ? " + calType);
			break;
		case "사내 전체" :
			System.out.println("schType ? " + schType);
			schType = "전체";
			calType.setCal_name(schType);
			calType = scheduleService.selectCalType(calType);
			System.out.println("DEPT calType ? " + calType);
			break;
		default : 
			System.out.println("schType ? " + schType);
			calType.setCal_name(schType);
			calType = scheduleService.selectCalType(calType);
			System.out.println("DEPT calType ? " + calType);
			break;
		}
		
		String startDate = null;
		String endDate = null;
		
		String[] timeRange = setEventTime.split("-");
		startDate = timeRange[0];
		endDate = timeRange[1];

		String writer = myEmp.getEmpName() + " " + myEmp.getJobName();
		
		schedule.setSch_startdate(startDate);
		schedule.setSch_endate(endDate);
		schedule.setSch_writer(writer);
		schedule.setSch_empno(myEmpNo);
		schedule.setSch_allday(checked);
		schedule.setSch_color(calType.getCal_color());
		schedule.setSch_calNo(calType.getCalNo());
		
		System.out.println("수정 schedule ? " + schedule);
		
		scheduleService.updateEvent(schedule);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:schMain.sc";
		
	}
	
	
}
