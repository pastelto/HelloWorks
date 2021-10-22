<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량 관리 페이지</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.content-wrapper {
	overflow: auto;
}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="col-12">
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-6">
							<h4>
								<i class="fas fa-clipboard-list"></i><b> 차량 관리</b>
							</h4>
						</div>
						<div class="col-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="request.menu">신청페이지</a></li>
								<li class="breadcrumb-item active">차량 관리</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<div class="card card-outline card-info">
				<div class="card-header">
					<h3 class="card-title">차량 목록</h3>
					<div class="float-right">
						<button class="btn btn-primary"
							onclick="window.open('openAdd.car','차량 등록','width=600,height=360,location=no,status=no,scrollbars=yes');">
							<i class="fas fa-clipboard-check"></i> 차량 등록
						</button>
					</div>
				</div>
				<!-- /.card-header -->
				<div class="card-body">
					<!-- 차량 목록 -->
					<!-- 가운데 <div class="container"> -->
					<table id="carList" class="table table-bordered table-striped">
						<thead>
							<tr align="center">
								<th>차량 번호</th>
								<th>차량 제조사명</th>
								<th>차량명</th>
								<th>차량 사용여부</th>
								<th>관리자</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<!-- 회의실 목록 띄우기 -->
							<c:forEach items="${ list }" var="c">
								<tr align="center">
									<td>${ c.CMNo }</td>
									<td>${ c.CMMfr }</td>
									<td>${ c.CMName }</td>
									<td>${ c.CMStatus }</td>
									<td>${ c.empName }</td>
									<td>체크박스</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- </div> -->
				</div>
				<!-- /.card-body -->
			</div>
			<!-- /.card -->
		</div>
		<!-- /.content -->
	</div>
	<jsp:include page="../common/footer.jsp" />

	<script>
		//리스트 클릭시 수정할 수 있게
		$(function() {
			$("#carList tbody tr").click(function() {
				//팝업창 띄우기
			});
		});
	</script>
</body>
</html>