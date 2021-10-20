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
	/* #searchCategory>tfoot>tr>th {
		background-color: #DAE1E7;
		width: 10%;
		text-align: center !important;
	} */
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
												<div class="row" style="margin-left: 0px;">
														&nbsp;&nbsp;
														<button id="allEmployeeSearchBtn" type="button" class="btn btn-default btn-sm" onclick="selectAllEmployee();">전체검색</button>
														&nbsp;&nbsp;
														<!-- <form action="searchEmployee.or"> -->
															<select name="optionType" class="custom-select custom-select-sm" style="width: 15%;">
																<option value="allType">전체</option>
																<option value="deptType">부서</option>
																<option value="empNoType">사번</option>
																<option value="empNameType">이름</option>
																<option value="ePhoneType">내선번호</option>
																<option value="emailType">이메일</option>
															</select>
															<div class="col-4">
																<form action="#">
																<div class="input-group">
																	<input type="search"
																		class="form-control form-control-sm"
																		placeholder="검색어를 입력하세요." name="searchEmployee" value="${ searchEmployee }">
																	<div class="input-group-append">
																		<button type="submit" class="btn btn-sm btn-default">
																			<i class="fa fa-search"></i>
																		</button>
																	</div>
																</div>
															</form>
														</div>
													</div>
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
									<caption style="caption-side:top">정렬 기준 : <span id="sortOption"></span></caption>
										<thead>
											<tr>
												<th style="width: 5%"></th>
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
							<button id="submitBtn" type="button"
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
            <div class="modal-header">
                <h4 class="modal-title">직원 상세보기</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button> 
            </div>

            <form action="searchEmployeeDetail.or" method="post">
                <!-- Modal Body -->
                <div class="modal-body">
                	여기에 직원 상세 정보 넣기!
                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary btn-sm">주소록 등록하기</button>
                    <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">취소</button>
                </div>
            </form>
            </div>
        </div>
    </div>
	
	
	

	<!-- 검색 -->
	<script>
		$(function() {
			switch ('${ optionType }') {
			case "allType":
				$("#searchEmpTable option").eq(0).attr("selected", true);
				break;
			case "empNoType":
				$("#searchEmpTable option").eq(1).attr("selected", true);
				break;
			case "content":
				$("#searchEmpTable option").eq(2).attr("selected", true);
				break;
			}
		})
	</script>




	<!-- 직원 이름 키워드 검색 -->
	<script>
	$(function(){
		$("#searchCategory>tbody>tr>th>h4>span").click(function(){
			var catTitle = $(this).text();
			
			//console.log(catTitle);
			
			if(catTitle == "ALL"){
				selectAllEmployee();
			}else if(catTitle >= 'ㄱ' && catTitle <='ㅎ'){
				//console.log(catTitle);
				$.ajax({
					url: "selectKorSortEmployee.or",
					type: "post",
					data: {
						catTitle:catTitle
					},
					success:function(list){
						
						var value="";
						
						$.each(list, function(i, obj){
							
							value +="<tr data-toggle='modal' data-target='#detailEmployeeModal'>"+
									"<td><input type='checkbox' name='plusAddressBook' id='plusAddressBook'></td>" +
									"<td>" + obj.empNo + "</td>" + 
									"<td>" + obj.empName+" ( "+ obj.empEn + " ) " + "</td>" + 
									"<td>" + obj.jobName + "</td>" +
									"<td>" + obj.deptDname + "</td>" +
									"<td>" + obj.empEphone + "</td>" +
									"<td>" + obj.empEmail + "</td>" +
									"<td><button id='sendMail' type='button' class='btn btn-default btn-xs'>메일발송</button><button id='workShare' type='button' class='btn btn-default btn-xs'>업무공유</button></td>"+
									"</tr>";
						});
						
						$("#employeeTable>tbody").html(value);
						$("#sortOption").text(catTitle);
					},
					error:function(){
						console.log("직원 전체 검색 ajax 통신 실패")
					}
				})
			}else{
				$.ajax({
					url: "selectEngSortEmployee.or",
					type: "post",
					data: {
						catTitle:catTitle
					},
					success:function(list){
						
						var value="";
						
						$.each(list, function(i, obj){
							
							value +="<tr data-toggle='modal' data-target='#detailEmployeeModal'>"+
									"<td><input type='checkbox' name='plusAddressBook' id='plusAddressBook'></td>" +
									"<td>" + obj.empNo + "</td>" + 
									"<td>" + obj.empName+" ( "+ obj.empEn + " ) " + "</td>" + 
									"<td>" + obj.jobName + "</td>" +
									"<td>" + obj.deptDname + "</td>" +
									"<td>" + obj.empEphone + "</td>" +
									"<td>" + obj.empEmail + "</td>" +
									"<td><button id='sendMail' type='button' class='btn btn-default btn-xs'>메일발송</button><button id='workShare' type='button' class='btn btn-default btn-xs'>업무공유</button></td>"+
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
			$.ajax({
				url: "selectAllEmployee.or",
				type: "post",
				success:function(list){
					
					var value="";
					
					$.each(list, function(i, obj){
						
						value +="<tr data-toggle='modal' data-target='#detailEmployeeModal'>"+
								"<td><input type='checkbox' name='plusAddressBook' id='plusAddressBook'></td>" +
								"<td>" + obj.empNo + "</td>" + 
								"<td>" + obj.empName+" ( "+ obj.empEn + " ) " + "</td>" + 
								"<td>" + obj.jobName + "</td>" +
								"<td>" + obj.deptDname + "</td>" +
								"<td>" + obj.empEphone + "</td>" +
								"<td>" + obj.empEmail + "</td>" +
								"<td><button id='sendMail' type='button' class='btn btn-default btn-xs'>메일발송</button><button id='workShare' type='button' class='btn btn-default btn-xs'>업무공유</button></td>"+
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
			
			$.ajax({
				url: "selectDeptEmployee.or",
				type: "post",
				data: {
					deptCode:deptCode
				},
				success:function(list){
					var value="";
					$.each(list, function(i, obj){
						value +="<tr data-toggle='modal' data-target='#detailEmployeeModal'>"+
						"<th><input type='checkbox' name='plusAddressBook' id='plusAddressBook'></th>" +
						"<td>" + obj.empNo + "</td>" + 
						"<td>" + obj.empName+" ( "+ obj.empEn + " ) " + "</td>" + 
						"<td>" + obj.jobName + "</td>" +
						"<td>" + obj.deptDname + "</td>" +
						"<td>" + obj.empEphone + "</td>" +
						"<td>" + obj.empEmail + "</td>" +
						"<th><button id='sendMail' type='button' class='btn btn-default btn-xs'>메일발송</button><button id='workShare' type='button' class='btn btn-default btn-xs'>업무공유</button></th>"+
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
	
</body>
</html>