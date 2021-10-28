package com.helloworks.spring.dailyReport.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.helloworks.spring.common.exception.CommException;
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
		
		model.addAttribute("loginUser", loginUser);
		return "dailyReport/dailyReportForm";
	}
	
	@RequestMapping("insertDailyReport.dr")
	public String insertDailyReport(DailyReport dailyReport, HttpServletRequest request, HttpSession session, Model model, @RequestParam(name="uploadFile", required = false) MultipartFile file) {
		
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
		
		String recvList = dailyReport.getDrReceiverList();
		String refList = dailyReport.getDrRefList();
		
		System.out.println("받는사람들: "+recvList);
		System.out.println("참조인원들: "+refList);
		
		String[] recvArr = recvList.split(",");
		
		String[] refArr =  refList.split(",");
		
		dailyReport.setDrReceiverNo(loginUser);
		
		System.out.println("컨트롤러: "+dailyReport);
		
		int tempDRCount = dailyReportService.tempDailyReportCount(loginUser);
		
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
		
		for(int i = 0; i<recvArr.length;i++) {
			dailyReport.setDrReceiverNo(Integer.parseInt(recvArr[i]));
			dailyReportService.insertDailyReport(dailyReport);
		}
		
		for(int i = 0; i<refArr.length;i++) {
			dailyReport.setDrReceiverNo(0);
			dailyReport.setDrRef(Integer.parseInt(refArr[i]));
			dailyReportService.insertDailyReport(dailyReport);
		}
		
		session.removeAttribute("receiveListSession");
		session.removeAttribute("refListSession");
		return "dailyReport/dailySendList";
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
		String savePath = resources+"\\upload_files\\";

		System.out.println("savePath: "+ savePath);
		
		File deleteFile = new File(savePath+fileName);
		deleteFile.delete();
		
	}
}
