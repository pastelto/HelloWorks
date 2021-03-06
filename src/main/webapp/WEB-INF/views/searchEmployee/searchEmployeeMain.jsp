<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 검색</title>
<style>
	#searchCategory>tbody>tr>th {
		width: 10%;
	}
	#searchCategory>tbody>tr>th>h4 {
		margin: auto;
	}
	#searchCategory>tbody>tr>th>h4>span {
		border: 1px solid #DAE1E7;
	}
	#searchCategory>tfoot>tr>td {
		background-color: white;
	}
	#searchEmpTable>tbody>tr>th	{
		background-color: #DAE1E7;
		width: 10%;
		text-align: center !important;
	}
	.content-wrapper {
		overflow: auto;
	}
	#accordion>.card{
		margin-bottom: 0px;
	}
	#employeeTable {
		text-align: center;
	}
	#detailEmployeeTable>tbody>tr>th {
		width: 15%;
	}
	#modalTitleDiv {
		background: #00909E;
		padding: 5px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-6">

						<h4>
							<i class="nav-icon fas fa-table"></i><b> 직원 검색</b>
						</h4>
					</div>
				</div>
			</div>
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-12">
				
					<div class="card card-outline card-info">

						<div class="card-header text-center">
							<h6 style="margin-bottom: 0px">
								<b>직원 검색</b>
							</h6>
						</div>

						<div class="card-body">

							<div class="card">
								<div class="card-body">
									<div class="card" style="margin-bottom: 0px;">
										<table id="searchEmpTable">
											<tr>
												<th>키워드</th>
												<td>
												<table id="searchCategory" class="table table-borderless table-sm" style="margin: auto; width: 98%">
														<tbody>
															<tr>
																<th><h4><span class="badge badge-light" style="width: 100%">ALL</span></h4></th>
																<th><h4><span class="badge badge-light" style="width: 100%">ㄱ</span></h4></th>
																<th><h4><span class="badge badge-light" style="width: 100%">ㄴ</span></h4></th>
																<th><h4><span class="badge badge-light" style="width: 100%">ㄷ</span></h4></th>
																<th><h4><span class="badge badge-light" style="width: 100%">ㄹ</span></h4></th>
																<th><h4><span class="badge badge-light" style="width: 100%">ㅁ</span></h4></th>
																<th><h4><span class="badge badge-light" style="width: 100%">ㅂ</span></h4></th>
																<th><h4><span class="badge badge-light" style="width: 100%">ㅅ</span></h4></th>
																<th><h4><span class="badge badge-light" style="width: 100%">ㅇ</span></h4></th>
																<th><h4><span class="badge badge-light" style="width: 100%">ㅈ</span></h4></th>
															</tr>
															<tr>
																<th><h4><span class="badge badge-light" style="width: 100%">ㅊ</span></h4></th>
																<th><h4><span class="badge badge-light" style="width: 100%">ㅋ</span></h4></th>
																<th><h4><span class="badge badge-light" style="width: 100%">ㅌ</span></h4></th>
																<th><h4><span class="badge badge-light" style="width: 100%">ㅍ</span></h4></th>
																<th><h4><span class="badge badge-light" style="width: 100%">ㅎ</span></h4></th>
																<th><h4><span class="badge badge-light" style="width: 100%">A ~ E</span></h4></th>
																<th><h4><span class="badge badge-light" style="width: 100%">F ~ J</span></h4></th>
																<th><h4><span class="badge badge-light" style="width: 100%">K ~ O</span></h4></th>
																<th><h4><span class="badge badge-light" style="width: 100%">P ~ T</span></h4></th>
																<th><h4><span class="badge badge-light" style="width: 100%">U ~ Z</span></h4></th>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
										</table>
									</div>
								
								
									<hr>

									<div class="card" style="margin-bottom: 0px;">
										<table id="searchEmpTable">
											<tr>
												<th>검색 조건</th>
												<td>
												<form action="searchEmployee.or">
												<div class="row" style="margin-left: 0px;">
														&nbsp;&nbsp;
														<button id="allEmployeeSearchBtn" type="button" class="btn btn-default btn-sm" onclick="selectAllEmployee();">전체검색</button>
														&nbsp;&nbsp;
														
															<select id="optionType" name="optionType" class="custom-select custom-select-sm" style="width: 10%;" onchange="deptSelect(this.value);">
																<option value="allType">전체</option>
																<option value="deptType" >부서</option>
																<option value="empNoType">사번</option>
																<option value="empNameType">이름</option>
																<option value="ePhoneType">내선번호</option>
																<option value="emailType">이메일</option>
															</select>
															<span id="deptTypeBlank"style="display:none">&nbsp;&nbsp;</span>
															<select id="deptTypeOption" name="deptTypeOption" class="custom-select custom-select-sm" style="width: 15%; display:none">
																<option value="A">경영지원본부</option>
																<option value="A1">인사팀</option>
																<option value="A2">총무팀</option>
																<option value="A3">재무회계팀</option>
																<option value="B">영업지원본부</option>
																<option value="B1">영업팀</option>
																<option value="B2">운영지원팀</option>
																<option value="C">사업본부</option>
																<option value="C1">디자인팀</option>
																<option value="C2">마케팅팀</option>
																<option value="C3">IT개발팀</option>
															</select>
															&nbsp;&nbsp;
															<div class="input-group" style="width: 30%;">
																<input type="search" id="searchInput"
																	class="form-control form-control-sm"
																	placeholder="검색어를 입력하세요." name="searchEmployee">
																<div class="input-group-append">
																	<button type="submit" class="btn btn-sm btn-default">
																		<i class="fa fa-search"></i>
																	</button>
																</div>
															</div>
														</div>
													</form>
												</td>
											</tr>
										</table>
									</div>
								</div>
							</div>


							<div class="row">
								<div class="col-md-2">
									<div class="card">
										<div class="card-header">
											<h3 class="card-title">HelloWorks</h3>
										</div>
										<div class="card-body">
											<div id="accordion">
												<div class="card">
													<div class="card-header">
														<a class="card-link" data-toggle="collapse" href="#collapseOne" onclick="selectDept('A','경영지원본부')">경영지원본부 </a>
													</div>
													<div id="collapseOne" class="collapse" data-parent="#accordion">
														<div class="card-body">
															<ul>
																<li><a href="#" onclick="selectDept('A1','인사팀')">인사팀</a></li>
																<li><a href="#" onclick="selectDept('A2', '총무팀')">총무팀</a></li>
																<li><a href="#" onclick="selectDept('A3', '재무회계팀')">재무회계팀</a></li>
															</ul>
														</div>
													</div>
												</div>
												<div class="card">
													<div class="card-header">
														<a class="collapsed card-link" data-toggle="collapse" href="#collapseTwo" onclick="selectDept('B', '영업지원본부')">영업지원본부 </a>
													</div>
													<div id="collapseTwo" class="collapse" data-parent="#accordion">
														<div class="card-body">
															<ul>
																<li><a href="#" onclick="selectDept('B1','영업팀')">영업팀</a></li>
																<li><a href="#" onclick="selectDept('B2','운영지원팀')">운영지원팀</a></li>
															</ul>
														</div>
													</div>
												</div>
												<div class="card">
													<div class="card-header">
														<a class="collapsed card-link" data-toggle="collapse" href="#collapseThree" onclick="selectDept('C','사업본부')">사업본부 </a>
													</div>
													<div id="collapseThree" class="collapse" data-parent="#accordion">
														<div class="card-body">
															<ul>
																<li><a href="#" onclick="selectDept('C1','디자인팀')">디자인팀</a></li>
																<li><a href="#" onclick="selectDept('C2','마케팅팀')">마케팅팀</a></li>
																<li><a href="#" onclick="selectDept('C3','IT개발팀')">IT개발팀</a></li>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- /.card-body -->
									</div>
									<!-- /.card -->
								</div>
								<!-- /.col -->
								<div class="col-md-10" style="overflow:auto; height: 450px">
									<table id="employeeTable" class="table table-sm">
									<caption style="caption-side:top">* 정렬 기준 : <span id="sortOption">전체</span></caption>
										<thead>
											<tr>
												<th style="width: 5%"><input type='checkbox' name='checkAll' id='checkAll' onclick="checkAll();"></th>
												<th style="width: 10%">사번</th>
												<th style="width: 20%">이름</th>
												<th style="width: 10%">직급</th>
												<th style="width: 10%">부서</th>
												<th style="width: 10%">내선번호</th>
												<th style="width: 20%">이메일</th>
												<th style="width: 15%"></th>
											</tr>
										</thead>
										<tbody>
										
											<c:forEach items="${ list }" var="employee">
							                    <tr>
							                    	<th><input type='checkbox' name='plusAddressBook' id='plusAddressBook' value="${ employee.empNo }"></th>
							                        <td data-toggle='modal' data-target='#detailEmployeeModal'onclick='detailEmployee("${ employee.empNo }");'>${ employee.empNo }</td>
							                        <td data-toggle='modal' data-target='#detailEmployeeModal'onclick='detailEmployee("${ employee.empNo }");'>${ employee.empName} ( ${employee.empEn} )</td>
							                        <td data-toggle='modal' data-target='#detailEmployeeModal'onclick='detailEmployee("${ employee.empNo }");'>${ employee.jobName }</td>
							                        <td data-toggle='modal' data-target='#detailEmployeeModal'onclick='detailEmployee("${ employee.empNo }");'>${ employee.deptDname }</td>
							                        <td data-toggle='modal' data-target='#detailEmployeeModal'onclick='detailEmployee("${ employee.empNo }");'>${ employee.empEphone }</td>
							                        <td data-toggle='modal' data-target='#detailEmployeeModal'onclick='detailEmployee("${ employee.empNo }");'>${ employee.empEmail }</td>
							                        <th>
							                        	<button id='sendMail' type='button' class='btn btn-default btn-xs' onclick="location.href='compose.ml'">메일발송</button>&nbsp;
							                        	<button id='workShare' type='button' class='btn btn-default btn-xs' onclick="location.href='sendFormView.ws'">업무공유</button>
							                        </th>
							                    </tr>
						                    </c:forEach>
										
										</tbody>
									</table>
								</div>
								<!-- /.col -->
							</div>
							<!-- /.row -->

						</div>

					<!-- card-footer -->
					<div class="card-footer">
						<div class="float-right">
							<button id="submitBtn" type="button" onclick="addOfficeAddressBookBtn();"
								class="btn btn-primary btn-sm">주소록 추가</button>
						</div>
					</div>
				</div>
				</div>
			</div>
		</section>
	</div>
	
	
	<!-- 직원 선택 시 뜨는 모달  -->
    <div class="modal fade" id="detailEmployeeModal">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header" id="modalTitleDiv">
					<img src="./resources/common/icon_gray.png">
					<img src="./resources/common/logoLetter_gray.png" style="margin: 2px; margin-left: 10px;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<form action="addOfficeAddressBook.adb" method="post">
					<!-- Modal Body -->
					<div class="modal-body">
						<div class="card bg-light d-flex flex-fill mb-0">
							<div class="card-body">
								<div class="row">
									<div class="col-2 text-center">
										<div id="employeePicDiv">
											
										</div>
										<div class="mt-3">
											<input type="hidden" id="addEmpNo" name="addEmpNo"/>
											<button type="submit" class="btn btn-primary btn-sm">주소록 추가</button>
										</div>
									</div>
									<div class="col-10">
										<table id="detailEmployeeTable" class="table table-sm"
											style="margin: 0px">
											<tr>
												<th>사번</th>
												<td id="empNoCol" style="width: 35%"></td>
												<th>이름</th>
												<td id="empNameCol" style="width: 35%"></td>
											</tr>
											<tr>
												<th>직급</th>
												<td id="empJobCol" style="width: 35%"></td>
												<th>영문이름</th>
												<td id="empEngNameCol" style="width: 35%"></td>
											</tr>
											<tr>
												<th>소속</th>
												<td id="empUDeptCol" style="width: 35%"></td>
												<th>부서</th>
												<td id="empDDeptCol" style="width: 35%"></td>
											</tr>
											<tr>
												<th>내선번호</th>
												<td id="empEphoneCol" style="width: 35%"></td>
												<th>상태</th>
												<td id="empStatusCol" style="width: 35%"></td>
											</tr>
											<tr>
												<th>이메일</th>
												<td colspan="3" id="empEmailCol" style="width: 70%"></td>
											</tr>
										</table>
									</div>

								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	
	<!-- 검색 -->
	<script>
		$(function() {
			switch ('${ optionType }') {
			case "allType":
				$("#optionType>option").eq(0).attr("selected", true);
				$("#searchInput").val("${ searchEmployee }");
				$("#sortOption").text("검색어 ( "+'${searchEmployee}'+" )");
				break;
			case "deptType":
				$("#deptTypeBlank").show();
				$("#deptTypeOption").show();
				$("#optionType>option").eq(1).attr("selected", true);
				
				switch ('${ deptTypeOption }') {
					case "A" :
						$("#deptTypeOption>option").eq(0).attr("selected", true);
						break;
					case "A1" :
						$("#deptTypeOption>option").eq(1).attr("selected", true);
						break;
					case "A2" :
						$("#deptTypeOption>option").eq(2).attr("selected", true);
						break;
					case "A3" :
						$("#deptTypeOption>option").eq(3).attr("selected", true);
						break;
					case "B" :
						$("#deptTypeOption>option").eq(4).attr("selected", true);
						break;
					case "B1" :
						$("#deptTypeOption>option").eq(5).attr("selected", true);
						break;
					case "B2" :
						$("#deptTypeOption>option").eq(6).attr("selected", true);
						break;
					case "C" :
						$("#deptTypeOption>option").eq(7).attr("selected", true);
						break;
					case "C1" :
						$("#deptTypeOption>option").eq(8).attr("selected", true);
						break;
					case "C2" :
						$("#deptTypeOption>option").eq(9).attr("selected", true);
						break;
					case "C3" :
						$("#deptTypeOption>option").eq(10).attr("selected", true);
						break;
				}
				$("#searchInput").val("${ searchEmployee }");
				$("#sortOption").text("검색어 ( "+'${searchEmployee}'+" )");
				break;
			case "empNoType":
				$("#optionType>option").eq(2).attr("selected", true);
				$("#searchInput").val("${ searchEmployee }");
				$("#sortOption").text("검색어 ( "+'${searchEmployee}'+" )");
				break;
			case "empNameType":
				$("#optionType>option").eq(3).attr("selected", true);
				$("#searchInput").val("${ searchEmployee }");
				$("#sortOption").text("검색어 ( "+'${searchEmployee}'+" )");
				break;
			case "ePhoneType":
				$("#optionType>option").eq(4).attr("selected", true);
				$("#searchInput").val("${ searchEmployee }");
				$("#sortOption").text("검색어 ( "+'${searchEmployee}'+" )");
				break;
			case "emailType":
				$("#optionType>option").eq(5).attr("selected", true);
				$("#searchInput").val("${ searchEmployee }");
				$("#sortOption").text("검색어 ( "+'${searchEmployee}'+" )");
				break;
			}
			
		})
	</script>
	
	<!-- select option 부서 선택시 -->
	<script>
		function deptSelect(selectOption){
			$("#searchInput").val("");
			
			switch (selectOption) {
			case "allType":
				$("#deptTypeBlank").hide();
				$("#deptTypeOption").hide();
				$("#searchInput").attr("placeholder","검색어를 입력하세요.");
				break;
			case "deptType":
				$("#deptTypeBlank").show();
				$("#deptTypeOption").show();
				$("#searchInput").attr("placeholder","이름을 입력하세요.");
				break;
			case "empNoType":
				$("#deptTypeBlank").hide();
				$("#deptTypeOption").hide();
				$("#searchInput").attr("placeholder","사번을 입력하세요.");
				break;
			case "empNameType":
				$("#deptTypeBlank").hide();
				$("#deptTypeOption").hide();
				$("#searchInput").attr("placeholder","이름을 입력하세요.");
				break;
			case "ePhoneType":
				$("#deptTypeBlank").hide();
				$("#deptTypeOption").hide();
				$("#searchInput").attr("placeholder","내선번호를 입력하세요.");
				break;
			case "emailType":
				$("#deptTypeBlank").hide();
				$("#deptTypeOption").hide();
				$("#searchInput").attr("placeholder","이메일을 입력하세요.");
				break;
			}
		}
	</script>
	
	<!-- 검색창 reset -->
	<script>
		function resetSearch(){
			$("#optionType>option").eq(0).attr("selected", true);
			$("#deptTypeBlank").hide();
			$("#deptTypeOption").hide();
			$("#searchInput").val("");
		}
	</script>
	
	<!-- 직원 이름 키워드 검색 -->
	<script>
		
		$(function() {
			$("#searchCategory>tbody>tr>th>h4>span").click(
			function() {
				var catTitle = $(this).text();
				
				resetSearch();
				
				if (catTitle == "ALL") {
					selectAllEmployee();
				} else if (catTitle >= 'ㄱ' && catTitle <= 'ㅎ') {
					$.ajax({
						url : "selectKorSortEmployee.or",
						type : "post",
						data : {
							catTitle : catTitle
						},
						success:function(list){
							var value="";
							var mailLocation = "onclick='location.href="+'"compose.ml"'+"'";
							var workLocation = "onclick='location.href="+'"sendFormView.ws"'+"'";
							$.each(list, function(i, obj){
								value +="<tr>"+
								"<th><input type='checkbox' name='plusAddressBook' id='plusAddressBook' value="+obj.empNo+"></th>" +
								"<td data-toggle='modal' data-target='#detailEmployeeModal'onclick='detailEmployee("+obj.empNo+");'>" + obj.empNo + "</td>" + 
								"<td data-toggle='modal' data-target='#detailEmployeeModal' onclick='detailEmployee("+obj.empNo+");'>" + obj.empName+" ( "+ obj.empEn + " ) " + "</td>" + 
								"<td data-toggle='modal' data-target='#detailEmployeeModal' onclick='detailEmployee("+obj.empNo+");'>" + obj.jobName + "</td>" +
								"<td data-toggle='modal' data-target='#detailEmployeeModal' onclick='detailEmployee("+obj.empNo+");'>" + obj.deptDname + "</td>" +
								"<td data-toggle='modal' data-target='#detailEmployeeModal' onclick='detailEmployee("+obj.empNo+");'>" + obj.empEphone + "</td>" +
								"<td data-toggle='modal' data-target='#detailEmployeeModal' onclick='detailEmployee("+obj.empNo+");'>" + obj.empEmail + "</td>" +
								"<th><button id='sendMail' type='button' class='btn btn-default btn-xs'"+mailLocation+">메일발송</button>&nbsp;&nbsp;<button id='workShare' type='button' class='btn btn-default btn-xs'"+workLocation +">업무공유</button></th>"+
								"</tr>";
							});
	
							$("#employeeTable>tbody").html(value);
							$("#sortOption").text(catTitle);
						},
						error:function(){
							console.log("직원 전체 검색 ajax 통신 실패")
						}
					})
				} else {
					$.ajax({
						url : "selectEngSortEmployee.or",
						type : "post",
						data : {
							catTitle : catTitle
						},
						success : function(list) {

							var value = "";
							var mailLocation = "onclick='location.href="+'"compose.ml"'+"'";
							var workLocation = "onclick='location.href="+'"sendFormView.ws"'+"'";
							$.each(list, function(i, obj) {
								value +="<tr>"+
								"<th><input type='checkbox' name='plusAddressBook' id='plusAddressBook' value="+obj.empNo+"></th>" +
								"<td data-toggle='modal' data-target='#detailEmployeeModal'onclick='detailEmployee("+obj.empNo+");'>" + obj.empNo + "</td>" + 
								"<td data-toggle='modal' data-target='#detailEmployeeModal' onclick='detailEmployee("+obj.empNo+");'>" + obj.empName+" ( "+ obj.empEn + " ) " + "</td>" + 
								"<td data-toggle='modal' data-target='#detailEmployeeModal' onclick='detailEmployee("+obj.empNo+");'>" + obj.jobName + "</td>" +
								"<td data-toggle='modal' data-target='#detailEmployeeModal' onclick='detailEmployee("+obj.empNo+");'>" + obj.deptDname + "</td>" +
								"<td data-toggle='modal' data-target='#detailEmployeeModal' onclick='detailEmployee("+obj.empNo+");'>" + obj.empEphone + "</td>" +
								"<td data-toggle='modal' data-target='#detailEmployeeModal' onclick='detailEmployee("+obj.empNo+");'>" + obj.empEmail + "</td>" +
								"<th><button id='sendMail' type='button' class='btn btn-default btn-xs'"+mailLocation+">메일발송</button>&nbsp;&nbsp;<button id='workShare' type='button' class='btn btn-default btn-xs'"+workLocation +">업무공유</button></th>"+
								"</tr>";
							});

							$("#employeeTable>tbody").html(value);
							$("#sortOption").text(catTitle);
						},
						error:function(){
							console.log("직원 전체 검색 ajax 통신 실패")
						}
					})
				}

			})
		})
	</script>
	
	<!-- 전체 검색 버튼 -->
	<script>
		function selectAllEmployee(){
			
			resetSearch();
			
			$.ajax({
				url: "selectAllEmployee.or",
				type: "post",
				success:function(list){
					
					var value="";
					var mailLocation = "onclick='location.href="+'"compose.ml"'+"'";
					var workLocation = "onclick='location.href="+'"sendFormView.ws"'+"'";
					$.each(list, function(i, obj){
						
						value +="<tr>"+
						"<th><input type='checkbox' name='plusAddressBook' id='plusAddressBook' value="+obj.empNo+"></th>" +
						"<td data-toggle='modal' data-target='#detailEmployeeModal'onclick='detailEmployee("+obj.empNo+");'>" + obj.empNo + "</td>" + 
						"<td data-toggle='modal' data-target='#detailEmployeeModal' onclick='detailEmployee("+obj.empNo+");'>" + obj.empName+" ( "+ obj.empEn + " ) " + "</td>" + 
						"<td data-toggle='modal' data-target='#detailEmployeeModal' onclick='detailEmployee("+obj.empNo+");'>" + obj.jobName + "</td>" +
						"<td data-toggle='modal' data-target='#detailEmployeeModal' onclick='detailEmployee("+obj.empNo+");'>" + obj.deptDname + "</td>" +
						"<td data-toggle='modal' data-target='#detailEmployeeModal' onclick='detailEmployee("+obj.empNo+");'>" + obj.empEphone + "</td>" +
						"<td data-toggle='modal' data-target='#detailEmployeeModal' onclick='detailEmployee("+obj.empNo+");'>" + obj.empEmail + "</td>" +
						"<th><button id='sendMail' type='button' class='btn btn-default btn-xs'"+mailLocation+">메일발송</button>&nbsp;&nbsp;<button id='workShare' type='button' class='btn btn-default btn-xs'"+workLocation +">업무공유</button></th>"+
						"</tr>";
					});
					
					$("#employeeTable>tbody").html(value);
					$("#sortOption").text("전체");
				},
				error:function(){
					console.log("직원 전체 검색 ajax 통신 실패")
				}
			})
		} 
	</script>
	
	<!-- 부서검색 연결 -->
	<script>
		function selectDept(deptCode, deptName){
			
			resetSearch();
			
			$.ajax({
				url: "selectDeptEmployee.or",
				type: "post",
				data: {
					deptCode:deptCode
				},
				success:function(list){
					var value="";
					var mailLocation = "onclick='location.href="+'"compose.ml"'+"'";
					var workLocation = "onclick='location.href="+'"sendFormView.ws"'+"'";
					$.each(list, function(i, obj){
						value +="<tr>"+
						"<th><input type='checkbox' name='plusAddressBook' id='plusAddressBook' value="+obj.empNo+"></th>" +
						"<td data-toggle='modal' data-target='#detailEmployeeModal'onclick='detailEmployee("+obj.empNo+");'>" + obj.empNo + "</td>" + 
						"<td data-toggle='modal' data-target='#detailEmployeeModal' onclick='detailEmployee("+obj.empNo+");'>" + obj.empName+" ( "+ obj.empEn + " ) " + "</td>" + 
						"<td data-toggle='modal' data-target='#detailEmployeeModal' onclick='detailEmployee("+obj.empNo+");'>" + obj.jobName + "</td>" +
						"<td data-toggle='modal' data-target='#detailEmployeeModal' onclick='detailEmployee("+obj.empNo+");'>" + obj.deptDname + "</td>" +
						"<td data-toggle='modal' data-target='#detailEmployeeModal' onclick='detailEmployee("+obj.empNo+");'>" + obj.empEphone + "</td>" +
						"<td data-toggle='modal' data-target='#detailEmployeeModal' onclick='detailEmployee("+obj.empNo+");'>" + obj.empEmail + "</td>" +
						"<th><button id='sendMail' type='button' class='btn btn-default btn-xs'"+mailLocation+">메일발송</button>&nbsp;&nbsp;<button id='workShare' type='button' class='btn btn-default btn-xs'"+workLocation +">업무공유</button></th>"+
						"</tr>";
					});
					$("#employeeTable>tbody").html(value);
					$("#sortOption").text(deptName);
				},
				error:function(){
					console.log("직원 부서별 검색 ajax 통신 실패")
				}
			})
			
		}
	</script>
	
	<!-- 직원 상세 정보 -->
	<script>
		function detailEmployee(empNo){
			
			$.ajax({
				url:"searchEmployeeDetail.or",
				data:{empNo:empNo},
				type:"post",
				dataType:"json",
				success:function(emp){
					console.log(emp.empName+" 사원 직원정보 ajax 통신 성공")
					
					var value=""
					
					if(emp.empOrgPic==null){
						value = '<img src="./resources/empImg/defaultImg.jpg" alt="등록된 사진이 없습니다." class="img-fluid" style="width: 90px; height: 120px;">'
					}else{
						value= '<img src="./resources/idPhoto_files/'+emp.empChgPic+'" class="img-fluid" style="width: 90px; height: 120px;">'
					}
					
					$("#employeePicDiv").html(value)
					$("#empNoCol").text(emp.empNo)
					$("#empNameCol").text(emp.empName)
					$("#empEngNameCol").text(emp.empEn)
					$("#empUDeptCol").text(emp.deptUname)
					$("#empDDeptCol").text(emp.deptDname)
					$("#empJobCol").text(emp.jobName)
					$("#empStatusCol").text(emp.psStatus)
					$("#empEphoneCol").text(emp.empEphone)
					$("#empEmailCol").text(emp.empEmail)
					
					$("#addEmpNo").val(emp.empNo)
				},
				error:function(){
					console.log("직원 부서별 검색 ajax 통신 실패")
				}
			})
		}
	</script>
	
	<!-- footer 사내 주소록 추가 버튼 -->
	<script>
		function addOfficeAddressBookBtn(){
			const checkList = [];
			
			$("input[name='plusAddressBook']:checked").each(function(){
				const checkEmpNo = $(this).val();
				checkList.push(checkEmpNo);
			});

			location.href="addOfficeAddressBookArr.adb?checkList="+checkList;
			
		}
	</script>
	 
	<!-- 전체 제크 -->
	<script>
		function checkAll(){
			if($("input[name='checkAll']").prop("checked")){
				$("input[name='plusAddressBook']").prop("checked", true)
			}else{
				$("input[name='plusAddressBook']").prop("checked", false)
			}
		}
	</script>
</body>
</html>