<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비품 신청 양식</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


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
						<form method="post" id="eRequestForm" action=""
							enctype="multipart/form-data">
							<div class="card-header">
								<h3 class="card-title">비품 신청서</h3>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<div class="container">
									<div class="row">
										<div class="col-2">
											<label>신청자</label>
										</div>
										<div class="col-10">
											<div class="form-group">
												<input id="" name="" value="${loginUser.empName}"
													class="form-control" readonly>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-2">
											<label>부서명</label>
										</div>
										<div class="col-10">
											<div class="form-group">
												<input id="" name="" value="${loginUser.deptDname}"
													class="form-control" readonly>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-2">
											<label>직급명</label>
										</div>
										<div class="col-10">
											<div class="form-group">
												<input id="" name="" value="${loginUser.jobName}"
													class="form-control" readonly>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-2">
											<label>사용장소</label>
										</div>
										<div class="col-10">
											<div class="form-group">
												<input id="" name="" value="" class="form-control">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-2">
											<label>사용목적</label>
										</div>
										<div class="col-10">
											<div class="form-group">
												<input id="" name="" value="" class="form-control">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-2">
											<label>사용기간</label>
										</div>
										<div class="col-3">
											<!-- 시작일시 -->
											<div class="form-group">
												<input type="date" name="sDate" class="form-control"
													id="sDate">
											</div>
										</div>
										<div class="col-2">
											<label> 부터</label>
										</div>
										<div class="col-3">
											<!-- 종료일시 -->
											<div class="form-group">
												<input type="date" name="eDate" class="form-control"
													id="eDate">
											</div>
										</div>
										<label> 까지</label>
									</div>
									<!-- 비품종류 -->
										<div class="row">
											<div class="col-2">
												<label>비품종류</label>
											</div>
											<div class="col-10">
												<div class="form-group">
													<input type="radio" id="" name=""  value="" class="form-control">
													<input type="radio" id="" name=""  value="" class="form-control">
													<input type="radio" id="" name=""  value="" class="form-control">
													<input type="radio" id="" name=""  value="" class="form-control">
													<input type="radio" id="" name=""  value="" class="form-control">
												</div>
											</div>
										</div>
									<!-- /.container -->
								</div>
								<!-- /.card-body -->
								<div class="card-footer">
									<div class="float-right">
										<button type="submit" class="btn btn-primary">
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
</body>
<script type="text/javascript">
	$('input[type="date"]').on('click', function() {
		var sDate = $("#sDate").val();
		console.log("시작 : " + sDate);

		var eDate = $("#eDate").val();
		console.log("끝 : " + eDate);
	});
</script>



</html>