<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<div class="card card-info card-outline card-outline-tabs">
			<div class="card-header p-0 border-bottom-0">
				<ul class="nav nav-tabs" id="custom-tabs-mainRequest-tab" role="tablist">
					<li class="nav-item"><a class="nav-link " id="custom-tabs-mainRequestMtr-tab" href="mainRequest.mtr" role="tab" aria-controls="custom-tabs-mainRequestMtr" aria-selected="true" style="font-size: small">회의실신청</a></li>
					<li class="nav-item"><a class="nav-link" id="custom-tabs-mainRequestEq-tab" href="mainRequest.eq" role="tab" aria-controls="custom-tabs-mainRequestEq" aria-selected="false" style="font-size: small">비품신청</a></li>
				</ul>
			</div>

			<div class="card-body">
				<div class="tab-content" id="custom-tabs-mainRequest-tabContent"> 
					<div class="tab-pane fade " id="custom-tabs-mainRequestMtr" role="tabpanel" aria-labelledby="custom-tabs-mainRequestMtr-tab">
						<!-- 회의실 -->
						<jsp:include page="./mainMtr.jsp" />
					</div>
					<div class="tab-pane fade " id="custom-tabs-mainRequestEq" role="tabpanel" aria-labelledby="custom-tabs-mainRequestEq-tab">
						<!-- 비품 -->
						<jsp:include page="./mainEq.jsp" />
					</div>
				</div>
			</div>
			<!-- /.card -->
		</div>

		<c:choose>
			<c:when test="${ mainPage == 1 }">
				<script>
							$('#custom-tabs-mainRequestMtr').addClass('show active');
							$('#custom-tabs-mainRequestEq').removeClass('show active');		
							
							$('#custom-tabs-mainRequestMtr-tab').addClass('active');
							$('#custom-tabs-mainRequestEq-tab').removeClass('active');
							
							$('#custom-tabs-mainRequestMtr-tab').attr('aria-selected', 'true');
							$('#custom-tabs-mainRequestEq-tab').attr('aria-selected', 'false');			
				</script>
			</c:when>
			<c:when test="${ mainPage == 2 }">
				<script>
							$('#custom-tabs-mainRequestMtr').removeClass('show active');
							$('#custom-tabs-mainRequestEq').addClass('show active');
							
							$('#custom-tabs-mainRequestMtr-tab').removeClass('active');
							$('#custom-tabs-mainRequestEq-tab').addClass('active');
							
							$('#custom-tabs-mainRequestMtr-tab').attr('aria-selected', 'false');
							$('#custom-tabs-mainRequestEq-tab').attr('aria-selected', 'true');
				</script>
			</c:when>
		</c:choose>
	</div>
	
</body>
</html>