package com.helloworks.spring.approval.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.helloworks.spring.approval.model.service.ApprovalService;
import com.helloworks.spring.approval.model.vo.Approval;
import com.helloworks.spring.approval.model.vo.ApprovalCC;
import com.helloworks.spring.approval.model.vo.ApprovalDiploma;
import com.helloworks.spring.approval.model.vo.ApprovalHr;
import com.helloworks.spring.approval.model.vo.ApprovalLine;
import com.helloworks.spring.approval.model.vo.ApprovalMinutes;
import com.helloworks.spring.common.exception.CommException;

@Controller
public class ApprovalController {

	
	@Autowired
	private ApprovalService approvalService;
	
	@RequestMapping("normalApprovalForm.ea")
	public String normalApprovalForm() {
		
		/*
		 * Employee e = new Employee();
		 * 
		 * String deptCode =
		 * ((Employee)request.getSession().getAttribute("loginUser")).getDeptCode();
		 * 
		 * String deptName = approvalService.selectUserDept(deptCode);
		 * 
		 * mv.addObject("detpName",
		 * deptName).setViewName("approval/normalApprovalForm");
		 */
		return "approval/normalApprovalForm";
	}
	
	@RequestMapping("expenditureApprovalForm.ea")
	public String expenditureApprovalForm() {
		
		return "approval/expenditureApprovalForm";
	}
	
	@RequestMapping("searchDeptForm.ea")
	public String searchDeptForm() {
		
		return "approval/searchDeptForm";
	}
	
	
	@RequestMapping("insertApproval.ea")
	public String insertApproval(Approval ap, ApprovalCC ac, ApprovalDiploma ad, ApprovalHr ah, ApprovalLine line, ApprovalMinutes am,
								String status, HttpServletRequest request, Model model,
								@RequestParam(name="normalAttach" , required=false) MultipartFile file) {
		
		
		// 등록 , 임시저장 구분
		if(status.equals("Y")) {
			ap.setStatus(status);
		}else if(status.equals("N")) {
			ap.setStatus(status);
		}
		
		
		String detailClass = request.getParameter("doc_type");
		String title = request.getParameter("ap_title");
		int writer = Integer.parseInt(request.getParameter("writer"));
		String deptCode = request.getParameter("userDept");
		String content = request.getParameter("apContent");
		String  cooper= request.getParameter("cooperator0");
		String deptShare = request.getParameter("deptShare");
		
		ap.setDetailClass(detailClass);
		ap.setTitle(title);
		ap.setWriter(writer);
		ap.setDeptCode(deptCode);
		ap.setContent(content);
		ap.setCooper(cooper);
		ap.setDeptShare(deptShare);
		
		// 첨부파일 등록 
		if(!file.getOriginalFilename().equals("")) {
			String newName = saveFile(file,request);
			
			if(newName!=null) {
				ap.setOriginName(file.getOriginalFilename());
				ap.setNewName(newName);
				approvalService.insertAttachment(ap);
			}
		}
		
		// 수신참조 등록 
				
		Object ccName = request.getParameter("ccName");
		
		if(ccName instanceof Integer) {
			int ccMember  = (int) ccName;
			ac.setCcMember(ccMember);
		} else {
			String ccMember = (String) ccName;
			ac.setCcDept(ccMember);
		}		
		
			approvalService.insertCoopertation(ac);
	
		
		// 결재라인 등록 
		insertLine(line, request);
						
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
				
		if(status.equals("Y")) {
			model.addAttribute("msg", "결재가 등록되었습니다.");
		}else if(status.equals("N")) {
			model.addAttribute("msg", "결재가 임시저장되었습니다.");
		}
		
		return "main/main";
	}
	
	public void insertLine(ApprovalLine line, HttpServletRequest request) {
		
		int line1 = Integer.parseInt(request.getParameter("line1"));
		int line2 = Integer.parseInt(request.getParameter("line2"));
		int line3 = Integer.parseInt(request.getParameter("line3"));
		int line4 = Integer.parseInt(request.getParameter("line4"));
		
		line.setLine1(line1);
		line.setLine2(line2);
		line.setLine3(line3);
		line.setLine4(line4);
		
		approvalService.insertLine(line);
		
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
		am.setAttendees(attendees);
		approvalService.insertApproval(ap); 
		approvalService.insertMinutes(am);
		
	}

	public void insertHr(Approval ap, ApprovalHr ah, HttpServletRequest request) {
		String dueDate = request.getParameter("dueDate");
		String hrtype = request.getParameter("hr_type");
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
}
