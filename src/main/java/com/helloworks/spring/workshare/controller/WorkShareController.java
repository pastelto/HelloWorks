package com.helloworks.spring.workshare.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.helloworks.spring.workshare.model.service.WorkShareService;

@Controller
public class WorkShareController {

	@Autowired
	private WorkShareService workShareService;
	
	
}
