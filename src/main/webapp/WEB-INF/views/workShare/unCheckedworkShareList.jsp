<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloWorks - 업무공유</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	
	<div class="content-wrapper">
	
	<!-- 페이지 헤더 -->
	<section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h4><i class="fas fa-link"></i> <b>업무공유</b></h4>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
	
	<!-- 탭 화면 -->
	<div class="col-12">
            <div class="card card-primary card-outline card-outline-tabs">
              <div class="card-header p-0 border-bottom-0">
                <ul class="nav nav-tabs" id="custom-tabs-four-tab" role="tablist">
                  <li class="nav-item">
                    <a class="nav-link active" id="custom-tabs-four-unchecked-tab" data-toggle="pill" href="#custom-tabs-four-unchecked" role="tab" aria-controls="custom-tabs-four-unchecked" aria-selected="true">미확인 업무</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="custom-tabs-four-recv-tab" data-toggle="pill" href="#custom-tabs-four-recv" role="tab" aria-controls="custom-tabs-four-recv" aria-selected="false">수신 업무</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="custom-tabs-four-send-tab" data-toggle="pill" href="#custom-tabs-four-send" role="tab" aria-controls="custom-tabs-four-send" aria-selected="false">발신 업무</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="custom-tabs-four-saved-tab" data-toggle="pill" href="#custom-tabs-four-saved" role="tab" aria-controls="custom-tabs-four-saved" aria-selected="false">임시 저장</a>
                  </li>
                </ul>
              </div>
              
              <!-- card body -->
         <div class="card-body">
           <div class="tab-content" id="custom-tabs-four-tabContent">
             <div class="tab-pane fade show active" id="custom-tabs-four-unchecked" role="tabpanel" aria-labelledby="custom-tabs-four-unchecked-tab">
					<!-- 미확인 업무 -->
					<jsp:include page="./unCheckedList.jsp" />
 			 </div>
             <div class="tab-pane fade" id="custom-tabs-four-recv" role="tabpanel" aria-labelledby="custom-tabs-four-recv-tab">
					<!-- 수신 업무 -->
					<jsp:include page="./unCheckedList.jsp" />
             </div>
             <div class="tab-pane fade" id="custom-tabs-four-send" role="tabpanel" aria-labelledby="custom-tabs-four-send-tab">
					<!-- 발신 업무 -->
					<jsp:include page="./sendWorkList.jsp" />
             </div>
             <div class="tab-pane fade" id="custom-tabs-four-saved" role="tabpanel" aria-labelledby="custom-tabs-four-saved-tab">
					<!-- 임시저장 업무 -->
             </div>
           </div>
         </div>
	
	<!-- content가 원래 있던 자리 -->

	</div>
</div>
</div>
	<jsp:include page="../common/footer.jsp"/>
	
<!-- 스크립트  -->
<script>

</script>
</body>
</html>