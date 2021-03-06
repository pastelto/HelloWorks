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
					<div class="float-right">
						<button class="btn btn-primary"
							onclick="window.open('openAdd.mtr','회의실 등록','width=600,height=300,location=no,status=no,scrollbars=yes');">
							회의실 등록
						</button>
						<button class="btn btn-danger" id="deleteBtn">
							삭제
						</button>
					</div>
				</div>
				<!-- /.card-header -->
				<div class="card-body">
					<!-- 회의실 목록 -->
					<!-- 가운데 <div class="container"> -->
					<table id="meetingRoomList"
						class="table table-bordered table-striped">
						<thead>
							<tr align="center">
								<th>회의실 관리 번호</th>
								<th>회의실 명</th>
								<th>회의실 수용인원</th>
								<th>회의실 사용여부</th>
								<th>관리자</th>
								<th><input type='checkbox' name='deleteAll'
									value='selectall'></th>
							</tr>
						</thead>
						<tbody>
							<!-- 회의실 목록 띄우기 -->
							<c:forEach items="${ list }" var="m">
								<tr align="center">
									<td>${ m.MMNo }</td>
									<td>${ m.MMName }</td>
									<td>${ m.MMCapacity }</td>
									<td>${ m.MMStatus }</td>
									<td>${ m.empName }</td>
									<td><input type='checkbox' name='deleteOne'
										value="${m.MMNo}"></td>
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
		$("input[name='deleteAll']").click(function() {

			if (($("input[name='deleteAll']")).prop("checked")) {
				$("input[name='deleteOne']").prop("checked", true);
			} else {
				$("input[name='deleteOne']").prop("checked", false);
			}
		});

		$("#deleteBtn").click(function() {
			var checkArr = [];
			$("input[name='deleteOne']:checked").each(function() {
				var ckvalue = $(this).val();
				console.log(ckvalue);
				checkArr.push(ckvalue);
			});
			console.log(checkArr);
			$.ajax({
				url : "delete.Mtr",
				type : "post",
				data : {
					checkArr : checkArr
				},
				success : function(result) {
					if (result == "??!") {
						alert("회의실 삭제성공!");
						location.reload(true);//페이지 새로고침
						//location.href = location.href;
						//history.go(0);
					} else {
						alert("삭제 실패");
					}
				}
			});
		});
	</script>
</body>
</html>