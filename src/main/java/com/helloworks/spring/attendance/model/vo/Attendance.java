package com.helloworks.spring.attendance.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Attendance {
	
	private int psaNo;//기록번호	
	private Date psCreateDate; // 출퇴근날짜
	private String inTime; //출근시간
	private String outTime; //퇴근시간	
	private String psStatus; //출퇴근상태
	private int empNo; //사번
	private int workingTime; //일한시간
	private int overTime; //야근시간
	private int total; //총 근로시간
	private String jobName;	//직급	
	private String deptName; //부서
	private String deptUname; //상위부서
	private int appliedIN; //적용 출근시간
	private int appliedOut; //적용 퇴근시간
	public int getPsaNo() {
		return psaNo;
	}
	public void setPsaNo(int psaNo) {
		this.psaNo = psaNo;
	}
	public Date getPsCreateDate() {
		return psCreateDate;
	}
	public void setPsCreateDate(Date psCreateDate) {
		this.psCreateDate = psCreateDate;
	}
	public String getInTime() {
		return inTime;
	}
	public void setInTime(String inTime) {
		this.inTime = inTime;
	}
	public String getOutTime() {
		return outTime;
	}
	public void setOutTime(String outTime) {
		this.outTime = outTime;
	}
	public String getPsStatus() {
		return psStatus;
	}
	public void setPsStatus(String psStatus) {
		this.psStatus = psStatus;
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public int getWorkingTime() {
		return workingTime;
	}
	public void setWorkingTime(int workingTime) {
		this.workingTime = workingTime;
	}
	public int getOverTime() {
		return overTime;
	}
	public void setOverTime(int overTime) {
		this.overTime = overTime;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getJobName() {
		return jobName;
	}
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getDeptUname() {
		return deptUname;
	}
	public void setDeptUname(String deptUname) {
		this.deptUname = deptUname;
	}
	public int getAppliedIN() {
		return appliedIN;
	}
	public void setAppliedIN(int appliedIN) {
		this.appliedIN = appliedIN;
	}
	public int getAppliedOut() {
		return appliedOut;
	}
	public void setAppliedOut(int appliedOut) {
		this.appliedOut = appliedOut;
	}
	
	
}
