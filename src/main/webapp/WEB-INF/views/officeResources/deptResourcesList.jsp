<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.content-wrapper{
		overflow:auto;
	}
	#deptResourcesTable>tbody>tr>th	{
		background-color: #DAE1E7;
		width: 10%;
		text-align: center !important;
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
							<i class="nav-icon fas fa-edit"></i><b> 부서별 자료실</b>
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
								<b>부서별 자료실</b>
							</h6>
						</div>

							<div class="card-body">
								<div class="row">
									<div class="col-12">

								<div class="card" style="margin-bottom: 0px;">
										
										<table id="deptResourcesTable" >
											
												<tr>
													<th>검색</th>
													<td>
													<form id="searchDailyReport">
													<div class="row mt-1 mb-1" style="margin-left: 0px;">
														&nbsp;&nbsp;
														<button id="allDailyReport" type="button" class="btn btn-default btn-sm" onclick="location.href='recvReport.dr'">전체검색</button>
														&nbsp;&nbsp;
														
														<select id="optionType" name="optionType" class="custom-select custom-select-sm" style="width: 10%;" onchange="deptSelect(this.value);">
															<option value="allType">전체</option>
															<option value="writerType">작성자</option>
															<option value="titleType">제목</option>
															<option value="contentType">내용</option>
														</select>
																
														&nbsp;&nbsp;
														<div class="input-group" style="width: 30%;">
															<input type="search" id="searchInput"
																class="form-control form-control-sm"
																placeholder="검색어를 입력하세요." name="search" value="${ search }">
															<div class="input-group-append">
																<button type="submit" class="btn btn-sm btn-default" style="width: 30px; font-size: 14px; important">
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
								
								<hr>
								
								<div class="row">
									<div class="col-12" style="height: 450px">
										<table class="table table-sm text-center table-hover">
											<thead>
												<tr>
													<th style="width: 5%;">NO.</th>
													<th style="width: 10%;">자료 유형</th>
													<th style="width: 20%">제목</th>
													<th style="width: 10%">작성자</th>
													<th style="width: 10%;">직위</th>
													<th style="width: 15%;">부서</th>
													<th style="width: 10%;">파일</th>
													<th style="width: 10%">조회수</th>
													<th style="width: 15%;">작성일</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${deptResourcesList }" var="deptResourcesList" varStatus="status">
													<tr>
														<td>${status.index+1}</td>
														<td>${deptResourcesList.deptrCategory }</td>
														<td>${deptResourcesList.deptrTitle }</td>
														<td>${deptResourcesList.writerName }</td>
														<td>${deptResourcesList.writerJobName }</td>
														<td>${deptResourcesList.writerDeptDName }</td>
														<c:if test="${deptResourcesList.deptrAttach == 'Y' }">
															<td><i class="bi bi-envelope"></i></td>
														</c:if>
														<c:if test="${deptResourcesList.deptrAttach == 'N' }">
															<td></td>
														</c:if>
														<td>${deptResourcesList.deptrCount }</td>
														<td>작성일 컬럼을 안 넣었다..</td>
													</tr>
												</c:forEach>													
											</tbody>
										</table>
									</div>
								</div>
								
								<div id="pagingArea">
						                <ul class="pagination">
						                	<c:choose>
						                		<c:when test="${ pi.currentPage ne 1 }">
						                			<li class="page-item"><a class="page-link" href="${pageURL}?currentPage=${ pi.currentPage-1 }">Previous</a></li>
						                		</c:when>
						                		<c:otherwise>
						                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
						                		</c:otherwise>
						                	</c:choose>
						                	
						                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
						                    	<c:choose>
							                		<c:when test="${ pi.currentPage ne p }">
						                    			<li class="page-item"><a class="page-link" href="${pageURL}?currentPage=${ p }">${ p }</a></li>
							                		</c:when>
							                		<c:otherwise>
							                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
							                		</c:otherwise>
							                	</c:choose>
						                    </c:forEach>
						                    
						                    
						                    <c:choose>
						                		<c:when test="${ pi.currentPage ne pi.maxPage }">
						                			<li class="page-item"><a class="page-link" href="${pageURL}?currentPage=${ pi.currentPage+1 }">Next</a></li>
						                		</c:when>
						                		<c:otherwise>
						                			<li class="page-item disabled"><a class="page-link" href="${pageURL}?currentPage=${ pi.currentPage+1 }">Next</a></li>
						                		</c:otherwise>
						                	</c:choose>
						                </ul>
						            </div>
						            


							</div>

							<div class="card-footer">
							
							</div>

					</div>
				</div>
			</div>

		</section>
	</div>
	
	<jsp:include page="../common/footer.jsp" />	

</body>
</html>