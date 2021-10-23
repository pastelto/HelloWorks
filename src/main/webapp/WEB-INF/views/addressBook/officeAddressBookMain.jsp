<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.content-wrapper {
		overflow: auto;
	}
	#searchOfficeAddressBookTable>thead{
		border-bottom: 1px solid #DAE1E7;
	}
	#searchOfficeAddressBookTable>thead>tr>th	{
		background-color: #DAE1E7;
		width: 10%;
		text-align: center !important;
	}
	#searchOfficeAddressBookTable>tbody>tr>th	{
		background-color: #DAE1E7;
		width: 10%;
		text-align: center !important;
	}
	#searchPersonalAddressBookTable>thead{
		border-bottom: 1px solid #DAE1E7;
	}
	#searchPersonalAddressBookTable>thead>tr>th	{
		background-color: #DAE1E7;
		width: 10%;
		text-align: center !important;
	}
	#searchPersonalAddressBookTable>tbody>tr>th	{
		background-color: #DAE1E7;
		width: 10%;
		text-align: center !important;
	}
	#officeAddressBookTable {
		text-align: center !important;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-6">

						<h4>
							<i class="nav-icon fas fa-table"></i><b> 주소록</b>
						</h4>
					</div>
				</div>
			</div>
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-12">
				
		            <div class="card card-info card-outline card-outline-tabs">
		              <div class="card-header p-0 border-bottom-0">
		                <ul class="nav nav-tabs" id="custom-tabs-addressBook-tab" role="tablist">
		                  <li class="nav-item">
		                    <a class="nav-link active" id="custom-tabs-officeAddressBook-tab" data-toggle="pill" href="#custom-tabs-officeAddressBook" role="tab" aria-controls="custom-tabs-officeAddressBook" aria-selected="true">사내 주소록</a>
		                  </li>
		                  <li class="nav-item">
		                    <a class="nav-link" id="custom-tabs-personalAddressBook-tab" data-toggle="pill" href="#custom-tabs-personalAddressBook" role="tab" aria-controls="custom-tabs-personalAddressBook" aria-selected="false">외부주소록</a>
		                  </li>
		                </ul>
		              </div>
		              
		              <div class="card-body">
						<div class="tab-content" id="custom-tabs-four-tabContent">
						
							<!-- 사내 주소록 탭 -->
							<div class="tab-pane fade show active" id="custom-tabs-officeAddressBook" role="tabpanel" aria-labelledby="custom-tabs-officeAddressBook-tab">
								<div class="card" style="margin-bottom: 0px;">
										
										<table id="searchOfficeAddressBookTable">
										<tbody>
											<tr>
												<th>검색</th>
												<td>
												<form action="searchOfficeAddressBookEmployee.adb">
												<div class="row mt-1 mb-1" style="margin-left: 0px;">
														&nbsp;&nbsp;
														<a id="allEmployeeSearchBtn" type="button" class="btn btn-default btn-sm" href="officeAddressBook.adb">전체검색</a>
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
																	placeholder="검색어를 입력하세요." name="searchEmployee" value="${ search }">
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
									
									<hr>
									
									<!-- 주소록 리스트 -->
									<div class="col-12" style="overflow:auto;">
									<div style="height: 450px">
									<table id="officeAddressBookTable" class="table table-sm" >
									<caption style="caption-side:top">* 정렬 기준 : <span id="sortOption">전체</span></caption>
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
										
											<c:forEach items="${ officeAddresslist }" var="officeAddresslist">
							                    <tr>
							                    	<th><input type='checkbox' name='deleteAddressBook' id='deleteAddressBook'></th>
							                        <td>${ officeAddresslist.oabEnrollNO }</td>
							                        <td>${ officeAddresslist.empName} ( ${officeAddresslist.empEn} )</td>
							                        <td>${ officeAddresslist.jobName }</td>
							                        <td>${ officeAddresslist.deptDname }</td>
							                        <td>${ officeAddresslist.empEphone }</td>
							                        <td>${ officeAddresslist.empEmail }</td>
							                        <th>
							                        	<button id='sendMail' type='button' class='btn btn-default btn-xs'>메일발송</button>&nbsp;
							                        	<button id='workShare' type='button' class='btn btn-default btn-xs'>업무공유</button>
							                        </th>
							                    </tr>
						                    </c:forEach>
										</tbody>
									</table>
									</div>
									
									<br>
									
									<div id="pagingArea">
						                <ul class="pagination">
						                	<c:choose>
						                		<c:when test="${ pi.currentPage ne 1 }">
						                			<li class="page-item"><a class="page-link" href="${pageURL}?optionType=${ optionType }&deptTypeOption=${ deptTypeOption }&searchEmployee=${ searchEmployee }&currentPage=${ pi.currentPage-1 }">Previous</a></li>
						                		</c:when>
						                		<c:otherwise>
						                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
						                		</c:otherwise>
						                	</c:choose>
						                	
						                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
						                    	<c:choose>
							                		<c:when test="${ pi.currentPage ne p }">
						                    			<li class="page-item"><a class="page-link" href="${pageURL}?optionType=${ optionType }&deptTypeOption=${ deptTypeOption }&searchEmployee=${ searchEmployee }&currentPage=${ p }">${ p }</a></li>
							                		</c:when>
							                		<c:otherwise>
							                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
							                		</c:otherwise>
							                	</c:choose>
						                    </c:forEach>
						                    
						                    
						                    <c:choose>
						                		<c:when test="${ pi.currentPage ne pi.maxPage }">
						                			<li class="page-item"><a class="page-link" href="${pageURL}?optionType=${ optionType }&deptTypeOption=${ deptTypeOption }&searchEmployee=${ searchEmployee }&currentPage=${ pi.currentPage+1 }">Next</a></li>
						                		</c:when>
						                		<c:otherwise>
						                			<li class="page-item disabled"><a class="page-link" href="${pageURL}?currentPage=${ pi.currentPage+1 }">Next</a></li>
						                		</c:otherwise>
						                	</c:choose>
						                </ul>
						            </div>
									
									
								</div>
								<!-- /.col -->

		                  	</div>
		                  
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
							<button id="deleteBtn" type="button"
								class="btn btn-primary btn-sm">주소록 삭제</button>
						</div>
					</div>
		              
		              
		              
		            </div>
		          </div>
			
			</div>
		</section>
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
	
	<!-- 페이징 클릭시 정렬기준 처리 -->
	<script>
		function previousClick(){
			$("#sortOption").text("검색어 ( "+'${searchEmployee}'+" )");
		}
		function pageClick(){
			$("#sortOption").text("검색어 ( "+'${searchEmployee}'+" )");
		}
		function nextClick(){
			$("#sortOption").text("검색어 ( "+'${searchEmployee}'+" )");
		}
	</script>
	
</body>
</html>