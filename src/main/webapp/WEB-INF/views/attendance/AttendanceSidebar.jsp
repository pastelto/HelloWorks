<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
}


</style>
</head>
<body>
<!-- 사이드바 메뉴 -->
	<div class=" text-center" >
	
	
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
                              <div class="card-header text-center">
								<h6 style="margin-bottom: 0px">
									<b>근태현황</b>
								</h6>
							</div>
                              <div class="card-body">
                                 <div id="accordion">
                                    <div class="card">
                                       <div class="card-header">
                                          <a class="card-link" data-toggle="collapse" href="#collapseOne" >근태 관리 </a>
                                       </div>
                                       <div id="collapseOne" class="collapse" data-parent="#accordion">                                          
                                          <ul class="nav nav-pills flex-column">
                                             <li class="nav-item "><a href="attendanceApiView.ps" class="nav-link">출근기록 </a></li>
                                             <li class="nav-item"><a href="checkDeptEmp.ps" class="nav-link">부서원 출결 조회</a></li>
                                             <li class="nav-item"><a href="#" class="nav-link">소속 근로시간 통계</a></li>      
                                          </ul>                                                                                 
                                       </div>
                                    </div>
                                    <div class="card">
                                       <div class="card-header">
                                          <a class="collapsed card-link" data-toggle="collapse" href="#collapseTwo" >연차휴가관리</a>
                                       </div>
                                       <div id="collapseTwo" class="collapse" data-parent="#accordion">
                                             <ul class="nav nav-pills flex-column">
                                                <li class="nav-item "><a href="#" class="nav-link"></i>연차휴가신청 </a></li>
                                                <li class="nav-item"><a href="#" class="nav-link">연차휴가 임시저장</a></li>
                                                <li class="nav-item"><a href="#" class="nav-link"> 휴가 사용 현황 </a></li>   
                                                <li class="nav-item"><a href="#" class="nav-link"> 소속 휴가 통계</a></li>    
                                             </ul>   
                                       </div>
                                    </div>
                                    <div class="card">
                                       <div class="card-header">
                                          <a class="collapsed card-link" data-toggle="collapse" href="#collapseThree" >근태변경 </a>
                                       </div>
                                       <div id="collapseThree" class="collapse" data-parent="#accordion">
                                             <ul class="nav nav-pills flex-column">
                                                <li class="nav-item "><a href="###"class="nav-link">전직원 근태 변경</a></li>                                             
                                             </ul>   
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <!-- /.card-body -->
                           </div>
                        </div>
         			</div>
        
	
	</div>
	<!-- 사이드바 -->
	
</body>
</html>