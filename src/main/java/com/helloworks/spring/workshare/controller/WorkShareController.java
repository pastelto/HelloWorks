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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.helloworks.spring.workshare.model.service.WorkShareService;
import com.helloworks.spring.workshare.model.vo.WSAttachment;
import com.helloworks.spring.workshare.model.vo.WorkShare;

@Controller
public class WorkShareController {

	private static final Logger logger = LoggerFactory.getLogger(WorkShareController.class);

	@Autowired
	private WorkShareService workShareService;

	// 메뉴바 -> 미확인 업무
	@RequestMapping("unCheckedListWS.ws")
	public String unCheckedList() {
		System.out.println("미확인 업무 메인화면으로 이동");
		return "workShare/workShareAllPage";
	}

	// 메뉴바 -> 수신 업무 내역
	@RequestMapping("recvListWS.ws")
	public String checkedList() {
		System.out.println("수신내역 메인화면으로 이동");
		return "workShare/workShareAllPage";
	}

	// 메뉴바 -> 발신 업무 내역
	@RequestMapping("sendListWS.ws")
	public String sendList() {
		System.out.println("발신 업무 메인화면으로 이동");
		return "workShare/workShareAllPage";
	}

	// 메뉴바 -> 임시저장 업무 내역
	@RequestMapping("savedListWS.ws")
	public String savedList() {
		System.out.println("임시저장 업무 메인화면으로 이동");
		return "workShare/workShareAllPage";
	}

	// 업무공유 작성 페이지 이동
	@RequestMapping("sendFormView.ws")
	public String sendFormView() {
		System.out.println("임시저장 업무 메인화면으로 이동");
		return "workShare/sendWSForm";
	}

	// 업무공유 작성 저장
	/*
	 * @RequestMapping("insert.ws") public String sendWorkShare(WorkShare ws, String
	 * ws_status, HttpServletRequest request, Model model) {
	 * 
	 * System.out.println("업무공유 작성 저장중");
	 * 
	 * try {
	 * 
	 * MultipartHttpServletRequest mphsr = (MultipartHttpServletRequest)request;
	 * 
	 * Iterator<String> iterator = mphsr.getFileNames(); MultipartFile multipartFile
	 * = null;
	 * 
	 * List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
	 * Map<String, Object> listMap = null;
	 * 
	 * while(iterator.hasNext()) { multipartFile = mphsr.getFile(iterator.next());
	 * 
	 * if(multipartFile.isEmpty() == false) {
	 * 
	 * 
	 * String changeName = saveFile(multipartFile, request);
	 * 
	 * if(changeName != null) {
	 * 
	 * listMap = new HashMap<String, Object>(); 
	 * listMap.put("wsa_empNo", ws.getWs_empno()); 
	 * listMap.put("wsa_wsNo", ws.getWs_empno());
	 * listMap.put("wsa_origin", multipartFile.getOriginalFilename());
	 * listMap.put("wsa_change", changeName); listMap.put("wsa_size",
	 * 
	 * multipartFile.getSize());
	 * 
	 * list.add(listMap); 
	 * } 
	 * } 
	 * }
	 * 
	 * if(ws_status.equals("Y")) { //등록 ws.setWs_status(ws_status); }else
	 * if(ws_status.equals("S")) {//임시저장 ws.setWs_status(ws_status); }
	 * 
	 * System.out.println("wsStatus ? " + ws_status);
	 * System.out.println("request ? " + request);
	 * 
	 * 
	 * 
	 * List<MultipartFile> fileList = ((MultipartRequest)request).getFiles("file");
	 * System.out.println("fileList : " + fileList); List<WSAttachment> wsAttach =
	 * new ArrayList<>(); WSAttachment wsa = new WSAttachment();
	 * 
	 * // workShareService.insertWorkShare(ws);
	 * 
	 * // 첨부파일이 있다면,
	 * 
	 * if(fileList.size() > 0) {
	 * 
	 * for(MultipartFile mpf : fileList) { System.out.println("file 이름 : " +
	 * mpf.getOriginalFilename());
	 * 
	 * if(!mpf.getOriginalFilename().equals("")) {
	 * 
	 * String changeName = saveFile(mpf, request);
	 * 
	 * if(changeName != null) {
	 * 
	 * wsa.setWsa_empNo(ws.getWs_empno()); 
	 * wsa.setWsa_wsNo(ws.getWs_no());
	 * wsa.setWsa_origin(mpf.getOriginalFilename()); 
	 * wsa.setWsa_change(changeName);
	 * wsa.setWsa_size(mpf.getSize());
	 * 
	 * 
	 * wsAttach.add(wsa); }
	 * 
	 * } } }
	 * 
	 * 
	 * 
	 * System.out.println("ws ? " + ws); System.out.println("list" + list);
	 * workShareService.insertWorkShare(ws, list);
	 * 
	 * 
	 * } catch (Exception e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); }
	 * 
	 * 
	 * List<MultipartFile> fileList = request.getFiles("file");
	 * System.out.println("fileList : " + fileList);
	 * 
	 * System.out.println("WorkShare ws : " + ws);
	 * 
	 * if(fileList.size() > 0) {
	 * 
	 * for(MultipartFile mpf : fileList) {
	 * 
	 * System.out.println("file 이름 : " + mpf.getOriginalFilename()); // 그냥 하면 에러가
	 * 발생함 -> pom.xml에 파일 업로드 관련 라이브러리 추가 필요 // 그 다음으로 root-context.xml에 가서 파일 사이즈도
	 * 지정해주어야함
	 * 
	 * 
	 * if(!file.getOriginalFilename().equals("")) { String changeName =
	 * saveFile(file, request);
	 * 
	 * if(changeName != null) { 
	 * ws.setWsa_origin(file.getOriginalFilename());
	 * ws.setWsa_change(changeName); 
	 * } } }
	 * 
	 * 
	 * workShareService.insertWorkShare(ws); }
	 * 
	 * 
	 * 
	 * return "redirect:sendListWS.ws"; }
	 */

	// 업무공유 작성 저장 (1)
		@RequestMapping("insert.ws")
		private ModelAndView sendWorkShare(MultipartHttpServletRequest multiRequest, HttpServletRequest request, String ws_status) throws Exception {

			ModelAndView mav = new ModelAndView("redirect:sendListWS.ws");
			
			// multiRequest에서 name이 uploadFile인 태그에 담긴 값 가져오기 = 첨부파일들
			List<MultipartFile> fileList = multiRequest.getFiles("uploadFile");
			System.out.println("fileList ? " + fileList.size());

			System.out.println("ws_status ? " + ws_status);
			
			WorkShare ws = new WorkShare();
			WSAttachment wsa = new WSAttachment();
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
