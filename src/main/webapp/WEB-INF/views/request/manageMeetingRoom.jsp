<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<div class="content-wrapper">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-6">
						<h4>
							<i class="fas fa-clipboard-list"></i><b> 회의실 관리</b>
						</h4>
					</div>
				</div>
			</div>
		</section>
		<!-- Main content -->
		<div class="col-12">
			<div class="card card-outline card-info card-outline-tabs">
				<div class="card-header p-0 border-bottom-0"></div>
				<div class="card-body"></div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>