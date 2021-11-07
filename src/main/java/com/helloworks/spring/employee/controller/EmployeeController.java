package com.helloworks.spring.employee.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.helloworks.spring.approval.model.service.ApprovalService;
import com.helloworks.spring.approval.model.vo.ApprovalComment;
import com.helloworks.spring.attendance.model.service.AttendanceService;
import com.helloworks.spring.employee.model.service.EmployeeService;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.notice.model.service.NoticeService;
import com.helloworks.spring.request.model.service.RequestService;
import com.helloworks.spring.request.model.vo.Mtr;
import com.helloworks.spring.request.model.vo.RequestEq;
import com.helloworks.spring.vacation.model.service.VacationService;


@SessionAttributes("loginUser")
@Controller
public class EmployeeController {
	
	
	@Autowired 
	private EmployeeService employeeService;

	//김소원
	@Autowired 
	private ApprovalService approvalService;
	
	//조아혜
	@Autowired
	private AttendanceService attendanceService;
	@Autowired
	private VacationService vacationService;
	@Autowired
	private NoticeService noticeService;
	
	//왕다영
	@Autowired
	private RequestService requestService;
	
	//마이페이지 전환
	@RequestMapping("Mypage.mp")
	public String EmployeeMypage() {
		System.out.println("마이페이지 전환");
		return "employee/EmployeeMypage";
	}
	
	//사원등록 페이지 전환
	@RequestMapping("insert.hr")
	public String EmployeeEnrollForm() {
		System.out.println("사원등록 페이지 전환");
		return "employee/EmployeeEnrollFrom";
	}
	
	//로그인
	@RequestMapping(value="login.me", method=RequestMethod.POST)
	public String loginMember(Employee m, Model model) {
				System.out.println("~~~~~~~~~~~~~~M  : "+ m);
				
		try {
			Employee loginUser = employeeService.loginMember(m);
			System.out.println("loginUser :  " + loginUser);
			model.addAttribute("loginUser", loginUser);
			return "redirect:main.mi"; 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("msg","사번 및 비번이 틀렸습니다");
			return "employee/LoginFrom";
		}
		
	}
	
	//조아혜 메소드
	public String changeTime(int num) {		
		int time = num;     
        int hour = time/(60*60);
        int minute = time/60-(hour*60);
        int second = time%60;
        System.out.println(time +"초는 " + hour + "시간, " + minute + "분, " + second + "초입니다.");
		String result = hour+"시간 " + minute+"분 ";		
		return result;		
	}
	
	@RequestMapping("main.mi")
	public ModelAndView main(ModelAndView mv, HttpServletRequest request) {

		  int empNo =  ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo();	
		  
		  //조아혜
//      Attendance attendance = attendanceService.selectAttendance(empNo); //출퇴근시간
//      mv.addObject("attendance", attendance);
//      LoginUserVacation annual = vacationService.selectAnnual(empNo); //연차정보	 
//      mv.addObject("annual", annual);
//      ArrayList<Notice> noticeList = noticeService. selectTopList(); //공지사항
//      mv.addObject("noticeList", noticeList);
//      SearchAttendance as = attendanceService.sysdateWeek(); //이번주
//		  as.setEmpNo(empNo);
//		  Statistics statistics = attendanceService.wtStatisticsOne(as); //소정근로시간			
//		  String test = null;
//		  test = changeTime(statistics.getWorking()); 
//		  statistics.setWorkingS(test);
//		  test = changeTime(statistics.getOver()); 
//		  statistics.setOverS(test);
//		  test = changeTime(statistics.getTotalT()); 
//		  statistics.setTotalTS(test);
//		  test = changeTime(statistics.getLeaveWT()); 
//		  statistics.setLeaveWTS(test);
//		  test = changeTime(statistics.getLeaveOT()); 
//		  statistics.setLeaveOTS(test);
//		  mv.addObject("statistics", statistics);
	      
	      
	      //김소원
	      ArrayList<ApprovalComment> acList = null;
	      String status = "Y"; 			
	      HashMap<String, Object> selectMap = new HashMap<String, Object>();			
	      selectMap.put("loginEmpNo", empNo);
	      selectMap.put("status", status);			
	      acList = approvalService.mainMyApproval(selectMap);
	      mv.addObject("acList", acList);
	      mv.addObject("commentPageURL", "mainMyApproval.ea");
	      mv.addObject("commentPage", 1);
	      
	      
	      
	      //왕다영
	      ArrayList<Mtr> mtrRList = null;		
	      HashMap<String, Object> selectrMtrList = new HashMap<String, Object>();			
	      selectrMtrList.put("loginEmpNo", empNo);		
	      mtrRList = requestService.mainRequestMtr(selectrMtrList);
	      mv.addObject("mtrRList", mtrRList);
	      mv.addObject("mainPageURL", "mainRequest.mtr");
	      mv.addObject("mainPage", 1); 	      
	      
	      ArrayList<RequestEq> eqRList = null;		
	      HashMap<String, Object> selectEqList = new HashMap<String, Object>();			
	      selectrMtrList.put("loginEmpNo", empNo);		
	      eqRList = requestService.mainRequestEq(selectEqList);
	      mv.addObject("eqRList", eqRList);
	      mv.addObject("mainPageURL", "mainRequest.eq");
	      mv.addObject("mainPage", 2); 
	      
	      
	      
	      mv.setViewName("main");
	      return mv;
	}
	
	//로그아웃
		@RequestMapping("logout.me")
		public String logoutMember( SessionStatus status) {
			System.out.println("@@@@@로그아웃" + status);
			status.setComplete(); //현재 컨트롤러에 @SessionAttribute에 의해 저장된 오브젝트를 제거
			return "redirect:index.jsp";
		}	
		
		

}
