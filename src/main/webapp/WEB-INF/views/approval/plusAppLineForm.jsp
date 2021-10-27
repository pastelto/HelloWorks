<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재라인 추가</title>
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
							<b>결재라인 추가</b>
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
								<b>결재라인 추가</b>
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
								<div  class="col-md-10"> 
									<div class="btn_line" align="right">
										<button type="button" class="btn btn-danger btn-sm" id="deleteLineBtn"onclick="deleteLine();">취소</button>
									</div>
									<table id="applineTable" class="table table-sm" ">
										<thead>
											<tr >
												<td style="width:20%">${loginUser.jobName}</th>
												<td style="width:20%"></th>
												<td style="width:20%"></th>
												<td style="width:20%"></th>
												<td style="width:20%"></th>
											</tr>
										</thead>
										<tbody>
											<tr >
												<td style="width:20%">${loginUser.empNo}</td>
												<td style="width:20%"></td>
												<td style="width:20%"></td>
												<td style="width:20%"></td>
												<td style="width:20%"></td>
											</tr>										
										</tbody>
										<tfoot>
											<tr >
												<td style="width:20%">${loginUser.empName}</td>
												<td style="width:20%"></td>
												<td style="width:20%"></td>
												<td style="width:20%"></td>
												<td style="width:20%"></td>
											</tr>	
										</tfoot>
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
								class="btn btn-default btn-sm" onclick="backApp();">+ 결재라인 추가</button>
						</div>
					</div>
				</div>
				</div>
			</div>
		</section>
	</div>
	
	
	<!-- 결재라인 테이블에 붙이기 -->	
	<script>
		
		var n=1;
		
		$("#deleteLineBtn").css("display","none");
		
		function plus(empName, jobName, empNo){
			
			console.log(empName, jobName, empNo);
				
			if(${loginUser.empNo} == empNo){
				alert("본인은 등록할 수 없습니다.");
			}else{
				
				$("#deleteLineBtn").css("display","");
				if(n < 5){
				
					$("#applineTable>thead>tr>td:eq("+n+")").text(jobName);
					$("#applineTable>tbody>tr>td:eq("+n+")").text(empNo);
					$("#applineTable>tfoot>tr>td:eq("+n+")").text(empName);
					
					n+=1
					
					
				} else {			
					alert("등록 가능한 결재라인 수를 초과하셨습니다.");
				}
			}
		};
	<!--라인삭제-->
		$(function(){					
			if($("#applineTable>thead>tr>td:eq(1)").text().length < 0){
				$("#deleteLineBtn").css("display","none");
			}
			
		});
	
	
	
		function deleteLine(){
			
			if(confirm("다시 등록하시겠습니까?")==true){			
				for(var i=1; i <= 4; i++){													
					$("#applineTable>thead>tr>td:eq("+i+")").text('');
					$("#applineTable>tbody>tr>td:eq("+i+")").text('');
					$("#applineTable>tfoot>tr>td:eq("+i+")").text('');	
					
				};		
				n=1;
				$("#deleteLineBtn").css("display","none");
			};
			
		}
		
	</script>

	<!-- 결재페이지 연결 --> 
	<script>
	
		var divNo;
	
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
			divNo = getData.val;
			
			console.log(divNo)
		}
	
	
		function backApp(){
			
			var level1 = $("#applineTable>thead>tr>td:eq(1)").text();
			var level2 = $("#applineTable>thead>tr>td:eq(2)").text();
			var level3 = $("#applineTable>thead>tr>td:eq(3)").text();
			var level4 = $("#applineTable>thead>tr>td:eq(4)").text();
			
			console.log(level1);
			console.log(level2);
			console.log(level3);
			console.log(level4);			
			
			var num1 = $("#applineTable>tbody>tr>td:eq(1)").text();
			var num2 = $("#applineTable>tbody>tr>td:eq(2)").text();
			var num3 = $("#applineTable>tbody>tr>td:eq(3)").text();
			var num4 = $("#applineTable>tbody>tr>td:eq(4)").text();
			
			console.log(num1);
			console.log(num2);
			console.log(num3);
			console.log(num4);
			
			var name1 = $("#applineTable>tfoot>tr>td:eq(1)").text();
			var name2 = $("#applineTable>tfoot>tr>td:eq(2)").text();
			var name3 = $("#applineTable>tfoot>tr>td:eq(3)").text();
			var name4 = $("#applineTable>tfoot>tr>td:eq(4)").text();

			console.log(name1);
			console.log(name2);
			console.log(name3);
			console.log(name4);
					
			if(divNo == 1){
				window.opener.document.getElementById("emp_level1_1").value = level1;
				window.opener.document.getElementById("emp_level1_2").value = level2;
				window.opener.document.getElementById("emp_level1_3").value = level3;
				window.opener.document.getElementById("emp_level1_4").value = level4;
				
				window.opener.document.getElementById("emp_name1_1").value = name1;
				window.opener.document.getElementById("emp_name1_2").value = name2;
				window.opener.document.getElementById("emp_name1_3").value = name3;
				window.opener.document.getElementById("emp_name1_4").value = name4;
				
				window.opener.document.getElementById("line1_1").value = num1;
				window.opener.document.getElementById("line1_2").value = num2;
				window.opener.document.getElementById("line1_3").value = num3;
				window.opener.document.getElementById("line1_4").value = num4;
				
				window.close();
			} else if (divNo == 2){
				window.opener.document.getElementById("emp_level2_1").value = level1;
				window.opener.document.getElementById("emp_level2_2").value = level2;
				window.opener.document.getElementById("emp_level2_3").value = level3;
				window.opener.document.getElementById("emp_level2_4").value = level4;
				
				window.opener.document.getElementById("emp_name2_1").value = name1;
				window.opener.document.getElementById("emp_name2_2").value = name2;
				window.opener.document.getElementById("emp_name2_3").value = name3;
				window.opener.document.getElementById("emp_name2_4").value = name4;
				
				window.opener.document.getElementById("line2_1").value = num1;
				window.opener.document.getElementById("line2_2").value = num2;
				window.opener.document.getElementById("line2_3").value = num3;
				window.opener.document.getElementById("line2_4").value = num4;
				
				window.close();
			} else if (divNo == 3){
				window.opener.document.getElementById("emp_level3_1").value = level1;
				window.opener.document.getElementById("emp_level3_2").value = level2;
				window.opener.document.getElementById("emp_level3_3").value = level3;
				window.opener.document.getElementById("emp_level3_4").value = level4;
				
				window.opener.document.getElementById("emp_name3_1").value = name1;
				window.opener.document.getElementById("emp_name3_2").value = name2;
				window.opener.document.getElementById("emp_name3_3").value = name3;
				window.opener.document.getElementById("emp_name3_4").value = name4;
				
				window.opener.document.getElementById("line3_1").value = num1;
				window.opener.document.getElementById("line3_2").value = num2;
				window.opener.document.getElementById("line3_3").value = num3;
				window.opener.document.getElementById("line3_4").value = num4;
				
				window.close();
			} else if (divNo == 4){
				window.opener.document.getElementById("emp_level4_1").value = level1;
				window.opener.document.getElementById("emp_level4_2").value = level2;
				window.opener.document.getElementById("emp_level4_3").value = level3;
				window.opener.document.getElementById("emp_level4_4").value = level4;
				
				window.opener.document.getElementById("emp_name4_1").value = name1;
				window.opener.document.getElementById("emp_name4_2").value = name2;
				window.opener.document.getElementById("emp_name4_3").value = name3;
				window.opener.document.getElementById("emp_name4_4").value = name4;
				
				window.opener.document.getElementById("line4_1").value = num1;
				window.opener.document.getElementById("line4_2").value = num2;
				window.opener.document.getElementById("line4_3").value = num3;
				window.opener.document.getElementById("line4_4").value = num4;
				
				window.close();
			}
			
		}
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
							"<td>"+"<button type='button'"+"class='btn btn-primary btn-sm'"+" onclick='plus("+'"'+obj.empName+'","'+ obj.jobName+'",'+ obj.empNo+');'+"'"+">+</button>"+"</td>" +
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
							"<td>"+"<button type='button'"+"class='btn btn-primary btn-sm'"+" onclick='plus("+'"'+obj.empName+'","'+ obj.jobName+'","'+obj.empNo+'");'+"'"+">+</button>"+"</td>" +
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
						"<td>"+"<button type='button'"+"class='btn btn-primary btn-sm'"+" onclick='plus("+'"'+obj.empName+'","'+ obj.jobName+'","'+obj.empNo+'");'+"'"+">+</button>"+"</td>"  +
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
						"<td>"+"<button type='button'"+"class='btn btn-primary btn-sm'"+" onclick='plus("+'"'+obj.empName+'","'+ obj.jobName +'","'+obj.empNo+'");'+"'"+">+</button>"+"</td>" +
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