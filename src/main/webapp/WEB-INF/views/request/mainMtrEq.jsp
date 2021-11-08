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
	<div id="cardRequest">

				
		  	      <div class="card card-info card-outline card-outline-tabs" style="height: 230px;">
		              <div class="card-header p-0 border-bottom-0">
		                <ul class="nav nav-tabs" id="custom-tabs-mainRequest-tab" role="tablist">
		                  <li class="nav-item ">
		                    <a class="nav-link active" id="custom-tabs-mainRequestMtr-tab" href="#custom-tabs-mainRequestMtr" role="tab" aria-controls="custom-tabs-mainRequestMtr" aria-selected="true" style="font-size: small">회의실신청내역</a>
		                  </li>
		                  <li class="nav-item">
		                    <a class="nav-link" id="custom-tabs-mainRequestEq-tab" href="#custom-tabs-mainRequestEq" role="tab" aria-controls="custom-tabs-mainRequestEq" aria-selected="true" style="font-size: small">비품신청내역</a>
		                  </li>
		                </ul>
		              </div>
		              
		              <div class="card-body">
						<div class="tab-content" id="custom-tabs-mainRequest-tabContent">
						
							<div class="tab-pane fade show active" id="custom-tabs-mainRequestMtr" role="tabpanel" aria-labelledby="custom-tabs-mainRequestMtr-tab">
							<!-- <table id="mainRequestMtrTable">
							<tbody>
								<tr>
									<td> -->
										<c:choose>
											<c:when test="${ empty mtrRList }">								
												<div style ="text-align: center" style="font-size: small;">
													<strong style="font-size: small;" > 회의실 신청 내역이 없습니다. </strong>
												</div>
											</c:when>
											<c:when test="${ not empty mtrRList }">		
											<div style ="text-align: center" style="font-size: small;">							
												<table id="mainRequestMtrTable">
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
				 			<div class="tab-pane fade " id="custom-tabs-mainRequestEq" role="tabpanel" aria-labelledby="custom-tabs-mainRequestEq-tab">
							<!-- <table id="mainRequestEqTable">
							<tbody>
								<tr>
									<td> -->
										<c:choose>
											<c:when test="${ empty eqRList }">								
												<div style ="text-align: center" style="font-size: small;">
													<strong style="font-size: small;" > 비품 신청내역이 없습니다. </strong>
												</div>
											</c:when>
											<c:when test="${ not empty eqRList }">			
											<div style ="text-align: center" style="font-size: small;">					
												<table id="mainRequestEqTable">
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
		$('#custom-tabs-mainRequestMtr-tab').click(function(){
			$('#custom-tabs-mainRequestMtr').addClass('show active');
			$('#custom-tabs-mainRequestEq').removeClass('show active');		
			
			$('#custom-tabs-mainRequestMtr-tab').addClass('active');
			$('#custom-tabs-mainRequestEq-tab').removeClass('active');
			
			$('#custom-tabs-mainRequestMtr-tab').attr('aria-selected', 'true');
			$('#custom-tabs-mainRequestEq-tab').attr('aria-selected', 'false');		
		})
		
		$('#custom-tabs-mainRequestEq-tab').click(function(){
			$('#custom-tabs-mainRequestMtr').removeClass('show active');
			$('#custom-tabs-mainRequestEq').addClass('show active');
			
			$('#custom-tabs-mainRequestMtr-tab').removeClass('active');
			$('#custom-tabs-mainRequestEq-tab').addClass('active');
			
			$('#custom-tabs-mainRequestMtr-tab').attr('aria-selected', 'false');
			$('#custom-tabs-mainRequestEq-tab').attr('aria-selected', 'true');		
		})
	</script>	
</body>
</html>