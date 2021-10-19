package com.helloworks.spring.workshare.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.activation.CommandMap;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.helloworks.spring.workshare.model.service.WorkShareService;
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
	 * listMap = new HashMap<String, Object>(); listMap.put("wsa_empNo",
	 * ws.getWs_empno()); listMap.put("wsa_wsNo", ws.getWs_empno());
	 * listMap.put("wsa_origin", multipartFile.getOriginalFilename());
	 * listMap.put("wsa_change", changeName); listMap.put("wsa_size",
	 * multipartFile.getSize());
	 * 
	 * list.add(listMap); } } }
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
	 * wsa.setWsa_empNo(ws.getWs_empno()); wsa.setWsa_wsNo(ws.getWs_no());
	 * wsa.setWsa_origin(mpf.getOriginalFilename()); wsa.setWsa_change(changeName);
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
	 * if(changeName != null) { ws.setWsa_origin(file.getOriginalFilename());
	 * ws.setWsa_change(changeName); } } }
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
	private ModelAndView sendWorkShare(CommandMap commandMap, HttpServletRequest request, MultipartFile[] file) throws Exception {
		
		ModelAndView mav = new ModelAndView("redirect:sendListWS.ws");
		
		for(int i = 0; i < file.length; i++) {
			logger.debug("==================== file start ====================");
			logger.debug("파일 이름 : " + file[i].getName());
			logger.debug("파일 실제 이름 : " + file[i].getOriginalFilename());
			logger.debug("파일 크기 : " + file[i].getSize());
			logger.debug("content type : " + file[i].getContentType());
			logger.debug("==================== file end ====================");
		}
		
		workShareService.insertWorkShare(commandMap, file);
		
		return mav;
	}
	
	// 첨부파일 저장
	// 하나의 메소드를 두군데 이상 활용하기 - 재사용성
	private String saveFile(MultipartFile file, HttpServletRequest request) {

		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\workshare_files\\";

		System.out.println("savePath : " + savePath);

		String originName = file.getOriginalFilename();

		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		String ext = originName.substring(originName.lastIndexOf("."));

		String changeName = currentTime + ext;

		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return changeName;
	}
	
	public List<Map<String, Object>> parseFileInfo(Map<String, Object> map, MultipartFile[] file) throws Exception {
			
			List<Map<String, Object>> fileList = new ArrayList<Map<String, Object>>();
			
			for(int i = 0; i < file.length; i++) {
				
				String resources = request.getSession().getServletContext().getRealPath("resources");
				String savePath = resources + "\\workshare_files\\";

				System.out.println("savePath : " + savePath);

				String originName = file.getOriginalFilename();

				String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

				String ext = originName.substring(originName.lastIndexOf("."));

				String changeName = currentTime + ext;
				
			}
			
			
			
		
		
	}
}
