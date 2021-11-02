<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .content-wrapper{
      overflow:auto;
   }
   
#attendanceSidebar{
	font-size :small !important;
	text-align:left;
}


</style>
</head>
<body>
<!-- 사이드바 메뉴 -->
	<div class=" text-center col-2" >
	
	
			  		<section class="content-header">
						<div class="container-fluid">
							<div class="row">
								<div class="col-10">			
									<h4>
										<i class="nav-icon fas fa-briefcase"></i><b> &nbsp; 근태현황</b>
									</h4>
								</div>
							</div>
						</div>
					</section>
		
		 
					
		        	<div class="content">
		               <div id="attendanceSidebar" style="width : 220px; margin-left : 30px;">
      
                           
                           
				              <div class="card card-info card-outline">
				              <div class="card-header">
				                <h3 class="card-title">근태 관리</h3>
				
				                <div class="card-tools">
				                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
				                    <i class="fas fa-minus"></i>
				                  </button>
				                </div>
				              </div>
				              <div class="card-body p-0">
				                <ul class="nav nav-pills flex-column">
				                  <li class="nav-item active">
				                    <a href="attendanceApiView.ps" class="nav-link">
				                      <i class="fas fa-inbox"></i> 출근기록
				                      
				                    </a>
				                  </li>
				                  <li class="nav-item">
				                    <a href="#" class="nav-link" onclick="checkJobcode();">
				                      <i class="far fa-envelope"></i> 부서원 출결 조회
				                    </a>
				                  </li>
				                  <li class="nav-item">
				                    <a href="#" class="nav-link" onclick="checkJob();">
				                      <i class="far fa-file-alt"></i> 소속 근로시간 통계
				                    </a>
				                  </li>
				                </ul>
				              </div>
				            </div>
                           
                           
                  
          					  <!-- /.card -->
				            <div class="card card-info card-outline">
				              <div class="card-header">
				                <h3 class="card-title">연차휴가관리</h3>
				
				                <div class="card-tools">
				                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
				                    <i class="fas fa-minus"></i>
				                  </button>
				                </div>
				              </div>
				              <!-- /.card-header -->
				              <div class="card-body p-0">
				                <ul class="nav nav-pills flex-column">
				                  <li class="nav-item">
				                    <a class="nav-link" href="vacationForm.ps"><i class="far fa-circle text-danger"></i> 연차휴가신청</a>
				                  </li>
				                  <li class="nav-item">
				                    <a class="nav-link" href="vacationUse.ps"><i class="far fa-circle text-warning"></i> 연차 사용 현황</a>
				                  </li>
				                  
				                  <!-- 
				                  <li class="nav-item">
				                    <a class="nav-link" href="vacationStatistics.ps"><i class="far fa-circle text-primary"></i> 소속 연차 통계</a>
				                  </li> -->
				                  <!-- 인사팀만 조회가능 -->
				                     <c:if test="${ loginUser.deptCode eq 'A1' }">
					                  <li class="nav-item">
					               
					                    <a class="nav-link" href="hrOnlyPage.ps"><i class="far fa-circle text-info"></i> 결재 문서함
					                    <span class="badge bg-primary float-right">12</span></a>
					         			
					                  </li>
				                  </c:if>
				                </ul>
				              </div>
				            </div>
    

                           
                        </div>
         			</div>
           
	</div>
	<!-- 사이드바 -->
	<script>
		function checkJobcode(){
			var jobName = '${loginUser.jobName}';	
			var deptName = '${loginUser.deptDname}';
			
			if(deptName == '인사팀'){
				location.href="checkDeptTimeAll.ps";
			}else{
				if(jobName == '팀원'){
					alert("팀장 이상만 조회 할 수 있습니다.")				
					return false;
				}else{
					location.href="checkDeptTimeAll.ps";
				}					
			}
		}
		
		function checkJob(){
			var jobName = '${loginUser.jobName}';	
			
	
			if(jobName == '팀원'){
				alert("팀장 이상만 조회 할 수 있습니다.")				
				return false;
			}else{
				location.href="wtStatistics.ps";
			}					
		
		}
	
	</script>
</body>
</html>