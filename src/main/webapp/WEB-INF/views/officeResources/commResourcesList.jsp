<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">

<style>
	.content-wrapper{
		overflow:auto;
	}
	#commResourcesTable>thead{
		border-bottom: 1px solid #DAE1E7;
	}
	#commResourcesTable>thead>tr>th	{
		background-color: #DAE1E7;
		width: 10%;
		text-align: center !important;
	}
	#commResourcesTable>tbody>tr>th	{
		background-color: #DAE1E7;
		width: 10%;
		text-align: center !important;
	}
	#sharingType{
		background: #00909E;
		color: white;
	}
	#documentType{	
		background: #27496D;
		color: white;
	}
	#etcType{
		background: #DAE1E7;
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
							<i class="nav-icon fas fa-edit"></i><b> 공통 자료실</b>
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
								<b>공통 자료실</b>
							</h6>
						</div>

							<div class="card-body">
								<div class="row">
									<div class="col-12">

								<div class="card" style="margin-bottom: 0px;">
										
										<table id="commResourcesTable" >
											<thead>
												<tr>
													<th>보고 유형</th>
													<td>
													<div class="mt-1 mb-1" style="margin-left: 0px;">
														&nbsp;
														<input type="radio" name="resourcesType" value="allType" ${ checkTypeAll }> 전체
														&nbsp;&nbsp;&nbsp;
														<input type="radio" name="resourcesType" value="공유" ${ checkS }> 공유
														&nbsp;&nbsp;&nbsp;
														<input type="radio" name="resourcesType" value="문서" ${ checkD }> 문서
														&nbsp;&nbsp;&nbsp;
														<input type="radio" name="resourcesType" value="기타" ${ checkE }> 기타
													</div>
													</td>
												</tr>
											
											</thead>	
												<tr>
													<th>검색</th>
													<td>
													<form id="commResourcesSearch">
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
									<div class="col-12" style="height: 510px; overflow: auto">
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
												<c:forEach items="${commResourcesList }" var="commResourcesList" varStatus="status">
													<tr onclick="detail(${commResourcesList.crNo });">
														<td>${status.index+1}</td>
														<td>
															<c:if test="${ commResourcesList.crCategory == '공유' }">
																<span class="badge" id="sharingType">공유</span>
															</c:if>
															<c:if test="${ commResourcesList.crCategory == '문서' }">
																<span class="badge" id="documentType">문서</span>
															</c:if>
															<c:if test="${ commResourcesList.crCategory == '기타' }">
																<span class="badge" id="etcType">기타</span>
															</c:if>
														</td>
														<td>${commResourcesList.crTitle }</td>
														<td>${commResourcesList.writerName }</td>
														<td>${commResourcesList.writerJobName }</td>
														<td>${commResourcesList.writerDeptDName }</td>
														<c:if test="${commResourcesList.crAttach == 'Y' }">
															<td><i class="bi bi-envelope"></i></td>
														</c:if>
														<c:if test="${commResourcesList.crAttach == 'N' }">
															<td></td>
														</c:if>
														<td>${commResourcesList.crCount }</td>
														<td><fmt:formatDate value="${commResourcesList.crCreateDate }" pattern="yyyy/MM/dd HH:mm"/></td>
														
													</tr>
												</c:forEach>												
											</tbody>
										</table>
									</div>
								</div>
								
								<div class="row">
									<div class="col-10">
										<div id="pagingArea">
						                <ul class="pagination mb-0">
						                	<c:choose>
						                		<c:when test="${ pi.currentPage ne 1 }">
						                			<li class="page-item"><a class="page-link" href="${pageURL}?resourcesType?=${ resourcesType }&currentPage=${ pi.currentPage-1 }">Previous</a></li>
						                		</c:when>
						                		<c:otherwise>
						                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
						                		</c:otherwise>
						                	</c:choose>
						                	
						                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
						                    	<c:choose>
							                		<c:when test="${ pi.currentPage ne p }">
						                    			<li class="page-item"><a class="page-link" href="${pageURL}?resourcesType?=${ resourcesType }currentPage=${ p }">${ p }</a></li>
							                		</c:when>
							                		<c:otherwise>
							                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
							                		</c:otherwise>
							                	</c:choose>
						                    </c:forEach>
						                    
						                    
						                    <c:choose>
						                		<c:when test="${ pi.currentPage ne pi.maxPage }">
						                			<li class="page-item"><a class="page-link" href="${pageURL}?resourcesType?=${ resourcesType }currentPage=${ pi.currentPage+1 }">Next</a></li>
						                		</c:when>
						                		<c:otherwise>
						                			<li class="page-item disabled"><a class="page-link" href="${pageURL}?currentPage=${ pi.currentPage+1 }">Next</a></li>
						                		</c:otherwise>
						                	</c:choose>
						                </ul>
						            </div>
									</div>
									<div class="col-2"  align='right'>
										<c:if test="${ loginUser.deptCode == 'A1' or loginUser.deptCode == 'A2' or loginUser.deptCode == 'A3' or loginUser.jobCode == 'J1' or loginUser.jobCode == 'J2' or loginUser.jobCode == 'J3'}">
											<button onclick="insertResource();" class="btn btn-sm btn-primary" type="button">글쓰기</button>&nbsp;
										</c:if>
									</div>
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

	<!-- 디테일 페이지 전환 -->
	<script>
		function detail(crNo){
			location.href="<%= request.getContextPath()%>/commResourcesDetail.or?crNo="+crNo;
		}
	
	</script>
	
	<!-- 유형 선택 검사 -->
	<script>
		$("input:radio[name='resourcesType']").click(function(){
	        
			var type = $("input:radio[name=resourcesType]:checked").val();
			
		    if(type=="allType"){
		    	location.href="<%=request.getContextPath()%>/commResourcesList.or";
		    }else{
		    	location.href="<%=request.getContextPath()%>/commResourcesListType.or?resourcesType="+type;
		    }
		});
	</script>
	
	<!-- 글쓰기 -->
	<script>
		function insertResource(){
			location.href="<%=request.getContextPath()%>/commResourcesEnroll.or";
		}
	</script>
</body>
</html>