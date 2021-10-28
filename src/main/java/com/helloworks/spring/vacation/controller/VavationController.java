package com.helloworks.spring.vacation.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.GsonBuilder;
import com.helloworks.spring.attendance.model.service.AttendanceService;
import com.helloworks.spring.attendance.model.vo.Attendance;
import com.helloworks.spring.vacation.model.service.VacationService;

@Controller
public class VavationController {
	
	@Autowired
	private VacationService vacationService;
	
	@Autowired
	private AttendanceService attendanceService;
	
	//페이지 전환
	@RequestMapping("vacationForm.ps")
	public String attendanceApiView() {
		System.out.println("근태현황 api  페이지 전환");
		return "vacation/AllForm";
	}
	
	//조정문서 날짜 선택 후 상태 가져오기
    @ResponseBody
   	@RequestMapping(value = "selectStatus.ps", method = {RequestMethod.POST})
   	public String selectStatus(String cancleVDate){
    	
    	System.out.println("~~~~~~~~~~" + cancleVDate);
    	String cancle = cancleVDate.substring(2, 4)+"/"+ cancleVDate.substring(5, 7)+"/"+ cancleVDate.substring(8, 10);
       	
    	Attendance canclelist = attendanceService.selectStatus(cancle);

    	return new GsonBuilder().create().toJson(canclelist);
    }
}
