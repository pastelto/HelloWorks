package com.helloworks.spring.mail.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public String sendMail(Mail m, HttpServletRequest request, Model model, MultipartHttpServletRequest multiRequest,
			HttpSession session) {
		m.setMailRcvr((String) multiRequest.getParameter("drReceiverList"));
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

			String rcvrList = m.getMailRcvr();
			// 수신인 사번
			String[] rcvrNo = rcvrList.split(",");

			for (int i = 0; i < rcvrNo.length; i++) {
				// 사번 하나하나 숫자로바꾸기
				int rEmpNo = Integer.parseInt(rcvrNo[i]);
				Employee empInfo = mailService.getEmpInfo(rEmpNo);
				Mail mailInfo = new Mail();// 메일수신자 정보를 저장할 메일객체 생성
				mailInfo.setMailNo(m.getMailNo()); // 메일번호
				mailInfo.setMailRcvrName(empInfo.getEmpName()); // 메일수신인이름
				mailInfo.setMailRcvrDept(empInfo.getDeptDname());// 메일수신인부서
				mailInfo.setMailRcvrJobName(empInfo.getJobName());// 메일수신인직급
				// 센더지만 수신인 사번넣기위함
				mailInfo.setMailSndr(empInfo.getEmpNo());// 메일수신인사번
				mailService.insertMailRcvrInfo(mailInfo);// 메일 수신인 정보 입력
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.removeAttribute("receiveListSession");
		return "redirect:inbox.ml";// 등록하면 리스트 화면으로 다시보이게

	}

	// 첨부파일 저장
	// 하나의 메소드를 두군데 이상 활용하기 - 재사용성
	private String saveFile(MultipartFile file, HttpServletRequest request, int num) throws Exception {

		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\mail_Attachment\\";

		// System.out.println("savePath : " + savePath);
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

	// 메일 읽기-메일상세조회
	@RequestMapping("read.ml")
	public String readMail(int mailNo, Model model, HttpServletRequest request) {
		System.out.println("메일 읽기 페이지");

		Employee myEmp = (Employee) request.getSession().getAttribute("loginUser");
		String empNo = String.valueOf(myEmp.getEmpNo()); // 로그인한 사번을 String형으로 변환

		Mail mail = new Mail();
		ArrayList<MailAttachment> mailAttachment = new ArrayList<>(); // 메일 첨부파일 조회
		// 업무공유 수신인 수신처리 후 값 (updateList)
		String uList = "";
		String[] rEach;

		// 수신인들 목록 가져오기
		String[] mailRcvrList = null;

		try {
			// 상세 조회
			mail = mailService.readMail(mailNo);
			System.out.println("readMail 상세 조회 [mailNo : " + mail.getMailNo() + " ] : " + mail);

			// 수신인 조회
			String recvEmp = mail.getMailRStatus();
			System.out.println("recvEmp ? " + recvEmp);
			mailRcvrList = recvEmp.split(",");

			// 수신여부에서 이미 읽음처리가 되어 있는지 확인
			String recvEmpList = mail.getMailRStatus();
			Boolean contain = contains(empNo, recvEmpList);

			// 수신처리가 안되어있으면 (contain == true 일 때)
			if (contain) {

				rEach = recvEmpList.split(",");
				System.out.println("rEach ? " + rEach);

				for (int i = 0; i < rEach.length; i++) {
					if (rEach[i].equals(empNo)) {
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

			// 첨부파일 상세조회
			mailNo = mail.getMailNo();
			System.out.println("mailNo 첨부파일 조회시 사용되는 메일번호 ? " + mailNo);
			mailAttachment = mailService.readMailAttachment(mailNo);
			System.out.println("mail : " + mail);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		model.addAttribute("mailAttachment", mailAttachment);
		model.addAttribute("inbox", mail);

		return "mail/read";
	}

	// 포함여부 메소드
	private boolean contains(String empNo, String recvEmpList) {

		String[] rEach = recvEmpList.split(",");

		for (int i = 0; i < rEach.length; i++) {
			// 만약 목록에 로그인한 사번이 있으면 contains == true
			if (rEach[i].equals(empNo)) {
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
		Employee myEmp = (Employee) request.getSession().getAttribute("loginUser");
		list = mailService.inboxMailList(myEmp);
		model.addAttribute("list", list);

		return "mail/inbox";
	}

	// 보낸 메일함
	@RequestMapping("sent.ml")
	public String sentMailList(HttpServletRequest request, Model model) {
		System.out.println("보낸 메일함 페이지");
		// 메일리스트
		ArrayList<Mail> sentMailList = new ArrayList<Mail>();
		// 수신자정보리스트
		ArrayList<Mail> rcvrList = new ArrayList<Mail>();

		// 메일리스트 조회
		int myEmp = ((Employee) request.getSession().getAttribute("loginUser")).getEmpNo();
		sentMailList = mailService.sentMailList(myEmp);

		// sentMailList.get(0).getMailRcvr(); // 수신자사번,수신자사번,수신자사번

		// 수신자정보리스트조회
		for (int i = 0; i < sentMailList.size(); i++) {
			// rcvrList.add(mailService.getRcvrInfo(sentMailList.get(i).getMailNo()));

			int mailNo = sentMailList.get(i).getMailNo();
			String recvList = sentMailList.get(i).getMailRcvr();
			String[] recv = recvList.split(",");
			System.out.println("보낸 메일함 페이지=====recvList: " + recvList);
			System.out.println("보낸 메일함 페이지=====recv: " + Arrays.toString(recv));

			for (int j = 0; j < recv.length; j++) {

				int recvEmpNo = Integer.parseInt(recv[j]); // 202100001, 202100002, 202100003
				Mail rEmp = new Mail();
				rEmp.setMailRcvrNo(recvEmpNo);
				rEmp.setMailNo(mailNo);
				Mail emp = mailService.getRcvrInfo(rEmp);
				rcvrList.add(j, emp);

			}

		}

		model.addAttribute("sentMailList", sentMailList);
		model.addAttribute("rcvrList", rcvrList);

		return "mail/sent";
	}

	// 임시 메일함
	@RequestMapping("draft.ml")
	public String draftMailList(HttpServletRequest request, Model model) {
		System.out.println("임시 메일함 페이지");

		// 메일리스트
		ArrayList<Mail> draftMailList = new ArrayList<Mail>();
		// 수신자정보리스트
		ArrayList<Mail> rcvrList = new ArrayList<Mail>();

		// 메일리스트 조회
		int myEmp = ((Employee) request.getSession().getAttribute("loginUser")).getEmpNo();

		draftMailList = mailService.draftMailList(myEmp);

		// 수신자정보리스트조회
		for (int i = 0; i < draftMailList.size(); i++) {

			int mailNo = draftMailList.get(i).getMailNo();
			String recvList = draftMailList.get(i).getMailRcvr();
			String[] recv = recvList.split(",");

			for (int j = 0; j < recv.length; j++) {

				int recvEmpNo = Integer.parseInt(recv[j]); // 202100001, 202100002, 202100003
				Mail rEmp = new Mail();
				rEmp.setMailRcvrNo(recvEmpNo);
				rEmp.setMailNo(mailNo);
				Mail emp = mailService.getRcvrInfo(rEmp);
				rcvrList.add(j, emp);

			}

		}

		model.addAttribute("draftMailList", draftMailList);
		model.addAttribute("rcvrList", rcvrList);

		return "mail/draft";
	}

	// 임시보관메일 읽기-메일상세조회
	@RequestMapping("dCompose.ml")
	public String draftComposeMail(int mailNo, Model model, HttpServletRequest request) {
		System.out.println("draftComposeMail 페이지");

		// Employee myEmp = (Employee) request.getSession().getAttribute("loginUser");

		Mail mail = new Mail();
		ArrayList<MailAttachment> mailAttachment = new ArrayList<>(); // 메일 첨부파일 조회

		// 상세 조회
		mail = mailService.readMail(mailNo);
		System.out.println("draftComposeMail 상세 조회 [mailNo : " + mail.getMailNo() + " ] : " + mail);

		// 첨부파일 상세조회
		mailNo = mail.getMailNo();
		System.out.println("mailNo 첨부파일 조회시 사용되는 메일번호 ? " + mailNo);
		mailAttachment = mailService.readMailAttachment(mailNo);
		System.out.println("mail : " + mail);

		// 메일리스트
		ArrayList<Mail> draftMailList = new ArrayList<Mail>();
		// 수신자정보리스트
		ArrayList<Mail> rcvrList = new ArrayList<Mail>();

		// 메일리스트 조회
		int myEmp = ((Employee) request.getSession().getAttribute("loginUser")).getEmpNo();

		draftMailList = mailService.draftMailList(myEmp);

		// 수신자정보리스트조회
		for (int i = 0; i < draftMailList.size(); i++) {

			mailNo = draftMailList.get(i).getMailNo();
			String recvList = draftMailList.get(i).getMailRcvr();
			String[] recv = recvList.split(",");

			for (int j = 0; j < recv.length; j++) {

				int recvEmpNo = Integer.parseInt(recv[j]); // 202100001, 202100002, 202100003
				Mail rEmp = new Mail();
				rEmp.setMailRcvrNo(recvEmpNo);
				rEmp.setMailNo(mailNo);
				Mail emp = mailService.getRcvrInfo(rEmp);
				rcvrList.add(j, emp);

			}

		}

		model.addAttribute("draftMailList", draftMailList);
		model.addAttribute("rcvrList", rcvrList);
		model.addAttribute("mailAttachment", mailAttachment);
		model.addAttribute("draftMail", mail);

		return "mail/draftCompose";
	}

	// 임시 보관 메일 보내기
	@RequestMapping("dsend.ml")
	public String dsendMail(Mail m, HttpServletRequest request, Model model, MultipartHttpServletRequest multiRequest,
			HttpSession session) {
		m.setMailRcvr((String) multiRequest.getParameter("drReceiverList"));
		System.out.println(m);

		List<MultipartFile> fileList = multiRequest.getFiles("uploadFile");
		System.out.println("메일 컨트롤러 파일리스트" + fileList);

		ArrayList<MailAttachment> mailAttachmentList = new ArrayList<MailAttachment>();
		mailService.dsendMail(m); // 메일 vo넘기기
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
				mailService.insertDMailAttach(mailAttachmentList);

			}

			String rcvrList = m.getMailRcvr();
			// 수신인 사번
			String[] rcvrNo = rcvrList.split(",");

			for (int i = 0; i < rcvrNo.length; i++) {
				// 사번 하나하나 숫자로바꾸기
				int rEmpNo = Integer.parseInt(rcvrNo[i]);
				Employee empInfo = mailService.getEmpInfo(rEmpNo);
				Mail mailInfo = new Mail();// 메일수신자 정보를 저장할 메일객체 생성
				mailInfo.setMailNo(m.getMailNo()); // 메일번호
				mailInfo.setMailRcvrName(empInfo.getEmpName()); // 메일수신인이름
				mailInfo.setMailRcvrDept(empInfo.getDeptDname());// 메일수신인부서
				mailInfo.setMailRcvrJobName(empInfo.getJobName());// 메일수신인직급
				// 센더지만 수신인 사번넣기위함
				mailInfo.setMailSndr(empInfo.getEmpNo());// 메일수신인사번
				mailService.insertMailRcvrInfo(mailInfo);// 메일 수신인 정보 입력
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.removeAttribute("receiveListSession");
		return "redirect:inbox.ml";// 등록하면 리스트 화면으로 다시보이게

	}

	// 삭제하기
	@RequestMapping("del.ml")
	public String delMail(HttpServletRequest request, int mailNo) {	
		int myEmp = ((Employee) request.getSession().getAttribute("loginUser")).getEmpNo();
		mailService.delMail(mailNo);
		return "mail/inbox";
	}
	// 휴지통
	@RequestMapping("trash.ml")
	public String trashMailList(HttpServletRequest request, Model model) {
		System.out.println("메일 휴지통 페이지");

//		ArrayList<Mail> list = new ArrayList<>();
//		Employee myEmp = (Employee) request.getSession().getAttribute("loginUser");
//		list = mailService.trashMailList(myEmp);
//		model.addAttribute("list", list);

		return "mail/trash";
	}

}
