package com.helloworks.spring.vacation.controller;



import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.GsonBuilder;
import com.helloworks.spring.attendance.model.service.AttendanceService;
import com.helloworks.spring.attendance.model.vo.Attendance;
import com.helloworks.spring.attendance.model.vo.SearchAttendance;
import com.helloworks.spring.common.exception.CommException;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.vacation.model.service.VacationService;
import com.helloworks.spring.vacation.model.vo.ApprovalAttendance;
import com.helloworks.spring.vacation.model.vo.LoginUserVacation;
import com.helloworks.spring.vacation.model.vo.Vacation;
import com.helloworks.spring.vacation.model.vo.VacationCC;
import com.helloworks.spring.vacation.model.vo.VacationLine;

@Controller
public class VavationController {
	
	@Autowired
	private VacationService vacationService;
	
	@Autowired
	private AttendanceService attendanceService;
	
	//페이지 전환 + 연차 잔여일 받아오기 
	@RequestMapping("vacationForm.ps")
	public String attendanceApiView(HttpServletRequest request, Model model) {
		
		int empNo =  ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo();	 
		
		
		LoginUserVacation annual = vacationService.selectAnnual(empNo);
		
		String loginUserAnnual = String.valueOf(annual.getAnnual()) + " 일";
		
		model.addAttribute("loginUserAnnual", loginUserAnnual);
		
		return "vacation/AllForm";
	}
	
	//초를 -> 일로 변환하는 메소드
	public String changeTime(int num) {
		
		int totalSec = num;
		
		int day = totalSec/ (60*60*24);
		int hour =(totalSec -day*60*60*24) / (60*60);
		int minute = (totalSec - day * 60*60*24 - hour *3600) / 60 ;
		int second = totalSec % 60;
		
		String result = day+"일 " + hour+"시간 ";
		
		return result;
		
	}
	
	//페이지 전환
		@RequestMapping("vacationUse.ps")
		public String vacationUse() {
			System.out.println("휴가사용현황  페이지 전환");
			return "vacation/VacationUse";
		}
		
	//페이지 전환
	@RequestMapping("vacationStatistics.ps")
	public String vacationStatistics() {
		System.out.println("휴가사용통계  페이지 전환");
		return "vacation/VacationStatistics";
	}
	
	//조정문서 날짜 선택 후 상태 가져오기
    @ResponseBody
   	@RequestMapping(value="selectStatus.ps")
   	public String selectStatus(String cancleVDate, HttpServletRequest request){
    	int empNo =  ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo();	 
    	String cancle = cancleVDate.substring(2, 4)+"/"+ cancleVDate.substring(5, 7)+"/"+ cancleVDate.substring(8, 10);
    	
    	SearchAttendance searchStatus = new SearchAttendance();
    	searchStatus.setYear1(cancle);
    	searchStatus.setEmpNo(empNo);  
       	
    	Attendance canclelist = attendanceService.selectStatus(searchStatus);	

    	System.out.println(canclelist);
    	
    	if( canclelist != null) {
    		if(canclelist.getPsStatus().equals("출근전")) {
        		canclelist.setPsStatus("A");
        	}else if(canclelist.getPsStatus().equals("정상출근")) {
                canclelist.setPsStatus("B");
            }else if(canclelist.getPsStatus().equals("반차")) {
               canclelist.setPsStatus("C");
            }else if(canclelist.getPsStatus().equals("지각")) {
               canclelist.setPsStatus("D");
            }else if(canclelist.getPsStatus().equals("결근")) {
               canclelist.setPsStatus("E");
            }else if(canclelist.getPsStatus().equals("휴가")) {
               canclelist.setPsStatus("F");
            }else if(canclelist.getPsStatus().equals("조퇴")) {
               canclelist.setPsStatus("G");
            }else if(canclelist.getPsStatus().equals("연차")) {
               canclelist.setPsStatus("H");
            }
    		return  new GsonBuilder().create().toJson(canclelist);
    	}else {
    		return  new GsonBuilder().create().toJson("");
    	}
    }
    
    //근태구분 결재 insert
    @RequestMapping("insertAttendanceF.ps")
	public String insertAttendanceF(Vacation vacation, VacationCC vaCC, VacationLine line, ApprovalAttendance apA,
								String status, HttpServletRequest request, Model model,
								@RequestParam(name="normalAttach" , required=false) MultipartFile file) {
		
		// 등록 , 임시저장 구분
		if(status.equals("Y")) {
			vacation.setStatus(status);
			vacation.setProgress("진행중");
		}else if(status.equals("N")) {
			vacation.setStatus(status);
			vacation.setProgress("임시저장");
		}
		
	
		String title = request.getParameter("ap_title"); //제목	
		int writer =  ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo();	//작성자
		String deptName =((Employee)request.getSession().getAttribute("loginUser")).getDeptDname(); // 부서
		String content = request.getParameter("apContent"); //내용		
		String deptShare = request.getParameter("deptShare"); // 부서공유
		String documentType = request.getParameter("documentType"); //문서타입 종류(연차,반차,조퇴,결근)
		String datailType = request.getParameter("datailType"); // 근태구분, 휴가구분/조정신청
		
		

		
		vacation.setApClass("근태");
		vacation.setDetailClass("근태");
		vacation.setTitle(title);
		vacation.setWriter(writer);
		vacation.setDeptName(deptName);
		vacation.setContent(content);
		vacation.setDeptShare(deptShare);	
		
		System.out.println("~!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@title !!" + title);
		System.out.println("writer!! " + writer);
		System.out.println("deptShare!! " + deptShare);
		System.out.println("documentType!! " + documentType);
		System.out.println("content!! " + content);
		
		
		System.out.println("datailType!! " + datailType);
						
		// 문서분류에 따른 등록 				
		switch(datailType) {
		case "근태구분" : insertAttendance(vacation, apA, request);
						System.out.println("1111111111111111111111");
					break;
		case "휴가구분" : 			
						insertVacation(vacation, apA, request);	
						System.out.println("222222222222222222222");
					break;
		case "근태조정" :
						//insertAdjust(vacation, am, request);		
						System.out.println("3333333333333333333333333");
					break;
		default : model.addAttribute("msg", "등록되지 않았습니다.");
		}
		
		
		
		// 첨부파일 등록 
		if(file != null) {
			if(!file.getOriginalFilename().equals("")) {
				String newName = saveFile(file,request);
							
				if(newName!=null) {
						vacation.setOriginName(file.getOriginalFilename());
						vacation.setNewName(newName);
						vacationService.insertAttachment(vacation);
					}
				}
		}
				
		//수신참조 등록 (수신자등록)
		String ccCode = request.getParameter("ccCode");
		System.out.println("ccCode : " + ccCode);
		if(!ccCode.equals("")) {							
			if(isInteger(ccCode)) {
				int num = Integer.parseInt(request.getParameter("ccCode"));
				System.out.println("cotroller num :" + num);
				vaCC.setCcMember(num);
				vacationService.insertCcEmpl(vaCC);
			} else {
				vaCC.setCcDept(ccCode);
				System.out.println("deptCode: " + ccCode);
				vacationService.insertCcDept(vaCC);
			}
		}

		System.out.println("~@@@@@@@@@$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$" + ccCode);
								
		// 결재라인 등록  
		insertLine(line, request);		
				
		// 결재 등록 알림창 
		if(status.equals("Y")) {
			model.addAttribute("msg", "결재가 등록되었습니다.");
		}else if(status.equals("N")) {
			model.addAttribute("msg", "결재가 임시저장되었습니다.");
		}
		
		return "main";
	}
	


	

	// 결재 수신참조 부서/직원 구분을 위한 메소드
	private boolean isInteger(String s) { 		
		try {
			Integer.parseInt(s);
		} catch (Exception e) {
			return false;
		} 
		
		return true;
	}
	//Save-file
		public String saveFile(MultipartFile file, HttpServletRequest request) {
			String resources = request.getSession().getServletContext().getRealPath("resources");
			String savePath = resources + "\\upload_files\\"; //저장경로
			
			System.out.println("savePath : "+ savePath);			
			String originName = file.getOriginalFilename(); //원본파일명			
			String cuurentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); //시간			
			String ext = originName.substring(originName.lastIndexOf("."));			
			String newName = cuurentTime + ext;
					
				try {
					file.transferTo(new File(savePath + newName));
				} catch (IllegalStateException e ) {
					newName="";
					e.printStackTrace();
					throw new CommException("file upload error");
				} catch (IOException e) {
					newName="";
					e.printStackTrace();
					throw new CommException("file upload error");
				}			
			return newName;
		}
		
		// 결재권자 파라미터로 받기 
		 private void insertLine(VacationLine line, HttpServletRequest request) {
			
				String[] temp = request.getParameterValues("line");
				System.out.println("temp:" + temp[0]);
				int[] empNo = new int[temp.length];
				
				System.out.println("temp length " + temp.length);
				for(int i=0; i < empNo.length; i++) {
					if(!temp[i].equals("")) {
						empNo[i] = Integer.parseInt(temp[i]);
						System.out.println("tempI=" + temp[i]);
						System.out.println("lineNo=" + empNo[i]);
					}
				}
				
				String[] empName = request.getParameterValues("lineName");	
				String[] jobName = request.getParameterValues("job");
				
				for(int i=0; i<empNo.length; i++) {
					if(empNo[i] != 0) {
						line.setLineNo(i+1);
						line.setEmpNo(empNo[i]);
						line.setEmpName(empName[i]);
						line.setJobName(jobName[i]);			
						vacationService.insertLine(line);		
					}
				}	
				
			}
	
	//Attendance 추가양식 
	private void insertAttendance(Vacation vacation, ApprovalAttendance apA, HttpServletRequest request) {
		
		String documentType = request.getParameter("documentType"); 
		String halfDay = request.getParameter("halfDay"); 
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");

		
		apA.setDocumentType(documentType);//근태부분 문서종류
		apA.setHalfDay(halfDay); //오전 or 오후
		apA.setStartDate(startDate); // 요청시작일
		apA.setEndDate(endDate); // 요청 종료일
		
		vacationService.insertVacation(vacation); 
		vacationService.insertAttendance(apA);
		
	}
	
	//Vacation 추가양식 
	private void insertVacation(Vacation vacation, ApprovalAttendance apA, HttpServletRequest request) {
		
		String vcType = request.getParameter("vcType"); 
		String documentType = request.getParameter("documentType"); 
		String halfDay = request.getParameter("halfDay"); 
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		
		String vacationTitle = request.getParameter("vacationTitle");

		
		apA.setDocumentType("휴가");
		apA.setHalfDay(halfDay); //오전 or 오후
		apA.setStartDate(startDate); // 요청시작일
		apA.setEndDate(endDate); // 요청 종료일
		apA.setVcType(vcType);// 휴가종류
		
		
		
		vacationService.insertVacation(vacation); 
		vacationService.insertAttendance(apA);
		
		
	}
	
	
	//인사팀 전용페이지
	@RequestMapping("hrOnlyPage.ps")
	public String hrOnlyPage(Model model) {
		
		ArrayList<Vacation> hr  = vacationService.selectApproval();
		model.addAttribute("hr", hr);
		
		return "vacation/HrOnlyPage";
	}
	
	//인사팀 전용페이지 결재문서 승인
	@RequestMapping("progressChange.ps")
	public String progressChange(Model model, String documentNo) {
		
		vacationService.progressChange(documentNo); //해당문서 승인완료로 상태변경
		
		//해당문서 조회
		Vacation change = vacationService.onlyOneSelect(documentNo);
		
		//날짜가공
		String stdate = change.getStartDate().substring(2, 4)+"/"+change.getStartDate().substring(5, 7)+"/"+change.getStartDate().substring(8, 10);
		
		//출퇴근 시간변경
		switch(change.getDocumentType()) {
		//1) 반차, 연차
		case"반차": case"연차" :
			Attendance attendance = new Attendance();
			attendance.setAppliedIN(32400);//출근시간
			attendance.setInTime(" ");
			attendance.setAppliedOut(64800);//퇴근시간
			attendance.setOutTime(" ");
			if(change.getDocumentType().equals("반차")) {//상태변경
				attendance.setPsStatus("반차"); 
			}else {
				attendance.setPsStatus("연차"); 
			}
			attendance.setWorkingTime(28800);//일한시간
			attendance.setOverTime(0);//야근시간
			attendance.setTotal(28800);//총시간
			attendance.setEmpNo(change.getWriter());//사번
			attendance.setVacation(stdate); //해당날짜
			
			attendanceService.changeTime(attendance); 
			
			//연차테이블변경
			LoginUserVacation annual = new LoginUserVacation();
			annual.setEmpNo(change.getWriter());
			
			if(change.getDocumentType().equals("반차")) {
				annual.setAnnual(0.5);
			}else {
				annual.setAnnual(1);
			}
			
			vacationService.updateAnnual(annual);
			
			break;
		//2) 휴가
		case "휴가" :
			
			switch(change.getVcType()) {
			case"경조사": case"육아휴직" : case"출산휴가" :
				//휴가테이블 +1 (종료일-시작일)
				break;
			case"보건휴가":
				
				//휴가테이블 +1
				
				break;
			}
			
			break;
		default: model.addAttribute("msg", "변경되지 않았습니다");
		}
		
		
		return "redirect:hrOnlyPage.ps";
	}
}
