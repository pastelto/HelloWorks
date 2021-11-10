<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재</title>
<style>
	.content-wrapper {
		overflow: auto;
	}
	
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">

		<!-- 페이지 헤더 -->
		<section class="content-header">
	      <div class="container-fluid">
	        <div class="row mb-2">
	          <div class="col-sm-6">
	            <h4><i class="fas fa-chart-pie"></i> <b>내결재함</b></h4>
	          </div>
	        </div>
	      </div><!-- /.container-fluid -->
	    </section>

		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-12">			
		            <div class="card card-info card-outline card-outline-tabs">
		              <div class="card-header p-0 border-bottom-0">
		                <ul class="nav nav-tabs" id="custom-tabs-tempororyApproval-tab" role="tablist">
		                  <li class="nav-item">
		                    <a class="nav-link " id="custom-tabs-normalApproval-tab" href="myNormal.ea" role="tab" aria-controls="custom-tabs-normalApproval" aria-selected="true">일반 결재</a>
		                  </li>
		                  <li class="nav-item">
		                    <a class="nav-link" id="custom-tabs-expenditureApproval-tab"  href="myExpenditure.ea" role="tab" aria-controls="custom-tabs-expenditureApproval" aria-selected="false">지출 결재</a>
		                  </li>
		                </ul>
		              </div>
		              
		              <div class="card-body">
						<div class="tab-content" id="custom-tabs-tempororyApproval-tabContent">
						
							<div class="tab-pane fade " id="custom-tabs-normalApproval" role="tabpanel" aria-labelledby="custom-tabs-normalApproval-tab">
									<!-- 일반결재 -->
									<jsp:include page="./myApprovalNormal.jsp" />
				 			</div>
				 			<div class="tab-pane fade " id="custom-tabs-expenditureApproval" role="tabpanel" aria-labelledby="custom-tabs-expenditureApproval-tab">
									<!-- 지출결재 -->
									<jsp:include page="./myApprovalExpenditure.jsp" />
				 			</div>
				 		</div>
		              </div>
		              <!-- /.card -->
		          	  </div>
		          	  <c:choose>
						<c:when test = "${ page == 1 }">
							<script>
							$('#custom-tabs-normalApproval').addClass('show active');
							$('#custom-tabs-expenditureApproval').removeClass('show active');
							
							$('#custom-tabs-normalApproval-tab').addClass('active');
							$('#custom-tabs-expenditureApproval-tab').removeClass('active');
							
							$('#custom-tabs-normalApproval-tab').attr('aria-selected', 'true');
							$('#custom-tabs-expenditureApproval-tab').attr('aria-selected', 'false');
							</script>
						</c:when>
						<c:when test = "${ page == 2 }">
							<script>
							$('#custom-tabs-normalApproval').removeClass('show active');
							$('#custom-tabs-expenditureApproval').addClass('show active');
							
							$('#custom-tabs-normalApproval-tab').removeClass('active');
							$('#custom-tabs-expenditureApproval-tab').addClass('active');
							
							$('#custom-tabs-normalApproval-tab').attr('aria-selected', 'false');
							$('#custom-tabs-expenditureApproval-tab').attr('aria-selected', 'true');
							</script>
						</c:when>
					</c:choose>
		          </div>			
			</div>
		</section>
	</div>
	
	
	
	<jsp:include page="../common/footer.jsp" />
	
	<!-- detail view -->
	<script> 
		function detailApproval(apNo, detailClass){
			
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