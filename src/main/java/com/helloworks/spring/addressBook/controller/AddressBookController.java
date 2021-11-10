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

import com.helloworks.spring.addressBook.model.service.AddressBookService;
import com.helloworks.spring.addressBook.model.vo.OfficeAddressBook;
import com.helloworks.spring.addressBook.model.vo.PersonalAddressBook;
import com.helloworks.spring.addressBook.model.vo.SearchPerson;
import com.helloworks.spring.common.Pagination;
import com.helloworks.spring.common.model.vo.PageInfo;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.offieceRoom.model.vo.SearchEmployee;

@Controller
public class AddressBookController {
	
	@Autowired
	private AddressBookService addressBookService;
	
	/* 주소록 */
	
	@RequestMapping("officeAddressBook.adb")
	public String officeAddressBook(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage , HttpServletRequest request, Model model) {
		
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo(); 
		
		// 공유 주소록 전환
		int listCount = addressBookService.selectListCount(loginEmpNo);
		
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<OfficeAddressBook> officeAddresslist = addressBookService.selectOfficeAddressBook(loginEmpNo, pi);
		
		
		model.addAttribute("officeAddresslist", officeAddresslist);
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
		
		int pageLimit = 5;
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
		
		return "redirect:searchEmpMain.or";
	}
	
	
	@RequestMapping("popupOfficeAddressBook.adb")
	public String popupAddressBook(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage , HttpSession session,HttpServletRequest request, Model model) {
		System.out.println("공유 주소록 전환");
		
		HashMap<String, String> receiveListSession = (HashMap<String, String>) (request.getSession().getAttribute("receiveListSession"));
		HashMap<String, String> refListSession = (HashMap<String, String>) (request.getSession().getAttribute("refListSession"));
		
		
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo(); 
		
		int listCount = addressBookService.selectListCount(loginEmpNo);
		
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
		
		session.removeAttribute("receiveListSession"); 
		
		HashMap<String, String> receiveList = new HashMap<String, String>();
		
		if(originAddReceiveList == null) {
			
			String receiveListStr = request.getParameter("receiveList");
			
			StringTokenizer tokenOrigin = new StringTokenizer(receiveListStr, ",");
			
			while(tokenOrigin.hasMoreTokens()) {
				
				StringTokenizer tokenOriginDiv = new StringTokenizer(tokenOrigin.nextToken(), " ");
				
				while(tokenOriginDiv.hasMoreTokens()) {
					receiveList.put(tokenOriginDiv.nextToken(), tokenOriginDiv.nextToken());
				}
			}
			
			session.setAttribute("receiveListSession", receiveList);
		}else if (originAddReceiveList != null){
			
			receiveList = originAddReceiveList;
			
			String receiveListStr = request.getParameter("receiveList");
			
			// 새로 받은 값 하나씩 분리
			StringTokenizer tokenNew = new StringTokenizer(receiveListStr, ",");
			
			while(tokenNew.hasMoreTokens()) {
				
				StringTokenizer tokenNewDiv = new StringTokenizer(tokenNew.nextToken(), " ");
				
				while(tokenNewDiv.hasMoreTokens()) {
					receiveList.put(tokenNewDiv.nextToken(), tokenNewDiv.nextToken());
				}
			}
			
			System.out.println(receiveList);
			
			session.setAttribute("receiveListSession", receiveList);
		}
		
		
		return "redirect:popupOfficeAddressBook.adb";
		
	}
	
	@RequestMapping("popupDelReceiveList.adb")
	public String popupDelReceiveList(HttpServletRequest request, HttpSession session, Model model) {
		
		HashMap<String, String> originAddReceiveList = (HashMap<String, String>)(request.getSession().getAttribute("receiveListSession"));
		
		HashMap<String, String> receiveList = new HashMap<String, String>();
		
		receiveList = originAddReceiveList;
		
		// 지워야 할 값
		HashMap<String, String> delReceiveList = new HashMap<String, String>();
		
		String receiveListStr = request.getParameter("receiveList");
		
		StringTokenizer tokenNew = new StringTokenizer(receiveListStr, ",");
		
		while(tokenNew.hasMoreTokens()) {
			
			StringTokenizer tokenNewDiv = new StringTokenizer(tokenNew.nextToken(), "=");
			
			while(tokenNewDiv.hasMoreTokens()) {
				delReceiveList.put(tokenNewDiv.nextToken(), tokenNewDiv.nextToken());
			}
		}
		
		// 기존 session의 key와 동일하면 remove하기
		
		Iterator<String> originKey = originAddReceiveList.keySet().iterator();
		
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
		
		
		session.setAttribute("receiveListSession", receiveList);
		
		return "redirect:popupOfficeAddressBook.adb";
	}
	
	
	@RequestMapping("popupAddRefList.adb")
	public String popupAddRefList(HttpServletRequest request, HttpSession session, Model model) {
		
		// HashMap
		HashMap<String, String> originAddRefList = (HashMap<String, String>)(request.getSession().getAttribute("refListSession"));
		
		session.removeAttribute("refListSession"); 
		
		HashMap<String, String> refList = new HashMap<String, String>();
		
		if(originAddRefList == null) {
			
			String refListStr = request.getParameter("refList");
			
			StringTokenizer tokenOrigin = new StringTokenizer(refListStr, ",");
			
			while(tokenOrigin.hasMoreTokens()) {
				
				StringTokenizer tokenOriginDiv = new StringTokenizer(tokenOrigin.nextToken(), " ");
				
				while(tokenOriginDiv.hasMoreTokens()) {
					refList.put(tokenOriginDiv.nextToken(), tokenOriginDiv.nextToken());
				}
			}
			
			session.setAttribute("refListSession", refList);
		}else if (originAddRefList != null){
			
			refList = originAddRefList;
			
			String refListStr = request.getParameter("refList");
			
			// 새로 받은 값 하나씩 분리
			StringTokenizer tokenNew = new StringTokenizer(refListStr, ",");
			
			while(tokenNew.hasMoreTokens()) {
				
				StringTokenizer tokenNewDiv = new StringTokenizer(tokenNew.nextToken(), " ");
				
				while(tokenNewDiv.hasMoreTokens()) {
					refList.put(tokenNewDiv.nextToken(), tokenNewDiv.nextToken());
				}
			}
			
			session.setAttribute("refListSession", refList);
		}
		
		return "redirect:popupOfficeAddressBook.adb";
		
	}
	
	@RequestMapping("popupDelRefList.adb")
	public String popupDelRefList(HttpServletRequest request, HttpSession session, Model model) {
		
		HashMap<String, String> originAddRefList = (HashMap<String, String>)(request.getSession().getAttribute("refListSession"));
		
		HashMap<String, String> refList = new HashMap<String, String>();
		
		refList = originAddRefList;
		
		// 지워야 할 값
		HashMap<String, String> delRefList = new HashMap<String, String>();
		
		String refListStr = request.getParameter("refList");
		
		StringTokenizer tokenNew = new StringTokenizer(refListStr, ",");
		
		while(tokenNew.hasMoreTokens()) {
			
			StringTokenizer tokenNewDiv = new StringTokenizer(tokenNew.nextToken(), "=");
			
			while(tokenNewDiv.hasMoreTokens()) {
				delRefList.put(tokenNewDiv.nextToken(), tokenNewDiv.nextToken());
			}
		}
		
		// 기존 session의 key와 동일하면 remove하기
		
		Iterator<String> originKey = originAddRefList.keySet().iterator();
		
		ArrayList<String> delKey = new ArrayList<String>();
		while(originKey.hasNext()) {
			
			String keyOrigin = originKey.next();
			
			Iterator<String> newKey = delRefList.keySet().iterator();
			
			while(newKey.hasNext()) {
				
				String keyNew = newKey.next();
				
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
		
		session.setAttribute("refListSession", refList);
		
		return "redirect:popupOfficeAddressBook.adb";
	}
	
	@RequestMapping("personalAddressBook.adb")
	public String personalAddressBook(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage , HttpServletRequest request, Model model) {
		
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo(); 
		
		// 개인 주소록 전환
		int listPerCount = addressBookService.selectListPerCount(loginEmpNo);
		
		
		PageInfo piR = Pagination.getPageInfo(listPerCount, currentPage, 5, 10);
		
		ArrayList<PersonalAddressBook> personalAddresslist = addressBookService.selectPerAddressBook(loginEmpNo, piR);
		
		
		model.addAttribute("personalAddresslist", personalAddresslist);
		model.addAttribute("piR", piR);
		
		model.addAttribute("pageURL", "personalAddressBook.adb");
		
		return "addressBook/personalAddressBookMain";
	}
	
	@RequestMapping("insertPersonalAddress.adb")
	public String addPersonalAddress(PersonalAddressBook personalAddressBook, HttpServletRequest request) {
		
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo();
		
		
		personalAddressBook.setPabUserNo(loginEmpNo);
		
		addressBookService.insertPersonalAddress(personalAddressBook);
		
		return "redirect:personalAddressBook.adb";
	}
	
	@RequestMapping("deletePerson.adb")
	public String deletePerson(int pabNo, HttpServletRequest request, HttpSession session) {
		
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo(); 
		
		PersonalAddressBook personalAddressBook = new PersonalAddressBook();
		
		personalAddressBook.setPabUserNo(loginEmpNo);
		personalAddressBook.setPabNo(pabNo);
		
		addressBookService.deletePerosonAddressBook(personalAddressBook);
		
		session.setAttribute("msg", "외부 주소록 삭제 완료");
		
		
		return "redirect:personalAddressBook.adb";
	}
	
	@RequestMapping("deletePerAddrressBookArr.adb")
	public String deletePerAddrressBookArr(HttpServletRequest request, HttpSession session) {
		
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo();
		String checkList = request.getParameter("checkList");
		
		PersonalAddressBook personalAddressBook = new PersonalAddressBook();
		
		StringTokenizer token = new StringTokenizer(checkList, ",");
		
		while(token.hasMoreTokens()) {
			personalAddressBook.setPabUserNo(loginEmpNo);
			personalAddressBook.setPabNo(Integer.parseInt(token.nextToken()));
			addressBookService.deletePerosonAddressBook(personalAddressBook);
		}
		
		session.setAttribute("msg", "외부 주소록 삭제 완료");
		
		
		return "redirect:personalAddressBook.adb";
	}
	
	@RequestMapping("searcPerAddressBookEmployee.adb")
	public String searcPerAddressBookEmployee(String optionTypePer, String searchPerson, @RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage , HttpServletRequest request, Model model) {
		
		SearchPerson sp = new SearchPerson();
		
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo();
		
		sp.setLoginUserEmpNo(loginEmpNo);
		
		switch(optionTypePer) {
		case "allPabType":
			sp.setAllPabType(searchPerson);
			break;
		case "pabNameType":
			sp.setPabNameType(searchPerson);
			break;
		case "empNameType":
			sp.setEmpNameType(searchPerson);
			break;
		case "ePhoneType":
			sp.setEPhoneType(searchPerson);
			break;
		case "emailType":
			sp.setEmailType(searchPerson);
			break;
		}
		
		int listCount = addressBookService.selectSearchPersonalAddressBookListCount(sp);
		
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo piR = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<PersonalAddressBook> personalAddresslist = addressBookService.searchPersonalAddressBook(sp, piR);
		
		model.addAttribute("optionTypePer", optionTypePer);
		model.addAttribute("searchPerson", searchPerson);
		model.addAttribute("personalAddresslist", personalAddresslist);
		model.addAttribute("piR", piR);
		model.addAttribute("pageURL", "searcPerAddressBookEmployee.adb");
		
		return "addressBook/personalAddressBookMain";
	}
}
