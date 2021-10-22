<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#attendanceSidebar{
	font-size :small;
}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="content-wrapper"> 
	
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h4>
								<i class="fas fa-briefcase"><b>&nbsp;근태현황</b></i>
							</h4>
						</div>
					</div>
				</div>
			</section>			
			<section class="content">
			<div class="col-md-12">
					<div id="attendanceSidebar" style="width : 220px;">
									<div class="card card-info card-outline">
										<div class="card-header">
											<h3 class="card-title text-center">근태현황</h3>
										</div>
										<div class="card-body">
											<div id="accordion">
												<div class="card">
													<div class="card-header">
														<a class="card-link" data-toggle="collapse" href="#collapseOne" >근태 관리 </a>
													</div>
													<div id="collapseOne" class="collapse" data-parent="#accordion">
														
														<ul class="nav nav-pills flex-column">
															<li class="nav-item "><a href="#"
																class="nav-link">출근기록 
															</a></li>
															<li class="nav-item"><a href="#" class="nav-link">
																	부서원 출결 조회
															</a></li>
															<li class="nav-item"><a href="#" class="nav-link">
																	 소속 근로시간 통계
															</a></li>		
														</ul>													
														
													</div>
												</div>
												<div class="card">
													<div class="card-header">
														<a class="collapsed card-link" data-toggle="collapse" href="#collapseTwo" >연차휴가관리</a>
													</div>
													<div id="collapseTwo" class="collapse" data-parent="#accordion">
														<div class="card-body">
															<ul class="nav nav-pills flex-column">
																<li class="nav-item "><a href="#"
																	class="nav-link"></i>연차휴가신청 
																</a></li>
																<li class="nav-item"><a href="#" class="nav-link">
																		연차휴가 임시저장
																</a></li>
																<li class="nav-item"><a href="#" class="nav-link">
																		휴가 사용 현황
																</a></li>	
																<li class="nav-item"><a href="#" class="nav-link">
																		소속 휴가 통계
																</a></li>		
															</ul>	
														</div>
													</div>
												</div>
												<div class="card">
													<div class="card-header">
														<a class="collapsed card-link" data-toggle="collapse" href="#collapseThree" >근태변경 </a>
													</div>
													<div id="collapseThree" class="collapse" data-parent="#accordion">
														<div class="card-body">
															<ul class="nav nav-pills flex-column">
																<li class="nav-item "><a href="###"
																	class="nav-link">전직원 근태 변경
																</a></li>															
															</ul>	
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- /.card-body -->
									</div>
								</div>
			
			
			</div>
			</section>	
							
								
	
	</div>
	<jsp:include page="../common/footer.jsp" />

</body>
</html>