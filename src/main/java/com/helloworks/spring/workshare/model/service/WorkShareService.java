package com.helloworks.spring.workshare.model.service;

import javax.activation.CommandMap;

import org.springframework.web.multipart.MultipartFile;

public interface WorkShareService {

	void insertWorkShare(CommandMap commandMap, MultipartFile[] file) throws Exception;

}
