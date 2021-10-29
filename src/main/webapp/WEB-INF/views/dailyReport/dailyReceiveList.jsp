<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수신함</title>
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
							<i class="nav-icon fas fa-edit"></i><b> 일일보고 수신함</b>
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
								<b>수신함</b>
							</h6>
						</div>



							<div class="card-body">
								<div class="row">
									<div class="col-12">

										

									</div>
								</div>
								
								<hr>
								
								<div class="row">
									<div class="col-12">
										<table class="table table-sm text-center">
											<thead>
												<tr>
													<th style="width: 5%;"></th>
													<th style="width: 5%;">보고 유형</th>
													<th style="width: 20%">제목</th>
													<th style="width: 15%">작성자</th>
													<th style="width: 10%;">직위</th>
													<th style="width: 15%;">부서</th>
													<th style="width: 20%;">작성일</th>
													<th style="width: 10%">열람 상태</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${dailyReportList}" var="dailyReportList">
												
												
													<tr>
														<c:if test="${ dailyReportList.drReceiverNo != 0 }">
															<td><span class="badge badge-info">보고</span></td>
														</c:if>
														<c:if test="${ dailyReportList.drRef != 0 }">
															<td><span class="badge badge-warning">참조</span></td>
														</c:if>
														<td>${ dailyReportList.drCategory }</td>
														<td>${ dailyReportList.drTitle }</td>
														<td>${ dailyReportList.writerName }</td>
														<td>${ dailyReportList.jobName }</td>
														<td>${ dailyReportList.deptDname}</td>
														<td>${ dailyReportList.drCreateDate }</td>
														<td>${ dailyReportList.drConfirm }</td>
													</tr>
												</c:forEach>												
											</tbody>
										</table>
									</div>
								</div>

							</div>

							<div class="card-footer">
							
							</div>

					</div>
				</div>
			</div>
		
		
		
		
			<%-- <div class="row">
					<div class="col-12">
					
			            <div class="card card-info card-outline card-outline-tabs">
			              <div class="card-header p-0 border-bottom-0">
			              </div>
			              
			              <div class="card-body">
							<div class="tab-content" id="custom-tabs-four-tabContent">
							
			                  	<!-- 외부 주소록 탭 -->
			                  	<div class="tab-pane fade" id="custom-tabs-personalAddressBook" role="tabpanel" aria-labelledby="custom-tabs-personalAddressBook-tab">
	
									<div class="card" style="margin-bottom: 0px;">
											
											<table id="searchPersonalAddressBookTable">
											 <thead>
												<tr>
													<th>추가</th>
													<td>
														<form action="#">
															<div class="input-group mt-1 mb-1">
																&nbsp;&nbsp;
														  		<div class="input-group-prepend">
																    <button type="button" class="btn btn-sm btn-default dropdown-toggle" data-toggle="dropdown">
																      	부서 선택
																    </button>
																    <div class="dropdown-menu">
																      <a class="dropdown-item" href="#">Link 1</a>
																      <a class="dropdown-item" href="#">Link 2</a>
																      <a class="dropdown-item" href="#">Link 3</a>
																    </div>
																  </div>
															  <input type="text" class="form-control form-control-sm" placeholder="Username">
															</div>
														</form>
													</td>
												</tr>
												</thead>
											<tbody>
												<tr>
													<th>검색</th>
													<td>
													<form action="searchOfficeAddressBookEmployee.adb">
													<div class="row mt-1 mb-1" style="margin-left: 0px;">
															&nbsp;&nbsp;
															<button id="allPersonSearchBtn" type="button" class="btn btn-default btn-sm" onclick="selectAllPeronalAddressBookEmployee();">전체검색</button>
															&nbsp;&nbsp;
															
																<select id="optionType" name="optionType" class="custom-select custom-select-sm" style="width: 10%;" onchange="deptSelect(this.value);">
																	<option value="allType">전체</option>
																	<option value="deptType" >부서</option>
																	<option value="empNoType">사번</option>
																	<option value="empNameType">이름</option>
																	<option value="ePhoneType">내선번호</option>
																	<option value="emailType">이메일</option>
																</select>
																
																&nbsp;&nbsp;
																<div class="input-group" style="width: 30%;">
																	<input type="search" id="searchInput"
																		class="form-control form-control-sm"
																		placeholder="검색어를 입력하세요." name="searchPerson" value="${ search }">
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
												</tbody>
											</table>
										</div>
	
	
	
			                  	</div>
			                </div>
			              </div>
			              <!-- /.card -->
			              
			              
			              <!-- card-footer -->
						<div class="card-footer">
							<div class="float-right">
								<button id="deleteOfficeAddressBookBtn" type="button" class="btn btn-danger btn-sm" onclick="deleteOfficeAddressBookBtn();">주소록 삭제</button>
							</div>
						</div>
			              
			              
			              
			            </div>
			          </div>
				
				</div> --%>
			
		
		
		
		
		
		</section>
	</div>
	
	<jsp:include page="../common/footer.jsp" />	
</body>
</html>