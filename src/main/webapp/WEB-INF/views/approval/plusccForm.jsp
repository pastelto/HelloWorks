<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수신자 등록</title>
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
	#applineTable {
		text-align: center;
	}
	#addLine, .btn* {
		font-size : 0.6em;
		
	}
</style>
</head>
<body>
	<div id="hiddenDiv" style="display:none">
	<jsp:include page="../common/menubar.jsp" />
	</div>	
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-6">

						<h4>
							<b>수신자 등록</b>
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
								<b>수신자 등록</b>
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
																<li>
																	<a href="#" onclick="selectDept('A1','인사팀')">인사팀</a>
																	<button type='button' class='btn btn-primary btn-xs' onclick='plus("A1", "인사팀");'>+</button>
																</li>
																<li>
																	<a href="#" onclick="selectDept('A2', '총무팀')">총무팀</a>
																	<button type='button' class='btn btn-primary btn-xs' onclick='plus("A2", "총무팀");'>+</button>
																</li>
																<li>
																	<a href="#" onclick="selectDept('A3', '재무회계팀')">재무회계팀</a>
																	<button type='button' class='btn btn-primary btn-xs' onclick='plus("A3", "재무회계팀");'>+</button>
																</li>
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
																<li>
																	<a href="#" onclick="selectDept('B1','영업팀')">영업팀</a>
																	<button type='button' class='btn btn-primary btn-xs' onclick='plus("B1", "영업팀");'>+</button>
																</li>
																<li>
																	<a href="#" onclick="selectDept('B2','운영지원팀')">운영지원팀</a>
																	<button type='button' class='btn btn-primary btn-xs' onclick='plus("B2", "운영지원팀");'>+</button>	
																</li>
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
																<li>
																	<a href="#" onclick="selectDept('C1','디자인팀')">디자인팀</a>
																	<button type='button' class='btn btn-primary btn-xs' onclick='plus("C1", "디자인팀");'>+</button>
																</li>
																<li>
																	<a href="#" onclick="selectDept('C2','마케팅팀')">마케팅팀</a>
																	<button type='button' class='btn btn-primary btn-xs' onclick='plus("C2", "마케팅팀");'>+</button>
																</li>
																<li>
																	<a href="#" onclick="selectDept('C3','IT개발팀')">IT개발팀</a>
																	<button type='button' class='btn btn-primary btn-xs' onclick='plus("C3", "IT개발팀");'>+</button>
																</li>
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
											</tr>
										</thead>
										<tbody>
											<tr>
												<th style="width: 5%"></th>
												<th style="width: 10%"></th>
												<th style="width: 20%"></th>
												<th style="width: 10%"></th>
												<th style="width: 10%"></th>
											</tr>
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
						</div>
					</div>
				</div>
				</div>
			</div>
		</section>
	</div>
	
	
	<!-- 결재 페이지 연결-->	
	<script>
		
		var no;
	
		function _GET(search) {
			var obj = {};
			var uri = decodeURI(search);
				uri = uri.slice(1,uri.length);
				
			var param = uri.split('&');
			
			for(var i=0; i<param.length; i++){		
				var devide = param[i].split('=');
				obj[devide[0]] = devide[1];
			}
			
			return obj;
		}
		
		window.onload = function(){
			
			var search = window.location.search;
			var getData = _GET(search);
			no = getData.val;
			
			console.log(no)
		}
		
		
		function plus(num, name){
			
			console.log(num, name);	
			
			if(${loginUser.empNo} == num) {
			
				alert("본인은 등록할 수 없습니다.");
				
			}else {
					if(no == 1){
				
					window.opener.document.getElementById("ccName1").value = name;
					window.opener.document.getElementById("ccCode1").value = num;
					
					window.close();
					
					} else if (no == 2){
						window.opener.document.getElementById("ccName2").value = name;
						window.opener.document.getElementById("ccCode2").value = num;
						
						window.close();
						
					} else if (no == 3){
						window.opener.document.getElementById("ccName3").value = name;
						window.opener.document.getElementById("ccCode3").value = num;
						
						window.close();
						
					} else if (no == 4){
						window.opener.document.getElementById("ccName4").value = name;
						window.opener.document.getElementById("ccCode4").value = num;
						
						window.close();
					}
			}
			
		};
					
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
							
							value +="<tr>"+
							"<td>"+"<button type='button'"+"class='btn btn-primary btn-sm'"+" onclick='plus("+obj.empNo+ ',"'+ obj.empName+'");'+"'"+">+</button>"+"</td>" +
									"<td>" + obj.empNo + "</td>" + 
									"<td>" + obj.empName + "</td>" + 
									"<td>" + obj.jobName + "</td>" +
									"<td>" + obj.deptDname + "</td>" +								
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
							
							value +="<tr>"+
							"<td>"+"<button type='button'"+"class='btn btn-primary btn-sm'"+" onclick='plus("+obj.empNo+ ',"'+ obj.empName+'");'+"'"+">+</button>"+"</td>" +
									"<td>" + obj.empNo + "</td>" + 
									"<td>" + obj.empName + "</td>" + 
									"<td>" + obj.jobCode + "</td>" +
									"<td>" + obj.deptCode + "</td>" +					
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
						
						value +="<tr>"+
						"<td>"+"<button type='button'"+"class='btn btn-primary btn-sm'"+" onclick='plus("+obj.empNo+ ',"'+ obj.empName+'");'+"'"+">+</button>"+"</td>"  +
								"<td>" + obj.empNo + "</td>" + 
								"<td>" + obj.empName + "</td>" + 
								"<td>" + obj.jobCode + "</td>" +
								"<td>" + obj.deptCode + "</td>" +					
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
						value +="<tr>"+
						"<td>"+"<button type='button'"+"class='btn btn-primary btn-sm'"+" onclick='plus("+obj.empNo+ ',"'+ obj.empName+'");'+"'"+">+</button>"+"</td>" +
						"<td>" + obj.empNo + "</td>" + 
						"<td>" + obj.empName + "</td>" + 
						"<td>" + obj.jobCode + "</td>" +
						"<td>" + obj.deptCode + "</td>" +						
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
	<!-- 스크립트 모음 -->
</body>
</html>