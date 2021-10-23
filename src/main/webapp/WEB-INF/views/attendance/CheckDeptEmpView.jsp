<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서 출근 기록</title>
<!-- css attendance  -->
<link href="resources/css/attendance/CheckDeptEmp.css" rel="stylesheet" type="text/css">
<style>
#searchEmpTable>thead>tr>th, #searchEmpTable>tbody>tr>th {
	background-color: #DAE1E7;
	text-align: center;
	padding: 8px;
	font-size: small;
}

#employeeTable>thead>tr>th, #employeeTable>tbody>tr>td {
	text-align: center;
}

#attendanceYear, #attendanceMonth {
	margin-left: 10px;
}
.content-wrapper {
	overflow: auto;
}

#mainContent{
	margin-left : 4% !important;
}

input[id*="radio"], input[id*="vacation"] {
	margin-left : 1% ;
	font-size : 10px;;
}

.line{
	border-bottom : 1px solid gray;
	border-color : rgb(227,227,227);
}

#realtype1, #realtype2{
	margin-left : 3px;
	padding-top : 5px;
}


</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="content-wrapper">

		
			<div class="container-fluid">
				<div class="row">
					
						<jsp:include page="../attendance/AttendanceSidebar.jsp" />
					
					<!--메인 -->
					<div class="col-9" id="mainContent">
						<br> <br>
						<div class="card card-outline card-info">
							<div class="card-header text-center">
								<h6 style="margin-bottom: 0px">
									<b>부서원 출결 조회</b>
								</h6>
							</div>
							<div class="card-body">
								<div class="card">
									<div class="card-body">
										<div class="card" style="margin-bottom: 0px;">
											<table id="searchEmpTable">
												<thead>
													<tr>
														<th style="width: 20%" class="line">검색일</th>
														<td style="width: 80%" class="line">
															<select id="attendanceYear" name="attendanceYear" class="custom-select custom-select-sm" style="width: 15%;" onchange="">
																<option value="2021">2021</option>
																<option value="2020">2020</option>
																<option value="2019">2019</option>
																<option value="2018">2018</option>
																<option value="2017">2017</option>
															</select> &nbsp; 
															<select id="attendanceMonth"name="attendanceMonth" class="custom-select custom-select-sm" style="width: 15%;" onchange="">
																<option value="1">1월</option>
																<option value="2">2월</option>
																<option value="3">3월</option>
																<option value="4">4월</option>
																<option value="5">5월</option>
																<option value="6">6월</option>
																<option value="7">7월</option>
																<option value="8">8월</option>
																<option value="9">9월</option>
																<option value="10">10월</option>
																<option value="11">11월</option>
																<option value="12">12월</option>
														   </select>
														</td>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th style="width: 20%" class="line">구분</th>
														<td style="width: 80%" class="line">
															
															<div class="container-fluid">
																<button id="realtype1"  class="btn btn-default btn-sm" >근태구분</button>&nbsp;
																<button id="realtype2"  class="btn btn-default btn-sm" >휴가구분</button>
															</div>															
															<div class="attendancetype">&nbsp;
																<input type="radio" name="attendance_type" value="출근전" id="radio1">출근전
																<input type="radio" name="attendance_type" value="정상출근" id="radio2">정상출근
																<input type="radio" name="attendance_type" value="지각" id="radio3">지각
																<input type="radio" name="attendance_type" value="결근" id="radio4">결근
																<input type="radio" name="attendance_type" value="반차" id="radio5">반차
																<input type="radio" name="attendance_type" value="연차" id="radio6">연차
																<input type="radio" name="attendance_type" value="병가" id="radio7">병가
																<input type="radio" name="attendance_type" value="조퇴" id="radio8">조퇴
															</div>
															<div class="vacationtype">&nbsp;														
																<input type="radio" name="vacation_type" value="보건휴가" id="vacation1">보건휴가
																<input type="radio" name="vacation_type" value="출산휴가" id="vacation2">출산휴가
																<input type="radio" name="vacation_type" value="대체휴가" id="vacation3">대체휴가
																<input type="radio" name="vacation_type" value="경조사" id="vacation4">경조사
																<input type="radio" name="vacation_type" value="육아휴직" id="vacation5">육아휴직	
															</div>
								
														</td>
													</tr>
													<tr>
														<th style="width: 20%">검색조건</th>
														<td style="width: 80%">
															<div class="row" style="margin-left: 0px;">
																&nbsp;&nbsp;&nbsp;															
																<select id="optionType" name="optionType" class="custom-select custom-select-sm" style="width: 10%;" onchange="deptSelect(this.value);">
																	<option value="allType">전체</option>
																	<option value="deptType" >부서</option>
																	<option value="empNoType">사번</option>
																	<option value="empNameType">이름</option>
																</select>
																&nbsp;&nbsp;&nbsp;
																<div class="input-group" style="width: 30%;">
																	<input type="search" id="searchInput"
																		class="form-control form-control-sm"
																		placeholder="검색어를 입력하세요." name="searchEmployee" value="${ search }">
																	<div class="input-group-append">
																		<button type="submit" class="btn btn-sm btn-default">
																			<i class="fa fa-search"></i>
																		</button>
																	</div>
																</div>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							<!-- /.col -->
							<div class="col-md-12" style="overflow: auto; height: 450px">
								<table id="employeeTable" class="table table-sm">
									<caption style="caption-side: top">
										* 정렬 기준 : <span id="sortOption">전체</span>
									</caption>
									<thead>
										<tr aling="center">
											<th style="width: 20px;">사번</th>
											<th style="width: 50px;">부서</th>
											<th style="width: 40px;">이름</th>
											<th style="width: 40px;">직급</th>
											<th style="width: 50px;">상태</th>
											<th style="width: 50px;">출근시간</th>
											<th style="width: 50px;">퇴근시간</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>202100008</td>
											<td>경영지원팀</td>
											<td>조아혜</td>
											<td>팀장</td>
											<td>정상출근</td>
											<td>09:00:00</td>
											<td>18:00:00</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->
					</div>
					<br> <br> 
				</div>
			</div>
		
	</div>
	<jsp:include page="../common/footer.jsp" />
	<script>
	$(function(){
		
		
		$('.attendancetype').hide();
		$('.vacationtype').hide();
					
		$('#realtype1').click(function(){
			$(".attendancetype").show();
			$('.vacationtype').hide();			
		});
		
		$('#realtype2').click(function(){
			$(".vacationtype").show();
			$('.attendancetype').hide();			
		});
		
	});
	
	
	</script>
</body>
</html>