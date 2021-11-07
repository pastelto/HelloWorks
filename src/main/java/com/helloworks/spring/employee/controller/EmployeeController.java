package com.helloworks.spring.employee.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.helloworks.spring.approval.model.service.ApprovalService;
import com.helloworks.spring.approval.model.vo.ApprovalComment;
import com.helloworks.spring.attendance.model.service.AttendanceService;
import com.helloworks.spring.attendance.model.vo.Attendance;
import com.helloworks.spring.attendance.model.vo.SearchAttendance;
import com.helloworks.spring.attendance.model.vo.Statistics;
import com.helloworks.spring.employee.model.service.EmployeeService;
import com.helloworks.spring.employee.model.vo.Dept;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.manageSchedule.model.service.ScheduleService;
import com.helloworks.spring.notice.model.service.NoticeService;
import com.helloworks.spring.notice.model.vo.Notice;
import com.helloworks.spring.request.model.service.RequestService;
import com.helloworks.spring.request.model.vo.Mtr;
import com.helloworks.spring.request.model.vo.RequestEq;
import com.helloworks.spring.vacation.model.service.VacationService;
import com.helloworks.spring.vacation.model.vo.LoginUserVacation;


@SessionAttributes("loginUser")
@Controller
public class EmployeeController {
	
   @Autowired
   private ScheduleService scheduleService;
	
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
		  Attendance attendance = attendanceService.selectAttendance(empNo); //출퇴근시간
		  mv.addObject("attendance", attendance);
		  LoginUserVacation annual = vacationService.selectAnnual(empNo); //연차정보	 
		  mv.addObject("annual", annual);
		  ArrayList<Notice> noticeList = noticeService. selectTopList(); //공지사항
		  mv.addObject("noticeList", noticeList);
		  SearchAttendance as = attendanceService.sysdateWeek(); //이번주
		  as.setEmpNo(empNo);
		  Statistics statistics = attendanceService.wtStatisticsOne(as); //소정근로시간			
		  String test = null;
		  test = changeTime(statistics.getWorking()); 
		  statistics.setWorkingS(test);
		  test = changeTime(statistics.getOver()); 
		  statistics.setOverS(test);
		  test = changeTime(statistics.getTotalT()); 
		  statistics.setTotalTS(test);
		  test = changeTime(statistics.getLeaveWT()); 
		  statistics.setLeaveWTS(test);
		  test = changeTime(statistics.getLeaveOT()); 
		  statistics.setLeaveOTS(test);
		  mv.addObject("statistics", statistics);	      

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
		
	//마이페이지 전환
	@RequestMapping("Mypage.mp")
	public String EmployeeMypage(ModelAndView mv, HttpServletRequest request) {
		System.out.println("마이페이지 전환");
		
		int empNo =  ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo();			
		Employee emp = employeeService.selectEmp(empNo);
		
		
		return "employee/EmployeeMypage";
	}
	
	//사원수정
	@RequestMapping("update.me")
	public String updateEmp(@ModelAttribute Employee m, @RequestParam("empPhone") String empPhone, Model model) {
		
		m.setEmpPhone(empPhone);
		Employee userInfo = employeeService.updateEmp(m);
		
		model.addAttribute("loginUser", userInfo);
		model.addAttribute("msg","정보가 수정되었습니다");
		
		return "redirect:Mypage.mp";		
	}
	
	//사원등록 페이지 전환
	@RequestMapping("insertForm.hr")
	public String EmployeeEnrollForm(Model model) {
		System.out.println("사원등록 페이지 전환");
		
		List<Dept> deptList = getDeptList();
		
		List<Dept> deptUList = employeeService.getDeptUList();
	    
	            
	       model.addAttribute("deptList", deptList);
	       
	       model.addAttribute("deptUList", deptUList);
		
		return "employee/EmployeeEnrollForm";
	}
	 private List<Dept> getDeptList() {
		   
	      List<Dept> deptList = new ArrayList<Dept>();
	      
	      // 부서목록 구하기
	            try {
	               deptList = employeeService.getDeptList();
	               System.out.println("deptList" + deptList);
	            } catch (Exception e) {
	               // TODO Auto-generated catch block
	               e.printStackTrace();
	            }
	            
	      return deptList;
	   }
	
	
	@RequestMapping("insert.hr")
	public String insertEmp(Employee m, HttpSession session) {
		
		
		System.out.println("m.getDeptCode@@@@@@@@@@@@@@@@"+ m.getDeptCode());
		
		System.out.println("m.setEmpAddress"+ m);
		
		System.out.println("암호화 전: "+ m.getEmpPwd());
		
		employeeService.insertEmp(m);
		session.setAttribute("msg", "사원등록성공");
		return "redirect:main.mi";
		
		
	}
	
	
	

}
