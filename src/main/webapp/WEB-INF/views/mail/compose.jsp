<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mail-compose</title>
<!-- summernote -->
<link rel="stylesheet"
	href="./resources/plugins/summernote/summernote-bs4.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.content-wrapper {
	overflow: auto;
}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h5>메일 쓰기</h5>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-3">
						<a href="mailbox.ml" class="btn btn-primary btn-block mb-3">
							받은 메일함</a>

						<div class="card card-outline card-info">
							<div class="card-header">
								<h3 class="card-title">Folders</h3>

								<div class="card-tools">
									<button type="button" class="btn btn-tool"
										data-card-widget="collapse">
										<i class="fas fa-minus"></i>
									</button>
								</div>
							</div>
							<div class="card-body p-0">
								<ul class="nav nav-pills flex-column">
									<li class="nav-item active"><a href="#" class="nav-link">
											<i class="fas fa-inbox"></i> Inbox <span
											class="badge bg-primary float-right">12</span>
									</a></li>
									<li class="nav-item"><a href="#" class="nav-link"> <i
											class="far fa-envelope"></i> Sent
									</a></li>
									<li class="nav-item"><a href="#" class="nav-link"> <i
											class="far fa-file-alt"></i> Drafts
									</a></li>
									<li class="nav-item"><a href="#" class="nav-link"> <i
											class="fas fa-filter"></i> Junk <span
											class="badge bg-warning float-right">65</span>
									</a></li>
									<li class="nav-item"><a href="#" class="nav-link"> <i
											class="far fa-trash-alt"></i> Trash
									</a></li>
								</ul>
							</div>
							<!-- /.card-body -->
						</div>
					</div>
					<!-- /.col -->
					<div class="col-md-9">
						<div class="card card-outline card-info">
							<div class="card-header">
								<h3 class="card-title">새로운 메일 쓰기</h3>
							</div>
							<!-- /.card-header -->
							<div class="card-body">

								<div class="row">
									<div class="col-2">발신자</div>
									<div class="col-10">
										<div class="form-group">
											<input class="form-control" placeholder="발신자 사번조회 -> 이메일">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-2">수신자</div>
									<div class="col-8">
										<div class="form-group">
											<input class="form-control" placeholder="수신자 사번조회 -> 이메일">
										</div>
									</div>
									<div class="col-2">
										<div class="float-right">
											<button type="button" class="btn btn-default">
												<i class="fas fa-user-plus"></i> 주소록
											</button>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-2">참조자</div>
									<div class="col-8">
										<div class="form-group">
											<input class="form-control" placeholder="참조자 사번조회 -> 이메일">
										</div>
									</div>
									<div class="col-2">
										<div class="float-right">
											<button type="button" class="btn btn-default" >
												<i class="fas fa-user-plus"></i> 주소록
											</button>
										</div>
									</div>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="제목">
								</div>
								<div class="row">
									<div class="col-12">
										<textarea id="summernote"></textarea>
									</div>
								</div>
								<div class="form-group">
									<div class="btn btn-default btn-file">
										<i class="fas fa-paperclip"></i> 첨부파일 <input type="file"
											name="attachment">
									</div>
									<p class="help-block">Max. 32MB</p>
								</div>
							</div>
							<!-- /.card-body -->
							<div class="card-footer">
								<div class="float-right">
									<button type="button" class="btn btn-default">
										<i class="fas fa-pencil-alt"></i> 임시저장
									</button>
									<button type="submit" class="btn btn-primary">
										<i class="far fa-envelope"></i> 보내기
									</button>
								</div>
								<button type="reset" class="btn btn-default">
									<i class="fas fa-times"></i> 취소하기
								</button>
							</div>
							<!-- /.card-footer -->
						</div>
						<!-- /.card -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->
	<jsp:include page="../common/footer.jsp" />

	<!-- naver editor -->

</body>
<!-- Summernote -->
<script src="./resources/plugins/summernote/summernote-bs4.min.js"></script>
<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			height : 400
		});
	});
</script>

</html>