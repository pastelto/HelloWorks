package com.helloworks.spring.workshare.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.helloworks.spring.common.Pagination;
import com.helloworks.spring.common.model.vo.PageInfo;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.workshare.model.service.WorkShareService;
import com.helloworks.spring.workshare.model.vo.WSAttachment;
import com.helloworks.spring.workshare.model.vo.WSReply;
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
		int countRead = 0; // 읽은 사람 수 
		int countReply = 0; // 회신 사람 수 
		ArrayList<Integer> cRead = new ArrayList<>(); 
		ArrayList<Integer> totalCount = new ArrayList<>(); // 총 수신인 수 
		
		ArrayList<Integer> refRead = new ArrayList<>(); 
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
			
			// 발신 수신인 수
			for(int i = 0; i < list.size(); i++) {
				String rList = list.get(i).getWs_recv_status();
				System.out.println("발신인 수신인 수 ? " + rList);
				String[] strList = rList.split(",");
				countRead = countRead(strList);
				totalCount.add(strList.length);
				cRead.add(countRead);
			}
			
			// 회신인 수
			for(int i = 0; i < list.size(); i++) {
				String replyList = list.get(i).getWs_reply();
				System.out.println("발신인 회신인 수 ? " + replyList);
				String[] strList = replyList.split(",");
				countReply = countRead(strList);
				refRead.add(countReply);
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("cRead", cRead); // 읽은 사람 수 
		model.addAttribute("refRead", refRead); // 읽은 사람 수 
		model.addAttribute("totalCount", totalCount); // 전체 발송인 수
		model.addAttribute("page", 3);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "workShare/workShareAllPage";
	}
	
	// 수신 인원
	private int countRead(String[] strList) {
		
		int countRead = 0;
		
		for(int i = 0; i < strList.length; i++) {
			if(Integer.parseInt(strList[i]) == 0) {
				countRead++;
			};
		}
		System.out.println("countRead ? " + countRead);
		return countRead;
	}
	
	// 회신 인원
	private int countReply() {
		
		return 0;
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
		// 업무공유 수신인 수신처리 후 값 (updateList)
		String uList = "";  
		String[] rEach;
		
		// 수신인들 목록 가져오기
		String[] wsRecvList = null; 
		ArrayList<WorkShare> wsRecvEmpName = new ArrayList<>();
		
		// 참조인들 목록 가져오기
		String[] wsRefList = null;
		ArrayList<WorkShare> wsRefEmpName = new ArrayList<>();
		int myEmpNo = 0;
		
		try {
			// 상세 조회	
			ws = workShareService.detailWS(wno);
			System.out.println("WS 상세 조회 [ws_no : " + ws.getWs_no() + " ] : " + ws);
			
      		// 수신인 조회
			String recvEmp = ws.getWs_recv();
			System.out.println("recvEmp ? " + recvEmp);
			wsRecvList = recvEmp.split(",");
			
			// 만약 수신인 중에 내 로그인 번호가 있으면!
			for(int i = 0; i < wsRecvList.length; i++) {
				int num = Integer.parseInt(wsRecvList[i]);
				if(myEmp.getEmpNo() == num) {
					myEmpNo = num;
				}
			}
			
			// 수신인들을 이름으로 가져오기!
			for(int i = 0; i < wsRecvList.length; i++) {
				int recvEmpNo = Integer.parseInt(wsRecvList[i]);
				
				wsRecvEmpName.add(workShareService.selectRecvEmpName(recvEmpNo));
			}
			System.out.println("wsRecvEmpName ? " + wsRecvEmpName);
			
      		// 참조인 조회
			String refEmp = ws.getWs_ref();
			if(refEmp == "") {
				
				System.out.println("refEmp ? " + refEmp);
				wsRefList = refEmp.split(",");
				
				// 참조인들을 이름으로 가져오기!
				for(int i = 0; i < wsRefList.length; i++) {
					int refEmpNo = Integer.parseInt(wsRefList[i]);
					
					wsRefEmpName.add(workShareService.selectRecvEmpName(refEmpNo));
				}
				System.out.println("wsRefEmpName ? " + wsRefEmpName);
			}

			
			// 수신여부에서 이미 읽음처리가 되어 있는지 확인
			String rList= ws.getWs_recv_status();
			Boolean contain = contains(empNo, rList);
			System.out.println("수신인 rList ? " + rList);
			// 수신처리가 안되어있으면 (contain == true 일 때)
			if(contain) {
			
			rEach = rList.split(",");
			System.out.println("rEach ? " + rEach);
			
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
			updateWS.setWs_empno(ws.getWs_empno());
			
			System.out.println("새로운 수신상태 값 uList ? " + uList);
			workShareService.readStatusWS(updateWS);
			}
			
			ws.setWs_no(wno);
			ws.setWs_empno(ws.getWs_empno());
			
			ws = workShareService.detailAllWS(ws);
			System.out.println("수신처리 후 다시 조회 [ws_no : " + ws.getWs_no() + " ] : " + ws);

			int wsno = ws.getWs_no();
			System.out.println("wsno 첨부파일 조회시 사용되는 업무공유 번호 ? " + wsno);
			wsa = workShareService.detailWSAttachment(wsno);
			System.out.println("wsa : " + wsa);
		} catch (Exception e) {
			// TODO Auto-generated catch block
		
		} 
		
		model.addAttribute("wsRefEmpName", wsRefEmpName);
		model.addAttribute("wsRecvEmpName", wsRecvEmpName);
		model.addAttribute("myEmpNo", myEmpNo);
		model.addAttribute("wsa", wsa);
		model.addAttribute("ws", ws);
		 
		 return "workShare/workShareDetail";
	}
	
	// 임시저장 업무공유 상세 조회
	@RequestMapping("sDetail.ws")
	public String savedDetailWS(int wno, Model model, HttpServletRequest request, HttpSession session) {
		
		logger.info("임시저장 업무공유 상세 조회 페이지로 이동");
		
		Employee myEmp = (Employee)request.getSession().getAttribute("loginUser");
		String empNo = String.valueOf(myEmp.getEmpNo()); // 로그인한 사번을 String형으로 변환
		
		WorkShare ws = new WorkShare(); // 업무공유 조회
		ArrayList<WSAttachment> wsa = new ArrayList<>(); // 업무공유 첨부파일 조회
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("wno", wno);
		map.put("empNo", empNo);
		try {
			// 상세 조회 - 업무공유
			ws = workShareService.savedDetailWS(map);
			System.out.println("WS 상세 조회 [ws_no : " + ws.getWs_no() + " ] : " + ws);		
			
			// 상세 조회 - 첨부파일
			int wsno = ws.getWs_no();
			System.out.println("wsno 첨부파일 조회시 사용되는 업무공유 번호 ? " + wsno);
			wsa = workShareService.detailWSAttachment(wsno);
			System.out.println("wsa : " + wsa);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		 session.removeAttribute("receiveListSession");
		 session.removeAttribute("refListSession");
		 model.addAttribute("wsa", wsa);
		 model.addAttribute("ws", ws);
		 return "workShare/updateWSForm";
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
	
	// 작성 기능 (업무공유 새로 작성, 수정, 임시저장 -> 발송)
	// 업무공유 작성 페이지 이동
	@RequestMapping("sendFormView.ws")
	public String sendFormView(HttpSession session) {
		System.out.println("업무공유 작성화면으로 이동");
		session.removeAttribute("receiveListSession");
		session.removeAttribute("refListSession");
		return "workShare/sendWSForm";
	}

	// 업무공유 작성 저장 원본
	@RequestMapping("insert.ws")
	private ModelAndView sendWorkShare(MultipartHttpServletRequest multiRequest, HttpServletRequest request, String ws_status, HttpSession session) throws Exception {

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
		ws.setWs_recv((String) multiRequest.getParameter("drReceiverList"));
		ws.setWs_ref((String) multiRequest.getParameter("drRefList"));
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
			 
			 if(ws_status.equals("S")) {
				 ws_status = "Y";
			 }
			 wsa.setWsa_status(ws_status);
			 
			 wsaList.add(wsa);
			 }
			 
			
			System.out.println("wsaList ? " + wsaList);
			workShareService.insertWSAttach(wsaList);
		 }
		 
		session.removeAttribute("receiveListSession");
		session.removeAttribute("refListSession");
		return mav;
	}

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
	
	// 업무공유 수정 양식으로 이동
	@RequestMapping("updateForm.ws")
	public String updateForm(int wno, Model model, HttpSession session) {
			
		WorkShare ws = new WorkShare();
		ArrayList<WSAttachment> wsa = new ArrayList<WSAttachment>();
		// 수신인들 목록 가져오기
		String[] wsRecvList = null; 
		ArrayList<WorkShare> wsRecvEmpName = new ArrayList<>();
		
		// 참조인들 목록 가져오기
		String[] wsRefList = null; 
		ArrayList<WorkShare> wsRefEmpName = new ArrayList<>();
		try {
			ws = workShareService.detailWS(wno);
			wsa = workShareService.detailWSAttachment(wno);
			
			// 수신인 조회
			String recvEmp = ws.getWs_recv();
			System.out.println("recvEmp ? " + recvEmp);
			wsRecvList = recvEmp.split(",");
			
			// 수신인들을 이름으로 가져오기!
			for(int i = 0; i < wsRecvList.length; i++) {
				int recvEmpNo = Integer.parseInt(wsRecvList[i]);
				
				wsRecvEmpName.add(workShareService.selectRecvEmpName(recvEmpNo));
			}
			System.out.println("wsRecvEmpName ? " + wsRecvEmpName);
			
	  		// 참조인 조회
			String refEmp = ws.getWs_ref();
			System.out.println("refEmp ? " + refEmp);
			wsRefList = refEmp.split(",");
			
			// 참조인들을 이름으로 가져오기!
			for(int i = 0; i < wsRefList.length; i++) {
				int refEmpNo = Integer.parseInt(wsRefList[i]);
				System.out.println("===== refEmpNo ===== ");
				System.out.println(refEmpNo);
				System.out.println("===== refEmpNo ===== ");
				wsRefEmpName.add(workShareService.selectRecvEmpName(refEmpNo));
			}
			System.out.println("wsRefEmpName ? " + wsRefEmpName);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		 session.removeAttribute("receiveListSession");
		 session.removeAttribute("refListSession");
		 model.addAttribute("wsRefEmpName", wsRefEmpName);
		 model.addAttribute("wsRecvEmpName", wsRecvEmpName);
		 model.addAttribute("wsa", wsa);
		 model.addAttribute("ws", ws);
		 return "workShare/updateWSForm";
	}
	
	// 업무공유 수정
	@RequestMapping("updateWS.ws")
	public String updateWS(MultipartHttpServletRequest multiRequest, HttpServletRequest request, Model model, HttpSession session) throws Exception {
		
		List<MultipartFile> fileList = multiRequest.getFiles("uploadFile");
		Employee myEmp = (Employee)request.getSession().getAttribute("loginUser");
		int myEmpNo = myEmp.getEmpNo();
		
		System.out.println("fileList ? " + fileList.size());
		int wno = Integer.parseInt(multiRequest.getParameter("workShareNo"));
		System.out.println("wno ? " + wno);
		
		WorkShare ws = new WorkShare();
		
		ArrayList<WSAttachment> wsaList = new ArrayList<WSAttachment>();
		ws.setWs_no(wno);
		ws.setWs_title((String) multiRequest.getParameter("ws_title"));
		ws.setWs_recv((String) multiRequest.getParameter("ws_recv")); 
		ws.setWs_ref((String) multiRequest.getParameter("ws_ref"));
		ws.setWs_content((String) multiRequest.getParameter("ws_content"));
		
		// 업무공유 먼저 수정하기
		workShareService.updateWorkShare(ws);
		
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
			 
			 wsa.setWsa_no(wno);
			 wsa.setWsa_empNo(myEmpNo); 
			 wsa.setWsa_wsNo(ws.getWs_no());
			 wsa.setWsa_origin(fileList.get(i).getOriginalFilename()); 
			 wsa.setWsa_change(changeName);
			 wsa.setWsa_size(fileList.get(i).getSize());
			 wsa.setWsa_status("Y");
			 
			 wsaList.add(wsa);
			 }

			System.out.println("wsaList ? " + wsaList);
			workShareService.updateWSAttachment(wsaList);
		 }
		
		session.removeAttribute("receiveListSession");
		session.removeAttribute("refListSession");
		 return "redirect:detail.ws?wno="+wno;
	}
	
	// 업무공유 임시저장 수정
	@RequestMapping("updateSavedWS.ws")
	public String updateSavedWS(MultipartHttpServletRequest multiRequest, HttpServletRequest request, Model model, HttpSession session) throws Exception {
		
		List<MultipartFile> fileList = multiRequest.getFiles("uploadFile");
		Employee myEmp = (Employee)request.getSession().getAttribute("loginUser");
		int myEmpNo = myEmp.getEmpNo();
		
		System.out.println("fileList ? " + fileList.size());
		int wno = Integer.parseInt(multiRequest.getParameter("workShareNo"));
		System.out.println("wno ? " + wno);
		
		WorkShare ws = new WorkShare();
		
		ArrayList<WSAttachment> wsaList = new ArrayList<WSAttachment>();
		ws.setWs_no(wno);
		ws.setWs_title((String) multiRequest.getParameter("ws_title"));
		ws.setWs_recv((String) multiRequest.getParameter("ws_recv")); 
		ws.setWs_ref((String) multiRequest.getParameter("ws_ref"));
		ws.setWs_content((String) multiRequest.getParameter("ws_content"));
		
		// 업무공유 먼저 수정하기
		workShareService.updateSavedWorkShare(ws);
		
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
				
				wsa.setWsa_no(wno);
				wsa.setWsa_empNo(myEmpNo); 
				wsa.setWsa_wsNo(ws.getWs_no());
				wsa.setWsa_origin(fileList.get(i).getOriginalFilename()); 
				wsa.setWsa_change(changeName);
				wsa.setWsa_size(fileList.get(i).getSize());
				wsa.setWsa_status("Y");
				
				wsaList.add(wsa);
			}
			
			System.out.println("wsaList ? " + wsaList);
			workShareService.updateWSAttachment(wsaList);
		}
		
		session.removeAttribute("receiveListSession");
		session.removeAttribute("refListSession");
		return "redirect:savedListWS.ws";
	}
	
	// 업무공유 삭제
	@RequestMapping("deleteWS.ws")
	public ModelAndView deleteWS(MultipartHttpServletRequest multiRequest, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("redirect:unCheckedListWS.ws");

		try {
			
		int wno = Integer.parseInt(multiRequest.getParameter("workShareNo"));

		// 해당 업무공유의 첨부파일 불러오기
		List<WSAttachment> wsaList = workShareService.detailWSAttachment(wno);
		System.out.println("wsaList Attachment ? " + wsaList);
		// 첨부파일이 있으면 삭제하기 
		 if(wsaList.size() != 0) {
		  
			 for(int i = 0; i < wsaList.size(); i++) { // 물리적인 파일 삭제
				 System.out.println("changeNameFile [" + i + "] ? " + wsaList.get(i));
				 deleteFile(wsaList.get(i), request);
			 } 
			 workShareService.deleteWSAttachment(wno); // 전체 파일 삭제
		 }
		 
		// 업무공유 삭제하기
		workShareService.deleteWS(wno);
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("삭제 성공!");
		//return "workShare/workShareAllPage";
		return mav;
	}
	
	// 첨부파일 삭제
	private void deleteFile(WSAttachment file, HttpServletRequest request) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\workshare_files\\";
		
		System.out.println("savePath : " + savePath);
		
		String fileName = file.getWsa_change();
		System.out.println("삭제할 파일 명 : " + fileName);
		
		File deleteFile = new File(savePath + fileName);
		deleteFile.delete();
		
	}
	
	// 업무공유 수정 - 첨부파일 리스트 불러오기
	@ResponseBody
	@RequestMapping(value="wsaList.ws", produces="application/json; charset=UTF-8")
	public String selectWsaList(int wno) {
		
		// 해당 업무공유의 첨부파일 불러오기
		List<WSAttachment> list = new ArrayList<>();
		try {
			list = workShareService.detailWSAttachment(wno);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(!list.isEmpty()) {
			System.out.println("wsaList Attachment ? " + list);	
			return new GsonBuilder().create().toJson(list); 
		} else {
			int result = 0;
			return String.valueOf(result);
		}	
		
	}
	
	// 업무공유 수정 - 첨부파일 삭제하기
	@ResponseBody
	@RequestMapping(value="deleteWsa.ws", produces="application/json; charset=UTF-8")
	public String deleteWsa(int wsaNo, HttpServletRequest request) {
		int result = 0;
		try {
			WSAttachment wsa = workShareService.selectWsa(wsaNo);
			result = workShareService.deleteWsa(wsaNo);
			deleteFile(wsa, request);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return String.valueOf(result);
	}
	
	// 업무공유 작성 취소하기
	@RequestMapping("cancelWorkShare.ws")
	public String cancelWorkShare(HttpSession session) {
		
		session.removeAttribute("receiveListSession");
		session.removeAttribute("refListSession");
		return "redirect:sendListWS.ws";
	}
	

	// -------------- 댓글 및 답글 기능 --------------
	// 댓글 및 답글 조회하기
	@ResponseBody
	@RequestMapping(value="rlist.ws", produces="application/json; charset=UTF-8") 
	public String selectReplyList(int wno) {
		// mybatis-config에서 typeAlias에 Reply 추가해주기
		ArrayList<WSReply> list = new ArrayList<>();
		try {
			list = workShareService.selectReplyList(wno);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(list);
	}
	
	// 댓글 추가하기 (기본댓글)
	@ResponseBody
	@RequestMapping("rinsert.ws")
	public String insertReply(WSReply wsr, int wno, HttpServletRequest request) {
		
		int result = 0;
		Employee myEmp = (Employee)request.getSession().getAttribute("loginUser");
		String empNo = String.valueOf(myEmp.getEmpNo());
		
		System.out.println("wsr ? " + wsr);
		System.out.println("wno ? " + wno);
		
		WorkShare ws = new WorkShare(); // 업무공유 조회 
		// 업무공유 수신인 수신처리 후 값 (updateList)
		String uList = "";  
		String[] rEach;
 
		try {

			wsr.setWsr_wsNo(wno); // 업무번호
			wsr.setWsr_empName(myEmp.getEmpName());
			wsr.setWsr_empJobName(myEmp.getJobName());
			result = workShareService.insertReply(wsr);
			
			ws = workShareService.detailWS(wno);
			
			// 회신여부에서 이미 회신처리가 되어 있는지 확인
			String rList= ws.getWs_reply();
			Boolean contain = contains(empNo, rList);
			
			// 회신처리가 안되어있으면 (contain == true 일 때)
			if(contain) {
			
			rEach = rList.split(",");
			System.out.println("rEach ? " + rEach);
			
			for(int i = 0; i < rEach.length; i++) {
				if( rEach[i].equals(empNo) ) {	
					rEach[i] = "0"; // 회신 상태에서 로그인한 사번값을 찾아 0으로 변환 -> 읽음 처리
				}
			
				uList += rEach[i] + ",";
			}
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("wno", wno);
			map.put("uList", uList);
			workShareService.updateReplyList(map);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return String.valueOf(result);
	}
	
	// 댓글 삭제하기
	@ResponseBody
	@RequestMapping("deleteReply.ws")
	public String deleteReply(int rno) {
		
		int result = 0;
		System.out.println("wsr_no ? " + rno);
		
		try {
			result = workShareService.deleteReply(rno);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return String.valueOf(result);
	}
	
	
}
