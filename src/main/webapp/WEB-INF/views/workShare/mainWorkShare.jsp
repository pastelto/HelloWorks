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
	
</style>
</head>
<body>
	<div id="cardWorkShare">

				
		  	      <div class="card card-info card-outline card-outline-tabs" style="height: 300px;">
		              <div class="card-header p-0 border-bottom-0">
		                <ul class="nav nav-tabs" id="custom-tabs-mainWorkShare-tab" role="tablist">
		                  <li class="nav-item ">
		                    <a class="nav-link active" id="custom-tabs-unCheckedWorkShare-tab" href="#custom-tabs-unCheckedWorkShare" role="tab" aria-controls="custom-tabs-unCheckedWorkShare" aria-selected="true" style="font-size: small">미확인 업무</a>
		                  </li>
		                  <li class="nav-item">
		                    <a class="nav-link" id="custom-tabs-sendWorkShare-tab" href="#custom-tabs-sendWorkShare" role="tab" aria-controls="custom-tabs-sendWorkShare" aria-selected="true" style="font-size: small">발신 업무</a>
		                  </li>
		                </ul>
		              </div>
		              
		              <div class="card-body">
						<div class="tab-content" id="custom-tabs-mainWorkShare-tabContent">
						
							<div class="tab-pane fade show active" id="custom-tabs-unCheckedWorkShare" role="tabpanel" aria-labelledby="custom-tabs-unCheckedWorkShare-tab">
							<!-- <table id="mainWorkShareTable">
							<tbody>
								<tr>
									<td> -->
										<c:choose>
											<c:when test="${ empty unCheckedList }">								
												<div style ="text-align: center" style="font-size: small;">
													<strong style="font-size: small;" > 모든 업무를 확인하였습니다. </strong>
												</div>
											</c:when>
											<c:when test="${ not empty unCheckedList }">		
											<div style ="text-align: center" style="font-size: small;">							
												<table id="unCheckedListTable">
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
									<!-- </td>
								</tr>
							</tbody>
						</table> -->
				 			</div>
				 			<div class="tab-pane fade " id="custom-tabs-sendWorkShare" role="tabpanel" aria-labelledby="custom-tabs-sendWorkShare-tab">
							<!-- <table id="sendWorkShareTable">
							<tbody>
								<tr>
									<td> -->
										<c:choose>
											<c:when test="${ empty sendList }">								
												<div style ="text-align: center" style="font-size: small;">
													<strong style="font-size: small;" > 작성한 업무가 없습니다. </strong>
												</div>
											</c:when>
											<c:when test="${ not empty sendList }">			
											<div style ="text-align: center" style="font-size: small;">					
												<table id="sendListTable">
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
									<!-- </td>
								</tr>
							</tbody>
						</table> -->
				 			</div>
				 		</div>
		              </div>
		              <!-- /.card -->
		          	  </div>
		          	  
		     </div>				
	<script>
		$('#custom-tabs-unCheckedWorkShare-tab').click(function(){
			$('#custom-tabs-unCheckedWorkShare').addClass('show active');
			$('#custom-tabs-sendWorkShare').removeClass('show active');		
			
			$('#custom-tabs-unCheckedWorkShare-tab').addClass('active');
			$('#custom-tabs-sendWorkShare-tab').removeClass('active');
			
			$('#custom-tabs-unCheckedWorkShare-tab').attr('aria-selected', 'true');
			$('#custom-tabs-sendWorkShare-tab').attr('aria-selected', 'false');			
		})
		
		$('#custom-tabs-sendWorkShare-tab').click(function(){
			$('#custom-tabs-unCheckedWorkShare').removeClass('show active');
			$('#custom-tabs-sendWorkShare').addClass('show active');		
			
			$('#custom-tabs-unCheckedWorkShare-tab').removeClass('active');
			$('#custom-tabs-sendWorkShare-tab').addClass('active');
			
			$('#custom-tabs-unCheckedWorkShare-tab').attr('aria-selected', 'false');
			$('#custom-tabs-sendWorkShare-tab').attr('aria-selected', 'true');		
		})
	</script>
	
	
	
</body>
</html>