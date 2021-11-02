<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회의실 신청페이지</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	        <link href="dist/css/datepicker.min.css" rel="stylesheet" type="text/css">

<style>
.content-wrapper {
	overflow: auto;
}
</style>
</head>
<body>
	<div class="card card-outline card-info ">
		<div class="card-header p-0 border-bottom-0">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<form method="post" id="reservationMtrForm" action="reservation.mtr"
							enctype="multipart/form-data" onsubmit="return resevationMtrValidate();">
							<input type="hidden" id="empNo" name="empNo"
								value="${ loginUser.empNo }">
							<div class="card-header">
								<h3 class="card-title">회의실 신청</h3>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<div class="container">
									<div class="row">
										<div class="col-6">
										달력들어올자리
										
										</div>
										<div class="col-6">
										회의실종류(체크박스/드롭박스)
										
										</div>
									</div>
									<!-- /.container -->
								</div>
								<!-- /.card-body -->
								<div class="card-footer">
									<div class="float-right">
										<button type="submit" id="submitBtn" class="btn btn-primary">
											<i class="fas fa-clipboard-check"></i> 신청하기
										</button>
									</div>
									<button type="reset" class="btn btn-default">
										<i class="fas fa-times"></i> 취소하기
									</button>
								</div>
							</div>
							<!-- /.card-footer -->
							<!-- /.card -->
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">

	function resevationMtrValidate() {
		if (($('#').val() == "")) {
			$("#reservationMtrForm input[name=]").focus();
			alert("날짜를 선택해 주세요")
			return false;
		}
		if (($('#').val() == "")) {
			$("#reservationMtrForm input[name=]").focus();
			alert("회의실을 선택해 주세요")
			return false;
		}
		if (($('#').val() == "")) {
			$("#reservationMtrForm input[name=]").focus();
			alert("사용시간을 선택해 주세요")
			return false;
		}
		return true;
	}
</script>

</body>
</html>