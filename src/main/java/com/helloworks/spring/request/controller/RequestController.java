package com.helloworks.spring.request.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.helloworks.spring.approval.model.vo.Approval;
import com.helloworks.spring.approval.model.vo.ApprovalComment;
import com.helloworks.spring.common.exception.CommException;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.request.model.service.RequestService;
import com.helloworks.spring.request.model.vo.Car;
import com.helloworks.spring.request.model.vo.Mtr;
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
	public String requestIdCard(RequestId rId, HttpServletRequest request, 
			@RequestParam(name="orgPicName", required=true) MultipartFile file) {
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
	
	//비품리스트
	@ResponseBody
	@RequestMapping(value="list.eq", produces="application/json; charset=UTF-8")
	public String selectEqList() {
		
		ArrayList<RequestEq> list = requestService.selectEqList();
		return new GsonBuilder().create().toJson(list);
		
	}
	//사원증리스트
	@ResponseBody
	@RequestMapping(value="list.id", produces="application/json; charset=UTF-8")
	public String selectIdList() {

		ArrayList<RequestId> list = requestService.selectIdList();
		return new GsonBuilder().create().toJson(list);
		
	}
	
	//회의실리스트
	@ResponseBody
	@RequestMapping(value="rlist.mtr", produces="application/json; charset=UTF-8")
	public String selectMtrList() {

		ArrayList<Mtr> list = requestService.selectMtrList();
		return new GsonBuilder().create().toJson(list);
		
	}
	
	// 목록-비품 체크박스 제출-> 승인완료로
	@ResponseBody
	@RequestMapping(value = "/confirm.eq", method = RequestMethod.POST)
	public String confirmEq(@RequestParam(value = "checkArr[]") List<String> checkArr){

		requestService.confirmEq(checkArr);
		String result = "성공!";
		return String.valueOf(result);

	}
	
	// 목록-사원증 체크박스 제출-> 승인완료로
	@ResponseBody
	@RequestMapping(value = "/confirm.id", method = RequestMethod.POST)
	public String confirmId(@RequestParam(value = "checkArr[]") List<String> checkArr){

		requestService.confirmId(checkArr);
		String result = "성공!";
		return String.valueOf(result);

	}
	
	// 목록-비품 체크박스 제출-> 승인취소로
	@ResponseBody
	@RequestMapping(value = "/cancel.eq", method = RequestMethod.POST)
	public String cancelEq(@RequestParam(value = "checkArr[]") List<String> checkArr){

		requestService.cancelEq(checkArr);
		String result = "성공!";
		return String.valueOf(result);

	}
	
	// 목록-사원증 체크박스 제출-> 승인취소로
	@ResponseBody
	@RequestMapping(value = "/cancel.id", method = RequestMethod.POST)
	public String cancelId(@RequestParam(value = "checkArr[]") List<String> checkArr){

		requestService.cancelId(checkArr);
		String result = "성공!";
		return String.valueOf(result);

	}
	
	// 비품신청 상세조회
	@RequestMapping("detail.eq")
	public ModelAndView selectEq(int requestEqNo, ModelAndView mv){
		System.out.println(requestEqNo);
		RequestEq requestEq = requestService.selectEq(requestEqNo);
		System.out.println(requestEq);
		mv.addObject("requestEq", requestEq).setViewName("request/requestEqDetail");
		return mv;

	}

	// 비품신청 상세조회
	@RequestMapping("detail.id")
	public ModelAndView selectId(int requestIdNo, ModelAndView mv){
		System.out.println(requestIdNo);
		RequestId requestId = requestService.selectId(requestIdNo);
		System.out.println(requestId);
		mv.addObject("requestId", requestId).setViewName("request/requestIdDetail");
		return mv;

	}
	
	//목록-비품 체크박스 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteList.eq", method = RequestMethod.POST)
	public String deleteListEq(@RequestParam(value = "checkArr[]") List<String> checkArr){

		requestService.deleteListEq(checkArr);
		String result = "성공!";
		return String.valueOf(result);

	}
	
	//목록-사원증 체크박스 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteList.id", method = RequestMethod.POST)
	public String deleteListId(@RequestParam(value = "checkArr[]") List<String> checkArr){

		requestService.deleteListId(checkArr);
		String result = "성공!";
		return String.valueOf(result);

	}
	
	//상세-비품신청 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteOne.eq", method = RequestMethod.POST)
	public String deleteOneEq(int requestEqNo){

		requestService.deleteOneEq(requestEqNo);
		String result = "성공!";
		return String.valueOf(result);

	}
	//상세-비품신청 승인완료
	@ResponseBody
	@RequestMapping(value = "/confirmOne.eq", method = RequestMethod.POST)
	public String confirmOneEq(int requestEqNo){

		requestService.confirmOneEq(requestEqNo);
		String result = "성공!";
		return String.valueOf(result);

	}
	//상세-비품신청 승인취소
	@ResponseBody
	@RequestMapping(value = "/cancelOne.eq", method = RequestMethod.POST)
	public String cancelOneEq(int requestEqNo){

		requestService.cancelOneEq(requestEqNo);
		String result = "성공!";
		return String.valueOf(result);

	}
	//상세-사원증신청 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteOne.id", method = RequestMethod.POST)
	public String deleteOneId(int requestIdNo){

		requestService.deleteOneId(requestIdNo);
		String result = "성공!";
		return String.valueOf(result);

	}
	//상세-사원증신청 승인완료
	@ResponseBody
	@RequestMapping(value = "/confirmOne.id", method = RequestMethod.POST)
	public String confirmOneId(int requestIdNo){

		requestService.confirmOneId(requestIdNo);
		String result = "성공!";
		return String.valueOf(result);

	}
	//상세-사원증신청 승인취소
	@ResponseBody
	@RequestMapping(value = "/cancelOne.id", method = RequestMethod.POST)
	public String cancelOneId(int requestIdNo){

		requestService.cancelOneId(requestIdNo);
		String result = "성공!";
		return String.valueOf(result);

	}
	
	//회의실 목록 및 차량 목록 가져오기
	@ResponseBody
	@RequestMapping(value = "/list.mtr",  produces="application/json; charset=UTF-8")
	public String listMtr(){

		ArrayList<Mtr> listMtr = requestService.listMtr();
		ArrayList<Car> listCar = requestService.listCar();

		System.out.println(listMtr.toString());
		System.out.println(listCar.toString());
		
		HashMap<String, Object> getList = new HashMap<String, Object>();
		getList.put("listMtr", listMtr);
		getList.put("listCar", listCar);
		
		System.out.println("ajax car랑 mtr ? " + getList);

		return new GsonBuilder().create().toJson(getList);
	}
	//회의실 시간표 가져오기
	@ResponseBody
	@RequestMapping(value = "/time.mtr",  produces="application/json; charset=UTF-8")
	public String timeMtr(int rNo, String getDate, int typeNo){
		
		System.out.println("rNo ? " + rNo);
		System.out.println("getDate ? " + getDate);
		System.out.println("typeNo ? " + typeNo);
		
		ArrayList<Mtr> timeMtr = new ArrayList<Mtr>();
		ArrayList<Car> timeCar = new ArrayList<Car>();
		
		if(typeNo == 1) {
			
			Mtr mtr = new Mtr();
			mtr.setMMNo(rNo);
			mtr.setMRDate(getDate);
			
			timeMtr = requestService.timeMtr(mtr);
			System.out.println("ArrayList<Mtr> timeMtr : "+  timeMtr);
			return new GsonBuilder().create().toJson(timeMtr);
		} else{
			
			Car car = new Car();
			car.setCSNo(rNo);
			car.setCRDate(getDate);
			
			timeCar = requestService.timeCar(car);
			System.out.println("ArrayList<Car> timeCar : "+  timeCar);
			return new GsonBuilder().create().toJson(timeCar);
		}
		
	}
	
	//회의실 예약 삭제
	@ResponseBody
	@RequestMapping(value = "/delRsv.mtr", method = RequestMethod.POST)
	public String delRsvMtr(int mRNo){
		
		requestService.delRsvMtr(mRNo);
		
		String result = "성공!";
		return String.valueOf(result);

	}
	
	//회의실 예약하기
	@ResponseBody
	@RequestMapping(value = "/rsv.mtr",  produces="application/json; charset=UTF-8")
	public String rsvMtr(HttpServletRequest request, int mMNo, String getDate, String mRTime, String mRUsg){
		
		Mtr mtr = new Mtr();
		int rEmpNo = ((Employee) request.getSession().getAttribute("loginUser")).getEmpNo();
		
		mtr.setMMNo(mMNo);
		mtr.setMRDate(getDate);
		mtr.setMRTime(mRTime);
		mtr.setREmpNo(rEmpNo);
		mtr.setMRUsg(mRUsg);
		
		System.out.println(mtr.toString());
		
		requestService.rsvMtr(mtr);

		String result = "successMtr";
		
		return new GsonBuilder().create().toJson(result);

	}
	
	//차량 시간표 가져오기
//	@ResponseBody
//	@RequestMapping(value = "/time.car", produces="application/json; charset=UTF-8")
//	public String timeCar(int cSNo, String getDate){
//		
//		Car car = new Car();
//		car.setCSNo(cSNo);
//		car.setCRDate(getDate);
//		
//		System.out.println("/time.car-----------------: " + car.toString());
//		
//		ArrayList<Car> timeCar = requestService.timeCar(car);
//		
//		System.out.println("ArrayList<Car> timeCar : "+  timeCar);
//		return new GsonBuilder().create().toJson(timeCar);
//
//	}
	
	//차량 예약 삭제
	@ResponseBody
	@RequestMapping(value = "/delRsv.car", method = RequestMethod.POST)
	public String delRsvCar(int cRNo){
		
		requestService.delRsvCar(cRNo);
		
		String result = "성공!";
		return String.valueOf(result);

	}
	
	//차량 예약하기
	@ResponseBody
	@RequestMapping(value = "/rsv.car",  produces="application/json; charset=UTF-8")
	public String rsvCar(HttpServletRequest request, String cMNo, String getDate, 
										String cRTime, String cRUsg, String cRDest, String cRPsng){
		
		Car car = new Car();
		int rEmpNo = ((Employee) request.getSession().getAttribute("loginUser")).getEmpNo();
		
		car.setCMNo(cMNo);
		car.setCRDate(getDate);
		car.setCRTime(cRTime);
		car.setEmpNo(rEmpNo);
		car.setCRUsg(cRUsg);
		
		System.out.println(car.toString());
		
		requestService.rsvCar(car);

		String result = "successCar";
		
		return new GsonBuilder().create().toJson(result);

	}
	
	@RequestMapping("mainRequest.mtr")
	public String mainRequestMtr(HttpServletRequest request, Model model) {
		
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo(); 
		
		ArrayList<Mtr> mtrRList = null;
		
		HashMap<String, Object> selectrMtrList = new HashMap<String, Object>();
		
		selectrMtrList.put("loginEmpNo", loginEmpNo);
		
		mtrRList = requestService.mainRequestMtr(selectrMtrList);
		
		model.addAttribute("mtrRList", mtrRList);
		System.out.println("메인 ----------mtrRList : " + mtrRList);
		model.addAttribute("mainPageURL", "mainReqeust.mtr");
		model.addAttribute("mainPage", 1);
		
		
		return "main";
	}
	
	@RequestMapping("mainRequest.eq")
	public String  mainRequestEq(HttpServletRequest request, Model model) {
		
		int loginEmpNo = ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo(); 
		
		ArrayList<RequestEq> eqRList = null;
		
		HashMap<String, Object> selectEqList = new HashMap<String, Object>();
		
		selectEqList.put("loginEmpNo", loginEmpNo);
		
		eqRList = requestService.mainRequestEq(selectEqList);
		
		model.addAttribute("eqRList", eqRList);
		System.out.println("메인 ----------eqRList : " + eqRList);
		model.addAttribute("mainPageURL", "mainRequest.eq");
		model.addAttribute("mainPage", 2);
		
		
		return "main";
	}
		
}
