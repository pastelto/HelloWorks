package com.helloworks.spring.workshare.model.service;

import java.util.ArrayList;

import com.helloworks.spring.workshare.model.vo.WSAttachment;
import com.helloworks.spring.workshare.model.vo.WorkShare;

public interface WorkShareService {

	void insertWorkShare(WorkShare ws) throws Exception;

	void insertWSAttach(ArrayList<WSAttachment> wsaList) throws Exception;

}
