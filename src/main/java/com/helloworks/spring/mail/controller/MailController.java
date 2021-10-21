package com.helloworks.spring.mail.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.helloworks.spring.mail.model.service.MailService;
import com.helloworks.spring.mail.model.vo.Mail;

@Controller
public class MailController {
	@Autowired
	private MailService mailService;

	// 메일 작성페이지로
	@RequestMapping("compose.ml")
	public String composeMail() {
		System.out.println("메일 작성 페이지");
		return "mail/compose";
	}

	// 메일 보내기
	@RequestMapping("send.ml")
	public String sendMail(Mail m, HttpServletRequest request, Model model,
			@RequestParam(name = "uploadFile", required = false) MultipartFile file) {

		System.out.println(m);
		//System.out.println(file.getOriginalFilename());

//		// 전달될 파일이 없으면 빈 문자열로 넘어올 거고 아니면 파일이 있는것
//		if (!file.getOriginalFilename().equals("")) {
//			// 아래서 리턴해준 changeName 변수로 담음
//			String changeName = saveFile(file, request);
//
//			if (changeName != null) { // null이아닐떄 -> 에러없이 잘 업로드 되었을떄
//				// 잘 넣어주자
//				b.setOriginName(file.getOriginalFilename());
//				b.setChangeName(changeName);
//			}
//		}

//		mailService.sendMail(m); // 메일 vo넘기기
		return "redirect:inbox.ml";// 등록하면 리스트 화면으로 다시보이게

	}


	// 메일 읽기
	@RequestMapping("read.ml")
	public String readMail() {
		System.out.println("메일 읽기 페이지");
		return "mail/read";
	}

	// 받은 메일함
	@RequestMapping("inbox.ml")
	public String inboxMail() {
		System.out.println("받은 메일함 페이지");
		return "mail/inbox";
	}

	// 보낸 메일함
	@RequestMapping("sent.ml")
	public String sentMail() {
		System.out.println("보낸 메일함 페이지");
		return "mail/sent";
	}

	// 임시 메일함
	@RequestMapping("draft.ml")
	public String draftMail() {
		System.out.println("임시 메일함 페이지");
		return "mail/draft";
	}

	// 휴지통
	@RequestMapping("trash.ml")
	public String trashMail() {
		System.out.println("메일 휴지통 페이지");
		return "mail/trash";
	}
	
	// 즐겨찾기
	@RequestMapping("important.ml")
	public String favorite() {
		System.out.println("중요 메일함 페이지");
		return "mail/important";
	}

}
