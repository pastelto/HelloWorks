package com.helloworks.spring.offieceRoom.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.GsonBuilder;
import com.helloworks.spring.common.Pagination;
import com.helloworks.spring.common.model.vo.PageInfo;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.offieceRoom.model.service.OfficeRoomService;
import com.helloworks.spring.offieceRoom.model.vo.CommonResources;
import com.helloworks.spring.offieceRoom.model.vo.CommonResourcesAttachment;
import com.helloworks.spring.offieceRoom.model.vo.CommonResourcesReply;
import com.helloworks.spring.offieceRoom.model.vo.DeptResources;
import com.helloworks.spring.offieceRoom.model.vo.DeptResourcesAttachment;
import com.helloworks.spring.offieceRoom.model.vo.DeptResourcesReply;
import com.helloworks.spring.offieceRoom.model.vo.SearchEmployee;
import com.helloworks.spring.workshare.model.vo.WSAttachment;

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
	
	/* 자료실 */
	@RequestMapping("commResourcesList.or")
	public String commResourcesList(@RequestParam(value="currentPage", required=false, defaultValue = "1") int currentPage, Model model) {
		
		int listCount = officeRoomService.selectCommResourcesListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 13);
		
		ArrayList<CommonResources> commResourcesList = officeRoomService.selectCommResourcesList(pi);
		
		System.out.println("공통자료실: "+commResourcesList);
		
		model.addAttribute("pi", pi);
		model.addAttribute("commResourcesList", commResourcesList);
		model.addAttribute("pageURL", "commResourcesList.or");
		model.addAttribute("checkTypeAll", "checked");
		model.addAttribute("resourcesType", "allType");
		
		return "officeResources/commResourcesList";
	}
	
	@RequestMapping("commResourcesListType.or")
	public String commResourcesListType(String resourcesType, @RequestParam(value="currentPage", required=false, defaultValue = "1") int currentPage, HttpServletRequest request, Model model) {
		
		CommonResources commonResources = new CommonResources();
		
		commonResources.setCrCategory(resourcesType);

		int listCount = officeRoomService.selectCommonResourcesCategoryTypeListCount(commonResources);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 13);
		
		ArrayList<CommonResources> commResourcesList = officeRoomService.selectCommonResourcesCategoryTypeList(commonResources, pi);
		
		
		model.addAttribute("pi", pi);
		model.addAttribute("commResourcesList", commResourcesList);
		model.addAttribute("pageURL", "commResourcesListType.or");
		
		if(resourcesType.equals("공유")) {
			model.addAttribute("checkS", "checked");
		}else if(resourcesType.equals("문서")){
			model.addAttribute("checkD", "checked");
		}else if(resourcesType.equals("기타")) {
			model.addAttribute("checkE", "checked");
		}else {
			model.addAttribute("checkTypeAll", "checked");
		}
		
		model.addAttribute("resourcesType", resourcesType);
		return "officeResources/commResourcesList";
	}
	
	
	@RequestMapping("commResourcesDetail.or")
	public String commResourcesDetail(int crNo, HttpServletRequest request, Model model) {
		System.out.println("공통 자료실 detail"+crNo);
		
		officeRoomService.increaseCount(crNo);
		int loginUserNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo();
		CommonResources commonResources = officeRoomService.selectCommonResources(crNo);
		
		ArrayList<CommonResourcesAttachment> commonResourcesAttach = officeRoomService.selectCommonResourcesAttachMent(crNo); 
		
		System.out.println("자료실 첨부파일:"+commonResourcesAttach);
		model.addAttribute("commonResources", commonResources);
		model.addAttribute("commonResourcesAttach", commonResourcesAttach);
		model.addAttribute("loginUserNo", loginUserNo);
		model.addAttribute("crNo", crNo);
		
		return "officeResources/commResourcesDetail";
	}	
	
	@ResponseBody
	@RequestMapping(value="commResourcesRelplyList.or", produces = "application/json; charset=utf-8")
	public String commRelplyList(int crNo) {
		ArrayList<CommonResourcesReply> list = officeRoomService.selectCommReplyList(crNo);
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(list); //형식적용하여 시간 출력
	}
	
	@ResponseBody
	@RequestMapping(value="addCommResourcesReply.or", produces = "application/json; charset=utf-8")
	public String addCommReply(CommonResourcesReply r) {
		
		System.out.println("댓글: "+r);
		
		int result = officeRoomService.addCommReply(r);
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping("deleteCommResourcesReply.or")
	public String deleteCommReply(int crNo) {
		System.out.println("삭제 넘어오나요..?");
		int result = officeRoomService.deleteCommReply(crNo);
		
		return String.valueOf(result);
	}
	
	@RequestMapping("commResourcesEnroll.or")
	public String commResourcesEnroll(HttpServletRequest request, Model model) {
		Employee loginUser = ((Employee)request.getSession().getAttribute("loginUser")); 
		model.addAttribute("loginUser", loginUser);
		return "officeResources/commResourcesEnroll";
	}
	
	@RequestMapping("commResourcesInsert.or")
	public String commResourcesInsert(CommonResources commonResources, MultipartHttpServletRequest multiRequest, HttpServletRequest request, Model model) throws Exception {
		
		System.out.println("전달 값: "+commonResources);
		List<MultipartFile> fileList = multiRequest.getFiles("uploadFile");
		System.out.println("fileList ? " + fileList.size());
		if(fileList.get(0).getSize() == 0) {
			commonResources.setCrAttach("N");
		}else {
			commonResources.setCrAttach("Y");
		}
		
		officeRoomService.insertCommResources(commonResources);
		
		ArrayList<CommonResourcesAttachment> commonResourcesAttachList = new ArrayList<CommonResourcesAttachment>();
		
		if(fileList.get(0).getSize() != 0) {
			  
			 for(int i = 0; i < fileList.size(); i++) {
				 CommonResourcesAttachment commonResourcesAttach = new CommonResourcesAttachment();
				 String changeName = saveFile(fileList.get(i), request, i, "common");
				 
				 commonResourcesAttach.setCrAttachOrigin(fileList.get(i).getOriginalFilename());
				 commonResourcesAttach.setCrAttachChange(changeName);
				 
				 commonResourcesAttachList.add(commonResourcesAttach);
			 }
			 officeRoomService.insertCommResourcesAttach(commonResourcesAttachList);
		}
		
		return "redirect:commResourcesList.or";
	}
	
	@RequestMapping("commResourcesDelete.or")
	public String commResourcesDelete() {
		
		return "redirect:commResourcesList.or";
	}
	
	@RequestMapping("deptResourcesList.or")
	public String deptResourcesList(@RequestParam(value="currentPage", required=false, defaultValue = "1") int currentPage, HttpServletRequest request, Model model) {
		
		Employee loginUser = ((Employee)request.getSession().getAttribute("loginUser")); 
		
		
		int listCount = officeRoomService.selectDeptResourcesListCount(loginUser.getDeptCode());
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 13);
		
		ArrayList<DeptResources> deptResourcesList = officeRoomService.selectDeptResourcesList(loginUser.getDeptCode(), pi);
		
		System.out.println("공통자료실: "+deptResourcesList);
		
		model.addAttribute("pi", pi);
		model.addAttribute("deptResourcesList", deptResourcesList);
		model.addAttribute("pageURL", "deptResourcesList.or");
		model.addAttribute("checkTypeAll", "checked");
		model.addAttribute("resourcesType", "allType");
		
		return "officeResources/deptResourcesList";
	}
	
	@RequestMapping("deptResourcesListType.or")
	public String deptResourcesListType(String resourcesType, @RequestParam(value="currentPage", required=false, defaultValue = "1") int currentPage, HttpServletRequest request, Model model) {
		
		
		Employee loginUser = ((Employee)request.getSession().getAttribute("loginUser")); 
		
		DeptResources deptResources = new DeptResources();
		deptResources.setDeptCode(loginUser.getDeptCode());
		deptResources.setDeptrCategory(resourcesType);

		int listCount = officeRoomService.selectDeptResourcesCategoryTypeListCount(deptResources);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 13);
		
		ArrayList<DeptResources> deptResourcesList = officeRoomService.selectDeptResourcesCategoryTypeList(deptResources, pi);
		
		
		model.addAttribute("pi", pi);
		model.addAttribute("deptResourcesList", deptResourcesList);
		model.addAttribute("pageURL", "deptResourcesListType.or");
		
		if(resourcesType.equals("공유")) {
			model.addAttribute("checkS", "checked");
		}else if(resourcesType.equals("문서")){
			model.addAttribute("checkD", "checked");
		}else if(resourcesType.equals("기타")) {
			model.addAttribute("checkE", "checked");
		}else {
			model.addAttribute("checkTypeAll", "checked");
		}
		
		model.addAttribute("resourcesType", resourcesType);
		return "officeResources/deptResourcesList";
	}
	
	
	@RequestMapping("deptResourcesDetail.or")
	public String deptResourcesDetail(int deptrNo, HttpServletRequest request, Model model) {
		System.out.println("부서별 자료실 detail: "+deptrNo);
		
		officeRoomService.increaseDeptCount(deptrNo);
		int loginUserNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo();
		DeptResources deptResources = officeRoomService.selectDeptResources(deptrNo);
		
		ArrayList<DeptResourcesAttachment> deptResourcesAttach = officeRoomService.selectDeptResourcesAttachMent(deptrNo); 
		
		System.out.println("자료실 첨부파일:"+deptResourcesAttach);
		model.addAttribute("deptResources", deptResources);
		model.addAttribute("deptResourcesAttach", deptResourcesAttach);
		model.addAttribute("loginUserNo", loginUserNo);
		model.addAttribute("deptrNo", deptrNo);
		
		return "officeResources/deptResourcesDetail";
	}
	
	@ResponseBody
	@RequestMapping(value="deptResourcesRelplyList.or", produces = "application/json; charset=utf-8")
	public String deptRelplyList(int deptrNo) {
		ArrayList<CommonResourcesReply> list = officeRoomService.selectDeptReplyList(deptrNo);
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(list); //형식적용하여 시간 출력
	}
	
	@ResponseBody
	@RequestMapping(value="addDeptResourcesReply.or", produces = "application/json; charset=utf-8")
	public String addDeptReply(DeptResourcesReply r) {
		
		System.out.println("댓글: "+r);
		
		int result = officeRoomService.addDeptCommReply(r);
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping("deleteDeptResourcesReply.or")
	public String deleteDeptReply(int deptrNo) {
		System.out.println("삭제 넘어오나요..?");
		int result = officeRoomService.deleteDeptReply(deptrNo);
		
		return String.valueOf(result);
	}
	
	
	@RequestMapping("deptResourcesEnroll.or")
	public String deptResourcesEnroll(HttpServletRequest request, Model model) {
		Employee loginUser = ((Employee)request.getSession().getAttribute("loginUser")); 
		model.addAttribute("loginUser", loginUser);
		return "officeResources/deptResourcesEnroll";
	}
	
	@RequestMapping("deptResourcesInsert.or")
	public String deptResourcesInsert(DeptResources deptResources, MultipartHttpServletRequest multiRequest, HttpServletRequest request, Model model) throws Exception {
		
		System.out.println("전달 값: "+deptResources);
		List<MultipartFile> fileList = multiRequest.getFiles("uploadFile");
		System.out.println("fileList ? " + fileList.size());
		if(fileList.get(0).getSize() == 0) {
			deptResources.setDeptrAttach("N");
		}else {
			deptResources.setDeptrAttach("Y");
		}
		
		officeRoomService.insertDeptResources(deptResources);
		
		ArrayList<DeptResourcesAttachment> deptResourcesAttachList = new ArrayList<DeptResourcesAttachment>();
		
		if(fileList.get(0).getSize() != 0) {
			  
			 for(int i = 0; i < fileList.size(); i++) {
				 DeptResourcesAttachment deptResourcesAttach = new DeptResourcesAttachment();
				 String changeName = saveFile(fileList.get(i), request, i, "dept");
				 
				 deptResourcesAttach.setDeptrAttachOrigin(fileList.get(i).getOriginalFilename());
				 deptResourcesAttach.setDeptrAttachChange(changeName);
				 
				 deptResourcesAttachList.add(deptResourcesAttach);
			 }
			 officeRoomService.insertDeptResourcesAttach(deptResourcesAttachList);
		}
		
		return "redirect:deptResourcesList.or";
	}
	
	@RequestMapping("deptResourcesDelete.or")
	public String deptResourcesDelete() {
		
		return "redirect:deptResourcesList.or";
	}
	
	// 첨부파일 저장
	private String saveFile(MultipartFile file, HttpServletRequest request, int num, String type) throws Exception {

		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = "";
		if(type.equals("common")) {
			savePath = resources + "\\commonResources_files\\";
		}else if(type.equals("dept")) {
			savePath = resources + "\\deptResources_files\\";
		}
		

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
	
	@RequestMapping("searchDeptResources.or")
	public String searchDeptResources(String resourcesType, String optionType, String search,
			@RequestParam(value="currentPage", required=false, defaultValue = "1") int currentPage, HttpServletRequest request, Model model) {
		
		System.out.println("부서별 검색 컨트롤러 option: "+optionType);
		Employee loginUser = ((Employee)request.getSession().getAttribute("loginUser")); 
		DeptResources deptResources = new DeptResources();
		deptResources.setDeptCode(loginUser.getDeptCode());
		
		//if(!resourcesType.equals("allType")){
			deptResources.setDeptrCategory(resourcesType);
		//}
		
		deptResources.setOptionType(optionType);
		deptResources.setSearch(search);
		
		int listCount = officeRoomService.selectDeptResourcesSearchListCount(deptResources);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 13);
		
		ArrayList<DeptResources> deptResourcesList = officeRoomService.selectDeptResourcesSearchList(deptResources, pi);
		
		
		model.addAttribute("pi", pi);
		model.addAttribute("deptResourcesList", deptResourcesList);
		model.addAttribute("pageURL", "searchDeptResources.or");
		
		if(resourcesType.equals("공유")) {
			model.addAttribute("checkS", "checked");
		}else if(resourcesType.equals("문서")){
			model.addAttribute("checkD", "checked");
		}else if(resourcesType.equals("기타")) {
			model.addAttribute("checkE", "checked");
		}else {
			model.addAttribute("checkTypeAll", "checked");
		}
		
		model.addAttribute("resourcesType", resourcesType);
		model.addAttribute("optionType", optionType);
		model.addAttribute("search", search);
		
		return "officeResources/deptResourcesList";
	}
	
	@RequestMapping("searchCommResources.or")
	public String searchCommResources(String resourcesType, String optionType, String search,
			@RequestParam(value="currentPage", required=false, defaultValue = "1") int currentPage, HttpServletRequest request, Model model) {
		
		System.out.println("공통 자료실 검색 컨트롤러 option: "+optionType);
		
		Employee loginUser = ((Employee)request.getSession().getAttribute("loginUser")); 
		CommonResources commResources = new CommonResources();
		
		commResources.setCrCategory(resourcesType);
		
		commResources.setOptionType(optionType);
		commResources.setSearch(search);
		
		int listCount = officeRoomService.selectCommResourcesSearchListCount(commResources);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 13);
		
		ArrayList<CommonResources> commResourcesList = officeRoomService.selectCommResourcesSearchList(commResources, pi);
		
		
		model.addAttribute("pi", pi);
		model.addAttribute("commResourcesList", commResourcesList);
		model.addAttribute("pageURL", "searchCommResources.or");
		
		if(resourcesType.equals("공유")) {
			model.addAttribute("checkS", "checked");
		}else if(resourcesType.equals("문서")){
			model.addAttribute("checkD", "checked");
		}else if(resourcesType.equals("기타")) {
			model.addAttribute("checkE", "checked");
		}else {
			model.addAttribute("checkTypeAll", "checked");
		}
		
		model.addAttribute("resourcesType", resourcesType);
		model.addAttribute("optionType", optionType);
		model.addAttribute("search", search);
		
		return "officeResources/commResourcesList";
	}
	
	@RequestMapping("updateCommResourceForm.or")
	public String updateCommResourceForm(int crNo, Model model, HttpServletRequest request) {
		
		int loginUserNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo();
		CommonResources commonResources = officeRoomService.selectCommonResources(crNo);
		
		ArrayList<CommonResourcesAttachment> commonResourcesAttach = officeRoomService.selectCommonResourcesAttachMent(crNo); 
		
		model.addAttribute("commonResources", commonResources);
		model.addAttribute("commonResourcesAttach", commonResourcesAttach);
		model.addAttribute("loginUserNo", loginUserNo);
		model.addAttribute("crNo", crNo);
		
		return "officeResources/commResourcesUpdate";
	}
	
	@RequestMapping("updateDeptResourceForm.or")
	public String updateDeptResourceForm(int deptrNo, Model model, HttpServletRequest request) {
		
		int loginUserNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo();
		DeptResources deptResources = officeRoomService.selectDeptResources(deptrNo);
		
		ArrayList<DeptResourcesAttachment> deptResourcesAttach = officeRoomService.selectDeptResourcesAttachMent(deptrNo); 
		
		model.addAttribute("deptResources", deptResources);
		model.addAttribute("deptResourcesAttach", deptResourcesAttach);
		model.addAttribute("loginUserNo", loginUserNo);
		model.addAttribute("deptrNo", deptrNo);
		
		return "officeResources/deptResourcesUpdate";
	}
	
	@ResponseBody
	@RequestMapping("deleteCommAttach.or")
	public String deleteCommAttach(int crAttachNo, HttpServletRequest request) {
		int result = 0;
		try {
			CommonResourcesAttachment commonResourcesAttachment = officeRoomService.selectDelCommonResourcesAttachment(crAttachNo);
			result = officeRoomService.deleteCommonResourcesAttachment(crAttachNo);
			deleteFile(commonResourcesAttachment, request);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return String.valueOf(result);
		
	}
	
	// 공통 첨부파일 삭제
	private void deleteFile(CommonResourcesAttachment file, HttpServletRequest request) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\commonResources_files\\";
		
		System.out.println("savePath : " + savePath);
		
		String fileName = file.getCrAttachChange();
		System.out.println("삭제할 파일 명 : " + fileName);
		
		File deleteFile = new File(savePath + fileName);
		deleteFile.delete();
		
	}
	
	@ResponseBody
	@RequestMapping(value="commAttachList.or", produces = "application/json; charset=utf-8")
	public String commAttachList(int crNo) {
		ArrayList<CommonResourcesAttachment> list = new ArrayList<CommonResourcesAttachment>();
		try {
			list = officeRoomService.commAttachList(crNo);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(!list.isEmpty()) {
			return new GsonBuilder().create().toJson(list); 
		} else {
			int result = 0;
			return String.valueOf(result);
		}
	}
	
	@RequestMapping("commResourcesUpdate.or")
	public String commResourcesUpdate(HttpServletRequest request, Model model) {
		int loginUserNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo();
		CommonResources commonResources = officeRoomService.selectCommonResources(crNo);
		
		ArrayList<CommonResourcesAttachment> commonResourcesAttach = officeRoomService.selectCommonResourcesAttachMent(crNo); 
		
		model.addAttribute("commonResources", commonResources);
		model.addAttribute("commonResourcesAttach", commonResourcesAttach);
		model.addAttribute("loginUserNo", loginUserNo);
		model.addAttribute("crNo", crNo);
		
		return "officeResources/commResourcesDetail";
	}
}
