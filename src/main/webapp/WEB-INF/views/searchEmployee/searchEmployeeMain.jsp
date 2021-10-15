<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 검색</title>
<style>
	th{
		background-color: #DAE1E7;
		width: 10%;
		text-align: center !important;
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
				<div class="row">
					<div class="col-sm-6">

						<h4>
							<i class="nav-icon fas fa-table"></i><b> 직원 검색</b>
						</h4>
					</div>
				</div>
			</div>
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-12">
					<div class="card card-outline card-info">

						<div class="card-header text-center">
							<h6 style="margin-bottom: 0px">
								<b>직원 검색</b>
							</h6>
						</div>


							<div class="card-body">
								<table id="searchCategory" class="table table-bordered table-secondary table-sm">
									<tr>
										<th>ALL</th>
										<th>ㄱ</th>
										<th>ㄴ</th>
										<th>ㄷ</th>
										<th>ㄹ</th>
										<th>ㅁ</th>
										<th>ㅂ</th>
										<th>ㅅ</th>
										<th>ㅇ</th>
										<th>ㅈ</th>
									</tr>
									<tr>
										<th>ㅊ</th>
										<th>ㅋ</th>
										<th>ㅌ</th>
										<th>ㅍ</th>
										<th>ㅎ</th>
										<th>A ~ E</th>
										<th>F ~ J</th>
										<th>K ~ O</th>
										<th>P ~ T</th>
										<th>U ~ Z</th>
									</tr>
								</table>


							</div>
								


							<div class="card-footer">
								<div class="float-right">
									<button id="submitBtn" type="button" class="btn btn-primary btn-sm">주소록 추가</button>
								</div>
							</div>

					</div>
				</div>
			</div>
		</section>
	</div>

	<script>
	
	$(function(){
		$("#searchCategory>tbody>tr>th").click(function(){
			var catTitle = $(this).text();
			
			console.log(catTitle);
			
		})
	}) 
	
	
		
	</script>
</body>
</html>