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
			<h3 class="card-title">회의실 등록</h3>
		</div>
		<!-- /.card-header -->
		<form method="post" id="addMtr" enctype="multipart/form-data">
			<input type="hidden" id="empNo" name="empNo"
				value="${ loginUser.empNo }">
			<div class="card-body">
				<table id="addMtr" class="table table-bordered table-striped">
					<tr align="center">
						<td colspan="3"><span>회의실 이름</span></td>
						<td colspan="6"><input type=text class="form-control"
							id="mMName" name="mMName"></td>
					</tr>
					<tr align="center">
						<td colspan="3"><span>회의실 수용인원</span></td>
						<td colspan="6"><input type=text class="form-control"
							id="mMCapacity" name="mMCapacity"></td>
					</tr>
				</table>
			</div>
			<div class="card-footer">
				<div class="float-right">
					<button type="button" class="btn btn-primary" onclick="addMtr();">
						<i class="fas fa-clipboard-check"></i> 등록하기
					</button>
				</div>
				<button type="reset" class="btn btn-default"
					onclick="window.close()">
					<i class="fas fa-times"></i> 취소하기
				</button>
			</div>
		</form>
	</div>
	<script>
   	function addMtr()
	{
		var params = $("#addMtr").serialize();
		$.ajax(
		{
			url : 'add.mtr?mMStatus=Y',
			data : params,
			success : function(xh)
					{			
						alert("성공적으로 회의실을 등록하였습니다.");
						window.close();
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