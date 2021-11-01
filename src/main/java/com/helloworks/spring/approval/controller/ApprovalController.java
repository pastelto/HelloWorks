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
import com.helloworks.spring.approval.model.vo.ApprovalComment;
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
	
	
	//임시저장함 detail - 기안
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
		ArrayList<ApprovalLine> lineList = approvalService.selectApprovalLine(searchMap);
		
		if(approval != null) {
			System.out.println("approval ; " + approval);
			 model.addAttribute("approval",approval);
		}
		if(apCC != null) {
			System.out.println("apCC ; " + apCC);
			 model.addAttribute("apCC",apCC);
		}
		if(lineList != null) {
			System.out.println("line ; " + lineList);
			 model.addAttribute("lineList",lineList);
		}
		if(apAttach != null) {
			System.out.println("apAttach ; " + apAttach);
			 model.addAttribute("apAttach",apAttach);
		}
		
		System.out.println("return line :" + lineList);
		return "approval/normalTempDetailForm";
	}
	
	// 임시저장함 detail - 공문서 
 	@RequestMapping("diplomaTempDetail.ea")
	public String diplomaTempDetail(HttpServletRequest request, Model model) {
 		
 		int apNo = Integer.parseInt(request.getParameter("apNo"));
		String detailClass = "공문";
				
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		
		searchMap.put("apNo", apNo);
		searchMap.put("detailClass", detailClass);
		
		Approval approval = approvalService.selectApprovalDetail(searchMap);
		Approval apAttach = approvalService.selectAttachDetail(searchMap);
		ApprovalCC apCC = approvalService.selectApprovalCC(searchMap);
		ApprovalDiploma ad = approvalService.selectApprovalDiploma(searchMap);
		ArrayList<ApprovalLine> lineList = approvalService.selectApprovalLine(searchMap);
		
		if(approval != null) {
			System.out.println("approval ; " + approval);
			 model.addAttribute("approval",approval);
		}
		if(apCC != null) {
			System.out.println("apCC ; " + apCC);
			 model.addAttribute("apCC",apCC);
		}
		if(lineList != null) {
			System.out.println("line ; " + lineList);
			 model.addAttribute("lineList",lineList);
		}
		if(apAttach != null) {
			System.out.println("apAttach ; " + apAttach);
			 model.addAttribute("apAttach",apAttach);
		}
		if(ad != null) {
			System.out.println("ad ; " + ad);
			 model.addAttribute("ad", ad);
		}
		
		
		return "approval/diplomaTempDetailForm";
	}
 	
 	// 임시저장함 detail - 인사 
  	@RequestMapping("hrTempDetail.ea")
 	public String hrTempDetail(HttpServletRequest request, Model model) {
 		
  		int apNo = Integer.parseInt(request.getParameter("apNo"));
		String detailClass = "인사";
				
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		
		searchMap.put("apNo", apNo);
		searchMap.put("detailClass", detailClass);
		
		Approval approval = approvalService.selectApprovalDetail(searchMap);
		Approval apAttach = approvalService.selectAttachDetail(searchMap);
		ApprovalCC apCC = approvalService.selectApprovalCC(searchMap);
		ApprovalHr ah = approvalService.selectApprovalHr(searchMap);
		ArrayList<ApprovalLine> lineList = approvalService.selectApprovalLine(searchMap);
		
		if(approval != null) {
			System.out.println("approval :" + approval);
			 model.addAttribute("approval",approval);
		}
		if(apCC != null) {
			System.out.println("apCC ; " + apCC);
			 model.addAttribute("apCC",apCC);
		}
		if(lineList != null) {
			System.out.println("line ; " + lineList);
			 model.addAttribute("lineList",lineList);
		}
		if(apAttach != null) {
			System.out.println("apAttach ; " + apAttach);
			 model.addAttribute("apAttach",apAttach);
		}
		if(ah != null) {
			System.out.println("ah ; " + ah);
			 model.addAttribute("ah", ah);
		}
 		return "approval/hrTempDetailForm";
 	}
  	
  	// 임시저장함 detail - 회의록
  	@RequestMapping("minutesTempDetail.ea")
 	public String minutesTempDetail(HttpServletRequest request, Model model) {
 		
  		int apNo = Integer.parseInt(request.getParameter("apNo"));
		String detailClass = "회의";
				
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		
		searchMap.put("apNo", apNo);
		searchMap.put("detailClass", detailClass);
		
		Approval approval = approvalService.selectApprovalDetail(searchMap);
		Approval apAttach = approvalService.selectAttachDetail(searchMap);
		ApprovalCC apCC = approvalService.selectApprovalCC(searchMap);
		ApprovalMinutes am = approvalService.selectApprovalMinutes(searchMap);
		ArrayList<ApprovalLine> lineList = approvalService.selectApprovalLine(searchMap);
		
		if(approval != null) {
			System.out.println("approval ; " + approval);
			 model.addAttribute("approval",approval);
		}
		if(apCC != null) {
			System.out.println("apCC ; " + apCC);
			 model.addAttribute("apCC",apCC);
		}
		if(lineList != null) {
			System.out.println("line ; " + lineList);
			 model.addAttribute("lineList",lineList);
		}
		if(apAttach != null) {
			System.out.println("apAttach ; " + apAttach);
			 model.addAttribute("apAttach",apAttach);
		}
		if(am != null) {
			System.out.println("am ; " + am);
			 model.addAttribute("am", am);
		}
 		
 		return "approval/minutesTempDetailForm";
 	}
  	
  	// 임시저장함 detail - 지출
  	@RequestMapping("expenditureTempDetail.ea")
 	public String expenditureTempDetail(HttpServletRequest request, Model model) {
 		
  		int apNo = Integer.parseInt(request.getParameter("apNo"));
		String detailClass = "지출";
				
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		
		searchMap.put("apNo", apNo);
		searchMap.put("detailClass", detailClass);
		
		Approval approval = approvalService.selectApprovalDetail(searchMap);
		Approval apAttach = approvalService.selectAttachDetail(searchMap);
		ApprovalCC apCC = approvalService.selectApprovalCC(searchMap);
		ApprovalExpenditure ae = approvalService.selectApprovalExpenditure(searchMap);
		ArrayList<ApprovalExDetails> adList = approvalService.selectApprovalExDetails(searchMap);
		ArrayList<ApprovalLine> lineList = approvalService.selectApprovalLine(searchMap);
		
		ArrayList<ApprovalExDetails> chlist = approvalService.selectExNumch();
		ArrayList<ApprovalExDetails> colist = approvalService.selectExNumco();
		
		if(approval != null) {
			System.out.println("approval ; " + approval);
			 model.addAttribute("approval",approval);
		}
		if(apCC != null) {
			System.out.println("apCC ; " + apCC);
			 model.addAttribute("apCC",apCC);
		}
		if(lineList != null) {
			System.out.println("line ; " + lineList);
			 model.addAttribute("lineList",lineList);
		}
		if(apAttach != null) {
			System.out.println("apAttach ; " + apAttach);
			 model.addAttribute("apAttach",apAttach);
		}
		if(ae != null) {
			System.out.println("ae ; " + ae);
			 model.addAttribute("ae", ae);
		}
		if(adList != null) {
			System.out.println("ad ; " + adList);
			 model.addAttribute("adList", adList);
		}
 		return "approval/expenditureTempDetailForm";
 	}
	
	// 임시저장함 - 일반결재
	@RequestMapping("tempNormal.ea")
	public String tempNormal(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage , HttpServletRequest request, Model model) {
		
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo(); 
		String apClass = "일반";	
		String status = "N";
		
		HashMap<String, Object> searchMap = new HashMap<String, Object>();	
		searchMap.put("loginEmpNo", loginEmpNo);
		searchMap.put("apClass", apClass);
		searchMap.put("status", status);
		
		int listCount = approvalService.selectListCount(searchMap);
		
		
		System.out.println("임시저장 결재 수 : " + listCount);
		
		int pageLimit = 10;
		int boardLimit = 10; 
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Approval> approvalList = approvalService.selectApproval(searchMap, pi);
		
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
		String status = "N";
		
		HashMap<String, Object> searchMap = new HashMap<String, Object>();	
		searchMap.put("loginEmpNo", loginEmpNo);
		searchMap.put("apClass", apClass);
		searchMap.put("status", status);
		
		int listCount = approvalService.selectListCount(searchMap);
		
		System.out.println("임시저장 결재 수 : " + listCount);
		
		int pageLimit = 10;
		int boardLimit = 10; 
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Approval> approvalList = approvalService.selectApproval(searchMap, pi);
		
		model.addAttribute("approvalList", approvalList);
		model.addAttribute("pi", pi);
		model.addAttribute("pageURL", "tempExpenditure.ea");
		model.addAttribute("page", 2);
		
		
		return "approval/temporarySaveMain";
	}
	
	// 내결재함 - 일반결재
	@RequestMapping("myNormal.ea")
	public String myNormal(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage , HttpServletRequest request, Model model) {
		
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo(); 
		String apClass = "일반";	
		String status = "Y";
		
		HashMap<String, Object> searchMap = new HashMap<String, Object>();	
		searchMap.put("loginEmpNo", loginEmpNo);
		searchMap.put("apClass", apClass);
		searchMap.put("status", status);
		
		int listCount = approvalService.selectListCount(searchMap);
		
		
		System.out.println("임시저장 결재 수 : " + listCount);
		
		int pageLimit = 10;
		int boardLimit = 10; 
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Approval> approvalList = approvalService.selectApproval(searchMap, pi);
		
		model.addAttribute("approvalList", approvalList);
		model.addAttribute("pi", pi);
		model.addAttribute("pageURL", "myNormal.ea");
		model.addAttribute("page", 1);
		
		
		return "approval/myApprovalMain";
	}
	
	// 내결재함 - 지출결재
	@RequestMapping("myExpenditure.ea")
	public String myExpenditure(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage , HttpServletRequest request, Model model) {
			
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo(); 
		String apClass = "지출";	
		String status = "Y";
		
		HashMap<String, Object> searchMap = new HashMap<String, Object>();	
		searchMap.put("loginEmpNo", loginEmpNo);
		searchMap.put("apClass", apClass);
		searchMap.put("status", status);
			
		int listCount = approvalService.selectListCount(searchMap);
			
		System.out.println("임시저장 결재 수 : " + listCount);
			
		int pageLimit = 10;
		int boardLimit = 10; 
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
			
		ArrayList<Approval> approvalList = approvalService.selectApproval(searchMap, pi);
			
		model.addAttribute("approvalList", approvalList);
		model.addAttribute("pi", pi);
		model.addAttribute("pageURL", "tempExpenditure.ea");
			model.addAttribute("page", 2);
		
		return "approval/myApprovalMain";
	}
		
	// 미결재함 - 일반결재
	@RequestMapping("pendingNormal.ea")
	public String pendingNormal(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage , HttpServletRequest request, Model model) {
			
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
			
		ArrayList<Approval> approvalList = approvalService.selectpendingList(searchMap, pi);
			
		model.addAttribute("approvalList", approvalList);
		model.addAttribute("pi", pi);
		model.addAttribute("pageURL", "pendingNormal.ea");
		model.addAttribute("page", 1);
		
		return "approval/pendingTrayMain";
	}
	
	// 미결재함 - 지출결재
	@RequestMapping("pendingExpenditure.ea")
	public String pendingExpenditure(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage , HttpServletRequest request, Model model) {
			
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
				
		ArrayList<Approval> approvalList = approvalService.selectpendingList(searchMap, pi);
				
		model.addAttribute("approvalList", approvalList);
		model.addAttribute("pi", pi);
		model.addAttribute("pageURL", "pendingExpenditure.ea");
		model.addAttribute("page", 2);
			
		return "approval/pendingTrayMain";
	}	
	
	//전자결재 -기안 detail 
	@RequestMapping("normalDetail.ea")
	public String normalDetail(HttpServletRequest request, Model model) {
		 
		int apNo = Integer.parseInt(request.getParameter("apNo"));
		String detailClass = "기안";
				
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		
		searchMap.put("apNo", apNo);
		searchMap.put("detailClass", detailClass);
		
		Approval approval = approvalService.selectApprovalDetail(searchMap);
		Approval apAttach = approvalService.selectAttachDetail(searchMap);
		ApprovalCC apCC = approvalService.selectApprovalCC(searchMap);
		ArrayList<ApprovalLine> lineList = approvalService.selectApprovalLine(searchMap);
		
		if(approval != null) {
			System.out.println("approval ; " + approval);
			 model.addAttribute("approval",approval);
		}
		if(apCC != null) {
			System.out.println("apCC ; " + apCC);
			 model.addAttribute("apCC",apCC);
		}
		if(lineList != null) {
			System.out.println("line ; " + lineList);
			 model.addAttribute("lineList",lineList);
		}
		if(apAttach != null) {
			System.out.println("apAttach ; " + apAttach);
			 model.addAttribute("apAttach",apAttach);
		}
		
		System.out.println("return line :" + lineList);
		
		return "approval/detailNormalForm";
	}
	
	//전자결재 -공문서 detail 
	@RequestMapping("diplomaDetail.ea")
	public String diplomaDetail(HttpServletRequest request, Model model) {
			
		int apNo = Integer.parseInt(request.getParameter("apNo"));
		String detailClass = "공문";
				
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		
		searchMap.put("apNo", apNo);
		searchMap.put("detailClass", detailClass);
		
		Approval approval = approvalService.selectApprovalDetail(searchMap);
		Approval apAttach = approvalService.selectAttachDetail(searchMap);
		ApprovalCC apCC = approvalService.selectApprovalCC(searchMap);
		ApprovalDiploma ad = approvalService.selectApprovalDiploma(searchMap);
		ArrayList<ApprovalLine> lineList = approvalService.selectApprovalLine(searchMap);
		
		if(approval != null) {
			System.out.println("approval ; " + approval);
			 model.addAttribute("approval",approval);
		}
		if(apCC != null) {
			System.out.println("apCC ; " + apCC);
			 model.addAttribute("apCC",apCC);
		}
		if(lineList != null) {
			System.out.println("line ; " + lineList);
			 model.addAttribute("lineList",lineList);
		}
		if(apAttach != null) {
			System.out.println("apAttach ; " + apAttach);
			 model.addAttribute("apAttach",apAttach);
		}
		if(ad != null) {
			System.out.println("ad ; " + ad);
			 model.addAttribute("ad", ad);
		}
		
		
		return "approval/detailDiplomaForm";
	}
	
	// 전자결재 detail - 인사 
	@RequestMapping("hrDetail.ea")
	public String hrDetail(HttpServletRequest request, Model model) {
		
		int apNo = Integer.parseInt(request.getParameter("apNo"));
		String detailClass = "인사";
		
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		
		searchMap.put("apNo", apNo);
		searchMap.put("detailClass", detailClass);
		
		Approval approval = approvalService.selectApprovalDetail(searchMap);
		Approval apAttach = approvalService.selectAttachDetail(searchMap);
		ApprovalCC apCC = approvalService.selectApprovalCC(searchMap);
		ApprovalHr ah = approvalService.selectApprovalHr(searchMap);
		ArrayList<ApprovalLine> lineList = approvalService.selectApprovalLine(searchMap);
			
		if(approval != null) {
			System.out.println("approval ; " + approval);
			model.addAttribute("approval",approval);
		}
		if(apCC != null) {
			System.out.println("apCC ; " + apCC);
			model.addAttribute("apCC",apCC);
		}
		if(lineList != null) {
			System.out.println("line ; " + lineList);
			model.addAttribute("lineList",lineList);
		}
		if(apAttach != null) {
			System.out.println("apAttach ; " + apAttach);
			model.addAttribute("apAttach",apAttach);
		}
		if(ah != null) {
			System.out.println("ah ; " + ah);
			model.addAttribute("ah", ah);
		}
	 	
		return "approval/detailHrForm";
	 }
	
	// 전자결재 detail - 회의록
	@RequestMapping("minutesDetail.ea")
	public String minutesDetail(HttpServletRequest request, Model model) {
	 		
		int apNo = Integer.parseInt(request.getParameter("apNo"));
		String detailClass = "회의";
		
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		
		searchMap.put("apNo", apNo);
		searchMap.put("detailClass", detailClass);
			
		Approval approval = approvalService.selectApprovalDetail(searchMap);
		Approval apAttach = approvalService.selectAttachDetail(searchMap);
		ApprovalCC apCC = approvalService.selectApprovalCC(searchMap);
		ApprovalMinutes am = approvalService.selectApprovalMinutes(searchMap);
		ArrayList<ApprovalLine> lineList = approvalService.selectApprovalLine(searchMap);
			
		if(approval != null) {
			System.out.println("approval ; " + approval);
			model.addAttribute("approval",approval);
		}
		if(apCC != null) {
			System.out.println("apCC ; " + apCC);
			model.addAttribute("apCC",apCC);
		}
		if(lineList != null) {
			System.out.println("line ; " + lineList);
			model.addAttribute("lineList",lineList);
		}
		if(apAttach != null) {
			System.out.println("apAttach ; " + apAttach);
			model.addAttribute("apAttach",apAttach);
		}
		if(am != null) {
			System.out.println("am ; " + am);
			model.addAttribute("am", am);
		}
	 		
		return "approval/detailMinutesForm";
	}
	  	
	// 전자결재 detail - 지출
	@RequestMapping("expenditureDetail.ea")
	public String expenditureDetail(HttpServletRequest request, Model model) {
		
		int apNo = Integer.parseInt(request.getParameter("apNo"));
		String detailClass = "지출";
		
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
			
		searchMap.put("apNo", apNo);
		searchMap.put("detailClass", detailClass);
			
		Approval approval = approvalService.selectApprovalDetail(searchMap);
		Approval apAttach = approvalService.selectAttachDetail(searchMap);
		ApprovalCC apCC = approvalService.selectApprovalCC(searchMap);
		ApprovalExpenditure ae = approvalService.selectApprovalExpenditure(searchMap);
		ArrayList<ApprovalExDetails> adList = approvalService.selectApprovalExDetails(searchMap);
		ArrayList<ApprovalLine> lineList = approvalService.selectApprovalLine(searchMap);
		ArrayList<ApprovalComment> cmList = approvalService.selectComment(apNo);
			
		model.addAttribute("cmList", cmList);
			
		if(approval != null) {
			System.out.println("approval ; " + approval);
			model.addAttribute("approval",approval);
		}
		if(apCC != null) {
			System.out.println("apCC ; " + apCC);
			model.addAttribute("apCC",apCC);
		}
		if(lineList != null) {
			System.out.println("line ; " + lineList);
			model.addAttribute("lineList",lineList);
		}
		if(apAttach != null) {
			System.out.println("apAttach ; " + apAttach);
			model.addAttribute("apAttach",apAttach);
		}
		if(ae != null) {
			System.out.println("ae ; " + ae);
			model.addAttribute("ae", ae);
		}
		if(adList != null) {
			System.out.println("ad ; " + adList);
			model.addAttribute("adList", adList);
		}
		
		return "approval/detailExpenditureForm";
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
		String cooName = request.getParameter("cooName");
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
		ap.setCooName(cooName);
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
					
		String ccName = request.getParameter("ccName");
		System.out.println("ccName : " + ccName);
		String ccCode = request.getParameter("ccCode");
		System.out.println("ccCode : " + ccCode);
		if(!ccName.equals("")) {							
			if(isInteger(ccCode)) {
				int num = Integer.parseInt(request.getParameter("ccCode"));
				System.out.println("cotroller num :" + num);
				ac.setCcName(ccName);
				ac.setCcMember(num);
				approvalService.insertCcEmpl(ac);
			} else {
				ac.setCcName(ccName);
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
			return "redirect:myNormal.ea";
		}else if(status.equals("N")) {
			model.addAttribute("msg", "결재가 임시저장되었습니다.");
			return "redirect:tempNormal.ea";
		}	
		
		return "redirect:myNormal.ea";
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
		String cooName = request.getParameter("cooName");
		String deptShare = request.getParameter("deptShare");
		
		ap.setApClass("지출");
		ap.setDetailClass(detailClass);
		ap.setTitle(title);
		ap.setWriter(writer);
		ap.setWriterJob(writerJob);
		ap.setDeptName(deptName);
		ap.setContent(content);
		ap.setCooper(cooper);
		ap.setCooJob(cooJob);
		ap.setCooName(cooName);
		ap.setDeptShare(deptShare);		
		
		// 전자결재 공통
		approvalService.insertApproval(ap);
		
		// 지출결재 기본
		String exForm = request.getParameter("ex_radio");
		String exCommon = request.getParameter("commonEx");
		
		ae.setExForm(exForm);
		ae.setExCommon(exCommon);
		
		approvalService.insertExpenditure(ae);
		
		// 지출결재 detail
		String exType = request.getParameter("exType");
		String cardNum = request.getParameter("cardNum");		
		
		System.out.println("cardNum : " + cardNum);
		
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
			ad.setExNum(cardNum);
			ad.setExTitle(title);
			ad.setExNo(i);
			ad.setExDate(exDate[i]);
			ad.setExContent(exContent[i]);
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
				ad.setExDept(exDept[i]);
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
								

		String ccName = request.getParameter("ccName");
		String ccCode = request.getParameter("ccCode");
		System.out.println("ccCode : " + ccCode);
		if(!ccName.equals("")) {							
			if(isInteger(ccCode)) {
				int num = Integer.parseInt(request.getParameter("ccCode"));
				System.out.println("cotroller num :" + num);
				ac.setCcName(ccName);
				ac.setCcMember(num);
				approvalService.insertCcEmpl(ac);
			} else {
				ac.setCcName(ccName);
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
			return "redirect:myExpenditure.ea";
		}else if(status.equals("N")) {
			model.addAttribute("msg", "결재가 임시저장되었습니다.");
			return "redirect:tempExpenditure.ea";
		}	
			
		return "redirect:myExpenditure.ea";
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
	
	// 공문서 
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

	// 회의록
	public void insertMinutes(Approval ap, ApprovalMinutes am, HttpServletRequest request) {
		String attendees = request.getParameter("attendees");
		String title = request.getParameter("mm_title");
		am.setAttendees(attendees);
		am.setTitle(title);
		approvalService.insertApproval(ap); 
		approvalService.insertMinutes(am);
		
	}

	// 인사
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
		String savePath = resources + "\\approval_files\\"; //저장경로
		
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
	
	// 임시저장 - 날짜 버튼 클릭 
	@ResponseBody
	@RequestMapping(value="selectDateSort.ea", produces= "application/json; charset=utf-8")
	public String selectDateSortTemp(HttpServletRequest request) {
		
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo();		
		String sdate = request.getParameter("sdate");
		String apClass = request.getParameter("apClass");
		String status = request.getParameter("status");
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("loginEmpNo", loginEmpNo);
		searchMap.put("apClass", apClass);
		searchMap.put("status", status);
		
		System.out.println("기간 : " + sdate);
		int sDate= 0;
		ArrayList<Approval> list = null;
		switch(sdate) {
			case "당일" : 
				sDate = 0;
				searchMap.put("sDate", sDate);				
				list = approvalService.selectDate(searchMap);
				break;
			case "1주일" : 
				sDate = 7;
				searchMap.put("sDate", sDate);	
				list = approvalService.selectDate(searchMap);
				break;
			case "1개월" :
				sDate = 30;
				searchMap.put("sDate", sDate);	
				list = approvalService.selectDate(searchMap);
				break;
			case "3개월" :
				sDate = 90;
				searchMap.put("sDate", sDate);	
				list = approvalService.selectDate(searchMap);
				break;
			case "6개월" :
				sDate = 180;
				searchMap.put("sDate", sDate);	
				list = approvalService.selectDate(searchMap);
				break;
			case "1년" :
				sDate = 365;
				searchMap.put("sDate", sDate);	
				list = approvalService.selectDate(searchMap);
				break;
			default : 
				break;
		}
		
		return new GsonBuilder().create().toJson(list);
		
	}
	

	// 임시저장 전체 보기 
	@ResponseBody
	@RequestMapping(value="selectAllApproval.ea", produces= "application/json; charset=utf-8")
	public String selectAllTempApproval(HttpServletRequest request) {
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo();		
			
		String option = request.getParameter("cOption");
		String status = request.getParameter("status");
		
		HashMap<String, Object> searchMap = new HashMap<String, Object>();	
		searchMap.put("status", status);
		searchMap.put("loginEmpNo", loginEmpNo);
		searchMap.put("option", option);
		
		ArrayList<Approval> list = approvalService.selectAllApproval(searchMap);
		
		return new GsonBuilder().create().toJson(list);
	}
	
	// 임시저장/내결재함  - 검색 
	@ResponseBody
	@RequestMapping(value="selectSearchSort.ea", produces= "application/json; charset=utf-8")
	public String selectSearchSortTemp(HttpServletRequest request) {
		
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo();			
		String optionType = request.getParameter("optionType"); // 제목 , 문서번호 
		String endDate = request.getParameter("endDate");
		String startDate = request.getParameter("startDate");
		String detailOption = request.getParameter("detailOption"); // 기안, 공문, 인사, 회의록 
		String input = request.getParameter("optionInput"); // 입력한 값 
		String apClass = request.getParameter("apClass");	// 일반 , 지출 ,...
		int intInput = 0;
		String stringInput = null;	
		String status = request.getParameter("status");
		
		System.out.println("detailOption : " + detailOption);
		
		HashMap<String, Object> searchMap = new HashMap<String, Object>();	
		searchMap.put("optionType", optionType);
		searchMap.put("loginEmpNo", loginEmpNo);
		searchMap.put("endDate", endDate);
		searchMap.put("startDate", startDate);
		searchMap.put("detailOption", detailOption);
		searchMap.put("apClass", apClass);
		searchMap.put("status", status);
		
		ArrayList<Approval> list = null;
		
		// 날짜구간 미입력
		if(endDate.equals("") || startDate.equals("")) {		
			// 세부 항목 미선택
			if(detailOption.equals("")) {
				switch(optionType) {
					case "문서번호" : 
						intInput = Integer.parseInt(request.getParameter("optionInput"));							
						searchMap.put("optionInput", intInput);		
						System.out.println("optionInput : " + intInput);
						list = approvalService.selectSearchApNo(searchMap);				
						break;
					case "제목" : 
						stringInput = request.getParameter("optionInput");							
						searchMap.put("optionInput", stringInput);		
						System.out.println("optionInput : " + stringInput);
						list = approvalService.selectSearchTitle(searchMap);				
						break;
					default :
						break;			
				}
			// 세부항목 선택
			} else {
				switch(optionType) {
				case "문서번호" : 
					intInput = Integer.parseInt(request.getParameter("optionInput"));							
					searchMap.put("optionInput", intInput);		
					searchMap.put("detailOption", detailOption);
					System.out.println("optionInput : " + intInput);
					list = approvalService.selectDetailApNo(searchMap);				
					break;
				case "제목" : 
					stringInput = request.getParameter("optionInput");							
					searchMap.put("optionInput", stringInput);		
					searchMap.put("detailOption", detailOption);
					System.out.println("optionInput : " + stringInput);
					list = approvalService.selectDetailTitle(searchMap);				
					break;
				default :
					break;			
				}
			}
		// 날짜 구간 입력
		} else {
			// 세부항목 미선택
			if(detailOption.equals("")) {
				// 검색어 입력
				if(!input.equals("")) {
					switch(optionType) {
						case "문서번호" : 
							intInput = Integer.parseInt(request.getParameter("optionInput"));							
							searchMap.put("optionInput", intInput);		
							System.out.println("optionInput : " + intInput);
							list = approvalService.selectDateApNo(searchMap);				
							break;
						case "제목" : 
							stringInput = request.getParameter("optionInput");							
							searchMap.put("optionInput", stringInput);		
							System.out.println("optionInput : " + stringInput);
							list = approvalService.selectDateTitle(searchMap);				
							break;
						default :
							break;			
					}
				// 검색어 미입력 
				} else {
					list = approvalService.selectOnlyDateSort(searchMap);
				}
			// 세부항목 선택	
			} else {
				switch(optionType) {
				case "문서번호" : 
					intInput = Integer.parseInt(request.getParameter("optionInput"));							
					searchMap.put("optionInput", intInput);		
					searchMap.put("detailOption", detailOption);
					System.out.println("optionInput : " + intInput);
					list = approvalService.selectDeteDetailApNo(searchMap);				
					break;
				case "제목" : 
					stringInput = request.getParameter("optionInput");							
					searchMap.put("optionInput", stringInput);	
					searchMap.put("detailOption", detailOption);
					System.out.println("optionInput : " + stringInput);
					list = approvalService.selectDateDetailTitle(searchMap);				
					break;
				default :
					break;			
				}
			}
		}
	
		return new GsonBuilder().create().toJson(list);
	}
	
	//미결재함 전체보기
	@ResponseBody
	@RequestMapping(value="selectAllPending.ea", produces= "application/json; charset=utf-8")
	public String selectAllPendingApproval(HttpServletRequest request) {
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo();					
		String option = request.getParameter("cOption");
		
		HashMap<String, Object> searchMap = new HashMap<String, Object>();	
		searchMap.put("loginEmpNo", loginEmpNo);
		searchMap.put("option", option);
		
		ArrayList<Approval> list = approvalService.selectAllPending(searchMap);
		
		return new GsonBuilder().create().toJson(list);
	}
	
	// 미결재함 - 날짜 버튼 클릭 
	@ResponseBody
	@RequestMapping(value="selectDateSortPending.ea", produces= "application/json; charset=utf-8")
	public String selectDateSortPending(HttpServletRequest request) {
			
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
				list = approvalService.selectDatePending(searchMap);
				break;
			case "1주일" : 
				sDate = 7;
				searchMap.put("sDate", sDate);	
				list = approvalService.selectDatePending(searchMap);
				break;
			case "1개월" :
				sDate = 30;
				searchMap.put("sDate", sDate);	
				list = approvalService.selectDatePending(searchMap);
				break;
			case "3개월" :
				sDate = 90;
				searchMap.put("sDate", sDate);	
				list = approvalService.selectDatePending(searchMap);
				break;
			case "6개월" :
				sDate = 180;
				searchMap.put("sDate", sDate);	
				list = approvalService.selectDatePending(searchMap);
				break;
			case "1년" :
				sDate = 365;
				searchMap.put("sDate", sDate);	
				list = approvalService.selectDatePending(searchMap);
				break;
			default : 
				break;
		}
			
		return new GsonBuilder().create().toJson(list);
			
	}
	
	// 미결재함 - 검색 
		@ResponseBody
		@RequestMapping(value="selectSearchSortPending.ea", produces= "application/json; charset=utf-8")
		public String selectSearchSortPending(HttpServletRequest request) {
			
			int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo();			
			String optionType = request.getParameter("optionType"); // 제목 , 문서번호 
			String endDate = request.getParameter("endDate");
			String startDate = request.getParameter("startDate");
			String detailOption = request.getParameter("detailOption"); // 기안, 공문, 인사, 회의록 
			String input = request.getParameter("optionInput"); // 입력한 값 
			String apClass = request.getParameter("apClass");	// 일반 , 지출 ,...
			int intInput = 0;
			String stringInput = null;	
			
			System.out.println("detailOption : " + detailOption);
			
			HashMap<String, Object> searchMap = new HashMap<String, Object>();	
			searchMap.put("optionType", optionType);
			searchMap.put("loginEmpNo", loginEmpNo);
			searchMap.put("endDate", endDate);
			searchMap.put("startDate", startDate);
			searchMap.put("detailOption", detailOption);
			searchMap.put("apClass", apClass);
			
			ArrayList<Approval> list = null;
			
			// 날짜구간 미입력
			if(endDate.equals("") || startDate.equals("")) {		
				// 세부 항목 미선택
				if(detailOption.equals("")) {
					switch(optionType) {
						case "문서번호" : 
							intInput = Integer.parseInt(request.getParameter("optionInput"));							
							searchMap.put("optionInput", intInput);		
							System.out.println("optionInput : " + intInput);
							list = approvalService.selectSearchApNoPending(searchMap);				
							break;
						case "제목" : 
							stringInput = request.getParameter("optionInput");							
							searchMap.put("optionInput", stringInput);		
							System.out.println("optionInput : " + stringInput);
							list = approvalService.selectSearchTitlePending(searchMap);				
							break;
						default :
							break;			
					}
				// 세부항목 선택
				} else {
					switch(optionType) {
					case "문서번호" : 
						intInput = Integer.parseInt(request.getParameter("optionInput"));							
						searchMap.put("optionInput", intInput);		
						searchMap.put("detailOption", detailOption);
						System.out.println("optionInput : " + intInput);
						list = approvalService.selectDetailApNoPending(searchMap);				
						break;
					case "제목" : 
						stringInput = request.getParameter("optionInput");							
						searchMap.put("optionInput", stringInput);		
						searchMap.put("detailOption", detailOption);
						System.out.println("optionInput : " + stringInput);
						list = approvalService.selectDetailTitlePending(searchMap);				
						break;
					default :
						break;			
					}
				}
			// 날짜 구간 입력
			} else {
				// 세부항목 미선택
				if(detailOption.equals("")) {
					// 검색어 입력
					if(!input.equals("")) {
						switch(optionType) {
							case "문서번호" : 
								intInput = Integer.parseInt(request.getParameter("optionInput"));							
								searchMap.put("optionInput", intInput);		
								System.out.println("optionInput : " + intInput);
								list = approvalService.selectDateApNoPending(searchMap);				
								break;
							case "제목" : 
								stringInput = request.getParameter("optionInput");							
								searchMap.put("optionInput", stringInput);		
								System.out.println("optionInput : " + stringInput);
								list = approvalService.selectDateTitlePending(searchMap);				
								break;
							default :
								break;			
						}
					// 검색어 미입력 
					} else {
						list = approvalService.selectOnlyDateSort(searchMap);
					}
				// 세부항목 선택	
				} else {
					switch(optionType) {
					case "문서번호" : 
						intInput = Integer.parseInt(request.getParameter("optionInput"));							
						searchMap.put("optionInput", intInput);		
						searchMap.put("detailOption", detailOption);
						System.out.println("optionInput : " + intInput);
						list = approvalService.selectDeteDetailApNoPending(searchMap);				
						break;
					case "제목" : 
						stringInput = request.getParameter("optionInput");							
						searchMap.put("optionInput", stringInput);	
						searchMap.put("detailOption", detailOption);
						System.out.println("optionInput : " + stringInput);
						list = approvalService.selectDateDetailTitlePending(searchMap);				
						break;
					default :
						break;			
					}
				}
			}
		
			return new GsonBuilder().create().toJson(list);
		}
		
	
	// 전자결재  update
		@RequestMapping("updateApproval.ea")
		public String updateApproval(Approval ap, ApprovalCC ac, ApprovalDiploma ad, ApprovalHr ah, ApprovalLine line, ApprovalMinutes am,
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
			
			int apNo = Integer.parseInt(request.getParameter("apNo"));		
			String detailClass = request.getParameter("doc_type");
			String title = request.getParameter("ap_title");
			int writer = Integer.parseInt(request.getParameter("writer"));
			String writerJob = request.getParameter("writerJob");
			String deptName = request.getParameter("userDept");
			String content = request.getParameter("apContent");
			String cooper= request.getParameter("cooperator0");
			String cooJob = request.getParameter("cooJob");
			String cooName = request.getParameter("cooName");
			String deptShare = request.getParameter("deptShare");
			
			ap.setApNo(apNo);
			ap.setApClass("일반");
			ap.setDetailClass(detailClass);
			ap.setTitle(title);
			ap.setWriter(writer);
			ap.setWriterJob(writerJob);
			ap.setDeptName(deptName);
			ap.setContent(content);
			ap.setCooper(cooper);
			ap.setCooJob(cooJob);
			ap.setCooName(cooName);
			ap.setDeptShare(deptShare);		
			
			ad.setApNo(apNo);
			am.setApNo(apNo);
			ah.setApNo(apNo);
			ac.setApNo(apNo);
			line.setApNo(apNo);
			
			System.out.println("ap :" + ap);
							
			// 문서분류에 따른 등록 
			String dtype = request.getParameter("doc_type");
					
			switch(dtype) {
			case "기안" : approvalService.updateApproval(ap);
						break;
			case "공문" : 			
						updateDiploma(ap, ad, request);					
						break;
			case "회의" :
						updateMinutes(ap, am, request);					
						break;
			case "인사" : 
						updateHr(ap, ah, request);					
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
							approvalService.updateAttachment(ap);
						}
					}
			}
			
			String ccCode = request.getParameter("ccCode");
			String ccName = request.getParameter("ccCode");
			System.out.println("ccCode : " + ccCode);
			if(!ccName.equals("")) {							
				if(isInteger(ccCode)) {
					int num = Integer.parseInt(request.getParameter("ccCode"));
					System.out.println("cotroller num :" + num);
					ac.setCcMember(num);
					ac.setCcName(ccName);
					approvalService.updateCcEmpl(ac);
				} else {
					ac.setCcDept(ccCode);
					ac.setCcName(ccName);
					System.out.println("deptCode: " + ccCode);
					approvalService.updateCcDept(ac);
				}
			}
				
			
									
			// 결재라인 등록 
			updateLine(line, request);		
			
			// 결재 등록 알림창 
			if(status.equals("Y")) {
				model.addAttribute("msg", "결재가 등록되었습니다.");
				return "approval/myApprovalNormal";
			}else if(status.equals("N")) {
				model.addAttribute("msg", "결재가 임시저장되었습니다.");
				return "approval/temporaryNormal";
			}	
			
			return "redirect:tempNormal.ea";
		}

		private void updateHr(Approval ap, ApprovalHr ah, HttpServletRequest request) {
			String dueDate = request.getParameter("dueDate");
			String hrtype = request.getParameter("hr_type");
			ap.setApClass("인사");
			ah.setHrClass(hrtype);
			ah.setDueDate(dueDate);
			approvalService.updateApproval(ap); 
			approvalService.updatetHr(ah);
			
		}

		private void updateMinutes(Approval ap, ApprovalMinutes am, HttpServletRequest request) {
			String attendees = request.getParameter("attendees");
			String title = request.getParameter("mm_title");
			am.setAttendees(attendees);
			am.setTitle(title);
			approvalService.updateApproval(ap); 
			approvalService.updateMinutes(am);
			
			
		}

		private void updateDiploma(Approval ap, ApprovalDiploma ad, HttpServletRequest request) {
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String officeAddress = request.getParameter("officeAddress");
			ad.setEmail(email);
			ad.setPhone(phone);
			ad.setOfficeAddress(officeAddress);
			approvalService.updateApproval(ap); 
			approvalService.updateDiploma(ad);
			
		}

		
		// 전자결재 - 지출결재 수정 
		@RequestMapping("updateExApproval.ea")
		public String updateExApproval(Approval ap, ApprovalExpenditure ae, ApprovalExDetails ad, ApprovalCC ac, ApprovalLine line, 
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
				
			int apNo = Integer.parseInt(request.getParameter("apNo"));
			String detailClass = request.getParameter("doc_type");
			String title = request.getParameter("ap_title");
			int writer = Integer.parseInt(request.getParameter("writer"));
			String writerJob = request.getParameter("writerJob");
			String deptName = request.getParameter("userDept");
			String content = request.getParameter("apContent");
			String cooper= request.getParameter("cooperator0");
			String cooJob = request.getParameter("cooJob");
			String cooName = request.getParameter("cooName");
			String deptShare = request.getParameter("deptShare");
			
			ap.setApNo(apNo);
			ap.setApClass("일반");
			ap.setDetailClass(detailClass);
			ap.setTitle(title);
			ap.setWriter(writer);
			ap.setWriterJob(writerJob);
			ap.setDeptName(deptName);
			ap.setContent(content);
			ap.setCooper(cooper);
			ap.setCooJob(cooJob);
			ap.setCooName(cooName);
			ap.setDeptShare(deptShare);	
			
			ad.setApNo(apNo);
			ac.setApNo(apNo);
			line.setApNo(apNo);
			
			// 전자결재 공통
			approvalService.updateApproval(ap);
			
			// 지출결재 기본
			String exForm = request.getParameter("ex_radio");
			String exCommon = request.getParameter("commonEx");
			
			ae.setExForm(exForm);
			ae.setExCommon(exCommon);
			
			approvalService.updateExpenditure(ae);
			
			// 지출결재 detail
			String exType = request.getParameter("exType");
			String exNum = request.getParameter("exNum");		
			
			String[] noTemp = request.getParameterValues("exNo");
			int[] exNo = null;
			exNo = new int[noTemp.length];
			for(int i=0; i< exNo.length; i++) {
				exNo[i] = Integer.parseInt(noTemp[i]);
			}
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
			
			approvalService.deleteExDetails(apNo);
			
			for(int i=0; i<exDate.length; i++) {
				ad.setExNo(exNo[i]);
				ad.setExType(exType);
				ad.setExNum(exNum);
				ad.setExTitle(title);
				ad.setExNo(i);
				ad.setExDate(exDate[i]);
				ad.setExContent(exContent[i]);
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
					ad.setExDept(exDept[i]);
				}
				if(note != null) {
					ad.setNote(note[i]);
				}
						
				approvalService.updateExpenditureDetail(ad);
			}
			
			// 첨부파일 등록 
			
			if(file != null) {
				if(!file.getOriginalFilename().equals("")) {
					String newName = saveFile(file,request);
								
					if(newName!=null) {
							ap.setOriginName(file.getOriginalFilename());
							ap.setNewName(newName);
							approvalService.updateAttachment(ap);
						}
					}
			}
										
			// 수신참조 등록 
									
			String ccCode = request.getParameter("ccCode");
			String ccName = request.getParameter("ccCode");
			System.out.println("ccCode : " + ccCode);
			if(!ccName.equals("")) {							
				if(isInteger(ccCode)) {
					int num = Integer.parseInt(request.getParameter("ccCode"));
					System.out.println("cotroller num :" + num);
					ac.setCcMember(num);
					ac.setCcName(ccName);
					approvalService.updateCcEmpl(ac);
				} else {
					ac.setCcDept(ccCode);
					ac.setCcName(ccName);
					System.out.println("deptCode: " + ccCode);
					approvalService.updateCcDept(ac);
				}
			}
											
			// 결재라인 등록 
			insertLine(line, request);		
			
			// 결재 등록 알림창 
			if(status.equals("Y")) {
				model.addAttribute("msg", "결재가 등록되었습니다.");
				return "approval/myApprovalNormal";
			}else if(status.equals("N")) {
				model.addAttribute("msg", "결재가 임시저장되었습니다.");
				return "approval/temporaryNormal";
			}	
			
			return "redirect:tempExpenditure.ea";		
		}
		
		
		//결재라인 업데이트
		public void updateLine(ApprovalLine line, HttpServletRequest request) {
			
			// 결재권자 파라미터로 받기 
			String[] temp = request.getParameterValues("line");
			System.out.println("temp:" + temp[0]);
			int[] empNo = new int[temp.length];
			int apNo = Integer.parseInt(request.getParameter("apNo"));
			
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
			
			//결재라인 삭제 후 재등록
			approvalService.deleteLine(apNo);
			
			for(int i=0; i<empNo.length; i++) {
				if(empNo[i] != 0) {
					line.setLineNo(i+1);
					line.setEmpNo(empNo[i]);
					line.setEmpName(empName[i]);
					line.setJobName(jobName[i]);			
					approvalService.updateLine(line);		
				}
			}	
		}
	
	@ResponseBody
	@RequestMapping(value="insertComment.ea", produces= "application/json; charset=utf-8")	
	public String insertComment (HttpServletRequest request) {
		
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo(); 
		String comment = request.getParameter("comment");
		int apNo = Integer.parseInt(request.getParameter("apNo"));
		
		System.out.println("comment : " + comment);
		
		HashMap<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("loginEmpNo", loginEmpNo);
		insertMap.put("comment", comment);
		insertMap.put("apNo", apNo);
		
		approvalService.insertComment(insertMap);
		
		ArrayList<ApprovalComment> list = approvalService.selectComment(apNo);
		
		return new GsonBuilder().create().toJson(list);
	}
	
	@RequestMapping("confirmApproavl.ea")
	public String confirmApproval(HttpServletRequest request) {
		
		int apNo = Integer.parseInt(request.getParameter("apNo"));
		int flag = Integer.parseInt(request.getParameter("flag"));
		
		approvalService.updateLineStatus(apNo);
		
		if (flag == 1){
			approvalService.completeStatus(apNo);
		}
				
		return "redirect:pendingNormal.ea";
	}
	
	@RequestMapping("returnApproavl.ea")
	public String returnApproavl(HttpServletRequest request) {
		
		int apNo = Integer.parseInt(request.getParameter("apNo"));		
		
		approvalService.returnStatus(apNo);		
				
		return "redirect:pendingNormal.ea";
	}
	
}
