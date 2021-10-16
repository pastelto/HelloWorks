<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 검색</title>
<style>
	#searchCategory>tbody>tr>th {
		background-color: #DAE1E7;
		width: 10%;
		text-align: center !important;
	}
	#searchCategory>tfoot>tr>th {
		background-color: #DAE1E7;
		width: 10%;
		text-align: center !important;
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
									<table id="searchCategory"
										class="table table-bordered table-secondary table-sm">
										<tbody>
											<tr>
												<th>ALL</th>
												<th>ㄱ</th>
												<th>ㄴ</th>
												<th>ㄷ</th>
												<th>ㄹ</th>
												<th>ㅁ</th>
												<th>ㅂ</th>
												<th>ㅅ</th>
												<th>ㅇ</th>
												<th>ㅈ</th>
											</tr>
											<tr>
												<th>ㅊ</th>
												<th>ㅋ</th>
												<th>ㅌ</th>
												<th>ㅍ</th>
												<th>ㅎ</th>
												<th>A ~ E</th>
												<th>F ~ J</th>
												<th>K ~ O</th>
												<th>P ~ T</th>
												<th>U ~ Z</th>
											</tr>
										</tbody>
									</table>
								
									<hr>

									<div class="card" style="margin-bottom: 0px;">
										<table id="searchEmpTable">
											<tr>
												<th>검색 조건</th>
												<td>
												<div class="row" style="margin-left: 0px;">
														&nbsp;&nbsp;
														<button id="allEmployeeSearchBtn" type="button" class="btn btn-default btn-sm">전체검색</button>
														&nbsp;&nbsp;
														<select name="optionType" class="custom-select custom-select-sm" style="width: 15%;">
															<option value="deptType">부서</option>
															<option value="deptType">사번</option>
															<option value="deptType">이름</option>
															<option value="deptType">내선번호</option>
															<option value="nameType">이메일</option>
														</select>
														<div class="col-4">
															<form action="#">
																<div class="input-group">
																	<input type="search"
																		class="form-control form-control-sm"
																		placeholder="검색어를 입력하세요.">
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
								<div class="col-md-3">
									<div class="card">
										<div class="card-header">
											<h3 class="card-title">HelloWorks</h3>
										</div>
										<div class="card-body">
											<div id="accordion">
												<div class="card">
													<div class="card-header">
														<a class="card-link" data-toggle="collapse" href="#collapseOne">경영지원본부 </a>
													</div>
													<div id="collapseOne" class="collapse" data-parent="#accordion">
														<div class="card-body">
															<ul>
																<li>인사팀</li>
																<li>총무팀</li>
																<li>재무회계팀</li>
															</ul>
														</div>
													</div>
												</div>
												<div class="card">
													<div class="card-header">
														<a class="collapsed card-link" data-toggle="collapse" href="#collapseTwo">영업지원본부 </a>
													</div>
													<div id="collapseTwo" class="collapse" data-parent="#accordion">
														<div class="card-body">
															<ul>
																<li>영업팀</li>
																<li>운영지원팀</li>
															</ul>
														</div>
													</div>
												</div>
												<div class="card">
													<div class="card-header">
														<a class="collapsed card-link" data-toggle="collapse" href="#collapseThree">사업본부 </a>
													</div>
													<div id="collapseThree" class="collapse" data-parent="#accordion">
														<div class="card-body">
															<ul>
																<li>마케팅팀</li>
																<li>디자인팀</li>
																<li>IT개발팀</li>
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
								<div class="col-md-9">
									<table id="employeeTable" class="table table-sm">
										<thead>
											<tr>
												<th></th>
												<th>사번</th>
												<th>이름</th>
												<th>직급</th>
												<th>부서</th>
												<th>내선번호</th>
												<th>이메일</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
										<!-- for문 돌리기 -->
										<% for(int i=0;i<10;i++){ %>
											<tr>
												<td style="width: 5%"><input type="checkbox"></td>
												<td style="width: 10%">0001</td>
												<td style="width: 10%">사원이름</td>
												<td style="width: 10%">직급</td>
												<td style="width: 10%">부서</td>
												<td style="width: 15%">내선번호</td>
												<td style="width: 25%">이메일</td>
												<td style="width: 15%">
													<button id="sendMail" type="button" class="btn btn-default btn-xs">메일발송</button>
													<button id="workShare" type="button" class="btn btn-default btn-xs">업무공유</button>
												</td>
											</tr>
										<%} %>
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

	<script>
	
	$(function(){
		$("#searchCategory>tbody>tr>th").click(function(){
			var catTitle = $(this).text();
			
			console.log(catTitle);
			
		})
	}) 
	
	
		
	</script>
</body>
</html>