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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.GsonBuilder;
import com.helloworks.spring.common.Pagination;
import com.helloworks.spring.common.exception.CommException;
import com.helloworks.spring.common.model.vo.PageInfo;
import com.helloworks.spring.dailyReport.model.service.DailyReportService;
import com.helloworks.spring.dailyReport.model.vo.DailyReport;
import com.helloworks.spring.dailyReport.model.vo.DailyReportReply;
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
	public String sendReport(HttpServletRequest request, Model model) {
		
//		int loginUserNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo(); 
//		
//		ArrayList<DailyReport> dailyReportList = dailyReportService.selectMyAllDailyReportList(loginUserNo);
//		
//		System.out.println("일일보고: "+dailyReportList);
//		
//		model.addAttribute("dailyReportList", dailyReportList);
		
		return "dailyReport/dailySendList";
	}
	
	@ResponseBody
	@RequestMapping(value="selectAllList.dr", produces = "application/json; charset=utf-8")
	public String selectAllList(HttpServletRequest request) {
		int loginUserNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo(); 
		
		ArrayList<DailyReport> dailyReportList = dailyReportService.selectMyAllDailyReportList(loginUserNo);
		
		System.out.println("일일보고: "+dailyReportList);
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(dailyReportList);
	}
	
	@RequestMapping("recvReport.dr")
	public String recvReport(@RequestParam(value="currentPage", required=false, defaultValue = "1") int currentPage, HttpServletRequest request, Model model) {
		
		int loginUserNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo(); 
		
		int listCount = dailyReportService.selectDailyReportListCount(loginUserNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<DailyReport> dailyReportList = dailyReportService.selectDailyReportList(loginUserNo, pi);
		
		System.out.println("일일보고: "+dailyReportList);
		
		model.addAttribute("pi", pi);
		model.addAttribute("dailyReportList", dailyReportList);
		model.addAttribute("pageURL", "recvReport.dr");
		model.addAttribute("checkTypeAll", "checked");
		model.addAttribute("reportType", "allReport");
		
		return "dailyReport/dailyReceiveList";
	}
	
	
	@RequestMapping("recvReportType.dr")
	public String recvReportType(String reportType, @RequestParam(value="currentPage", required=false, defaultValue = "1") int currentPage, HttpServletRequest request, Model model) {
		
		
		int loginUserNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo(); 
		
		DailyReport dailyReport = new DailyReport();
		
		dailyReport.setDrWriterNo(loginUserNo);
		dailyReport.setDrCategory(reportType);

		int listCount = dailyReportService.selectDailyReportCategoryTypeListCount(dailyReport);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<DailyReport> dailyReportList = dailyReportService.selectDailyReportCategoryTypeList(dailyReport, pi);
		
		
		model.addAttribute("pi", pi);
		model.addAttribute("dailyReportList", dailyReportList);
		model.addAttribute("pageURL", "recvReportType.dr");
		
		if(reportType.equals("D")) {
			model.addAttribute("checkD", "checked");
		}else if(reportType.equals("W")){
			model.addAttribute("checkW", "checked");
		}else if(reportType.equals("M")) {
			model.addAttribute("checkM", "checked");
		}else {
			model.addAttribute("checkTypeAll", "checked");
		}
		
		model.addAttribute("reportType", reportType);
		return "dailyReport/dailyReceiveList";
	}
	
	@RequestMapping("recvReportTermType.dr")
	public String recvReportTermType(String reportType, int termType,
									@RequestParam(value="startDate", required=false, defaultValue = "0") String startDate,
									@RequestParam(value="endDate", required=false, defaultValue = "0") String endDate,
									@RequestParam(value="currentPage", required=false, defaultValue = "1") int currentPage, HttpServletRequest request, Model model) {
		
		System.out.println("보고유형: "+reportType);
		System.out.println("기간타입: "+termType);
		System.out.println("시작일자: "+startDate);
		System.out.println("종료일자: "+endDate);
		
		int loginUserNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo(); 
		
		DailyReport dailyReport = new DailyReport();
		
		dailyReport.setDrWriterNo(loginUserNo);
		dailyReport.setDrCategory(reportType);
		dailyReport.setTermType(termType);
		//datePicker 사용시 날짜 변환 후 담기
		
		if(termType==5) {
			String start = startDate.replace("-", "/");
			String end = endDate.replace("-", "/");
			dailyReport.setStartDate(start);
			dailyReport.setEndDate(end);
		}

		int listCount = dailyReportService.selectDailyReportTermTypeListCount(dailyReport);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<DailyReport> dailyReportList = dailyReportService.selectDailyReportTermTypeList(dailyReport, pi);
		
		
		
		if(reportType.equals("allReport")) {
			model.addAttribute("checkTypeAll", "checked");
		}else if(reportType.equals("D")) {
			model.addAttribute("checkD", "checked");
		}else if(reportType.equals("W")){
			model.addAttribute("checkW", "checked");
		}else if(reportType.equals("M")) {
			model.addAttribute("checkM", "checked");
		}
		
		if(!startDate.equals("0") && !endDate.equals("0")) {
			model.addAttribute("startDate", startDate);
			model.addAttribute("endDate", endDate);
		}
		
		model.addAttribute("pi", pi);
		model.addAttribute("dailyReportList", dailyReportList);
		model.addAttribute("termType", termType);
		model.addAttribute("pageURL", "recvReportTermType.dr");
		model.addAttribute("reportType", reportType);
		
		return "dailyReport/dailyReceiveList";
	}
	
	@RequestMapping("searchDailyReport.dr")
	public String searchDailyReport(String optionType, String search, Model model) {
		
		
		switch (optionType) {
		case "allType":
			
			break;
		case "writerType":
					
					break;
		case "titleType":
			
			break;
		case "contentType":
			
			break;
		default:
			break;
		}
		
		
		return "dailyReport/dailyReceiveList";
	}
	
	@RequestMapping("detailDailyReport.dr")
	public String detailDailyReport(int writer, Date createDate, HttpServletRequest request, Model model) {
		
		int loginUserNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo(); 
		
		System.out.println("작성자: "+writer);
		System.out.println("생성일자: "+createDate);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		
		String newDate = sdf.format(createDate);
		System.out.println("생성일자변환: "+newDate);
		DailyReport dailyReport = new DailyReport();
		
		dailyReport.setDrWriterNo(writer);
		dailyReport.setStartDate(newDate); //타입 형태때문에 startDate에 담음
		
		dailyReport.setDrReceiverNo(loginUserNo);
		dailyReport.setDrRef(loginUserNo);
		
		dailyReportService.updateConfirm(dailyReport); // 읽음 확인 값 변경
		
		DailyReport dailyReportResult = dailyReportService.selectDetailDailyReport(dailyReport);
		
		System.out.println("선택한 일일보고: "+dailyReportResult);
		
		model.addAttribute("dailyReportResult", dailyReportResult);
		model.addAttribute("loginUserNo", loginUserNo);
		
		return "dailyReport/dailyReportDetail";
	}
	
	@ResponseBody
	@RequestMapping(value="relplyList.dr", produces = "application/json; charset=utf-8")
	public String relplyList(int drNo) {
		ArrayList<DailyReportReply> list = dailyReportService.selectReplyList(drNo);
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(list); //형식적용하여 시간 출력
	}
	
	@ResponseBody
	@RequestMapping(value="addReply.dr", produces = "application/json; charset=utf-8")
	public String addReply(DailyReportReply r) {
		
		System.out.println("댓글: "+r);
		
		int result = dailyReportService.addReply(r);
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping("deleteReply.dr")
	public String deleteReply(int drNo) {
		System.out.println("삭제 넘어오나요..?");
		int result = dailyReportService.deleteReply(drNo);
		
		return String.valueOf(result);
	}
	
	
	@RequestMapping("detailSendDailyReport.dr")
	public String detailSendDailyReport(int drNo, HttpServletRequest request, Model model) {
		
		int loginUserNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo(); 
		
		
		DailyReport dailyReport = new DailyReport();
		
		dailyReport.setDrNo(drNo);
		
		DailyReport dailyReportResult = dailyReportService.selectDetailSendDailyReport(drNo);
		
		System.out.println("선택한 일일보고: "+dailyReportResult);
		
		model.addAttribute("dailyReportResult", dailyReportResult);
		model.addAttribute("loginUserNo", loginUserNo);
		
		return "dailyReport/dailyReportDetail";
	}
}
