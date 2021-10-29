package com.helloworks.spring.dailyReport.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.helloworks.spring.common.Pagination;
import com.helloworks.spring.common.exception.CommException;
import com.helloworks.spring.common.model.vo.PageInfo;
import com.helloworks.spring.dailyReport.model.service.DailyReportService;
import com.helloworks.spring.dailyReport.model.vo.DailyReport;
import com.helloworks.spring.employee.model.vo.Employee;

@Controller
public class DailyReportController {

	@Autowired
	private DailyReportService dailyReportService;
	
	@RequestMapping("enrollReportForm.dr")
	public String enrollReportForm(HttpServletRequest request, Model model, HttpSession session) {
		System.out.println("일일보고 등록 페이지 전환");
		
		Employee loginUser = ((Employee)request.getSession().getAttribute("loginUser")); 
		
		DailyReport dailyReport = new DailyReport();
		dailyReport.setDrReceiverNo(loginUser.getEmpNo());
		dailyReport.setDrWriterNo(loginUser.getEmpNo());
		int tempDRCount = dailyReportService.tempDailyReportCount(dailyReport);
		
		if(tempDRCount > 0 ) {
			dailyReport = dailyReportService.selectTempSaveDailyReport(loginUser.getEmpNo());
			session.setAttribute("msg", "작성 중인 일일보고 페이지로 전환됩니다.");
		}
		
		
		int alreadySend = dailyReportService.alreadySendReport(dailyReport);
		
		if(alreadySend > 0) {
			session.setAttribute("msg", "제출된 일일보고가 존재합니다. 발신함으로 전환됩니다.");
			return "redirect:sendReport.dr";
		}
		
		System.out.println("임시저장: "+dailyReport);
		model.addAttribute("dailyReport", dailyReport);
		model.addAttribute("loginUser", loginUser);
		session.removeAttribute("receiveListSession");
		session.removeAttribute("refListSession");
		return "dailyReport/dailyReportForm";
	}
	
	@RequestMapping("enrollReportFormTempSave.dr")
	public String enrollReportFormTempSave(HttpServletRequest request, Model model, HttpSession session) {
		System.out.println("일일보고 등록 페이지 전환");
		
		Employee loginUser = ((Employee)request.getSession().getAttribute("loginUser")); 
		
		DailyReport dailyReport = new DailyReport();
		dailyReport.setDrReceiverNo(loginUser.getEmpNo());
		dailyReport.setDrWriterNo(loginUser.getEmpNo());
		int tempDRCount = dailyReportService.tempDailyReportCount(dailyReport);
		
		if(tempDRCount > 0 ) {
			dailyReport = dailyReportService.selectTempSaveDailyReport(loginUser.getEmpNo());
		}
		
		model.addAttribute("dailyReport", dailyReport);
		model.addAttribute("loginUser", loginUser);
		return "dailyReport/dailyReportForm";
	}
	
	
	@RequestMapping("insertDailyReport.dr")
	public String insertDailyReport(DailyReport dailyReport, HttpServletRequest request, HttpSession session, Model model, @RequestParam(name="uploadFile", required = false) MultipartFile file) {
		/*
		System.out.println("일일보고 등록: "+dailyReport );
		System.out.println("일일보고 파일: "+file.getOriginalFilename() );
		
		int loginUser = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo(); 
		
		if(!file.getOriginalFilename().equals("")) {
			String drAttachChange = saveFile(file, request);
			
			if(drAttachChange != null) {
				dailyReport.setDrAttachOrigin(file.getOriginalFilename());
				dailyReport.setDrAttachChange(drAttachChange);
			}
		}
		
		dailyReport.setDrReceiverNo(loginUser);
		
		System.out.println("컨트롤러: "+dailyReport);
		
		int tempDRCount = dailyReportService.tempDailyReportCount(dailyReport);
		
		System.out.println("tempDRCount: "+tempDRCount);
		
		if(tempDRCount > 0) {
			
			if(!file.getOriginalFilename().equals("")) { // 널이 아니면 파일이 있는 것
				if(dailyReport.getDrAttachChange() != null) {
					deleteFile(dailyReport.getDrAttachChange(), request);
				}
				
				String changeName = saveFile(file, request);
				dailyReport.setDrAttachOrigin(file.getOriginalFilename());
				dailyReport.setDrAttachChange(changeName);
			}
			
			dailyReportService.updateDailyReportMe(dailyReport);
		}else {
			dailyReportService.insertDailyReport(dailyReport);
		}
		
		String recvList = dailyReport.getDrReceiverList();
		String refList = dailyReport.getDrRefList();
		
		System.out.println("받는사람들: "+recvList);
		System.out.println("참조인원들: "+refList);
		
		String[] recvArr = recvList.split(",");
		
		for(int i = 0; i<recvArr.length;i++) {
			dailyReport.setDrReceiverNo(Integer.parseInt(recvArr[i]));
			dailyReportService.insertDailyReport(dailyReport);
		}
		
		if( !refList.equals("")) {
			String[] refArr =  refList.split(",");
			
			if(recvArr != null) {
				for(int i = 0; i<refArr.length;i++) {
					dailyReport.setDrReceiverNo(0);
					dailyReport.setDrRef(Integer.parseInt(refArr[i]));
					dailyReportService.insertDailyReport(dailyReport);
				}
			}
		}
		
		session.removeAttribute("receiveListSession");
		session.removeAttribute("refListSession");
		return "redirect:sendReport.dr";
		*/
		
		
		System.out.println("일일보고 등록: "+dailyReport );
		System.out.println("일일보고 파일: "+file.getOriginalFilename() );
		
		int loginUser = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo(); 
		
		if(!file.getOriginalFilename().equals("")) {
			String drAttachChange = saveFile(file, request);
			
			if(drAttachChange != null) {
				dailyReport.setDrAttachOrigin(file.getOriginalFilename());
				dailyReport.setDrAttachChange(drAttachChange);
			}
		}
		
		dailyReport.setDrReceiverNo(loginUser);
		
		System.out.println("컨트롤러: "+dailyReport);
		
		int tempDRCount = dailyReportService.tempDailyReportCount(dailyReport);
		
		System.out.println("tempDRCount: "+tempDRCount);
		
		if(tempDRCount > 0) {
			
			if(!file.getOriginalFilename().equals("")) { // 널이 아니면 파일이 있는 것
				if(dailyReport.getDrAttachChange() != null) {
					deleteFile(dailyReport.getDrAttachChange(), request);
				}
				
				String changeName = saveFile(file, request);
				dailyReport.setDrAttachOrigin(file.getOriginalFilename());
				dailyReport.setDrAttachChange(changeName);
			}
			
			dailyReportService.updateDailyReportMe(dailyReport);
		}else {
			dailyReportService.insertDailyReport(dailyReport);
		}
		
		String recvList = dailyReport.getDrReceiverList();
		String refList = dailyReport.getDrRefList();
		
		System.out.println("받는사람들: "+recvList);
		System.out.println("참조인원들: "+refList);
		
		String[] recvArr = recvList.split(",");
		
		for(int i = 0; i<recvArr.length;i++) {
			dailyReport.setDrReceiverNo(Integer.parseInt(recvArr[i]));
			dailyReportService.insertDailyReport(dailyReport);
		}
		
		if( !refList.equals("")) {
			String[] refArr =  refList.split(",");
			
				
			for(int i = 0; i<refArr.length;i++) {
				
				dailyReport.setDrReceiverNo(Integer.parseInt(refArr[i]));
				
				int receiveCheck = dailyReportService.receiveCheck(dailyReport);
				
				if( receiveCheck > 0 ) {
					dailyReport.setDrRef(Integer.parseInt(refArr[i]));
					dailyReportService.updateDailyReportRef(dailyReport);
				}else {
					dailyReport.setDrReceiverNo(0);
					dailyReport.setDrRef(Integer.parseInt(refArr[i]));
					dailyReportService.insertDailyReport(dailyReport);
				}
				
			}
		}
		
		session.removeAttribute("receiveListSession");
		session.removeAttribute("refListSession");
		return "redirect:sendReport.dr";
		
	}

	private String saveFile(MultipartFile file, HttpServletRequest request) {
		// TODO Auto-generated method stub
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources+"\\daily_report_file\\";

		System.out.println("savePath: "+ savePath);
		
		String originName = file.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		String ext = originName.substring(originName.lastIndexOf(".")); // . 뒤에 있는 확장자를 가지고 옴
		
		String changeName = currentTime + ext;
		
		try {
			file.transferTo(new File(savePath+changeName));
		
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new CommException("일일보고 file upload error");
		}
		return changeName;
	}
	
	private void deleteFile(String fileName, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources+"\\daily_report_file\\";

		System.out.println("savePath: "+ savePath);
		
		File deleteFile = new File(savePath+fileName);
		deleteFile.delete();
		
	}
	
	@RequestMapping("cancelDailyReport.dr")
	public String cancelDailyReport(HttpSession session) {
		
		session.removeAttribute("receiveListSession");
		session.removeAttribute("refListSession");
		return "redirect:/main.mi";
	}
	
	@RequestMapping("tempSaveDailyReport.dr")
	public String tempSaveDailyReport(DailyReport dailyReport, HttpServletRequest request, HttpSession session, Model model, @RequestParam(name="uploadFile", required = false) MultipartFile file) {
		
		int loginUser = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo(); 
		
		if(!file.getOriginalFilename().equals("")) {
			String drAttachChange = saveFile(file, request);
			
			if(drAttachChange != null) {
				dailyReport.setDrAttachOrigin(file.getOriginalFilename());
				dailyReport.setDrAttachChange(drAttachChange);
			}
		}
		
		dailyReport.setDrReceiverNo(loginUser);
		
		int tempDRCount = dailyReportService.tempDailyReportCount(dailyReport);
		
		System.out.println("tempDRCount: "+tempDRCount);
		
		if(tempDRCount > 0) {
			
			if(!file.getOriginalFilename().equals("")) { // 널이 아니면 파일이 있는 것
				if(dailyReport.getDrAttachChange() != null) {
					deleteFile(dailyReport.getDrAttachChange(), request);
				}
				
				String changeName = saveFile(file, request);
				dailyReport.setDrAttachOrigin(file.getOriginalFilename());
				dailyReport.setDrAttachChange(changeName);
			}
			
			dailyReportService.updateTempDailyReportMe(dailyReport);
			
		}else {
			dailyReportService.insertTempDailyReport(dailyReport);
		}
		
		return "redirect:enrollReportFormTempSave.dr";
	}
	
	@RequestMapping("sendReport.dr")
	public String sendReport() {
		
		return "dailyReport/dailySendList";
	}
	
	@RequestMapping("recvReport.dr")
	public String recvReport(@RequestParam(value="currentPage", required=false, defaultValue = "1") int currentPage, HttpServletRequest request, Model model) {
		
		int loginUserNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo(); 
		
		int listCount = dailyReportService.selectDailyReportListCount(loginUserNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<DailyReport> dailyReportList = dailyReportService.selectDailyReportList(loginUserNo, pi);
		
		System.out.println("일일보고: "+dailyReportList);
		
		model.addAttribute("pi", pi);
		model.addAttribute("dailyReportList", dailyReportList);
		
		return "dailyReport/dailyReceiveList";
	}
	
}
