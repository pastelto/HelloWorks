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
	<div id="cardApproval">

				
		  	      <div class="card card-info card-outline card-outline-tabs" style="height: 355px;">
		              <div class="card-header p-0 border-bottom-0">
		                <ul class="nav nav-tabs" id="custom-tabs-mainApproval-tab" role="tablist">
		                  <li class="nav-item">
		                    <a class="nav-link " id="custom-tabs-myApproval-tab" href="#custom-tabs-myApproval" role="tab" aria-controls="custom-tabs-myApproval" aria-selected="true" style="font-size: small">내결재함</a>
		                  </li>
		                  <li class="nav-item">
		                    <a class="nav-link" id="custom-tabs-pendingApproval-tab" href="#custom-tabs-pendingApproval" role="tab" aria-controls="custom-tabs-pendingApproval" aria-selected="false" style="font-size: small">미결재함</a>
		                  </li>
		                </ul>
		              </div>
		              
		              <div class="card-body">
						<div class="tab-content" id="custom-tabs-mainApproval-tabContent">
						
							<div class="tab-pane fade " id="custom-tabs-myApproval" role="tabpanel" aria-labelledby="custom-tabs-myApproval-tab">
									<!-- 일반결재 -->
									<jsp:include page="./mainMyApproval.jsp" />
				 			</div>
				 			<div class="tab-pane fade " id="custom-tabs-pendingApproval" role="tabpanel" aria-labelledby="custom-tabs-pendingApproval-tab">
									<!-- 지출결재 -->
									<jsp:include page="./mainPendingTray.jsp" />
				 			</div>
				 		</div>
		              </div>
		              <!-- /.card -->
		          	  </div>
		          	  
		          	  <c:choose>
						<c:when test = "${ commentPage == 1 }">
							<script>
							$('#custom-tabs-myApproval').addClass('show active');
							$('#custom-tabs-pendingApproval').removeClass('show active');		
							
							$('#custom-tabs-myApproval-tab').addClass('active');
							$('#custom-tabs-pendingApproval-tab').removeClass('active');
							
							$('#custom-tabs-myApproval-tab').attr('aria-selected', 'true');
							$('#custom-tabs-pendingApproval-tab').attr('aria-selected', 'false');			
							</script>
						</c:when>
						<c:when test = "${ commentPage == 2 }">
							<script>
							$('#custom-tabs-myApproval').removeClass('show active');
							$('#custom-tabs-pendingApproval').addClass('show active');
							
							$('#custom-tabs-myApproval-tab').removeClass('active');
							$('#custom-tabs-pendingApproval-tab').addClass('active');
							
							$('#custom-tabs-myApproval-tab').attr('aria-selected', 'false');
							$('#custom-tabs-pendingApproval-tab').attr('aria-selected', 'true');
							</script>
						</c:when>
					</c:choose>
		     </div>				
	
	<script>
	
		var flag = 0;
		
	 	$(function(){
	 		$("#custom-tabs-myApproval-tab").click(function(){
	 			
	 			location.href="<%=request.getContextPath()%>/main.mi?flag="+ flag;		 		
	 		})
	 		
	 		$("#custom-tabs-pendingApproval-tab").click(function(){

	 				flag = 1;
	 				
	 			location.href="<%=request.getContextPath()%>/main.mi?flag="+ flag;		 		
	 		})
	 	});
	</script>
</body>
</html>