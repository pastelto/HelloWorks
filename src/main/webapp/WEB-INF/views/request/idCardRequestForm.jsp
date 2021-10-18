<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원증 신청 양식</title>
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
						<form method="post" id="" action="" enctype="multipart/form-data">
							<div class="card-header">
								<h3 class="card-title">사원증 신청서</h3>
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
									<div class="col-2">영문이름</div>
									<div class="col-10">
										<div class="form-group">
											<input id="" name="" value="${loginUser.empEn}"
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
							<!-- /.card-footer -->
							<!-- /.card -->
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>