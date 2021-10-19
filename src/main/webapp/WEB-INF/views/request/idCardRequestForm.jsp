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
/*파일선택시 선택된 파일명이 붙는것을 가려준다*/
.fileRegiBtn input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}
</style>
</head>
<body>
	<div class="card card-outline card-info">
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
								<div class="container">
									<div class="row">
										<div class="col-9">
											<div class="row">
												<div class="col-3">
													<label>한글이름</label>
												</div>
												<div class="col-3">
													<div class="form-group">
														<input id="" name="" value="${loginUser.empName}"
															class="form-control" readonly>
													</div>
												</div>
												<div class="col-3">
													<label>영문이름</label>
												</div>
												<div class="col-3">
													<div class="form-group">
														<input id="" name="" value="${loginUser.empEn}"
															class="form-control">
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-3">
													<label>부서명</label>
												</div>
												<div class="col-3">
													<div class="form-group">
														<input id="" name="" value="${loginUser.deptCode}"
															class="form-control" readonly>
													</div>
												</div>
												<div class="col-3">
													<label>직급명</label>
												</div>
												<div class="col-3">
													<div class="form-group">
														<input id="" name="" value="${loginUser.jobCode}"
															class="form-control" readonly>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-3">
													<label>사번</label>
												</div>
												<div class="col-3">
													<div class="form-group">
														<input id="" name="" value="${loginUser.empNo}"
															class="form-control" readonly>
													</div>
												</div>
												<div class="col-3">
													<label>발급종류</label>
												</div>
												<div class="col-3">
													<label> <input type="radio" name="iRkind"
														value="신규발급" id="radioNew" checked> 신규발급
													</label> <label> <input type="radio" name="iRkind"
														value="재발급" id="radioReissue"> 재발급
													</label>
												</div>
											</div>
										</div>
										<div class="col-3">
											<!-- 이미지파일 등록 -->
											<div class="col-3">
												<!-- 이미지 들어오는 부분 -->
												<div class="selectCover">
													<img id="cover" src="resources/img/defaultImg.jpg"
														style="width: 160px; height: 200px;" />
												</div>
											</div>
											<div class="col-9">
												<div class="form-group">
													<input id="fileName" class="form-control"
														value="jpg, jpeg, png" readonly>
												</div>
												<div class="fileRegiBtn">
													<label for="myFileUp">파일등록</label> <input type="file"
														id="myFileUp">
												</div>
											</div>
										</div>
										<!--/. container -->
									</div>
								</div>
								<!-- /.card-body -->
							</div>
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
							<!-- /.card-footer -->
							<!-- /.card -->
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		// 파일 URL 띄우기
		function readURL(input) {
			//console.log("버튼클릭");
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#cover').attr('src', e.target.result); //cover src로 붙여지고
					$('#fileName').val(input.files[0].name); //파일선택 form으로 파일명이 들어온다
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		// 이미지 바꾸기
		$("#myFileUp").change(function() {
			readURL(this);
			//console.log("이미지 바뀜");
		});
		
		
	</script>
</body>

</html>