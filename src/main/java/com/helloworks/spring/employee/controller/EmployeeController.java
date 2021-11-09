package com.helloworks.spring.employee.controller;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.helloworks.spring.approval.model.service.ApprovalService;
import com.helloworks.spring.approval.model.vo.Approval;
import com.helloworks.spring.approval.model.vo.ApprovalComment;
import com.helloworks.spring.attendance.model.service.AttendanceService;
import com.helloworks.spring.attendance.model.vo.Attendance;
import com.helloworks.spring.attendance.model.vo.SearchAttendance;
import com.helloworks.spring.attendance.model.vo.Statistics;
import com.helloworks.spring.common.Pagination;
import com.helloworks.spring.common.exception.CommException;
import com.helloworks.spring.common.model.vo.PageInfo;
import com.helloworks.spring.employee.model.service.EmployeeService;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.mail.model.service.MailService;
import com.helloworks.spring.mail.model.vo.Mail;
import com.helloworks.spring.manageSchedule.model.service.ScheduleService;
import com.helloworks.spring.notice.model.service.NoticeService;
import com.helloworks.spring.notice.model.vo.Notice;
import com.helloworks.spring.offieceRoom.model.vo.SearchEmployee;
import com.helloworks.spring.request.model.service.RequestService;
import com.helloworks.spring.request.model.vo.Mtr;
import com.helloworks.spring.request.model.vo.RequestEq;
import com.helloworks.spring.vacation.model.service.VacationService;
import com.helloworks.spring.vacation.model.vo.LoginUserVacation;
import com.helloworks.spring.workshare.model.service.WorkShareService;
import com.helloworks.spring.workshare.model.vo.WorkShare;



@SessionAttributes("loginUser")
@Controller
public class EmployeeController {
	
	// 김다혜
	@Autowired
   	private ScheduleService scheduleService;
	@Autowired
	private WorkShareService workShareService;
	
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
	@Autowired
	private MailService mailService;
	
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

		  Employee myEmp = (Employee)request.getSession().getAttribute("loginUser");
		  int empNo =  myEmp.getEmpNo();	
		  
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
		  try {
			  String test = "";
			  test = changeTime(statistics.getWorking()); 
			  statistics.setWorkingS(test);
			  test = changeTime(statistics.getOver()); 
			  statistics.setOverS(test);
			  mv.addObject("statistics", statistics);
		  }catch (NullPointerException e) {
		  }
		

	      //김소원
	      ArrayList<ApprovalComment> acList = null;
	      ArrayList<Approval> approvalList = null;
	      String status = "Y"; 			
	      HashMap<String, Object> selectMap = new HashMap<String, Object>();			
	      selectMap.put("loginEmpNo", empNo);
	      selectMap.put("status", status);	
	      int flag = 0;
	      
	      if(request.getParameter("flag") != null) {
	    	  flag = Integer.parseInt(request.getParameter("flag"));
	    	  
		      if(flag == 0) {
			      acList = approvalService.mainMyApproval(selectMap);
			      mv.addObject("acList", acList);
			      mv.addObject("commentPageURL", "mainMyApproval.ea");
			      mv.addObject("commentPage", 1);
		      } else if(flag == 1) {		    	  
		    	  approvalList = approvalService.mainPending(selectMap);
			      mv.addObject("approvalList", approvalList);
			      mv.addObject("commentPageURL", "mainPendingApproval.ea");
			      mv.addObject("commentPage", 2);
		      }
		  } else {
			  acList = approvalService.mainMyApproval(selectMap);
		      mv.addObject("acList", acList);
		      mv.addObject("commentPageURL", "mainMyApproval.ea");
		      mv.addObject("commentPage", 1);
		  }
	      
	      //왕다영
		  // 회의실
	      ArrayList<Mtr> mtrRList = null;		
	      HashMap<String, Object> selectrMtrList = new HashMap<String, Object>();			
	      selectrMtrList.put("loginEmpNo", myEmp.getEmpNo());		
	      mtrRList = requestService.mainRequestMtr(selectrMtrList);
	      // 비품
	      ArrayList<RequestEq> eqRList = null;		
	      HashMap<String, Object> selectEqList = new HashMap<String, Object>();			
	      selectEqList.put("loginEmpNo", myEmp.getEmpNo());		
	      eqRList = requestService.mainRequestEq(selectEqList);
	      // 메일
		  ArrayList<Mail> mailList = new ArrayList<>();
		  mailList = mailService.inboxMailList(myEmp);
		  
		  mv.addObject("mtrRList", mtrRList);
		  mv.addObject("eqRList", eqRList);
		  mv.addObject("mailList", mailList);
		  
		  System.out.println("mailList--------------"+ mailList);

	      System.out.println("------업무공유 시작-------");

	      //김다혜
	      // 미확인 업무 개수 
	      ArrayList<WorkShare> unCheckedList = new ArrayList<WorkShare>();
	      ArrayList<WorkShare> sendList = new ArrayList<WorkShare>();
	      // 미확인 업무 목록 
	      unCheckedList = workShareService.mainUnCheckedList(myEmp);
	      sendList = workShareService.mainSendList(myEmp);
	      mv.addObject("unCheckedList", unCheckedList);
	      mv.addObject("sendList", sendList);


	    
	      
	      

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
	public String EmployeeMypage(Model model, HttpServletRequest request) {
		System.out.println("마이페이지 전환");
		
		int empNo =  ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo();			
		Employee emp = employeeService.selectEmp(empNo);
		model.addAttribute("emp",emp );
		
		return "employee/EmployeeMypage";
	}
	
	//사원수정
	@RequestMapping("update.me")
	public String updateEmp(@ModelAttribute Employee m, HttpServletRequest request,  @RequestParam("empPhone") String empPhone, Model model,
															@RequestParam(name="empOrgPicName", required=true) MultipartFile file,
															@RequestParam(name="empOrgSignName", required=true) MultipartFile file1) {
		
		m.setEmpPhone(empPhone);
		
		if(!file.getOriginalFilename().equals("")) {
			String chgPic = saveFile(file, request,"pic");
			
			String chgSign = saveFile(file1, request, "sign");
			
			System.out.println("chgPic : " + chgPic);
			System.out.println("chgSign : " + chgSign);
			if(chgPic!=null) {
					m.setEmpOrgPic(file.getOriginalFilename());
					m.setEmpChgPic(chgPic);				
				
				}
			if(chgSign != null) {
					m.setEmpOrgSign(file1.getOriginalFilename());
					m.setEmpChgSign(chgSign);
				}
			}		
		
		Employee userInfo = employeeService.updateEmp(m);
		
		
		model.addAttribute("loginUser", userInfo);
		model.addAttribute("msg","정보가 수정되었습니다");
		
		return "redirect:Mypage.mp";		
	}
	
	// 파일 저장
		public String saveFile(MultipartFile file, HttpServletRequest request, String type) {
			String resources = request.getSession().getServletContext().getRealPath("resources");
			
			String savePath = "";
			if(type.equals("pic")) {
				savePath = resources + "\\idPhoto_files\\";
			}else if(type.equals("sign")) {
				savePath = resources + "\\idSign_files\\";
			}
						
		System.out.println("savePath : "+ savePath);		
			String orgPic = file.getOriginalFilename(); //원본파일명		
			String cuurentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); //시간		
			String ext = orgPic.substring(orgPic.lastIndexOf("."));		
			String chgPic = cuurentTime + ext;
				try {
					file.transferTo(new File(savePath + chgPic));
				} catch (IllegalStateException e ) {
					chgPic="";
					e.printStackTrace();
					throw new CommException("사진파일 등록 실패");
				} catch (IOException e) {
					chgPic="";
					e.printStackTrace();
					throw new CommException("사진파일 등록 실패");
				}		
			return chgPic;
		}
	
	
	//사원등록 페이지 전환
	@RequestMapping("insertForm.hr")
	public String EmployeeEnrollForm(Model model) {
		System.out.println("사원등록 페이지 전환");
		
		return "employee/EmployeeEnrollForm";
	}
	
	
	@RequestMapping("insert.hr")
	public String insertEmp(Employee m, HttpSession session) {
		
		
		System.out.println("m.getDeptCode@@@@@@@@@@@@@@@@"+ m.getDeptCode());
		
		System.out.println("m.setEmpAddress"+ m);
		
		System.out.println("암호화 전: "+ m.getEmpPwd());
		
		
		
		employeeService.insertEmp(m);
		
		Employee emp = employeeService.getLastEmpNo();
		scheduleService.insertCal(emp.getEmpNo());
		session.setAttribute("msg", "사원등록성공");
		return "redirect:main.mi";

	}
	
	// 인사팀 - 하연
	@RequestMapping("empManageMain.hr")
	public String empManageMain(@RequestParam(value="currentPage", required=false, defaultValue = "1") int currentPage, Model model) {
		
		
		int listCount = employeeService.selectAllEmployeeListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Employee> list = employeeService.selectAllEmployee(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("pageURL", "empManageMain.hr");
		model.addAttribute("checkY", "checked");
		
		return "employee/empManageMain";
	}
	
	// 인사팀 - 하연
	@RequestMapping("empManageHrType.hr")
	public String empManageLeave(String hrType, @RequestParam(value="currentPage", required=false, defaultValue = "1") int currentPage, Model model) {
		
		int listCount = employeeService.selectHrTypeEmployeeListCount(hrType);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Employee> list = employeeService.selectHrTypeEmployee(hrType, pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("pageURL", "empManageHrType.hr");
		
		if(hrType.equals("Y")) {
			model.addAttribute("checkY", "checked");
		}else if(hrType.equals("V")){
			model.addAttribute("checkV", "checked");
		}else if(hrType.equals("N")) {
			model.addAttribute("checkN", "checked");
		}
		
		return "employee/empManageMain";
	}
	

	// 인사팀 - 하연
	@RequestMapping("searchEmployee.hr")
	public String searchEmployee(String hrType, String optionType, String deptTypeOption, String searchEmployee, @RequestParam(value="currentPage", required=false, defaultValue = "1") int currentPage, Model model) {

		System.out.println("optionType: "+optionType);
		System.out.println("hrType: "+hrType);
		System.out.println("deptTypeOption: "+deptTypeOption);
		System.out.println("searchEmployee: "+searchEmployee);
		
		SearchEmployee se = new SearchEmployee();
		
		if(hrType.equals("null")) {
			se.setHrType("Y");
		}else {
			se.setHrType(hrType);
		}
		
		
		switch(optionType) {
		case "allType":
			se.setAllType(searchEmployee);
			break;
		case "deptType":
			se.setDeptType(searchEmployee);
			se.setDeptTypeOption(deptTypeOption);
			break;
		case "empNoType":
			se.setEmpNoType(searchEmployee);
			break;
		case "empNameType":
			se.setEmpNameType(searchEmployee);
			break;
		case "ePhoneType":
			se.setePhoneType(searchEmployee);
			break;
		case "emailType":
			se.setEmailType(searchEmployee);
			break;
		}
		
		int listCount = employeeService.searchEmployeeListCount(se);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Employee> list = employeeService.searchEmployee(se, pi);
		
		
		if(hrType.equals("Y")) {
			model.addAttribute("checkY", "checked");
		}else if(hrType.equals("V")){
			model.addAttribute("checkV", "checked");
		}else if(hrType.equals("N")) {
			model.addAttribute("checkN", "checked");
		}
		
		model.addAttribute("optionType", optionType);
		model.addAttribute("hrType", hrType);
		model.addAttribute("deptTypeOption", deptTypeOption);
		model.addAttribute("searchEmployee", searchEmployee);
		model.addAttribute("list", list);
		
		return "employee/empManageMain";
	}

	//인사팀 - 하연
	@RequestMapping("updateEmployeeForm.hr")
	public String updateEmployeeForm(int empNo, Model model) {
		
		Employee employee = employeeService.selectEmp(empNo);
		model.addAttribute("employee", employee);
		return "employee/employeeUpdate";
	}
	
	//인사팀 - 하연
	@RequestMapping("updateEmployee.hr")
	public String updateEmployee(String fireDate, Employee employee) {
		
		System.out.println("전달 값: "+employee);
		
		if(fireDate.equals("")) {
			System.out.println("날짜 비었다.");
		}else {
			System.out.println("날짜 안빔");
		}
		
		employeeService.updateEmployee(employee);
		
		return "redirect:empManageMain.hr";
	}
	
	//인사팀 - 하연
	@RequestMapping("detailEmployee.hr")
	public String detailEmployee(int empNo, Model model) {
		
		Employee employee = employeeService.selectEmp(empNo);
		model.addAttribute("employee", employee);
		
		return "employee/detailEmployee";
	}
	
	// 메인 미확인업무
	@ResponseBody
	@RequestMapping(value="mainAll.mi", produces="application/json; charset=UTF-8")
	public String mainAll(HttpServletRequest request, Model model) {
		 
		  // 업무공유 
		  Employee myEmp = (Employee)request.getSession().getAttribute("loginUser");
		 
	      // 업무공유 - 미확인
		  ArrayList<WorkShare> unCheckedList = new ArrayList<WorkShare>();
	      unCheckedList = workShareService.mainUnCheckedList(myEmp);
	      // 업무공유 - 발신
	      ArrayList<WorkShare> sendList = new ArrayList<WorkShare>();
		  sendList = workShareService.mainSendList(myEmp);

		  // 회의실
	      ArrayList<Mtr> mtrRList = null;		
	      HashMap<String, Object> selectrMtrList = new HashMap<String, Object>();			
	      selectrMtrList.put("loginEmpNo", myEmp.getEmpNo());		
	      mtrRList = requestService.mainRequestMtr(selectrMtrList);
	      // 비품
	      ArrayList<RequestEq> eqRList = null;		
	      HashMap<String, Object> selectEqList = new HashMap<String, Object>();			
	      selectEqList.put("loginEmpNo", myEmp.getEmpNo());		
	      eqRList = requestService.mainRequestEq(selectEqList);
	      // 메일
		  ArrayList<Mail> mailList = new ArrayList<>();
		  mailList = mailService.inboxMailList(myEmp);
		  
		  // 해쉬맵 
		  HashMap<String, Object> mainAll = new HashMap<String, Object>();
		  // 다혜
		  mainAll.put("unCheckedList", unCheckedList);
		  mainAll.put("sendList", sendList);

	      // 다영
		  mainAll.put("mtrRList", mtrRList);
		  mainAll.put("eqRList", eqRList);
		  mainAll.put("mailList", mailList);

		  
	      return new GsonBuilder().setDateFormat("yy년 MM월 dd일").create().toJson(mainAll);
	}

}
