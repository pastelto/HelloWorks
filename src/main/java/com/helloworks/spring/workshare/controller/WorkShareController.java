package com.helloworks.spring.workshare.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.helloworks.spring.workshare.model.service.WorkShareService;
import com.helloworks.spring.workshare.model.vo.WSAttachment;
import com.helloworks.spring.workshare.model.vo.WorkShare;

@Controller
public class WorkShareController {

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
	@RequestMapping("insert.ws")
	public String sendWorkShare(WorkShare ws, @RequestParam(name="uploadFile", required=false) MultipartHttpServletRequest request, Model model, 
			  					@RequestParam(name="uploadFile", required=false) MultipartFile file) {
		
			try {
				
				System.out.println("업무공유 작성 저장중");
				
				List<MultipartFile> fileList = request.getFiles("file");
				System.out.println("fileList : " + fileList);
				List<WSAttachment> wsAttach = new ArrayList<>();
				
				// workShareService.insertWorkShare(ws);
				
				// 첨부파일이 있다면, 
				if(fileList.size() > 0) {
					
					for(MultipartFile mpf : fileList) {
						System.out.println("file 이름 : " + mpf.getOriginalFilename()); 
						
						if(!file.getOriginalFilename().equals("")) { 
							
							String changeName = saveFile(file, request);
							
							if(changeName != null) { 
								WSAttachment wsa = new WSAttachment();
								
								wsa.setWsa_empNo(ws.getWs_empno());
								wsa.setWsa_wsNo(ws.getWs_no());
								wsa.setWsa_origin(file.getOriginalFilename());
								wsa.setWsa_change(changeName);
								wsa.setWsa_size(mpf.getSize());

								wsAttach.add(wsa);
								
								} 
							} 
						}
					}
				
				System.out.println("ws ? " + ws);
				System.out.println("wsAttach" + wsAttach);
				workShareService.insertWorkShare(ws, wsAttach);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		/*
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
		 */		

		
		return "redirect:sendListWS.ws";
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
}
