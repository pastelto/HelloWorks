package com.helloworks.spring.addressBook.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.helloworks.spring.addressBook.model.service.AddressBookService;
import com.helloworks.spring.addressBook.model.vo.OfficeAddressBook;
import com.helloworks.spring.addressBook.model.vo.PersonalAddressBook;
import com.helloworks.spring.common.Pagination;
import com.helloworks.spring.common.model.vo.PageInfo;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.offieceRoom.model.vo.SearchEmployee;

@Controller
public class AddressBookController {
	
	@Autowired
	private AddressBookService addressBookService;
	
	/* 주소록 */
	
	@RequestMapping("addressBookMain.adb")
	public String addressBookMain(HttpServletRequest request, Model model) {
		return "addressBook/addressBookMain";
	}
	
	@RequestMapping("officeAddressBook.adb")
	public String officeAddressBook(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage , HttpServletRequest request, Model model) {
		System.out.println("주소록 전환");
		
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo(); 
		
		// 공유 주소록 전환
		int listCount = addressBookService.selectListCount(loginEmpNo);
		
		System.out.println("공유 주소록 등록 인원: "+listCount);
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<OfficeAddressBook> officeAddresslist = addressBookService.selectOfficeAddressBook(loginEmpNo, pi);
		
		
		model.addAttribute("officeAddresslist", officeAddresslist);
		model.addAttribute("firstTab", "active");
		model.addAttribute("pi", pi);
		model.addAttribute("pageURL", "officeAddressBook.adb");
		
		
		return "addressBook/officeAddressBookMain";
	}
	
	
	@RequestMapping("addOfficeAddressBook.adb")
	public String addOfficeAddressBook(int addEmpNo, HttpServletRequest request, HttpSession session,  Model model) {
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo(); 
		
		// 본인은 주소록 등록 불가
		if(loginEmpNo == addEmpNo) {
			session.setAttribute("msg", "본인은 등록할 수 없습니다.");
			return "redirect:searchEmpMain.or";
		}
		
		OfficeAddressBook officeAddressBook = new OfficeAddressBook();
		
		officeAddressBook.setOabUserNo(loginEmpNo);
		officeAddressBook.setOabEnrollNo(addEmpNo);
		
		// 이미 주소록 등록된 직원인지 확인
		int result = addressBookService.searchEnrollCount(officeAddressBook);
		
		if( result > 0) {
			session.setAttribute("msg", "이미 등록된 직원입니다.");
			return "redirect:searchEmpMain.or";
		}else {
			Employee emp = addressBookService.searchEmployee(addEmpNo);
			
			System.out.println("추가할 직원 사번: "+ addEmpNo);
			System.out.println("로그인 직원 사번: "+ loginEmpNo);
			if(emp != null) {
				
				addressBookService.addOfficeAddressBook(officeAddressBook);
				session.setAttribute("msg", "주소록 추가 완료");
			}
			//model.addAttribute("addEmpNo", addEmpNo);
			return "redirect:officeAddressBook.adb";
		}
		
	}
	
	@RequestMapping("deleteOfficeAddressBook.adb")
	public String deleteOfficeAddressBook(int deleteEmpNo, HttpServletRequest request, HttpSession session ,Model model) {
		System.out.println("직원 삭제 컨트롤러");
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo(); 
		
		OfficeAddressBook officeAddressBook = new OfficeAddressBook();
		
		officeAddressBook.setOabUserNo(loginEmpNo);
		officeAddressBook.setOabEnrollNo(deleteEmpNo);
		
		addressBookService.deleteOfficeAddressBook(officeAddressBook);
		
		session.setAttribute("msg", "주소록 삭제 완료");
		return "redirect:officeAddressBook.adb";
	}
	
	@RequestMapping("searchOfficeAddressBookEmployee.adb")
	public String searchOfficeAddressBookEmployee(String optionType, String deptTypeOption, String searchEmployee, @RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage , HttpServletRequest request, Model model) {
		
		SearchEmployee se = new SearchEmployee();
		
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo();
		
		se.setLoginUserEmpNo(loginEmpNo);
		
		switch(optionType) {
		case "allType":
			se.setAllType(searchEmployee);
			break;
		case "deptType":
			se.setDeptType(searchEmployee);
			se.setDeptTypeOption(deptTypeOption);
			break;
		case "empNoType":
			se.setEmpNoType(searchEmployee);
			break;
		case "empNameType":
			se.setEmpNameType(searchEmployee);
			break;
		case "ePhoneType":
			se.setePhoneType(searchEmployee);
			break;
		case "emailType":
			se.setEmailType(searchEmployee);
			break;
		}
		
		int listCount = addressBookService.selectSearchOfficeAddressBookEmployeeListCount(se);
		
		System.out.println("주소록 검색 결과 총 등록 인원: "+listCount);
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Employee> officeAddresslist = addressBookService.searchOfficeAddressBookEmployee(se, pi);
		
		model.addAttribute("optionType", optionType);
		model.addAttribute("deptTypeOption", deptTypeOption);
		model.addAttribute("searchEmployee", searchEmployee);
		model.addAttribute("officeAddresslist", officeAddresslist);
		model.addAttribute("pi", pi);
		model.addAttribute("pageURL", "searchOfficeAddressBookEmployee.adb");
		return "addressBook/officeAddressBookMain";
	}
	
	@RequestMapping("deleteOfficeAddrressBookArr.adb")
	public String deleteOfficeAddrressBookArr(HttpServletRequest request, HttpSession session ,Model model ) {
		
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo();
		String checkList = request.getParameter("checkList");
		
		OfficeAddressBook officeAddressBook = new OfficeAddressBook();
		
		StringTokenizer token = new StringTokenizer(checkList, ",");
		
		while(token.hasMoreTokens()) {
			officeAddressBook.setOabUserNo(loginEmpNo);
			officeAddressBook.setOabEnrollNo(Integer.parseInt(token.nextToken()));
			addressBookService.deleteOfficeAddressBook(officeAddressBook);
		}
		
		session.setAttribute("msg", "주소록 삭제 완료");
		return "redirect:officeAddressBook.adb";
	}
	
	@RequestMapping("addOfficeAddressBookArr.adb")
	public String addOfficeAddressBookArr(HttpServletRequest request, HttpSession session ,Model model ) {
		
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo();
		String checkList = request.getParameter("checkList");
		
		OfficeAddressBook officeAddressBook = new OfficeAddressBook();
		
		StringTokenizer token = new StringTokenizer(checkList, ",");
		
		int userCase = 0;
		int enrollCase = 0;
		int successCase = 0;
		int allCase = token.countTokens();
		
		while(token.hasMoreTokens()) {
			
			int addEmpNo = Integer.parseInt(token.nextToken());
			
			if(addEmpNo==loginEmpNo) {
				userCase = 1;
			}else{
				officeAddressBook.setOabUserNo(loginEmpNo);
				officeAddressBook.setOabEnrollNo(addEmpNo);
				int result = addressBookService.searchEnrollCount(officeAddressBook);
				
				if( result > 0) {
					enrollCase += 1;
				}else {
					addressBookService.addOfficeAddressBook(officeAddressBook);
					successCase += 1;
				}
			}
		}
		
		if(successCase == 0) {
			session.setAttribute("msg", "이미 등록된 직원입니다.");
		}else if(userCase != 0 && enrollCase != 0) {
			session.setAttribute("msg", successCase+"명 주소록 추가 완료(*본인 및 중복인원 제외)");
		}else if(userCase != 0 && enrollCase == 0 && allCase == 1) {
			session.setAttribute("msg", "본인은 등록할 수 없습니다.");
		}else if(userCase != 0 && enrollCase == 0) {
			session.setAttribute("msg", successCase+"명 주소록 추가 완료(*본인 제외)");
		}else if(userCase == 0 && enrollCase != 0) {
			session.setAttribute("msg", successCase+"명 주소록 추가 완료(*중복 인원 제외)");
		}else {
			session.setAttribute("msg", "주소록 추가 완료");
		}
		System.out.println(token.countTokens());
		return "redirect:searchEmpMain.or";
	}
	
	
	@RequestMapping("popupOfficeAddressBook.adb")
	public String popupAddressBook(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage , HttpSession session,HttpServletRequest request, Model model) {
		System.out.println("공유 주소록 전환");
		
		HashMap<String, String> receiveListSession = (HashMap<String, String>) (request.getSession().getAttribute("receiveListSession"));
		HashMap<String, String> refListSession = (HashMap<String, String>) (request.getSession().getAttribute("refListSession"));
		
		System.out.println("new 세션값: "+receiveListSession);
		
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo(); 
		
		int listCount = addressBookService.selectListCount(loginEmpNo);
		
		System.out.println("공유 주소록 등록 인원: "+listCount);
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<OfficeAddressBook> officeAddresslist = addressBookService.selectOfficeAddressBook(loginEmpNo, pi);
		
		
		model.addAttribute("officeAddresslist", officeAddresslist);
		model.addAttribute("pi", pi);
		model.addAttribute("pageURL", "popupOfficeAddressBook.adb");
		model.addAttribute("addReceiveList", receiveListSession);
		model.addAttribute("addRefList", refListSession);
		return "addressBook/popupOfficeAddressBook";
	}
	
	@RequestMapping("popUpSearchOfficeAddressBookEmployee.adb")
	public String popUpSearchOfficeAddressBookEmployee(String optionType, String deptTypeOption, String searchEmployee, @RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage , HttpServletRequest request, Model model) {
		
		SearchEmployee se = new SearchEmployee();
		
		HashMap<String, String> receiveListSession = (HashMap<String, String>) (request.getSession().getAttribute("receiveListSession"));
		HashMap<String, String> refListSession = (HashMap<String, String>) (request.getSession().getAttribute("refListSession"));
		
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo();
		
		se.setLoginUserEmpNo(loginEmpNo);
		
		switch(optionType) {
		case "allType":
			se.setAllType(searchEmployee);
			break;
		case "deptType":
			se.setDeptType(searchEmployee);
			se.setDeptTypeOption(deptTypeOption);
			break;
		case "empNoType":
			se.setEmpNoType(searchEmployee);
			break;
		case "empNameType":
			se.setEmpNameType(searchEmployee);
			break;
		}
		
		int listCount = addressBookService.popUpSearchOfficeAddressBookEmployeeListCount(se);
		
		System.out.println("주소록 검색 결과 총 등록 인원: "+listCount);
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Employee> officeAddresslist = addressBookService.popUpSearchOfficeAddressBookEmployee(se, pi);
		
		model.addAttribute("optionType", optionType);
		model.addAttribute("deptTypeOption", deptTypeOption);
		model.addAttribute("searchEmployee", searchEmployee);
		model.addAttribute("officeAddresslist", officeAddresslist);
		model.addAttribute("pi", pi);
		model.addAttribute("pageURL", "popUpSearchOfficeAddressBookEmployee.adb");
		model.addAttribute("addReceiveList", receiveListSession);
		model.addAttribute("addRefList", refListSession);
		return "addressBook/popupOfficeAddressBook";
	}
	
	@RequestMapping("popupAddReceiveList.adb")
	public String popupAddReceiveList(HttpServletRequest request, HttpSession session, Model model) {
		
		// HashMap
		HashMap<String, String> originAddReceiveList = (HashMap<String, String>)(request.getSession().getAttribute("receiveListSession"));
		
		System.out.println("이전: "+(HashMap<String, String>)(request.getSession().getAttribute("receiveListSession")));
		session.removeAttribute("receiveListSession"); 
		System.out.println("이후: "+ (HashMap<String, String>)(request.getSession().getAttribute("receiveListSession")));
		
		HashMap<String, String> receiveList = new HashMap<String, String>();
		
		if(originAddReceiveList == null) {
			System.out.println("세션값 비었다.");
			String receiveListStr = request.getParameter("receiveList");
			System.out.println(receiveListStr);
			StringTokenizer tokenOrigin = new StringTokenizer(receiveListStr, ",");
			
			while(tokenOrigin.hasMoreTokens()) {
				
				StringTokenizer tokenOriginDiv = new StringTokenizer(tokenOrigin.nextToken(), " ");
				
				while(tokenOriginDiv.hasMoreTokens()) {
					receiveList.put(tokenOriginDiv.nextToken(), tokenOriginDiv.nextToken());
				}
				System.out.println("기존 session값: "+receiveList);
			}
			
			session.setAttribute("receiveListSession", receiveList);
		}else if (originAddReceiveList != null){
			System.out.println("세션값 있었다.");
			
			receiveList = originAddReceiveList;
			
			String receiveListStr = request.getParameter("receiveList");
			
			// 새로 받은 값 하나씩 분리
			StringTokenizer tokenNew = new StringTokenizer(receiveListStr, ",");
			
			while(tokenNew.hasMoreTokens()) {
				
				StringTokenizer tokenNewDiv = new StringTokenizer(tokenNew.nextToken(), " ");
				
				while(tokenNewDiv.hasMoreTokens()) {
					receiveList.put(tokenNewDiv.nextToken(), tokenNewDiv.nextToken());
				}
				System.out.println("새로 전달 받은 값 추가: "+receiveList);
			}
			
			System.out.println(receiveList);
			
			session.setAttribute("receiveListSession", receiveList);
		}
		
		System.out.println("신규: "+ (HashMap<String, String>)(request.getSession().getAttribute("receiveListSession")));
		
		System.out.println("넘어갔나요: "+receiveList);
		return "redirect:popupOfficeAddressBook.adb";
		
	}
	
	@RequestMapping("popupDelReceiveList.adb")
	public String popupDelReceiveList(HttpServletRequest request, HttpSession session, Model model) {
		
		HashMap<String, String> originAddReceiveList = (HashMap<String, String>)(request.getSession().getAttribute("receiveListSession"));
		
		HashMap<String, String> receiveList = new HashMap<String, String>();
		receiveList = originAddReceiveList;
		System.out.println("세션값: "+receiveList);
		// 지워야 할 값
		HashMap<String, String> delReceiveList = new HashMap<String, String>();
		
		String receiveListStr = request.getParameter("receiveList");
		
		System.out.println("del: "+receiveListStr);
		
		StringTokenizer tokenNew = new StringTokenizer(receiveListStr, ",");
		
		while(tokenNew.hasMoreTokens()) {
			
			StringTokenizer tokenNewDiv = new StringTokenizer(tokenNew.nextToken(), "=");
			
			while(tokenNewDiv.hasMoreTokens()) {
				delReceiveList.put(tokenNewDiv.nextToken(), tokenNewDiv.nextToken());
			}
		}
		
		// 기존 session의 key와 동일하면 remove하기
		
		Iterator<String> originKey = originAddReceiveList.keySet().iterator();
		System.out.println("originKey: "+originKey);
		ArrayList<String> delKey = new ArrayList<String>();
		while(originKey.hasNext()) {
			String keyOrigin = originKey.next();
			System.out.println("keyOrigin: "+keyOrigin);
			Iterator<String> newKey = delReceiveList.keySet().iterator();
			
			while(newKey.hasNext()) {
				
				String keyNew = newKey.next();
				System.out.println("keyOrigin: "+keyOrigin+" keyNew: "+keyNew);
				if(keyOrigin.equals(keyNew)) {
					System.out.println(keyOrigin);
					delKey.add(keyOrigin);
				}else {
					continue;
				}
				
			}
		}
		
		for(int i=0;i<delKey.size();i++) {
			receiveList.remove(delKey.get(i));
		}
		
		
		System.out.println("세션값 변경: "+receiveList);
		session.setAttribute("receiveListSession", receiveList);
		
		return "redirect:popupOfficeAddressBook.adb";
	}
	
	
	@RequestMapping("popupAddRefList.adb")
	public String popupAddRefList(HttpServletRequest request, HttpSession session, Model model) {
		
		// HashMap
		HashMap<String, String> originAddRefList = (HashMap<String, String>)(request.getSession().getAttribute("refListSession"));
		
		System.out.println("이전: "+(HashMap<String, String>)(request.getSession().getAttribute("refListSession")));
		session.removeAttribute("refListSession"); 
		System.out.println("이후: "+ (HashMap<String, String>)(request.getSession().getAttribute("refListSession")));
		
		HashMap<String, String> refList = new HashMap<String, String>();
		
		if(originAddRefList == null) {
			System.out.println("세션값 비었다.");
			String refListStr = request.getParameter("refList");
			System.out.println(refListStr);
			StringTokenizer tokenOrigin = new StringTokenizer(refListStr, ",");
			
			while(tokenOrigin.hasMoreTokens()) {
				
				StringTokenizer tokenOriginDiv = new StringTokenizer(tokenOrigin.nextToken(), " ");
				
				while(tokenOriginDiv.hasMoreTokens()) {
					refList.put(tokenOriginDiv.nextToken(), tokenOriginDiv.nextToken());
				}
				System.out.println("기존 session값: "+refList);
			}
			
			session.setAttribute("refListSession", refList);
		}else if (originAddRefList != null){
			System.out.println("세션값 있었다.");
			
			refList = originAddRefList;
			
			String refListStr = request.getParameter("refList");
			
			// 새로 받은 값 하나씩 분리
			StringTokenizer tokenNew = new StringTokenizer(refListStr, ",");
			
			while(tokenNew.hasMoreTokens()) {
				
				StringTokenizer tokenNewDiv = new StringTokenizer(tokenNew.nextToken(), " ");
				
				while(tokenNewDiv.hasMoreTokens()) {
					refList.put(tokenNewDiv.nextToken(), tokenNewDiv.nextToken());
				}
				System.out.println("새로 전달 받은 값 추가: "+refList);
			}
			
			System.out.println(refList);
			
			session.setAttribute("refListSession", refList);
		}
		
		System.out.println("신규: "+ (HashMap<String, String>)(request.getSession().getAttribute("refListSession")));
		
		System.out.println("넘어갔나요: "+refList);
		return "redirect:popupOfficeAddressBook.adb";
		
	}
	
	@RequestMapping("popupDelRefList.adb")
	public String popupDelRefList(HttpServletRequest request, HttpSession session, Model model) {
		
		HashMap<String, String> originAddRefList = (HashMap<String, String>)(request.getSession().getAttribute("refListSession"));
		
		HashMap<String, String> refList = new HashMap<String, String>();
		refList = originAddRefList;
		System.out.println("세션값: "+refList);
		// 지워야 할 값
		HashMap<String, String> delRefList = new HashMap<String, String>();
		
		String refListStr = request.getParameter("refList");
		
		System.out.println("del: "+refListStr);
		
		StringTokenizer tokenNew = new StringTokenizer(refListStr, ",");
		
		while(tokenNew.hasMoreTokens()) {
			
			StringTokenizer tokenNewDiv = new StringTokenizer(tokenNew.nextToken(), "=");
			
			while(tokenNewDiv.hasMoreTokens()) {
				delRefList.put(tokenNewDiv.nextToken(), tokenNewDiv.nextToken());
			}
		}
		
		// 기존 session의 key와 동일하면 remove하기
		
		Iterator<String> originKey = originAddRefList.keySet().iterator();
		System.out.println("originKey: "+originKey);
		ArrayList<String> delKey = new ArrayList<String>();
		while(originKey.hasNext()) {
			String keyOrigin = originKey.next();
			System.out.println("keyOrigin: "+keyOrigin);
			Iterator<String> newKey = delRefList.keySet().iterator();
			
			while(newKey.hasNext()) {
				
				String keyNew = newKey.next();
				System.out.println("keyOrigin: "+keyOrigin+" keyNew: "+keyNew);
				if(keyOrigin.equals(keyNew)) {
					System.out.println(keyOrigin);
					delKey.add(keyOrigin);
				}else {
					continue;
				}
				
			}
		}
		
		for(int i=0;i<delKey.size();i++) {
			refList.remove(delKey.get(i));
		}
		
		
		System.out.println("세션값 변경: "+refList);
		session.setAttribute("refListSession", refList);
		
		return "redirect:popupOfficeAddressBook.adb";
	}
	
	@RequestMapping("personalAddressBook.adb")
	public String personalAddressBook(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage , HttpServletRequest request, Model model) {
		
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo(); 
		
		// 개인 주소록 전환
		int listPerCount = addressBookService.selectListPerCount(loginEmpNo);
		
		System.out.println("사내 주소록 등록 인원: "+listPerCount);
		
		PageInfo piR = Pagination.getPageInfo(listPerCount, currentPage, 5, 10);
		
		ArrayList<PersonalAddressBook> personalAddresslist = addressBookService.selectPerAddressBook(loginEmpNo, piR);
		
		
		model.addAttribute("personalAddresslist", personalAddresslist);
		model.addAttribute("piR", piR);
		model.addAttribute("secondTab", "active");
		
		model.addAttribute("pagePerURL", "personalAddressBook.adb");
		
		return "addressBook/personalAddressBookMain";
	}
}
