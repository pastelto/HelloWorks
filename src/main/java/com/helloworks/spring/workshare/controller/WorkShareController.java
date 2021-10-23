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
	
	// 조회 기능 (목록 조회, 상세내용 조회)
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
	
	// 업무공유 상세 조회
	@RequestMapping("detail.ws")
	public String detailWS(int wno, Model model, HttpServletRequest request) {
		
		logger.info("해당 업무공유 상세 조회 페이지로 이동");
		
		Employee myEmp = (Employee)request.getSession().getAttribute("loginUser");
		String empNo = String.valueOf(myEmp.getEmpNo()); // 로그인한 사번을 String형으로 변환
		
		WorkShare ws = new WorkShare(); // 업무공유 조회
		ArrayList<WSAttachment> wsa = new ArrayList<>(); // 업무공유 첨부파일 조회
		String uList = ""; // 업무공유 수신인 수신처리 후 값 (updateList)
		
		try {
			// 상세 조회
			ws = workShareService.detailWS(wno);
			System.out.println("WS 상세 조회 [ws_no : " + ws.getWs_no() + " ] : " + ws);
			
			// 수신여부에서 이미 읽음처리가 되어 있는지 확인
			String rList= ws.getWs_recv_status();
			Boolean contain = contains(empNo, rList);
			
			// 수신처리가 안되어있으면 (contain == true 일 때)
			if(contain) {
			
			String[] rEach = rList.split(",");
			
			for(int i = 0; i < rEach.length; i++) {
				if( rEach[i].equals(empNo) ) {	
					rEach[i] = "0"; // 수신 상태에서 로그인한 사번값을 찾아 0으로 변환 -> 읽음 처리
				}
			
				uList += rEach[i] + ",";
			}
			// update시 여러개의 파라미터를 넘길 수 없음 -> HashMap을 사용하거나 Object를 사용해야함
			WorkShare updateWS = new WorkShare();
			updateWS.setWs_no(wno);
			updateWS.setWs_recv_status(uList);
			
			System.out.println("새로운 수신상태 값 uList ? " + uList);
			workShareService.readStatusWS(updateWS);
			ws = workShareService.detailWS(wno);
			System.out.println("수신처리 후 다시 조회 [ws_no : " + ws.getWs_no() + " ] : " + ws);
			}
			
			int wsno = ws.getWs_no();
			wsa = workShareService.detailWSAttachment(wsno);
			System.out.println("wsa : " + wsa);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
		model.addAttribute("wsa", wsa);
		model.addAttribute("ws", ws);
		 
		 return "workShare/workShareDetail";
	}
	
	// 포함여부 메소드
	private boolean contains(String empNo, String rList) {
		
		String[] rEach = rList.split(",");
		
		for(int i = 0; i < rEach.length; i++) {
			// 만약 목록에 로그인한 사번이 있으면 contains == true
			if( rEach[i].equals(empNo) ) {	
				return true;
			}
		}
		return false;
	}

	// 수신 인원
	private int countRead() {
		
		return 0;
	}
	
	// 회신 인원
	private int countReply() {
		
		return 0;
	}
	
	// 작성 기능 (업무공유 새로 작성, 수정, 임시저장 -> 발송)
	// 업무공유 작성 페이지 이동
	@RequestMapping("sendFormView.ws")
	public String sendFormView() {
		System.out.println("업무공유 작성화면으로 이동");
		return "workShare/sendWSForm";
	}

	// 업무공유 작성 저장 원본
	@RequestMapping("insert.ws")
	private ModelAndView sendWorkShare(MultipartHttpServletRequest multiRequest, HttpServletRequest request, String ws_status) throws Exception {

		ModelAndView mav = new ModelAndView("redirect:sendListWS.ws");
		
		// multiRequest에서 name이 uploadFile인 태그에 담긴 값 가져오기 = 첨부파일들
		// input file 에 아무것도 없을 경우 (파일을 업로드 하지 않았을 때 처리) 
		
		List<MultipartFile> fileList = multiRequest.getFiles("uploadFile");
		
		// System.out.println("multiRequest 파일 사이즈가 0이면, 파일이 없음! : " + multiRequest.getFiles("uploadFile").get(0).getSize());
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
		 if(fileList.get(0).getSize() != 0) {
		  
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

	
	// 업무 생성 - 배열 이용
/*	@RequestMapping("insert.ws")
	private ModelAndView sendWorkShare(WorkShare ws, HttpServletRequest request, String ws_status,
			 							@RequestParam(name="uploadFile", required=false) MultipartFile[] files) throws Exception {
		
		ModelAndView mav = new ModelAndView("redirect:sendListWS.ws");
		
		// multiRequest에서 name이 uploadFile인 태그에 담긴 값 가져오기 = 첨부파일들
		
		System.out.println("files.length ? " + files.length);
		System.out.println("files ? " + files[0]);
		System.out.println("ws_status ? " + ws_status);
		
		// WorkShare ws = new WorkShare();
		
		ArrayList<WSAttachment> wsaList = new ArrayList<WSAttachment>();

		ws.setWs_status(ws_status);
		
		// 업무공유 먼저 추가하기
		workShareService.insertWorkShare(ws);
		System.out.println("ws ? " + ws);
		
		// 첨부파일이 있으면 리스트로 값 추가하기
		if(files.length > 0) {
			
			for(int i = 0; i < files.length; i++) {
				WSAttachment wsa = new WSAttachment();
				String changeName = saveFile(files[i], request, i);
				
				System.out.println("==================== file start ====================");
				System.out.println("파일 이름 : " + changeName); 
				System.out.println("파일 실제 이름 : " + files[i].getOriginalFilename());
				System.out.println("파일 크기 : " + files[i].getSize()); 
				System.out.println("content type : " + files[i].getContentType());
				System.out.println("==================== file end ====================="); 
				
				wsa.setWsa_empNo(ws.getWs_empno()); 
				wsa.setWsa_wsNo(ws.getWs_no());
				wsa.setWsa_origin(files[i].getOriginalFilename()); 
				wsa.setWsa_change(changeName);
				wsa.setWsa_size(files[i].getSize());
				wsa.setWsa_status(ws_status);
				
				wsaList.add(wsa);
			}
			
			
			System.out.println("wsaList ? " + wsaList);
			workShareService.insertWSAttach(wsaList);
		}
		
		return mav;
	}
*/
	// 첨부파일 저장
	// 하나의 메소드를 두군데 이상 활용하기 - 재사용성
	private String saveFile(MultipartFile file, HttpServletRequest request, int num) throws Exception {

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
	
	@RequestMapping("update.ws")
	public ModelAndView updateWS(MultipartHttpServletRequest multiRequest, HttpServletRequest request, String ws_status) {
		
		
		
		
		
		
		ModelAndView mav = new ModelAndView("redirect:sendListWS.ws");
		return mav;
	}
	
	
	

}
