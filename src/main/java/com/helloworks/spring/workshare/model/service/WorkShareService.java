package com.helloworks.spring.workshare.model.service;

import java.util.List;

import com.helloworks.spring.workshare.model.vo.WSAttachment;
import com.helloworks.spring.workshare.model.vo.WorkShare;

public interface WorkShareService {

	void insertWorkShare(WorkShare ws, List<WSAttachment> wsAttach) throws Exception;

}
