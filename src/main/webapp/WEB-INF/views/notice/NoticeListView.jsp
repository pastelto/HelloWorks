<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<!-- css NoticeListView  -->
<link href="resources/css/notice/Notice.css" rel="stylesheet" type="text/css">
<style>
</style>
</head>
<body style="overflow-x: hidden">
	<jsp:include page="../common/menubar.jsp" />
	<div class="content-wrapper">


		<!-- 공지사항 타이틀 -->
		<section class="content-header">
			<div class="container-fluid">
			<div class="row">
				<div class="col-sm-6">
					<h4>
					<i class="fas fa-bullhorn"></i><b> &nbsp;공지사항</b>
					</h4>
				</div>
			</div>
			</div>
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="col-md-12">

				<!-- 검색영역 -->
				<div class="callout callout-info" style="height: 50px;">
					<div id="searchNoticeArea" class="card-header">
						<form action="searchNotice.nt">
							<div class="row">
							<ul class="searchUl">
								<li class="searchUl">
									<div class="form-group " id="detailSearch1">
									<select class="form-control" name="condition" id="searchSelect">
										<option value="all" selected>전체보기</option>
										<option value="writer">작성자</option>
										<option value="title">제목</option>
										<option value="content">내용</option>
									</select>
									</div>

								</li>
								<li class="searchUl">
									<div class="form-group" id="detailSearch2">
									<div class="input-group input-group-lg">
										<input type="search" id="searchinput" name="search" class="form-control form-control-lg col-12" value="${ search }">
									<div class="input-group-append">
										<button type="submit" id="searchbtn" class="btn btn-lg btn-default  col-4">
										<div id="nsearchi">
											<i class="fa fa-search fa-lg"></i>
										</div>
										</button>
									</div>
									</div>
									</div>
								</li>
							</ul>
							</div>
						</form>
					</div>
				</div>
				<!-- 검색영역 -->

				<!-- 모든 사원 조회 가능~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<div class="card card-info card-outline card-tabs">
					<div class="card-header p-0 pt-1 border-bottom-0">
						<ul class="nav nav-tabs" id="custom-tabs-three-tab" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								id="custom-tabs-three-home-tab" data-toggle="pill"
								href="#custom-tabs-three-home" role="tab"
								aria-controls="custom-tabs-three-home" aria-selected="true">공지사항</a>
							</li>
							<c:if test="${ loginUser.deptCode eq 'A1' }">
							<li class="nav-item"><a class="nav-link"
								id="custom-tabs-three-profile-tab" data-toggle="pill"
								href="#custom-tabs-three-profile" role="tab"
								aria-controls="custom-tabs-three-profile" aria-selected="false">임시저장</a>
							</li>
							</c:if>
						</ul>
					</div>
					<div class="card-body">
						<div class="tab-content" id="custom-tabs-three-tabContent">
							<div class="tab-pane fade show active"
								id="custom-tabs-three-home" role="tabpanel"
								aria-labelledby="custom-tabs-three-home-tab">
								<!-- 공지사항테이블 -->
								<div class="card">
									<table class="table table-hover text-nowrap" id="noticeList">
										<thead align="center">
											<tr>
												<th width="50px;">No.</th>
												<th width="350px;">제목</th>
												<th width="100px;">작성자</th>
												<th width="100px;">직급</th>
												<th width="120px;">작성일</th>
												<th width="50px;">조회수</th>
											</tr>
										</thead>
										<tbody>
										<c:if test="${ !empty list }">
											<c:forEach items="${ list }" var="n">
												<tr align="center">
													<td>${ n.noticeNo }</td>
													<td>${ n.noticeTitle }</td>
													<td>${ n.noticeWriter }</td>
													<td>${ n.jobName }</td>
													<td>${ n.createDate }</td>
													<td>${ n.nt_count }</td>
												</tr>
											</c:forEach>
									    </c:if>
									    <c:if test="${ empty list }">
									    	<tr align="center">
													<td colspan="6">검색결과가 없습니다</td>
										    </tr>
									    </c:if>
										</tbody>
									</table>

									<div class="card-footer clearfix">
										<!-- 인사팀만 글쓰기 버튼이 보이게 -->
										<c:if test="${ loginUser.deptCode eq 'A1'}">
											<div class="float-right">
												<button class="btn btn-primary btn-sm"
													id="writenotice" onclick="location.href = 'enrollForm.nt' ">글쓰기</button>
											</div>
										</c:if>
										<%-- 페이징--%>
										<div id="pagingArea">
											<ul
												class="pagination pagination-sm m-0 justify-content-center">
												<c:choose>
													<c:when test="${ pi.currentPage ne 1 }">
														<li class="page-item"><a class="page-link"
															href="list.nt?currentPage=${ pi.currentPage-1 }">&laquo;</a></li>
													</c:when>
													<c:otherwise>
														<li class="page-item disabled"><a class="page-link"
															href="">&laquo;</a></li>
													</c:otherwise>
												</c:choose>

												<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }"
													var="p">
													<c:choose>
														<c:when test="${ pi.currentPage ne p }">
															<li class="page-item"><a class="page-link"
																href="list.nt?currentPage=${ p }">${ p }</a></li>
														</c:when>
														<c:otherwise>
															<li class="page-item disabled"><a class="page-link"
																href="">${ p }</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>


												<c:choose>
													<c:when test="${ pi.currentPage ne pi.maxPage }">
														<li class="page-item"><a class="page-link"
															href="list.nt?currentPage=${ pi.currentPage+1 }">&raquo;</a></li>
													</c:when>
													<c:otherwise>
														<li class="page-item disabled"><a class="page-link"
															href="list.nt?currentPage=${ pi.currentPage+1 }">&raquo;</a></li>
													</c:otherwise>
												</c:choose>
											</ul>
										</div>
										<!-- 페이징 -->
									</div>

								</div>

							</div>
							<!-- 모든 사원 조회 가능 -->
							
							
							
							
							<%--  인사팀만 조회가능 --%>	
							<c:if test="${ loginUser.deptCode eq 'A1' }">						
							<div class="tab-pane fade" id="custom-tabs-three-profile"
								role="tabpanel" aria-labelledby="custom-tabs-three-profile-tab">
								<!-- 임시저장테이블 -->
								<div class="card">
									<table class="table table-hover text-nowrap" id="noticeTList">
										<thead align="center">
											<tr>
												<th width="50px;">No.</th>
												<th width="350px;">제목</th>
												<th width="100px;">작성자</th>
												<th width="100px;">직급</th>
												<th width="120px;">작성일</th>
												<th width="50px;">조회수</th>
											</tr>
										</thead>
										<tbody>
										<c:if test="${ !empty tlist }">
											<c:forEach items="${ tlist }" var="t">
												<tr align="center">
													<td>${ t.noticeNo }</td>
													<td>${ t.noticeTitle }</td>
													<td>${ t.noticeWriter }</td>
													<td>${ t.jobName }</td>
													<td>${ t.createDate }</td>
													<td>${ t.nt_count }</td>
											</c:forEach>
										</c:if>
										<c:if test="${ empty tlist }">
											<tr align="center">
													<td colspan="6">게시글이 없습니다</td>
										    </tr>
										</c:if>
										</tbody>

									</table>
									<div class="card-footer clearfix">
										<%-- 인사팀만 버튼이 보게 --%>    
										<c:if test="${ loginUser.deptCode eq 'A1'  }">
											<div class="float-right">
												<button class="btn btn-primary btn-sm"
													id="writenotice" onclick="location.href = 'enrollForm.nt' ">글쓰기</button>
											</div>
										</c:if>
										<%--페이징--%>
										<div id="pagingArea">
											<ul
												class="pagination pagination-sm m-0 justify-content-center">
												<c:choose>
													<c:when test="${ piT.currentPage ne 1 }">
														<li class="page-item"><a class="page-link"
															href="list.nt?currentPage=${ piT.currentPage-1 }">&laquo;</a></li>
													</c:when>
													<c:otherwise>
														<li class="page-item disabled"><a class="page-link"
															href="">&laquo;</a></li>
													</c:otherwise>
												</c:choose>

												<c:forEach begin="${ piT.startPage }" end="${ piT.endPage }"
													var="p">
													<c:choose>
														<c:when test="${ piT.currentPage ne p }">
															<li class="page-item"><a class="page-link"
																href="list.nt?currentPage=${ p }">${ p }</a></li>
														</c:when>
														<c:otherwise>
															<li class="page-item disabled"><a class="page-link"
																href="">${ p }</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>


												<c:choose>
													<c:when test="${ piT.currentPage ne piT.maxPage }">
														<li class="page-item"><a class="page-link"
															href="list.nt?currentPage=${ piT.currentPage+1 }">&raquo;</a></li>
													</c:when>
													<c:otherwise>
														<li class="page-item disabled"><a class="page-link"
															href="list.nt?currentPage=${ piT.currentPage+1 }">&raquo;</a></li>
													</c:otherwise>
												</c:choose>
											</ul>
										</div>
									</div>

								</div>
							</div>
							</c:if>
							<!-- 인사팀만 조회 가능  -->
							
							
						</div>
					</div>
					<!-- /.card -->
				</div>

		</section>

	</div>

	<script>
		$(function() {
			switch ('${condition}') {
			case "all":
				$("#searchNoticeArea option").eq(0).attr("selected", true);
				break;
			case "writer":
				$("#searchNoticeArea option").eq(1).attr("selected", true);
				break;
			case "title":
				$("#searchNoticeArea option").eq(2).attr("selected", true);
				break;
			case "content":
				$("#searchNoticeArea option").eq(3).attr("selected", true);
				break;
			}
		})
	</script>

	<script>
		$(function() {
			$("#noticeList tbody tr").click(
					function() {
						location.href = "detail.nt?bno="
								+ $(this).children().eq(0).text();
					});
		});
		$(function() {
			$("#noticeTList tbody tr").click(
					function() {
						location.href = "detail.nt?bno="
								+ $(this).children().eq(0).text();
					});
		});
	</script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>