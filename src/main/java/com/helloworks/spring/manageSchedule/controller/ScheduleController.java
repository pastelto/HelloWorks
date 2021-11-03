package com.helloworks.spring.manageSchedule.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.GsonBuilder;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.manageSchedule.model.service.ScheduleService;
import com.helloworks.spring.manageSchedule.model.vo.ManageSchedule;
import com.helloworks.spring.workshare.model.vo.WSAttachment;

@Controller
public class ScheduleController {
	
	@Autowired
	private ScheduleService scheduleService;
	
	// 메뉴바 -> 일정관리 메인화면
	@RequestMapping("schMain.sc")
	public String scheduleMain() {
		System.out.println("일정관리 메인화면으로 이동");
		return "schedule/scheduleMain";
	}
	
	// 일정등록하기 - 페이지
	@RequestMapping("addEventsPage.sc")
	public String addEvents() {
		
		return "schedule/addSchedule";
	}
	
	// 일정등록하기
	@RequestMapping("addEvent.sc")
	public String addEvent(ManageSchedule schedule, HttpServletRequest request, 
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
		default : 
			calType.setCal_name(schType);
			calType = scheduleService.selectCalType(calType);
			System.out.println("DEPT calType ? " + calType);
			break;
		}
		
		// 시작 날짜 및 시간 ~ 끝 날짜 및 시간
		String[] timeRange = setEventTime.split("-");
		String startDate = timeRange[0];
		String endDate = timeRange[1];
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
	// 내 일정 불러오기
	@ResponseBody
	@RequestMapping(value="getMyCalender.cal", produces="application/json; charset=UTF-8")
	public String getMyCalender(String calType) {
		
		/*
		 * // 해당 업무공유의 첨부파일 불러오기 List<ManageSchedule> list = new ArrayList<>(); try {
		 * list = workShareService.detailWSAttachment(wno);
		 * 
		 * } catch (Exception e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); }
		 * 
		 * if(!list.isEmpty()) { System.out.println("wsaList Attachment ? " + list);
		 * return new GsonBuilder().create().toJson(list); } else { int result = 0;
		 *  }
		 */
		return String.valueOf("1");
	}
	
	
	
}
