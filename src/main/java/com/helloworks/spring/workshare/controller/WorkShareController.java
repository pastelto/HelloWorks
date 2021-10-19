package com.helloworks.spring.workshare.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.helloworks.spring.common.Pagination;
import com.helloworks.spring.common.model.vo.PageInfo;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.workshare.model.service.WorkShareService;
import com.helloworks.spring.workshare.model.vo.WSAttachment;
import com.helloworks.spring.workshare.model.vo.WorkShare;

@Controller
public class WorkShareController {

	private static final Logger logger = LoggerFactory.getLogger(WorkShareController.class);

	@Autowired
	private WorkShareService workShareService;

	// 메뉴바 -> 미확인 업무 목록
	@RequestMapping("unCheckedListWS.ws")
	public String unCheckedList(HttpServletRequest request, 
								@RequestParam(value="currentPage", required = false, defaultValue="1") int currentPage, Model model) {

		logger.info("미확인 업무 목록 조회 후 미확인업무목록으로 이동");
		
		ArrayList<WorkShare> list = new ArrayList<>();
		PageInfo pi = new PageInfo();
		try {
			
			Employee myEmp = (Employee)request.getSession().getAttribute("loginUser");
			
			// 사번 & 부서코드 조회
			int empNo = myEmp.getEmpNo();	
			String deptCode = myEmp.getDeptCode();
			System.out.println("내 사번 ? " + empNo);
			System.out.println("내 부서코드 ? " + deptCode);
			
			// 미확인 업무 개수 
			int listCount = workShareService.selectUncheckedWSListCount(myEmp);
			
			pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			
			// 미확인 업무 목록 
			list = workShareService.selectUnCheckedList(myEmp, pi);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("page", 1);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "workShare/workShareAllPage";
	}

	// 메뉴바 -> 수신 업무 목록
	@RequestMapping("recvListWS.ws")
	public String checkedList(HttpServletRequest request, 
							  @RequestParam(value="currentPage", required = false, defaultValue="1") int currentPage, Model model) {

		logger.info("수신내역 업무 목록 조회 후 수신업무목록으로 이동");
		
		ArrayList<WorkShare> list = new ArrayList<>();
		PageInfo pi = new PageInfo();
		try {
			
			Employee myEmp = (Employee)request.getSession().getAttribute("loginUser");
			
			// 사번 & 부서코드 조회
			int empNo = myEmp.getEmpNo();	
			String deptCode = myEmp.getDeptCode();
			System.out.println("내 사번 ? " + empNo);
			System.out.println("내 부서코드 ? " + deptCode);
			
			// 수신 업무 개수 
			int listCount = workShareService.selectRecvWSListCount(myEmp);
			
			pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			
			// 수신 업무 목록 
			list = workShareService.selectRecvList(myEmp, pi);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("page", 2);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "workShare/workShareAllPage";
	}

	// 메뉴바 -> 발신 업무 목록
	@RequestMapping("sendListWS.ws")
	public String sendList(HttpServletRequest request, 
			  			   @RequestParam(value="currentPage", required = false, defaultValue="1") int currentPage, Model model) {
		logger.info("발신내역 업무 목록 조회 후 발신업무목록으로 이동");
		
		ArrayList<WorkShare> list = new ArrayList<>();
		PageInfo pi = new PageInfo();
		try {
			
			Employee myEmp = (Employee)request.getSession().getAttribute("loginUser");
			
			// 사번 & 부서코드 조회
			int empNo = myEmp.getEmpNo();	
			String deptCode = myEmp.getDeptCode();
			System.out.println("내 사번 ? " + empNo);
			System.out.println("내 부서코드 ? " + deptCode);
			
			// 발신 업무 개수 
			int listCount = workShareService.selectSendWSListCount(myEmp);
			
			pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			
			// 발신 업무 목록 
			list = workShareService.selectSendList(myEmp, pi);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("page", 3);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "workShare/workShareAllPage";
	}

	// 메뉴바 -> 임시저장 업무 목록
	@RequestMapping("savedListWS.ws")
	public String savedList(HttpServletRequest request, 
			   				@RequestParam(value="currentPage", required = false, defaultValue="1") int currentPage, Model model) {
		
		logger.info("임시저장 업무 목록 조회 후 임시업무목록으로 이동");
		
		ArrayList<WorkShare> list = new ArrayList<>();
		PageInfo pi = new PageInfo();
		try {
			
			Employee myEmp = (Employee)request.getSession().getAttribute("loginUser");
			
			// 사번 & 부서코드 조회
			int empNo = myEmp.getEmpNo();	
			String deptCode = myEmp.getDeptCode();
			System.out.println("내 사번 ? " + empNo);
			System.out.println("내 부서코드 ? " + deptCode);
			
			// 임시저장 업무 개수 
			int listCount = workShareService.selectSavedWSListCount(myEmp);
			
			pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			
			// 임시저장 업무 목록 
			list = workShareService.selectSavedList(myEmp, pi);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("page", 4);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "workShare/workShareAllPage";
	}

	// 업무공유 작성 페이지 이동
	@RequestMapping("sendFormView.ws")
	public String sendFormView() {
		System.out.println("업무공유 작성화면으로 이동");
		return "workShare/sendWSForm";
	}

	// 업무공유 작성 저장
	@RequestMapping("insert.ws")
	private ModelAndView sendWorkShare(MultipartHttpServletRequest multiRequest, HttpServletRequest request, String ws_status) throws Exception {

		ModelAndView mav = new ModelAndView("redirect:sendListWS.ws");
		
		// multiRequest에서 name이 uploadFile인 태그에 담긴 값 가져오기 = 첨부파일들
		List<MultipartFile> fileList = multiRequest.getFiles("uploadFile");
		System.out.println("fileList ? " + fileList.size());

		System.out.println("ws_status ? " + ws_status);
		
		WorkShare ws = new WorkShare();
		
		ArrayList<WSAttachment> wsaList = new ArrayList<WSAttachment>();
		
		ws.setWs_empno(Integer.parseInt(multiRequest.getParameter("ws_empno")));
		ws.setWs_title((String) multiRequest.getParameter("ws_title"));
		ws.setWs_recv((String) multiRequest.getParameter("ws_recv"));
		ws.setWs_ref((String) multiRequest.getParameter("ws_ref"));
		ws.setWs_content((String) multiRequest.getParameter("ws_content"));
		ws.setWs_status(ws_status);
		
		// 업무공유 먼저 추가하기
		workShareService.insertWorkShare(ws);
		System.out.println("ws ? " + ws);
		
		// 첨부파일이 있으면 리스트로 값 추가하기
		 if(!fileList.isEmpty()) {
		  
			 for(int i = 0; i < fileList.size(); i++) {
			 WSAttachment wsa = new WSAttachment();
			 String changeName = saveFile(fileList.get(i), request, i);
			  
			 System.out.println("==================== file start ====================");
			 System.out.println("파일 이름 : " + changeName); 
			 System.out.println("파일 실제 이름 : " + fileList.get(i).getOriginalFilename());
			 System.out.println("파일 크기 : " + fileList.get(i).getSize()); 
			 System.out.println("content type : " + fileList.get(i).getContentType());
			 System.out.println("==================== file end ====================="); 
			 						 
			 wsa.setWsa_empNo(ws.getWs_empno()); 
			 wsa.setWsa_wsNo(ws.getWs_no());
			 wsa.setWsa_origin(fileList.get(i).getOriginalFilename()); 
			 wsa.setWsa_change(changeName);
			 wsa.setWsa_size(fileList.get(i).getSize());
			 wsa.setWsa_status(ws_status);
			 
			 wsaList.add(wsa);
			 }
			 
			
			 System.out.println("wsaList ? " + wsaList);
			workShareService.insertWSAttach(wsaList);
		 }

		return mav;
	}

	// 첨부파일 저장
	// 하나의 메소드를 두군데 이상 활용하기 - 재사용성
	private String saveFile(MultipartFile file, HttpServletRequest request, int num) {

		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\workshare_files\\";

		System.out.println("savePath : " + savePath);

		String originName = file.getOriginalFilename();

		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		String ext = originName.substring(originName.lastIndexOf("."));

		String changeName = currentTime + num + ext;

		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return changeName;
	}
	


}
