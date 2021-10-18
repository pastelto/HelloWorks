<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비품 신청 양식</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css" />
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
						<form method="post" id="" action="" enctype="multipart/form-data">
							<div class="card-header">
								<h3 class="card-title">비품 신청서</h3>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<div class="row">
									<div class="col-2">신청자</div>
									<div class="col-10">
										<div class="form-group">
											<input id="" name="" value="${loginUser.empName}"
												class="form-control" readonly>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-2">부서</div>
									<div class="col-10">
										<div class="form-group">
											<input id="" name="" value="${loginUser.deptCode}"
												class="form-control" readonly>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-2">직급</div>
									<div class="col-10">
										<div class="form-group">
											<input id="" name="" value="${loginUser.jobCode}"
												class="form-control" readonly>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-2">사용장소</div>
									<div class="col-10">
										<div class="form-group">
											<input id="" name="" value="" class="form-control">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-2">사용목적</div>
									<div class="col-10">
										<div class="form-group">
											<input id="" name="" value="" class="form-control">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-2">사용기간</div>
									<div class="col-3">
										<div class="form-group">
											<div class="input-group date" id="datetimepicker1"
												data-target-input="nearest">
												<input type="text" class="form-control datetimepicker-input"
													data-target="#datetimepicker1" value="">
												<!-- 오늘날짜 넣기 -->
												<div class="input-group-append"
													data-target="#datetimepicker1" data-toggle="datetimepicker">
													<div class="input-group-text">
														<i class="fa fa-calendar"></i>
													</div>
												</div>
											</div>
										</div>
									</div>
									부터
									<div class='col-md-3 col-xs-4'>
										<div class="form-group">
											<div class="input-group date" id="datetimepicker2"
												data-target-input="nearest">
												<input type="text" class="form-control datetimepicker-input"
													data-target="#datetimepicker2" value="">
												<div class="input-group-append"
													data-target="#datetimepicker2" data-toggle="datetimepicker">
													<div class="input-group-text">
														<i class="fa fa-calendar"></i>
													</div>
												</div>
											</div>
										</div>
									</div>
									까지
									<!-- 기타 -->
									<!--<div class="row">
										<div class="col-12">
											<textarea id="" name=""></textarea>
										</div>
									</div>  -->
								</div>
								<!-- /.card-body -->
								<div class="card-footer">
									<div class="float-right">
										<button type="submit" class="btn btn-primary">
											<i class="far fa-envelope"></i> 신청하기
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
	$(function() {
		$('#datetimepicker1').datetimepicker({
			format : 'L'
		});
		$('#datetimepicker2').datetimepicker({
			format : 'L',
			useCurrent : true
		});
		$("#datetimepicker1").on("change.datetimepicker", function(e) {
			$('#datetimepicker2').datetimepicker('minDate', e.date);
		});
		$("#datetimepicker2").on("change.datetimepicker", function(e) {
			$('#datetimepicker1').datetimepicker('maxDate', e.date);
		});
	});
</script>
</html>