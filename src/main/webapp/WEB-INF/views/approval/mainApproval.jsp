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
	 .pendingSimple{
 	ovarflow: auto;
 	padding-left:5px;
 	padding-top:5px;
 	font-familiy:함초롱바탕;
 	
	 }
	 .ap_progress{
	 	color: navy;
	 }
	 .apTitle:hover{
	 	background-color:ivory;
	 }
	 .div_comment{
	 	background-color:#FCF8F7;
	 }

</style>
</head>
<body>
	<div id="cardApproval">

				
		  	      <div class="card card-info card-outline card-outline-tabs" style="height: 355px;">
		              <div class="card-header p-0 border-bottom-0">
		                <ul class="nav nav-tabs" id="custom-tabs-mainApproval-tab" role="tablist">
		                  <li class="nav-item">
		                    <a class="nav-link active" id="custom-tabs-myApproval-tab" href="#custom-tabs-myApproval" role="tab" aria-controls="custom-tabs-myApproval" aria-selected="true" style="font-size: small">내결재함</a>
		                  </li>
		                  <li class="nav-item">
		                    <a class="nav-link" id="custom-tabs-pendingApproval-tab" href="#custom-tabs-pendingApproval" role="tab" aria-controls="custom-tabs-pendingApproval" aria-selected="false" style="font-size: small">미결재함</a>
		                  </li>
		                </ul>
		              </div>
		              
		              <div class="card-body">
						<div class="tab-content" id="custom-tabs-mainApproval-tabContent">
						
								<div class="tab-pane fade show active" id="custom-tabs-myApproval" role="tabpanel" aria-labelledby="custom-tabs-myApproval-tab">
									
										<c:choose>
											<c:when test="${ empty acList }">								
												<div style ="text-align: center" style="font-size: small;">
													<strong style="font-size: small;" > 새로운 comment가 없습니다. </strong>
												</div>
											</c:when>
										</c:choose>
										<c:choose>
											<c:when test="${ not empty acList }">
												<div style ="text-align: center" style="font-size: small;">
													<table id="mainMyApprovalTable">
														<tbody>
														</tbody>
													</table>
												</div>
											</c:when>
										</c:choose>
									
									
				 			</div>
				 			<div class="tab-pane fade " id="custom-tabs-pendingApproval" role="tabpanel" aria-labelledby="custom-tabs-pendingApproval-tab">
									
										<c:choose>
											<c:when test="${ empty pendingList }">								
												<div style ="text-align: center">
													<strong style="font-size: small;" > 새로운 미결재 문서가 없습니다. </strong>
												</div>
											</c:when>
										</c:choose>
										<c:choose>
											<c:when test="${ not empty pendingList }">
												<div style ="text-align: center" style="font-size: small;">
													<table id="mainPendingApprovalTable">
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
		$("#custom-tabs-myApproval-tab").click(function(){
			$('#custom-tabs-myApproval').addClass('show active');
			$('#custom-tabs-pendingApproval').removeClass('show active');		
			
			$('#custom-tabs-myApproval-tab').addClass('active');
			$('#custom-tabs-pendingApproval-tab').removeClass('active');
			
			$('#custom-tabs-myApproval-tab').attr('aria-selected', 'true');
			$('#custom-tabs-pendingApproval-tab').attr('aria-selected', 'false');			
		})
		
		$("#custom-tabs-pendingApproval-tab").click(function(){
			$('#custom-tabs-myApproval').removeClass('show active');
			$('#custom-tabs-pendingApproval').addClass('show active');
			
			$('#custom-tabs-myApproval-tab').removeClass('active');
			$('#custom-tabs-pendingApproval-tab').addClass('active');
			
			$('#custom-tabs-myApproval-tab').attr('aria-selected', 'false');
			$('#custom-tabs-pendingApproval-tab').attr('aria-selected', 'true');
		})
		
	
	</script>
	<script>
		function selectApDetail(apNo, detailClass){
			
			console.log("apNo : " + apNo);
			console.log("detailClass : " + detailClass)
			
			switch(detailClass){
				case "기안" :
					location.href="<%=request.getContextPath()%>/normalDetail.ea?apNo="+ apNo;
					break;
				case "공문" :
					location.href="<%=request.getContextPath()%>/diplomaDetail.ea?apNo="+ apNo;
					break;
				case "인사" :
					location.href="<%=request.getContextPath()%>/hrDetail.ea?apNo="+ apNo;
					break;
				case "회의" :
					location.href="<%=request.getContextPath()%>/minutesDetail.ea?apNo="+ apNo;
					break;
				case "지출" :
					location.href="<%=request.getContextPath()%>/expenditureDetail.ea?apNo="+ apNo;
					break;
			}
			
		}
	</script>
</body>
</html>