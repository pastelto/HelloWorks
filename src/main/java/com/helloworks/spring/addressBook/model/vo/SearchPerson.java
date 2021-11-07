package com.helloworks.spring.addressBook.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class SearchPerson {

	private String allPabType;
	private String pabNameType;
	private String empNameType;
	private String ePhoneType;
	private String emailType;
	
	private int loginUserEmpNo;
}
