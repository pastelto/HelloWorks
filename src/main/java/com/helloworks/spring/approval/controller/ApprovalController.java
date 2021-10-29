package com.helloworks.spring.approval.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.GsonBuilder;
import com.helloworks.spring.approval.model.service.ApprovalService;
import com.helloworks.spring.approval.model.vo.Approval;
import com.helloworks.spring.approval.model.vo.ApprovalCC;
import com.helloworks.spring.approval.model.vo.ApprovalDiploma;
import com.helloworks.spring.approval.model.vo.ApprovalExDetails;
import com.helloworks.spring.approval.model.vo.ApprovalExpenditure;
import com.helloworks.spring.approval.model.vo.ApprovalHr;
import com.helloworks.spring.approval.model.vo.ApprovalLine;
import com.helloworks.spring.approval.model.vo.ApprovalMinutes;
import com.helloworks.spring.common.Pagination;
import com.helloworks.spring.common.exception.CommException;
import com.helloworks.spring.common.model.vo.PageInfo;
import com.helloworks.spring.employee.model.vo.Employee;

@Controller
public class ApprovalController {

	
	@Autowired
	private ApprovalService approvalService;
	
	@RequestMapping("normalApprovalForm.ea")
	public String normalApprovalForm() {
		
		return "approval/normalApprovalForm";
	}
	
	@RequestMapping("expenditureApprovalForm.ea")
	public String expenditureApprovalForm(Model model) {
		
		ArrayList<ApprovalExDetails> chlist = approvalService.selectExNumch();
		ArrayList<ApprovalExDetails> colist = approvalService.selectExNumco();
		
		model.addAttribute("chlist",chlist);
		model.addAttribute("colist",colist);
		
		return "approval/expenditureApprovalForm";
	}
	
	@RequestMapping("searchDeptForm.ea")
	public String searchDeptForm() {
		
		return "approval/searchDeptForm";
	}
	
	@RequestMapping("plusAppLineForm.ea")
	public String plusAppLineForm() {
		
		return "approval/plusAppLineForm";
	}

	
	@RequestMapping("plusccForm.ea")
	public String plusccForm() {
		
		return "approval/plusccForm";
	}
	
	@RequestMapping("plusCooForm.ea")
	public String plusCooForm() {
		
		return "approval/plusCooForm";
	}
	
	@RequestMapping("temporarySave.ea")
	public String temporarySave() {
		
		return "approval/temporarySaveMain";
	}
	
	//임시저장함 detail - 일반결재
	@RequestMapping("normalTempDetail.ea")
	public String normalTempDetail(HttpServletRequest request, Model model) {
		
		int apNo = Integer.parseInt(request.getParameter("apNo"));
		String detailClass = "기안";
				
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		
		searchMap.put("apNo", apNo);
		searchMap.put("detailClass", detailClass);
		
		Approval approval = approvalService.selectApprovalDetail(searchMap);
		Approval apAttach = approvalService.selectAttachDetail(searchMap);
		ApprovalCC apCC = approvalService.selectApprovalCC(searchMap);
		ApprovalLine line = approvalService.selectApprovalLine(searchMap);
		
		 model.addAttribute(approval);
		 model.addAttribute(apCC);
		 model.addAttribute(line);
		 model.addAttribute(apAttach);
		
		
		return "approval/normalTempDetailFrom";
	}
	
	// 임시저장함 - 일반결재
	@RequestMapping("tempNormal.ea")
	public String tempNormal(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage , HttpServletRequest request, Model model) {
		
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo(); 
		String apClass = "일반";	
		
		HashMap<String, Object> searchMap = new HashMap<String, Object>();	
		searchMap.put("loginEmpNo", loginEmpNo);
		searchMap.put("apClass", apClass);
		
		int listCount = approvalService.selectListCount(searchMap);
		
		
		System.out.println("임시저장 결재 수 : " + listCount);
		
		int pageLimit = 10;
		int boardLimit = 10; 
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Approval> approvalList = approvalService.selectTempApproval(searchMap, pi);
		
		model.addAttribute("approvalList", approvalList);
		model.addAttribute("pi", pi);
		model.addAttribute("pageURL", "tempNormal.ea");
		model.addAttribute("page", 1);
		
		
		return "approval/temporarySaveMain";
	}
	
	// 임시저장함 - 지출결재
	@RequestMapping("tempExpenditure.ea")
	public String tempExpenditure(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage , HttpServletRequest request, Model model) {
		
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo(); 
		String apClass = "지출";	
		
		HashMap<String, Object> searchMap = new HashMap<String, Object>();	
		searchMap.put("loginEmpNo", loginEmpNo);
		searchMap.put("apClass", apClass);
		
		int listCount = approvalService.selectListCount(searchMap);
		
		System.out.println("임시저장 결재 수 : " + listCount);
		
		int pageLimit = 10;
		int boardLimit = 10; 
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Approval> approvalList = approvalService.selectTempApproval(searchMap, pi);
		
		model.addAttribute("approvalList", approvalList);
		model.addAttribute("pi", pi);
		model.addAttribute("pageURL", "tempExpenditure.ea");
		model.addAttribute("page", 2);
		
		
		return "approval/temporarySaveMain";
	}
	
	// 전자결재  Insert
	@RequestMapping("insertApproval.ea")
	public String insertApproval(Approval ap, ApprovalCC ac, ApprovalDiploma ad, ApprovalHr ah, ApprovalLine line, ApprovalMinutes am,
								String status, HttpServletRequest request, Model model,
								@RequestParam(name="normalAttach" , required=false) MultipartFile file) {
		
		
		// 등록 , 임시저장 구분
		if(status.equals("Y")) {
			ap.setStatus(status);
			ap.setProgress("진행중");
		}else if(status.equals("N")) {
			ap.setStatus(status);
			ap.setProgress("임시저장");
		}
		
		System.out.println("status : " + status);
				
		String detailClass = request.getParameter("doc_type");
		String title = request.getParameter("ap_title");
		int writer = Integer.parseInt(request.getParameter("writer"));
		String writerJob = request.getParameter("writerJob");
		String deptName = request.getParameter("userDept");
		String content = request.getParameter("apContent");
		String cooper= request.getParameter("cooperator0");
		String cooJob = request.getParameter("cooJob");
		String deptShare = request.getParameter("deptShare");
		
		ap.setApClass("일반");
		ap.setDetailClass(detailClass);
		ap.setTitle(title);
		ap.setWriter(writer);
		ap.setWriterJob(writerJob);
		ap.setDeptName(deptName);
		ap.setContent(content);
		ap.setCooper(cooper);
		ap.setCooJob(cooJob);
		ap.setDeptShare(deptShare);		
		
		System.out.println("ap :" + ap);
						
		// 문서분류에 따른 등록 
		String dtype = request.getParameter("doc_type");
				
		switch(dtype) {
		case "기안" : approvalService.insertApproval(ap);
					break;
		case "공문" : 			
					insertDiploma(ap, ad, request);					
					break;
		case "회의" :
					insertMinutes(ap, am, request);					
					break;
		case "인사" : 
					insertHr(ap, ah, request);					
					break;
		default : model.addAttribute("msg", "등록되지 않았습니다.");
		}
		
		// 첨부파일 등록 
		if(file != null) {
			if(!file.getOriginalFilename().equals("")) {
				String newName = saveFile(file,request);
							
				if(newName!=null) {
						ap.setOriginName(file.getOriginalFilename());
						ap.setNewName(newName);
						approvalService.insertAttachment(ap);
					}
				}
		}
				
		// 수신참조 등록 
						
		/*Object ccCode = request.getParameter("ccCode");
				
		if(ccCode instanceof Integer) {
			System.out.println("이것은 숫자입니다.");
			int ccMember  = (int) ccCode;
			ac.setCcMember(ccMember);
			approvalService.insertCcEmpl(ac);
	
		} else {
			System.out.println("이것은 문자입니다.");
				String ccMember = (String) ccCode;
				ac.setCcDept(ccMember);
				approvalService.insertCcDept(ac);
		}		*/
		
		String ccCode = request.getParameter("ccCode");
		System.out.println("ccCode : " + ccCode);
		if(!ccCode.equals("")) {							
			if(isInteger(ccCode)) {
				int num = Integer.parseInt(request.getParameter("ccCode"));
				System.out.println("cotroller num :" + num);
				ac.setCcMember(num);
				approvalService.insertCcEmpl(ac);
			} else {
				ac.setCcDept(ccCode);
				System.out.println("deptCode: " + ccCode);
				approvalService.insertCcDept(ac);
			}
		}
			
		
								
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

	// 전자결재 - 지출결재 등록 
	@RequestMapping("insertExApproval.ea")
	public String insertExApproval(Approval ap, ApprovalExpenditure ae, ApprovalExDetails ad, ApprovalCC ac, ApprovalLine line, 
									String status, HttpServletRequest request, Model model,
									@RequestParam(name="normalAttach" , required=false) MultipartFile file) {
									
		// 등록 , 임시저장 구분
		if(status.equals("Y")) {
			ap.setStatus(status);
			ap.setProgress("진행중");
		}else if(status.equals("N")) {
			ap.setStatus(status);
			ap.setProgress("임시저장");
		}
				
		System.out.println("status : " + status);
			
		String detailClass = request.getParameter("doc_type");
		String title = request.getParameter("ap_title");
		int writer = Integer.parseInt(request.getParameter("writer"));
		String writerJob = request.getParameter("writerJob");
		String deptName = request.getParameter("userDept");
		String content = request.getParameter("apContent");
		String cooper= request.getParameter("cooperator0");
		String cooJob = request.getParameter("cooJob");
		String deptShare = request.getParameter("deptShare");
		
		ap.setApClass("일반");
		ap.setDetailClass(detailClass);
		ap.setTitle(title);
		ap.setWriter(writer);
		ap.setWriterJob(writerJob);
		ap.setDeptName(deptName);
		ap.setContent(content);
		ap.setCooper(cooper);
		ap.setCooJob(cooJob);
		ap.setDeptShare(deptShare);		
		
		approvalService.insertApproval(ap);
		
		
		String exForm = request.getParameter("ex_radio");
		String exCommon = request.getParameter("commonEx");
		
		ae.setExForm(exForm);
		ae.setExCommon(exCommon);
		
		approvalService.insertExpenditure(ae);
		
		String exType = request.getParameter("exType");
		String exNum = request.getParameter("exNum");
		
		
		String[] exDate = request.getParameterValues("exDate");
		String[] exContent = request.getParameterValues("exContent");
		String[] temp =	request.getParameterValues("price");
		int[] price = null;
		price = new int[temp.length];
		for(int i=0; i < price.length; i++) {
			price[i] = Integer.parseInt(temp[i]);
		}
		String[] exAccount = request.getParameterValues("accName");
		String[] exBank = request.getParameterValues("bankName");
		String[] accNum = request.getParameterValues("accNum");
		String[] holder = request.getParameterValues("accHolder");
		String[] exDept = request.getParameterValues("exDept");
		String[] note = request.getParameterValues("note");
		
		for(int i=0; i<exDate.length; i++) {
			ad.setExType(exType);
			ad.setExNum(exNum);
			ad.setExTitle(title);
			ad.setExNo(i);
			ad.setCreateDate(exDate[i]);
			ad.setContent(exContent[i]);
			ad.setPrice(price[i]);
			ad.setAccName(exAccount[i]);
			ad.setBankName(exBank[i]);
			if(accNum != null) {
				ad.setAccNum(accNum[i]);
			}
			if(holder != null) {
				ad.setAccHolder(holder[i]);
			}
			if(exDept != null) {
				ad.setExDate(exDept[i]);
			}
			if(note != null) {
				ad.setNote(note[i]);
			}
					
			approvalService.insertExpenditureDetail(ad);
		}
		
		// 첨부파일 등록 
		
		if(file != null) {
			if(!file.getOriginalFilename().equals("")) {
				String newName = saveFile(file,request);
							
				if(newName!=null) {
						ap.setOriginName(file.getOriginalFilename());
						ap.setNewName(newName);
						approvalService.insertAttachment(ap);
					}
				}
		}
									
		// 수신참조 등록 
								
		if(request.getParameter("ccCode")!= "") {
			
			String ccCode = request.getParameter("ccCode");			
					
			if(isInteger(ccCode)) {
				int num = Integer.parseInt(request.getParameter("ccCode"));
				System.out.println("cotroller num :" + num);
				ac.setCcMember(num);
				approvalService.insertCcEmpl(ac);
			} else {
				ac.setCcDept(ccCode);
				approvalService.insertCcDept(ac);
			}
		}
										
		// 결재라인 등록 
		insertLine(line, request);		
		
		//수신참조 부서, 직원 구분
		if(status.equals("Y")) {
			model.addAttribute("msg", "결재가 등록되었습니다.");
		}else if(status.equals("N")) {
			model.addAttribute("msg", "결재가 임시저장되었습니다.");
		}
	
		return "main";		
	}
	
	
	//결재라인 등록 
	public void insertLine(ApprovalLine line, HttpServletRequest request) {
		
		// 결재권자 파라미터로 받기 
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
				approvalService.insertLine(line);		
			}
		}	
	}
	
	public void insertDiploma(Approval ap, ApprovalDiploma ad, HttpServletRequest request) {
		
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String officeAddress = request.getParameter("officeAddress");
		ad.setEmail(email);
		ad.setPhone(phone);
		ad.setOfficeAddress(officeAddress);
		approvalService.insertApproval(ap); 
		approvalService.insertDiploma(ad);
		
	}

	public void insertMinutes(Approval ap, ApprovalMinutes am, HttpServletRequest request) {
		String attendees = request.getParameter("attendees");
		String title = request.getParameter("mm_title");
		am.setAttendees(attendees);
		am.setTitle(title);
		approvalService.insertApproval(ap); 
		approvalService.insertMinutes(am);
		
	}

	public void insertHr(Approval ap, ApprovalHr ah, HttpServletRequest request) {
		String dueDate = request.getParameter("dueDate");
		String hrtype = request.getParameter("hr_type");
		ap.setApClass("인사");
		ah.setHrClass(hrtype);
		ah.setDueDate(dueDate);
		approvalService.insertApproval(ap); 
		approvalService.insertHr(ah);
		
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
	
	@ResponseBody
	@RequestMapping(value="selectDateSortTemp.ea", produces= "application/json; charset=utf-8")
	public String selectDateSortTemp(HttpServletRequest request) {
		
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo();		
		String sdate = request.getParameter("sdate");
		String apClass = request.getParameter("apClass");
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("loginEmpNo", loginEmpNo);
		searchMap.put("apClass", apClass);
		
		System.out.println("기간 : " + sdate);
		int sDate= 0;
		ArrayList<Approval> list = null;
		switch(sdate) {
			case "당일" : 
				sDate = 0;
				searchMap.put("sDate", sDate);				
				list = approvalService.selectTempDate(searchMap);
				break;
			case "1주일" : 
				sDate = 7;
				searchMap.put("sDate", sDate);	
				list = approvalService.selectTempDate(searchMap);
				break;
			case "1개월" :
				sDate = 30;
				searchMap.put("sDate", sDate);	
				list = approvalService.selectTempDate(searchMap);
				break;
			case "3개월" :
				sDate = 90;
				searchMap.put("sDate", sDate);	
				list = approvalService.selectTempDate(searchMap);
				break;
			case "6개월" :
				sDate = 180;
				searchMap.put("sDate", sDate);	
				list = approvalService.selectTempDate(searchMap);
				break;
			case "1년" :
				sDate = 365;
				searchMap.put("sDate", sDate);	
				list = approvalService.selectTempDate(searchMap);
				break;
			default : 
				break;
		}
		
		return new GsonBuilder().create().toJson(list);
		
	}
	

	
	@ResponseBody
	@RequestMapping(value="selectAllTempApproval.ea", produces= "application/json; charset=utf-8")
	public String selectAllTempApproval(HttpServletRequest request) {
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo();		
			
		String option = request.getParameter("cOption");
		
		HashMap<String, Object> searchMap = new HashMap<String, Object>();	
		
		searchMap.put("loginEmpNo", loginEmpNo);
		searchMap.put("option", option);
		
		ArrayList<Approval> list = approvalService.selectAllTempApproval(searchMap);
		
		return new GsonBuilder().create().toJson(list);
	}
	
	
	@ResponseBody
	@RequestMapping(value="selectSearchSortTemp.ea", produces= "application/json; charset=utf-8")
	public String selectSearchSortTemp(HttpServletRequest request) {
		
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo();			
		String optionType = request.getParameter("optionType");
		String endDate = request.getParameter("endDate");
		String startDate = request.getParameter("startDate");
		String detailOption = request.getParameter("detailOption");
		String input = request.getParameter("optionInput");
		String apClass = request.getParameter("apClass");
		int intInput = 0;
		String stringInput = null;
		
		HashMap<String, Object> searchMap = new HashMap<String, Object>();	
		searchMap.put("optionType", optionType);
		searchMap.put("loginEmpNo", loginEmpNo);
		searchMap.put("endDate", endDate);
		searchMap.put("startDate", startDate);
		searchMap.put("detailOption", detailOption);
		searchMap.put("apClass", apClass);
		
		ArrayList<Approval> list = null;
		
		if(endDate == null || startDate == null) {
			if(detailOption == null) {
				switch(optionType) {
					case "문서번호" : 
						intInput = Integer.parseInt(request.getParameter("optionInput"));							
						searchMap.put("optionInput", intInput);		
						System.out.println("optionInput : " + intInput);
						list = approvalService.selectSearchApNoTemp(searchMap);				
						break;
					case "제목" : 
						stringInput = request.getParameter("optionInput");							
						searchMap.put("optionInput", stringInput);		
						System.out.println("optionInput : " + stringInput);
						list = approvalService.selectSearchTitleTemp(searchMap);				
						break;
					default :
						break;			
				}
			} else {
				switch(optionType) {
				case "문서번호" : 
					intInput = Integer.parseInt(request.getParameter("optionInput"));							
					searchMap.put("optionInput", intInput);		
					System.out.println("optionInput : " + intInput);
					list = approvalService.selectDetailApNoTemp(searchMap);				
					break;
				case "제목" : 
					stringInput = request.getParameter("optionInput");							
					searchMap.put("optionInput", stringInput);		
					System.out.println("optionInput : " + stringInput);
					list = approvalService.selectDetailTitleTemp(searchMap);				
					break;
				default :
					break;			
				}
			}
		} else {
			if(detailOption == null) {
				if(input != null) {
					switch(optionType) {
						case "문서번호" : 
							intInput = Integer.parseInt(request.getParameter("optionInput"));							
							searchMap.put("optionInput", intInput);		
							System.out.println("optionInput : " + intInput);
							list = approvalService.selectDateApNoTemp(searchMap);				
							break;
						case "제목" : 
							stringInput = request.getParameter("optionInput");							
							searchMap.put("optionInput", stringInput);		
							System.out.println("optionInput : " + stringInput);
							list = approvalService.selectDateTitleTemp(searchMap);				
							break;
						default :
							break;			
					}
				} else {
					list = approvalService.selectOnlyDateSortTemp(searchMap);
				}
				
			} else {
				switch(optionType) {
				case "문서번호" : 
					intInput = Integer.parseInt(request.getParameter("optionInput"));							
					searchMap.put("optionInput", intInput);		
					System.out.println("optionInput : " + intInput);
					list = approvalService.selectDeteDetailApNoTemp(searchMap);				
					break;
				case "제목" : 
					stringInput = request.getParameter("optionInput");							
					searchMap.put("optionInput", stringInput);		
					System.out.println("optionInput : " + stringInput);
					list = approvalService.selectDateDetailTitleTemp(searchMap);				
					break;
				default :
					break;			
				}
			}
		}
	
		return new GsonBuilder().create().toJson(list);
	}
}
