package com.helloworks.spring.mail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.helloworks.spring.mail.model.service.MailService;

@Controller
public class MailController {
	@Autowired
	private MailService mailService;

	// 메일 쓰기
	@RequestMapping("compose.ml")
	public String composeMail() {
		System.out.println("메일 작성 페이지");
		return "mail/compose";
	}

	// 메일 읽기
	@RequestMapping("read.ml")
	public String readMail() {
		System.out.println("메일 읽기 페이지");
		return "mail/read";
	}

	// 받은 메일함
	@RequestMapping("mailbox.ml")
	public String inboxMail() {
		System.out.println("받은 메일함 페이지");
		return "mail/mailbox";
	}

//	// 보낸 메일함
//	@RequestMapping("mailbox.ml")
//	public String outboxMail() {
//		System.out.println("보낸 메일함 페이지");
//		return "mail/mailbox";
//	}
//
//	// 임시 메일함
//	@RequestMapping("mailbox.ml")
//	public String tempboxMail() {
//		System.out.println("임시 메일함 페이지");
//		return "mail/mailbox";
//	}
//
//	// 휴지통
//	@RequestMapping("mailbox.ml")
//	public String trashMail() {
//		System.out.println("메일 휴지통 페이지");
//		return "mail/mailbox";
//	}

}
