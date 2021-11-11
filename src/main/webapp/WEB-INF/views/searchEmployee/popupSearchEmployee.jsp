<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 검색</title>
	<!-- Google Font: Source Sans Pro -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="./resources/plugins/fontawesome-free/css/all.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="./resources/dist/css/adminlte.min.css">
	<!-- overlayScrollbars -->
	<link rel="stylesheet" href="./resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
	<script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>
	<!-- 스크립트 모음 -->
	<!-- jQuery -->
	<script src="./resources/plugins/jquery/jquery.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="./resources/plugins/jquery-ui/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
	  $.widget.bridge('uibutton', $.ui.button)
	</script>
	<!-- Bootstrap 4 -->
	<script src="./resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- overlayScrollbars -->
	<script src="./resources/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	<!-- AdminLTE App -->
	<script src="./resources/dist/js/adminlte.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="./resources/dist/js/demo.js"></script>
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

	<!-- Content Wrapper. Contains page content -->
	<div class="content m-3">

		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-12">
				
					<div class="card card-outline card-info mb-0">

						<div class="card-header text-center">
							<h6 style="margin-bottom: 0px">
								<b>직원 검색</b>
							</h6>
						</div>


						<div class="card-body">
							<div class="row">
								<div class="col-9">
									<div class="card mb-0">
										<div class="card-body">
											<div class="card">
												<div class="card-body">
													<div class="card" style="margin-bottom: 0px;">
														<table id="searchEmpTable">
															<tr>
																<th>키워드</th>
																<td>
																	<table id="searchCategory"
																		class="table table-borderless table-sm"
																		style="margin: auto; width: 98%">
																		<tbody>
																			<tr>
																				<th><h4>
																						<span class="badge badge-light" style="width: 100%">ALL</span>
																					</h4></th>
																				<th><h4>
																						<span class="badge badge-light" style="width: 100%">ㄱ</span>
																					</h4></th>
																				<th><h4>
																						<span class="badge badge-light" style="width: 100%">ㄴ</span>
																					</h4></th>
																				<th><h4>
																						<span class="badge badge-light" style="width: 100%">ㄷ</span>
																					</h4></th>
																				<th><h4>
																						<span class="badge badge-light" style="width: 100%">ㄹ</span>
																					</h4></th>
																				<th><h4>
																						<span class="badge badge-light" style="width: 100%">ㅁ</span>
																					</h4></th>
																				<th><h4>
																						<span class="badge badge-light" style="width: 100%">ㅂ</span>
																					</h4></th>
																				<th><h4>
																						<span class="badge badge-light" style="width: 100%">ㅅ</span>
																					</h4></th>
																				<th><h4>
																						<span class="badge badge-light" style="width: 100%">ㅇ</span>
																					</h4></th>
																				<th><h4>
																						<span class="badge badge-light" style="width: 100%">ㅈ</span>
																					</h4></th>
																			</tr>
																			<tr>
																				<th><h4>
																						<span class="badge badge-light" style="width: 100%">ㅊ</span>
																					</h4></th>
																				<th><h4>
																						<span class="badge badge-light" style="width: 100%">ㅋ</span>
																					</h4></th>
																				<th><h4>
																						<span class="badge badge-light" style="width: 100%">ㅌ</span>
																					</h4></th>
																				<th><h4>
																						<span class="badge badge-light" style="width: 100%">ㅍ</span>
																					</h4></th>
																				<th><h4>
																						<span class="badge badge-light" style="width: 100%">ㅎ</span>
																					</h4></th>
																				<th><h4>
																						<span class="badge badge-light" style="width: 100%">A ~ E</span>
																					</h4></th>
																				<th><h4>
																						<span class="badge badge-light" style="width: 100%">F ~ J</span>
																					</h4></th>
																				<th><h4>
																						<span class="badge badge-light" style="width: 100%">K ~ O</span>
																					</h4></th>
																				<th><h4>
																						<span class="badge badge-light" style="width: 100%">P ~ T</span>
																					</h4></th>
																				<th><h4>
																						<span class="badge badge-light" style="width: 100%">U ~ Z</span>
																					</h4></th>
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
																	<form action="popupSearchEmployee.or">
																		<div class="row" style="margin-left: 0px;">
																			&nbsp;&nbsp;
																			<button id="allEmployeeSearchBtn" type="button"
																				class="btn btn-default btn-sm"
																				onclick="selectAllEmployee();">전체검색</button>
																			&nbsp;&nbsp; <select id="optionType"
																				name="optionType"
																				class="custom-select custom-select-sm"
																				style="width: 10%;"
																				onchange="deptSelect(this.value);">
																				<option value="allType">전체</option>
																				<option value="deptType">부서</option>
																				<option value="empNoType">사번</option>
																				<option value="empNameType">이름</option>
																				<option value="ePhoneType">내선번호</option>
																				<option value="emailType">이메일</option>
																			</select> <span id="deptTypeBlank" style="display: none">&nbsp;&nbsp;</span>
																			<select id="deptTypeOption" name="deptTypeOption"
																				class="custom-select custom-select-sm"
																				style="width: 15%; display: none">
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
																			</select> &nbsp;&nbsp;
																			<div class="input-group" style="width: 30%;">
																				<input type="search" id="searchInput"
																					class="form-control form-control-sm"
																					placeholder="검색어를 입력하세요." name="searchEmployee"
																					value="${ search }">
																				<div class="input-group-append">
																					<button type="submit"
																						class="btn btn-sm btn-default">
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
												<div class="col-3">
													<div class="card">
														<div class="card-header">
															<h3 class="card-title">HelloWorks</h3>
														</div>
														<div class="card-body">
															<div id="accordion">
																<div class="card">
																	<div class="card-header">
																		<a class="card-link" data-toggle="collapse"
																			href="#collapseOne"
																			onclick="selectDept('A','경영지원본부')">경영지원본부 </a>
																	</div>
																	<div id="collapseOne" class="collapse"
																		data-parent="#accordion">
																		<div class="card-body">
																			<ul>
																				<li><a href="#"
																					onclick="selectDept('A1','인사팀')">인사팀</a></li>
																				<li><a href="#"
																					onclick="selectDept('A2', '총무팀')">총무팀</a></li>
																				<li><a href="#"
																					onclick="selectDept('A3', '재무회계팀')">재무회계팀</a></li>
																			</ul>
																		</div>
																	</div>
																</div>
																<div class="card">
																	<div class="card-header">
																		<a class="collapsed card-link" data-toggle="collapse"
																			href="#collapseTwo"
																			onclick="selectDept('B', '영업지원본부')">영업지원본부 </a>
																	</div>
																	<div id="collapseTwo" class="collapse"
																		data-parent="#accordion">
																		<div class="card-body">
																			<ul>
																				<li><a href="#"
																					onclick="selectDept('B1','영업팀')">영업팀</a></li>
																				<li><a href="#"
																					onclick="selectDept('B2','운영지원팀')">운영지원팀</a></li>
																			</ul>
																		</div>
																	</div>
																</div>
																<div class="card">
																	<div class="card-header">
																		<a class="collapsed card-link" data-toggle="collapse"
																			href="#collapseThree"
																			onclick="selectDept('C','사업본부')">사업본부 </a>
																	</div>
																	<div id="collapseThree" class="collapse"
																		data-parent="#accordion">
																		<div class="card-body">
																			<ul>
																				<li><a href="#"
																					onclick="selectDept('C1','디자인팀')">디자인팀</a></li>
																				<li><a href="#"
																					onclick="selectDept('C2','마케팅팀')">마케팅팀</a></li>
																				<li><a href="#"
																					onclick="selectDept('C3','IT개발팀')">IT개발팀</a></li>
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
												<div class="col-md-9" style="overflow: auto; height: 380px">
													<table id="employeeTable" class="table table-sm">
														<caption style="caption-side: top">
															* 정렬 기준 : <span id="sortOption">전체</span>
														</caption>
														<thead>
															<tr>
																<th style="width: 5%"><input type='checkbox'
																	name='checkAll' id='checkAll' onclick="checkAll();"></th>
																<th style="width: 10%">사번</th>
																<th style="width: 20%">이름</th>
																<th style="width: 10%">직급</th>
																<th style="width: 10%">부서</th>
															</tr>
														</thead>
														<tbody>

															<c:forEach items="${ list }" var="employee">
																<c:if test="${employee.empNo ne loginUser.empNo }">
																<tr>
																	<th><input type='checkbox' name='plusAddressBook'
																		id='plusAddressBook' value="${ employee.empNo }+${employee.empName}"></th>
																	<td>${ employee.empNo }</td>
																	<td>${ employee.empName}( ${employee.empEn} )</td>
																	<td>${ employee.jobName }</td>
																	<td >${ employee.deptDname }</td>
																</tr>
																</c:if>
															</c:forEach>

														</tbody>
													</table>
												</div>
												<!-- /.col -->
											</div>
											<!-- /.row -->
											</div>
										</div>
									</div>



									<div class="col-1">
										<div class="row" style="height: 50%">
											<div class="col-12 align-self-center text-center">
												<button type="button" class="btn btn-primary btn-xs"
													onclick="addReceiveListBtn();">추가</button>
												<br>
												<button type="button" class="btn btn-danger btn-xs"
													onclick="delReceiveListBtn();">삭제</button>
											</div>
										</div>
										<div class="row" style="height: 50%">
											<div class="col-12 align-self-center text-center">
												<button type="button" class="btn btn-primary btn-xs"
													onclick="addRefBtn();">추가</button>
												<br>
												<button type="button" class="btn btn-danger btn-xs"
													onclick="delRefBtn();">삭제</button>
											</div>
										</div>
									</div>


									<div class="col-2">
										<div class="row" style="height: 50%">
											<div class="col-12 mb-2 card">
												<div class="card-header text-center">
													<b>수신 직원</b>
												</div>
												<div class="card-body pr-1 pl-1 pt-2 pb-2">
													<div style="overflow: auto; height: 235px">
														<table id="receiveTable"
															class="table table-bordered table-sm mb-0 text-center">
															<tbody>
																<c:forEach items="${ addReceiveList }" var="addReceiveList">
																	<tr>
																		<td><input type="checkbox" id="delReceiveList"
																			name="delReceiveList" value="${ addReceiveList }"></td>
																		<td><input type="hidden" id="addReceiveListKey" name="addReceiveListKey" value="${ addReceiveList.key }">${ addReceiveList.key }</td>
																		<td>${ addReceiveList.value }</td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>

										<div class="row" style="height: 50%">
											<div class="col-12 mt-2 mb-0 card">
												<div class="card-header text-center">
													<b>참조 직원</b>
												</div>
												<div class="card-body pr-1 pl-1 pt-2 pb-2">
													<div style="overflow: auto; height: 235px">
														<table id="refTable"
															class="table table-bordered table-sm mb-0 text-center">
															<tbody>
																<c:forEach items="${ addRefList }" var="addRefList">
																	<tr>
																		<td><input type="checkbox" id="delRefList" name="delRefList" value="${ addRefList }"></td>
																		<td><input type="hidden" id="addRefListKey" name="addRefListKey" value="${ addRefList.key }">${ addRefList.key }</td>
																		<td>${ addRefList.value }</td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>



								<!-- card-footer -->
							<div class="card-footer">
								<div class="float-right">
									<button id="submitBtn" type="button" onclick="saveListSubmit();"
										class="btn btn-primary btn-sm">저장하기</button>
								</div>
							</div>
						</div>
						</div>
					</div>
				</section>
			</div>
	 
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
							$.each(list, function(i, obj){
								
								if(obj.empNo != ${loginUser.empNo}){
								value +="<tr>"+
								"<th><input type='checkbox' name='plusAddressBook' id='plusAddressBook' value="+"'"+obj.empNo+"+"+obj.empName+"'"+"></th>" +
								"<td>" + obj.empNo + "</td>" + 
								"<td>" + obj.empName+" ( "+ obj.empEn + " ) " + "</td>" + 
								"<td>" + obj.jobName + "</td>" +
								"<td>" + obj.deptDname + "</td>" +
								"</tr>";
								}
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

							$.each(list, function(i, obj) {
								if(obj.empNo != ${loginUser.empNo}){
								value +="<tr>"+
								"<th><input type='checkbox' name='plusAddressBook' id='plusAddressBook' value="+"'"+obj.empNo+"+"+obj.empName+"'"+"></th>" +
								"<td>" + obj.empNo + "</td>" + 
								"<td>" + obj.empName+" ( "+ obj.empEn + " ) " + "</td>" + 
								"<td>" + obj.jobName + "</td>" +
								"<td>" + obj.deptDname + "</td>" +
								"</tr>";
								}
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
					
					$.each(list, function(i, obj){
						if(obj.empNo != ${loginUser.empNo}){
						value +="<tr>"+
						"<th><input type='checkbox' name='plusAddressBook' id='plusAddressBook' value="+"'"+obj.empNo+"+"+obj.empName+"'"+"></th>" +
						"<td>" + obj.empNo + "</td>" + 
						"<td>" + obj.empName+" ( "+ obj.empEn + " ) " + "</td>" + 
						"<td>" + obj.jobName + "</td>" +
						"<td>" + obj.deptDname + "</td>" +
						"</tr>";
						}
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
					var setempNo = "";
					var setempName = "";
					
					$.each(list, function(i, obj){
						if(obj.empNo != ${loginUser.empNo}){
						value +="<tr>"+
						"<th><input type='checkbox' name='plusAddressBook' id='plusAddressBook' value="+"'"+obj.empNo+"+"+obj.empName+"'"+"></th>" +
						"<td>" + obj.empNo + "</td>" + 
						"<td>" + obj.empName+" ( "+ obj.empEn + " ) " + "</td>" + 
						"<td>" + obj.jobName + "</td>" +
						"<td>" + obj.deptDname + "</td>" +
						"</tr>";
						}
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
	
	<!-- checkBox 수신직원 추가 -->
	<script>
		function addReceiveListBtn(){
			var receiveList = [];
			
			$("input[name='plusAddressBook']:checked").each(function(){
				let checkEmpNo = $(this).val();
				receiveList.push(checkEmpNo);
			});
			location.href="popupAddReceiveList.or?receiveList="+receiveList;
		}
	</script>
	
	<!-- checkBox 수신직원 삭제 -->
	<script>
		function delReceiveListBtn(){
			var receiveList = [];
			
			$("input[name='delReceiveList']:checked").each(function(){
				let checkEmpNo = $(this).val();
				receiveList.push(checkEmpNo);
			});
			location.href="popupDelReceiveList.or?receiveList="+receiveList;
		}
	</script>
	
	<!-- checkBox 참조직원 추가 -->
	<script>
		function addRefBtn(){
			var refList = [];
			
			$("input[name='plusAddressBook']:checked").each(function(){
				let checkEmpNo = $(this).val();
				refList.push(checkEmpNo);
			});
			location.href="popupAddRefList.or?refList="+refList;
		}
	</script>
	
	<!-- checkBox 참조직원 삭제 -->
	<script>
		function delRefBtn(){
			var refList = [];
			
			$("input[name='delRefList']:checked").each(function(){
				let checkEmpNo = $(this).val();
				refList.push(checkEmpNo);
			});
			location.href="popupDelRefList.or?refList="+refList;
		}
	</script>
	
	<!-- 저장하기 버튼 -->
	<script>
		function saveListSubmit(){
			
			var receiveList = [];
			var receiveListVal = ""
			$("input[name='delReceiveList']").each(function(){
				let checkEmpNo = $(this).val();
				receiveList.push(" "+checkEmpNo);
				
				receiveListVal += "<b><span class='badge badge-info'>"+checkEmpNo+"</span></b> "
			});
			
			var refList = [];
			var refListVal = ""
			$("input[name='delRefList']").each(function(){
				let checkEmpNo = $(this).val();
				refList.push(" "+checkEmpNo);
				
				refListVal += "<b><span class='badge badge-warning'>"+checkEmpNo+"</span></b> "

			});
			
			
			var receiveListKey = [];
			
			$("input[name='addReceiveListKey']").each(function(){
				let checkEmpNo = $(this).val();
				receiveListKey.push(checkEmpNo);
			});
			
			var refListKey = [];
			
			$("input[name='addRefListKey']").each(function(){
				let checkEmpNo = $(this).val();
				refListKey.push(checkEmpNo);
			});
			receiveListVal += '<input type="hidden" id="receiveListKey" name="drReceiverList" value="'+receiveListKey+'">';
			refListVal += '<input type="hidden" id="refListKeyTag" name="drRefList" value="'+refListKey+'">';
			
			$("#receiveListDiv", opener.document).html(receiveListVal);
			$("#refListDiv", opener.document).html(refListVal);
			
			$("input[name='checking']", opener.document).val("1");
			window.close();

		}
	
	</script>

</body>
</html>