<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>차량 정보 등록</title>
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="./resources/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="./resources/dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="./resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>
</head>
<body>
	<div class="card card-outline card-info">
		<div class="card-header">
			<h3 class="card-title">차량 등록</h3>
		</div>
		<!-- /.card-header -->
		<form method="post" id="addCar" enctype="multipart/form-data">
			<input type="hidden" id="empNo" name="empNo"
				value="${ loginUser.empNo }">
			<div class="card-body">
				<table id="addCar" class="table table-bordered table-striped">
					<tr align="center">
						<td colspan="3"><span>차량 번호</span></td>
						<td colspan="6"><input type=text class="form-control"
							id="cMNo" name="cMNo" placeholder="예시: 00허0000"></td>
					</tr>
					<tr align="center">
						<td colspan="3"><span>차량 제조사명</span></td>
						<td colspan="6"><input type=text class="form-control"
							id="cMMfr" name="cMMfr"></td>
					</tr>
					<tr align="center">
						<td colspan="3"><span>차량 명</span></td>
						<td colspan="6"><input type=text class="form-control"
							id="cMName" name="cMName"></td>
					</tr>
				</table>
			</div>
			<div class="card-footer">
				<div class="float-right">
					<button type="button" class="btn btn-primary" onclick="addCar();">
					등록하기
					</button>
				</div>
				<button type="reset" class="btn btn-danger"
					onclick="window.close()">
					 취소하기
				</button>
			</div>
		</form>
	</div>
	<script>
		function addCar() {
			var params = $("#addCar").serialize();
				$.ajax({
					url : 'add.car?cMStatus=Y',
					data : params,
					success : function(result) {					
						if(result) {
							alert("차량 등록성공!");
							opener.parent.location='manage.car'; //페이지 새로고침
							window.close();
						}else{
							alert("차량 등록실패");
						}
							
					},
					error : function() {
						console.log("차량 등록 ajax 통신 실패");
					}
				});
		}
	</script>
	<!-- 스크립트 모음 -->
	<!-- jQuery -->
	<script src="./resources/plugins/jquery/jquery.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="./resources/plugins/jquery-ui/jquery-ui.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="./resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- overlayScrollbars -->
	<script
		src="./resources/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	<!-- AdminLTE App -->
	<script src="./resources/dist/js/adminlte.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="./resources/dist/js/demo.js"></script>
</body>
</html>
