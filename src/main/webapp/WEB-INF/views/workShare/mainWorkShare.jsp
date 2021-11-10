<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.content-wrapper {
		overflow: auto;
	}
	
	.calTab{
		 width:20%;
		 text-align: center;
	}
</style>
</head>
<body>
	<div id="cardWorkShare">


		<div class="card card-info card-outline card-outline-tabs"
			style="height: 355px;">
			<div class="card-header p-0 border-bottom-0 container-fluid">
				<ul class="nav nav-tabs" id="custom-tabs-mainWorkShare-tab"
					role="tablist">
					<li class="nav-item calTab"><a class="nav-link active"
						id="custom-tabs-unCheckedWorkShare-tab"
						href="#custom-tabs-unCheckedWorkShare" role="tab"
						aria-controls="custom-tabs-unCheckedWorkShare"
						aria-selected="true" style="font-size: small">미확인 업무</a></li>
					<li class="nav-item calTab"><a class="nav-link"
						id="custom-tabs-sendWorkShare-tab"
						href="#custom-tabs-sendWorkShare" role="tab"
						aria-controls="custom-tabs-sendWorkShare" aria-selected="true"
						style="font-size: small">발신 업무</a></li>
					<li class="" style="padding-top:5px; width:60%;">
					<div class="input-group input-group-sm float-right mr-1" style="width: 60%;">
						<input type="text" name="table_search"
							class="form-control" placeholder="Search"
							id="titleKeyword" >
	
						<div class="input-group-append">
							<button type="submit" class="btn btn-default">
								<i class="fas fa-search"></i>
							</button>
						</div>
					</div>
					</li>
				</ul>



			</div>

			<div class="card-body">
				<div class="tab-content" id="custom-tabs-mainWorkShare-tabContent">

					<div class="tab-pane fade show active" id="custom-tabs-unCheckedWorkShare" role="tabpanel" aria-labelledby="custom-tabs-unCheckedWorkShare-tab">
						<c:choose>
							<c:when test="${ empty unCheckedList }">
								<div style="text-align: center" style="font-size: small;">
									<strong style="font-size: small;"> 모든 업무를 확인하였습니다. </strong>
								</div>
							</c:when>
							<c:when test="${ not empty unCheckedList }">								
								<div class="table-responsive p-0"
										style="height: 250px; text-align: center">
										<table class="table table-head-fixed text-nowrap"
											id="unCheckedListTable">
											<thead>
												<tr>
													<th>번호</th>
													<th>제목</th>
													<th>발신인</th>
													<th>수신일</th>
												</tr>
											</thead>
											<tbody>

											</tbody>
										</table>
									</div>
							</c:when>
						</c:choose>
					</div>
					
					<div class="tab-pane fade " id="custom-tabs-sendWorkShare"
						role="tabpanel" aria-labelledby="custom-tabs-sendWorkShare-tab">
						<c:choose>
							<c:when test="${ empty sendList }">
								<div style="text-align: center" style="font-size: small;">
									<strong style="font-size: small;"> 작성한 업무가 없습니다. </strong>
								</div>
							</c:when>
							<c:when test="${ not empty sendList }">				
									<div class="table-responsive p-0"
										style="height: 250px; text-align: center">
										<table class="table table-head-fixed text-nowrap"
											id="sendListTable">
											<thead>
												<tr>
													<th>번호</th>
													<th>제목</th>
													<th>발신일</th>
												</tr>
											</thead>
											<tbody>

											</tbody>
										</table>
									</div>
							</c:when>
						</c:choose>
					</div>
				</div>
			</div>
		</div>

	</div>
	<script>
		$('#custom-tabs-unCheckedWorkShare-tab')
				.click(
						function() {
							$('#custom-tabs-unCheckedWorkShare').addClass(
									'show active');
							$('#custom-tabs-sendWorkShare').removeClass(
									'show active');

							$('#custom-tabs-unCheckedWorkShare-tab').addClass(
									'active');
							$('#custom-tabs-sendWorkShare-tab').removeClass(
									'active');

							$('#custom-tabs-unCheckedWorkShare-tab').attr(
									'aria-selected', 'true');
							$('#custom-tabs-sendWorkShare-tab').attr(
									'aria-selected', 'false');
						})

		$('#custom-tabs-sendWorkShare-tab').click(
				function() {
					$('#custom-tabs-unCheckedWorkShare').removeClass(
							'show active');
					$('#custom-tabs-sendWorkShare').addClass('show active');

					$('#custom-tabs-unCheckedWorkShare-tab').removeClass(
							'active');
					$('#custom-tabs-sendWorkShare-tab').addClass('active');

					$('#custom-tabs-unCheckedWorkShare-tab').attr(
							'aria-selected', 'false');
					$('#custom-tabs-sendWorkShare-tab').attr('aria-selected',
							'true');
				})
	</script>
	
	<!-- 빠른검색기능 -->
	<script> 
    $(function(){
          	   $("#titleKeyword").keyup(function() { 
    		   var k = $(this).val();
    		   
    		   $("#sendListTable > tbody > tr").hide();
    		   var temp1 = $("#sendListTable > tbody > tr > td:nth-child(5n+2):contains('" + k + "')");
    		   
    		   $("#unCheckedListTable > tbody > tr").hide();
    		   var temp2 = $("#unCheckedListTable > tbody > tr > td:nth-child(5n+2):contains('" + k + "')");

    		   $(temp1).parent().show();
    		   $(temp2).parent().show();
          	 })

       })
    </script>
    
    <script>
 		// 발송업무 & 미확인 상세 조회 페이지 
    	function goDetail(num){
    		location.href = "detail.ws?wno="+num;
    	}
    </script>

	
	
</body>
</html>