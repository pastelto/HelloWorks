<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회의실 관리 페이지</title>
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
								<i class="fas fa-clipboard-list"></i><b> 회의실 관리</b>
							</h4>
						</div>
						<div class="col-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="request.menu">신청페이지</a></li>
								<li class="breadcrumb-item active">회의실 관리</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<div class="card card-outline card-info">
				<div class="card-header">
					<h3 class="card-title">회의실 목록</h3>
				</div>
				<!-- /.card-header -->
				<div class="card-body">
					<!-- 회의실 목록 -->
					<!-- 가운데 <div class="container"> -->
						<table id="meetingRoomList"
							class="table table-bordered table-striped">
							<thead>
								<tr align="center">
									<th>회의실 번호</th>
									<th>회의실 명</th>
									<th>회의실 수용인원</th>
									<th>회의실 사용여부</th>
									<th>관리자</th>
									<th>삭제</th>
								</tr>
							</thead>
							<tbody>
								<!-- 회의실 목록 띄우기 -->
								<c:forEach items="${ list }" var="m">
									<tr align="center">
										<td>${ m.no }</td>
										<td>${ m.name }</td>
										<td>${ m.capacity }</td>
										<td>${ m.status }</td>
										<td>${ m.empNo }</td>
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
		//등록

		//리스트 클릭시 수정할 수 있게
		$(function() {
			$("#meetingRoomList tbody tr").click(function() {
				//팝업창 띄우기
			});
		});
	</script>
</body>
</html>