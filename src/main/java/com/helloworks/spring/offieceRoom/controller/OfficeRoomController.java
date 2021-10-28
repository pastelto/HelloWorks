package com.helloworks.spring.offieceRoom.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.GsonBuilder;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.offieceRoom.model.service.OfficeRoomService;
import com.helloworks.spring.offieceRoom.model.vo.SearchEmployee;

@Controller
public class OfficeRoomController {

	@Autowired
	private OfficeRoomService officeRoomService;
	
	/* 직원 검색 */
	@RequestMapping("searchEmpMain.or")
	public String enrollReportForm(Model model) {
		System.out.println("직원검색 페이지 전환");
		
		ArrayList<Employee> list = officeRoomService.selectAllEmployee();
		model.addAttribute("list", list);
		return "searchEmployee/searchEmployeeMain";
	}
	
	@ResponseBody
	@RequestMapping(value="selectAllEmployee.or", produces = "application/json; charset=utf-8")
	public String selectAllEmployee() {
		ArrayList<Employee> list = officeRoomService.selectAllEmployee();
		
		return new GsonBuilder().create().toJson(list); 
	}
	
	@ResponseBody
	@RequestMapping(value="selectDeptEmployee.or", produces = "application/json; charset=utf-8")
	public String selectDeptEmployee(String deptCode) {
		System.out.println("부서코드: "+deptCode);
		ArrayList<Employee> list = officeRoomService.selectDeptEmployee(deptCode);
		
		return new GsonBuilder().create().toJson(list); 
	}
	
	@ResponseBody
	@RequestMapping(value="selectKorSortEmployee.or", produces = "application/json; charset=utf-8")
	public String selectKorSortEmployee(String catTitle) {
		System.out.println("한글 코드: "+catTitle);
		ArrayList<Employee> list = officeRoomService.selectKorSortEmployee(catTitle);
		
		return new GsonBuilder().create().toJson(list); 
	}
	
	@ResponseBody
	@RequestMapping(value="selectEngSortEmployee.or", produces = "application/json; charset=utf-8")
	public String selectEngSortEmployee(String catTitle) {
		System.out.println("영어 코드: "+catTitle);
		ArrayList<Employee> list = officeRoomService.selectEngSortEmployee(catTitle);
		
		return new GsonBuilder().create().toJson(list); 
	}
	
	@ResponseBody
	@RequestMapping(value="searchEmployeeDetail.or", produces = "application/json; charset=utf-8")
	public String searchEmployeeDetail(int empNo) {
		
		Employee emp = officeRoomService.searchEmployeeDetail(empNo);
		
		System.out.println("직원상세조회 Controller: "+ emp);
		
		return new GsonBuilder().create().toJson(emp); 
	}
	
	@RequestMapping("searchEmployee.or")
	public String searchEmployee(String optionType, String deptTypeOption, String searchEmployee, Model model) {

		System.out.println("optionType: "+optionType);
		System.out.println("deptTypeOption: "+deptTypeOption);
		System.out.println("searchEmployee: "+searchEmployee);
		
		SearchEmployee se = new SearchEmployee();
		
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
		
		ArrayList<Employee> list = officeRoomService.searchEmployee(se);
		
		model.addAttribute("optionType", optionType);
		model.addAttribute("deptTypeOption", deptTypeOption);
		model.addAttribute("searchEmployee", searchEmployee);
		model.addAttribute("list", list);
		return "searchEmployee/searchEmployeeMain";
		
	}
	
	@RequestMapping("popupSearchEmp.or")
	public String popupSearchEmp(Model model, HttpServletRequest request, HttpSession session) {
		System.out.println("직원검색 페이지 전환");
		
		Employee loginUser = ((Employee)request.getSession().getAttribute("loginUser")); 
		
		
		
		HashMap<String, String> receiveListSession = (HashMap<String, String>) (request.getSession().getAttribute("receiveListSession"));
		HashMap<String, String> refListSession = (HashMap<String, String>) (request.getSession().getAttribute("refListSession"));
		
		model.addAttribute("loginUser", loginUser);
		ArrayList<Employee> list = officeRoomService.selectAllEmployee();
		model.addAttribute("list", list);
		model.addAttribute("addReceiveList", receiveListSession);
		model.addAttribute("addRefList", refListSession);
		
		return "searchEmployee/popupSearchEmployee";
	}

	@RequestMapping("popupSearchEmployee.or")
	public String popupSearchEmployee(String optionType, String deptTypeOption, String searchEmployee, Model model) {

		System.out.println("optionType: "+optionType);
		System.out.println("deptTypeOption: "+deptTypeOption);
		System.out.println("searchEmployee: "+searchEmployee);
		
		SearchEmployee se = new SearchEmployee();
		
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
		
		ArrayList<Employee> list = officeRoomService.searchEmployee(se);
		
		model.addAttribute("optionType", optionType);
		model.addAttribute("deptTypeOption", deptTypeOption);
		model.addAttribute("searchEmployee", searchEmployee);
		model.addAttribute("list", list);
		return "searchEmployee/popupSearchEmployee";
		
	}
	
	@RequestMapping("popupAddReceiveList.or")
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
		return "redirect:popupSearchEmp.or";
		
	}
	
	@RequestMapping("popupDelReceiveList.or")
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
		
		return "redirect:popupSearchEmp.or";
	}
	
	
	@RequestMapping("popupAddRefList.or")
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
		return "redirect:popupSearchEmp.or";
		
	}
	
	@RequestMapping("popupDelRefList.or")
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
		
		return "redirect:popupSearchEmp.or";
	}
}
