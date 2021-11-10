<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 상세 정보</title>
<style>
	#employeeMainInfo>tbody>tr>th{
		text-align: center !important;
		width: 10%;
	}
	#employeeMainInfo>tbody>tr>td{
		width: 40%;
	}
	#employeeDetailInfo>tbody>tr>th{
		text-align: center !important;
		width: 10%;
	}
	#employeeDetailInfo>tbody>tr>td{
		width: 40%;
	}
	input[disabled='disabled']{
		  color: black;
		  background-color: white !important;     
		  border: 0px !important;  
	}
	#deptCode, #jobCode{
		  color: black;
		  background-color: white !important;     
		  border: 0px !important;  
	}

</style>

</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	 
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-6">

						<h4>
							<i class="nav-icon far fa-address-card"></i><b> 사원 상세 정보</b>
						</h4>
					</div>
				</div>
			</div>
		</section>
		
		<section class="content">
			<div class="row">
			<div class="col-12">
			<form id="updateForm" action="updateEmployee.hr" method="post" >
					<div class="card card-outline card-info">
					
						<div class="card-header text-center">
							<h6 style="margin-bottom: 0px">
								<b>사원 정보 수정</b>
							</h6>
						</div>
						
						<br>
						<div class="card-body">

						
							<h4>
								<b>| 기본정보</b>
								<input type="hidden" class="form-control form-control-sm" name="empNo" value="${employee.empNo }">
							</h4>
							<table id="employeeMainInfo" class="table table-bordered table-sm mt-3">
								<tbody>
						
									<tr>
										<th><p class="mt-1 mb-0">성명</p></th>
										<td><input type="text" class="form-control form-control-sm" name="empName" placeholder="성명" required value="${employee.empName }" disabled="disabled"></td>	
										<th><p class="mt-1 mb-0">영문이름</p></th>
										<td><input type="text" class="form-control form-control-sm" name="empEn" placeholder="영문이름" required value="${employee.empEn }" disabled="disabled"></td>					
									</tr>	
									<tr>
										<th><p class="mt-1 mb-0">비밀번호</p></th>
										<td><input type="text" class="form-control form-control-sm" name="empPwd" placeholder="비밀번호" required value="${employee.empPwd }" disabled="disabled"></td>						
										<th><p class="mt-1 mb-0">주민번호</th>
										<td><input type="text" class="form-control form-control-sm" name="empPid" placeholder="주민번호" required value="${employee.empPid }" disabled="disabled"></td>
									</tr>									
									<tr>
										<th><p class="mt-1 mb-0">이메일</p></th>
										<td><input type="email" class="form-control form-control-sm" name="empEmail" placeholder="@helloworks.com" required value="${employee.empEmail }" disabled="disabled"></td>		
										<th><p class="mt-1 mb-0">연봉</p></th>
										<td><input type="text" class="form-control form-control-sm" name="empSalary" placeholder="연봉" required value="${employee.empSalary }" disabled="disabled"></td>								
									</tr>	
									<tr>
										<th><p class="mt-1 mb-0">재직상태</p></th>
										<td colspan="3">
										<div class="mt-1 mb-1" style="margin-left: 0px;">
												&nbsp;
												<input type="radio" name="empStatus" id="Y" value="Y" disabled="disabled"> 재직
												&nbsp;
												<input type="radio" name="empStatus" id="V" value="V" disabled="disabled"> 휴직
												&nbsp;
												<input type="radio" name="empStatus" id="N" value="N" disabled="disabled"> 퇴사
										</div>										
										</td>	
									</tr>								
									<tr>
										<th><p class="mt-1 mb-0">입사일</p></th>
										<td><input type="date" class="form-control form-control-sm" name="empHire" placeholder="입사일" required value="${employee.empHire }" disabled="disabled"></td>
										<th><p class="mt-1 mb-0">퇴사일</p></th>
										<td>
											<c:if test="${ empty employee.empFire}">
											
											</c:if>
											<c:if test="${ !empty employee.empFire}">
												<input type="date" class="form-control form-control-sm" name="empFireString" placeholder="퇴사일" value="${employee.empFire}" disabled="disabled">
											</c:if>
										</td>		
									</tr>
								</tbody>	
							</table>
				
							<br><hr><br>
	
							<!-- 상세정보 -->
							<h4>
								<b>| 상세정보</b>
							</h4>						
												
							<table id="employeeDetailInfo" class="table table-bordered table-sm mt-3 mb-3">
								<tbody>
								
									<tr>
										<th><p class="mt-1 mb-0">소속팀</p></th>
										<td colspan="3">
											
										<div id="test1">
											<select name="deptCode" id="deptCode" class="custom-select custom-select-sm" disabled="disabled">
												<option value="A1">인사팀</option>
												<option value="A2">총무팀</option>
												<option value="A3">재무회계팀</option>						
												<option value="B1">영업팀</option>
												<option value="B2">운영지원팀</option>																						
												<option value="C1">디자인팀</option>
												<option value="C2">마케팅팀</option>
												<option value="C3">IT개발팀</option>
											</select>
										</div>	
										</td>		
										
										<th><p class="mt-1 mb-0">직급</p></th>
										<td colspan="3">
											<select name="jobCode" id="jobCode" class="custom-select custom-select-sm" disabled="disabled">
												<option value="J1">대표이사</option>
												<option value="J2">본부장</option>
												<option value="J3">팀장</option>
												<option value="J4">팀원</option>
											</select>										
										</td>			
									</tr>	
									<tr>							
										<th><p class="mt-1 mb-0">내선번호</p></th>
										<td colspan="3"><input type="text" class="form-control form-control-sm" name="empEphone" placeholder="02-413" required value="${employee.empEphone }" disabled="disabled"></td>					
										<th><p class="mt-1 mb-0">핸드폰</th>
										<td ><input type="text" class="form-control form-control-sm" name="empPhone" placeholder="핸드폰" required value="${employee.empPhone }" disabled="disabled"></td>	
													
									</tr>
									<tr>
										<th><p class="mt-1 mb-0">주소</p></th>
										<td colspan="5"><input type="text" class="form-control form-control-sm" name="empAddress" placeholder="주소" required value="${employee.empAddress }" disabled="disabled"></td>														
									</tr>	
									<tr>
										<th><p class="mt-1 mb-0">상세내용</p></th>
										<td colspan="5" ><input type="text" class="form-control form-control-sm" name="empNote" placeholder="상세내용 작성" value="${employee.empNote }" disabled="disabled"></td>
									</tr>
											
								</tbody>
							</table>
								
						
						</div>
					<!-- card-footer -->
					<div class="card-footer">
						<div class="float-right">
							<button type="button" class="btn btn-primary" onclick="cancelFun();">돌아가기</button>
							<button type="button" class="btn btn-danger" onclick="updateFunc(${employee.empNo });">수정하기</button>
						</div>
					</div>
					
				</div>
				</form>
				</div>
				
			</div>
		</section>
	</div>
		
	
	 <jsp:include page="../common/footer.jsp" />
	 
	 
	<!-- 재직유형 -->
	<script>
	   	$(function(){
	   		if("${employee.empStatus}" == "Y"){
	   			$("#Y").attr("checked", true);
	   		}else if("${employee.empStatus}" == "V"){
	   			$("#V").attr("checked", true);
	   		}else if("${employee.empStatus}" == "N"){
	   			$("#N").attr("checked", true);
	   		}
	   	});
   </script>
   
   	<!-- 부서 값 검색 -->
	<script>
		$(function() {
			switch ('${ employee.deptCode }') {
				case "A1" :
					$("#deptCode>option").eq(0).attr("selected", true);
					break;
				case "A2" :
					$("#deptCode>option").eq(1).attr("selected", true);
					break;
				case "A3" :
					$("#deptCode>option").eq(2).attr("selected", true);
					break;
				case "B1" :
					$("#deptCode>option").eq(3).attr("selected", true);
					break;
				case "B2" :
					$("#deptCode>option").eq(4).attr("selected", true);
					break;
				case "C1" :
					$("#deptCode>option").eq(5).attr("selected", true);
					break;
				case "C2" :
					$("#deptCode>option").eq(6).attr("selected", true);
					break;
				case "C3" :
					$("#deptCode>option").eq(7).attr("selected", true);
					break;
				}
		})
	</script>
	
	<!-- 직급 값 검색 -->
	<script>
		$(function() {
			switch ('${ employee.jobCode }') {
				case "J1" :
					$("#jobCode>option").eq(0).attr("selected", true);
					break;
				case "J2" :
					$("#jobCode>option").eq(1).attr("selected", true);
					break;
				case "J3" :
					$("#jobCode>option").eq(2).attr("selected", true);
					break;
				case "J4" :
					$("#jobCode>option").eq(3).attr("selected", true);
					break;
				}
		})
	</script>
	
	<!-- 업데이트 버튼 -->
	<script>
		function updateFunc(empNo){
			
			location.href="<%=request.getContextPath()%>/updateEmployeeForm.hr?empNo="+empNo;
			
		}
	</script>
	
	<!-- 돌아가기 버튼 -->
	<script>
		function cancelFun(){
			location.href="<%=request.getContextPath()%>/empManageMain.hr";
		}
	</script>
	 
</body>
</html>