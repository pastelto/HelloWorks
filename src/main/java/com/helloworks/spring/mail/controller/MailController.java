package com.helloworks.spring.mail.controller;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.mail.model.service.MailService;
import com.helloworks.spring.mail.model.vo.Mail;
import com.helloworks.spring.mail.model.vo.MailAttachment;

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
	public String sendMail(Mail m, HttpServletRequest request, Model model, MultipartHttpServletRequest multiRequest) {

		System.out.println(m);

		List<MultipartFile> fileList = multiRequest.getFiles("uploadFile");
		System.out.println("메일 컨트롤러 파일리스트" + fileList);

		ArrayList<MailAttachment> mailAttachmentList = new ArrayList<MailAttachment>();
		mailService.sendMail(m); // 메일 vo넘기기
		try {
		// 첨부파일이 있으면 리스트로 값 추가하기
		if (fileList.get(0).getSize() != 0) {

			for (int i = 0; i < fileList.size(); i++) {
				MailAttachment mailAttach = new MailAttachment();
				String changeName;

					changeName = saveFile(fileList.get(i), request, i);


				System.out.println("==================== file start ====================");
				System.out.println("파일 이름 : " + changeName);
				System.out.println("파일 실제 이름 : " + fileList.get(i).getOriginalFilename());
				System.out.println("파일 크기 : " + fileList.get(i).getSize());
				System.out.println("content type : " + fileList.get(i).getContentType());
				System.out.println("==================== file end =====================");

				mailAttach.setMailNo(m.getMailNo());
				mailAttach.setMailAtOrg(fileList.get(i).getOriginalFilename());
				mailAttach.setMailAtChg(changeName);
				mailAttachmentList.add(mailAttach);
			}

			System.out.println("mailAttachmentList ? " + mailAttachmentList);
			mailService.insertMailAttach(mailAttachmentList);
		}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "redirect:inbox.ml";// 등록하면 리스트 화면으로 다시보이게

	}
	
	// 첨부파일 저장
	// 하나의 메소드를 두군데 이상 활용하기 - 재사용성
	private String saveFile(MultipartFile file, HttpServletRequest request, int num) throws Exception {

		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\mail_Attachment\\";

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

	// 메일 읽기
	@RequestMapping("read.ml")
	public String readMail(int mailNo, Model model, HttpServletRequest request) {
		System.out.println("메일 읽기 페이지");
		
		Employee myEmp = (Employee)request.getSession().getAttribute("loginUser");
		String empNo = String.valueOf(myEmp.getEmpNo()); // 로그인한 사번을 String형으로 변환
		
		Mail mail = new Mail(); // 업무공유 조회
		ArrayList<MailAttachment> mailAttachment = new ArrayList<>(); // 메일 첨부파일 조회
		// 업무공유 수신인 수신처리 후 값 (updateList)
		String uList = ""; 
		String[] rEach;
		
		// 수신인들 목록 가져오기
//		String[] mailRcvrList = null; 

		try {
			// 상세 조회
			mail = mailService.readMail(mailNo);
			System.out.println("readMail 상세 조회 [mailNo : " + mail.getMailNo() + " ] : " + mail);
			
//			// 수신인 조회
//			String recvEmp = mail.getMailRStatus();
//			System.out.println("recvEmp ? " + recvEmp);
//			mailRcvrList = recvEmp.split(",");
			
			// 수신여부에서 이미 읽음처리가 되어 있는지 확인
			String recvEmpList = mail.getMailRStatus();
			Boolean contain = contains(empNo, recvEmpList);
			
			// 수신처리가 안되어있으면 (contain == true 일 때)
			if(contain) {
			
			rEach = recvEmpList.split(",");
			System.out.println("rEach ? " + rEach);
			
			for(int i = 0; i < rEach.length; i++) {
				if( rEach[i].equals(empNo) ) {	
					rEach[i] = "0"; // 수신 상태에서 로그인한 사번값을 찾아 0으로 변환 -> 읽음 처리
				}
			
				uList += rEach[i] + ",";
			}
			// update시 여러개의 파라미터를 넘길 수 없음 -> HashMap을 사용하거나 Object를 사용해야함
			Mail newMail = new Mail();
			newMail.setMailNo(mailNo);
			newMail.setMailRStatus(uList);
			
			System.out.println("새로운 수신상태 값 uList ? " + uList);
			mailService.readStatusMail(newMail);
			mail = mailService.readMail(mailNo);
			System.out.println("수신 처리후 readMail 상세 조회 [mailNo : " + mail.getMailNo() + " ] : " + mail);
			}
			
			//첨부파일 상세조회
			mailNo = mail.getMailNo();
			System.out.println("mailNo 첨부파일 조회시 사용되는 메일번호 ? " + mailNo);
			mailAttachment = mailService.readMailAttachment(mailNo);
			System.out.println("mail : " + mail);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
		model.addAttribute("mailAttachment", mailAttachment);
		System.out.println("mailAttachment`````````````````````"  + mailAttachment);
		model.addAttribute("inbox", mail);
		
		return "mail/read";
	}
	
	// 포함여부 메소드
	private boolean contains(String empNo, String recvEmpList) {
		
		String[] rEach = recvEmpList.split(",");
		
		for(int i = 0; i < rEach.length; i++) {
			// 만약 목록에 로그인한 사번이 있으면 contains == true
			if( rEach[i].equals(empNo) ) {	
				return true;
			}
		}
		return false;
	}


	// 받은 메일함
	@RequestMapping("inbox.ml")
	public String inboxMailList(HttpServletRequest request, Model model) {
		System.out.println("받은 메일함 페이지");
		
		ArrayList<Mail> list = new ArrayList<>();
		Employee myEmp = (Employee)request.getSession().getAttribute("loginUser");
		list = mailService.inboxMailList(myEmp);		
		model.addAttribute("list", list);
		
		return "mail/inbox";
	}

	// 보낸 메일함
	@RequestMapping("sent.ml")
	public String sentMailList(HttpServletRequest request, Model model) {
		System.out.println("보낸 메일함 페이지");
		Mail mail = new Mail();
		
		ArrayList<Mail> list = new ArrayList<>();
		ArrayList<Mail> mList = new ArrayList<>();
		ArrayList<ArrayList<Mail>> newList = new ArrayList<ArrayList<Mail>>();
		
		
		Employee myEmp = (Employee)request.getSession().getAttribute("loginUser");
		
		String empNo = String.valueOf(myEmp.getEmpNo());
		
		mail.setMailNo(myEmp.getEmpNo());
		mail.setMailRcvrDept(myEmp.getDeptCode());
		
		mList = mailService.getMail(mail);
		
		String[] rcvrList;
		
		
		for(int i = 0; i<mList.size(); i++) {
			
			String rcvr = mList.get(i).getMailRcvr();
			rcvrList = rcvr.split(",");
			
			Boolean contain = contains(empNo, rcvr);
			
			if(contain) {
				for(int j =0; j<rcvrList.length; j++) {
					int eNo = Integer.parseInt(rcvrList[j]);
					mail.setMailNo(eNo);
					mail.setMailSndr(myEmp.getEmpNo());
					list = mailService.sentMailList(mail);
					newList.add(list);
				}
				
			}
		}
		
		
//		list = mailService.sentMailList(myEmp);		
//		//System.out.println("list---------------"+ list);
//		
//		// 수신인 조회
//		String recvEmp = list.getWs_recv();
//		System.out.println("recvEmp ? " + recvEmp);
//		wsRecvList = recvEmp.split(",");
//		
//		// 수신인들을 이름으로 가져오기!
//		for(int i = 0; i < wsRecvList.length; i++) {
//			int recvEmpNo = Integer.parseInt(wsRecvList[i]);
//			
//			wsRecvEmpName.add(workShareService.selectRecvEmpName(recvEmpNo));
//		}
//		System.out.println("wsRecvEmpName ? " + wsRecvEmpName);
//		
//  		// 참조인 조회
//		String refEmp = ws.getWs_ref();
//		System.out.println("refEmp ? " + refEmp);
//		wsRefList = refEmp.split(",");
//		
//		// 참조인들을 이름으로 가져오기!
//		for(int i = 0; i < wsRefList.length; i++) {
//			int refEmpNo = Integer.parseInt(wsRefList[i]);
//			
//			wsRefEmpName.add(workShareService.selectRecvEmpName(refEmpNo));
//		}
		System.out.println("newList0000000000000000000" + newList);
		model.addAttribute("newList", newList);
		
		model.addAttribute("mList", mList);
		
		return "mail/sent";
	}

	// 임시 메일함
	@RequestMapping("draft.ml")
	public String draftMailList(HttpServletRequest request, Model model) {
		System.out.println("임시 메일함 페이지");
		
		ArrayList<Mail> list = new ArrayList<>();
		Employee myEmp = (Employee)request.getSession().getAttribute("loginUser");
		list = mailService.draftMailList(myEmp);		
		System.out.println("draftMailList---------------"+ list);
		model.addAttribute("list", list);
		


		
		return "mail/draft";
	}

	// 휴지통
	@RequestMapping("trash.ml")
	public String trashMailList(HttpServletRequest request, Model model) {
		System.out.println("메일 휴지통 페이지");
		
		ArrayList<Mail> list = new ArrayList<>();
		Employee myEmp = (Employee)request.getSession().getAttribute("loginUser");
		list = mailService.trashMailList(myEmp);		
		//System.out.println("trashMailList---------------"+ list);
		model.addAttribute("list", list);
		
		return "mail/trash";
	}

}
