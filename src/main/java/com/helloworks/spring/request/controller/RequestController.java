package com.helloworks.spring.request.controller;

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

import com.helloworks.spring.common.exception.CommException;
import com.helloworks.spring.request.model.service.RequestService;
import com.helloworks.spring.request.model.vo.RequestEq;
import com.helloworks.spring.request.model.vo.RequestId;

@Controller
public class RequestController {

	@Autowired
	private RequestService requestService;

	// 신청 메뉴 페이지 전환
	@RequestMapping("request.menu")
	public String requestMenu() {
		//System.out.println("신청메뉴페이지");
		return "request/menu";
	}

	// 비품 신청
	@RequestMapping("request.eq")
	public String requestEquipment(RequestEq rEq) {
		//System.out.println(rEq);
		requestService.requestEquipment(rEq);
		return "request/menu";
	}
	
	// 사원증 신청
	@RequestMapping("request.id")
	public String requestIdCard(RequestId rId, HttpServletRequest request, @RequestParam(name="orgPicName", required=true) MultipartFile file) {
		System.out.println(rId);
		System.out.println(file);
		// 첨부파일 등록 		
		if(!file.getOriginalFilename().equals("")) {
			String chgPic = saveFile(file, request);
			System.out.println("requestIdCard : " + chgPic);
			if(chgPic!=null) {
					rId.setOrgPic(file.getOriginalFilename());
					rId.setChgPic(chgPic);
					requestService.requestIdCard(rId);
				}
			}		
		return "request/menu";
	}
	
	// 파일 저장
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\upload_files\\"; //저장경로
		
		System.out.println("savePath : "+ savePath);		
		String orgPic = file.getOriginalFilename(); //원본파일명		
		String cuurentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); //시간		
		String ext = orgPic.substring(orgPic.lastIndexOf("."));		
		String chgPic = cuurentTime + ext;
			try {
				file.transferTo(new File(savePath + chgPic));
			} catch (IllegalStateException e ) {
				chgPic="";
				e.printStackTrace();
				throw new CommException("사진파일 등록 실패");
			} catch (IOException e) {
				chgPic="";
				e.printStackTrace();
				throw new CommException("사진파일 등록 실패");
			}		
		return chgPic;
	}	
}
