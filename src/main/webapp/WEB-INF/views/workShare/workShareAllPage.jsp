<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloWorks - 업무공유</title>
</head>
<style>
	#WorkShareTable, #savedWSTable{
	height:450px;
	}
</style>
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
                    <a class="nav-link active" id="custom-tabs-four-unchecked-tab" href="unCheckedListWS.ws" role="tab" aria-controls="custom-tabs-four-unchecked" aria-selected="true">미확인 업무</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="custom-tabs-four-recv-tab" href="recvListWS.ws" role="tab" aria-controls="custom-tabs-four-recv" aria-selected="false">수신 업무</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="custom-tabs-four-send-tab" href="sendListWS.ws" role="tab" aria-controls="custom-tabs-four-send" aria-selected="false">발신 업무</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="custom-tabs-four-saved-tab" href="savedListWS.ws" role="tab" aria-controls="custom-tabs-four-saved" aria-selected="false">임시 저장</a>
                  </li>
                </ul>
              </div>
   
         <!-- card body -->
         <div class="card-body">
           <div class="tab-content" id="custom-tabs-four-tabContent">
             <div class="tab-pane fade show active" id="custom-tabs-four-unchecked" role="tabpanel" aria-labelledby="custom-tabs-four-unchecked-tab">
					<!-- 미확인 업무 -->
					<jsp:include page="./unCheckedWSList.jsp" />
 			 </div>
             <div class="tab-pane fade" id="custom-tabs-four-recv" role="tabpanel" aria-labelledby="custom-tabs-four-recv-tab">
					<!-- 수신 업무 -->
					<jsp:include page="./recvWSList.jsp" />
             </div>
             <div class="tab-pane fade" id="custom-tabs-four-send" role="tabpanel" aria-labelledby="custom-tabs-four-send-tab">
					<!-- 발신 업무 -->
					<jsp:include page="./sendWSList.jsp" />
					<%-- <jsp:include page="./sendWSNEWLIST.jsp" /> --%>
             </div>
             <div class="tab-pane fade" id="custom-tabs-four-saved" role="tabpanel" aria-labelledby="custom-tabs-four-saved-tab">
					<!-- 임시저장 업무 -->
					<jsp:include page="./savedWSList.jsp" />
             </div>
           </div>
         </div>
         
     <!-- 메뉴바 -> 특정 탭 연결 -->     
     <c:choose>
 		<c:when test="${ page == 1 }">
			<script>
			$('#custom-tabs-four-unchecked').addClass('show active');
			$('#custom-tabs-four-recv').removeClass('show active');
			$('#custom-tabs-four-send').removeClass('show active');
			$('#custom-tabs-four-saved').removeClass('show active');
			
			$('#custom-tabs-four-unchecked-tab').addClass('active');
			$('#custom-tabs-four-recv-tab').removeClass('active');
			$('#custom-tabs-four-send-tab').removeClass('active');
			$('#custom-tabs-four-saved-tab').removeClass('active');

			$('#custom-tabs-four-unchecked-tab').attr('aria-selected', 'true');
			$('#custom-tabs-four-recv-tab').attr('aria-selected', 'false');
			$('#custom-tabs-four-send-tab').attr('aria-selected', 'false');
			$('#custom-tabs-four-saved-tab').attr('aria-selected', 'false');
			</script>
		</c:when> 
		<c:when test="${ page == 2 }">
			<script>
			$('#custom-tabs-four-unchecked').removeClass('show active');
			$('#custom-tabs-four-recv').addClass('show active');
			$('#custom-tabs-four-send').removeClass('show active');
			$('#custom-tabs-four-saved').removeClass('show active');
			
			$('#custom-tabs-four-unchecked-tab').removeClass('active');
			$('#custom-tabs-four-recv-tab').addClass('active');
			$('#custom-tabs-four-send-tab').removeClass('active');
			$('#custom-tabs-four-saved-tab').removeClass('active');
			
			$('#custom-tabs-four-unchecked-tab').attr('aria-selected', 'false');
			$('#custom-tabs-four-recv-tab').attr('aria-selected', 'true');
			$('#custom-tabs-four-send-tab').attr('aria-selected', 'false');
			$('#custom-tabs-four-saved-tab').attr('aria-selected', 'false');
			</script>
		</c:when>
		<c:when test="${ page == 3 }">
			<script>
			$('#custom-tabs-four-unchecked').removeClass('show active');
			$('#custom-tabs-four-recv').removeClass('show active');
			$('#custom-tabs-four-send').addClass('show active');
			$('#custom-tabs-four-saved').removeClass('show active');
			
			$('#custom-tabs-four-unchecked-tab').removeClass('active');
			$('#custom-tabs-four-recv-tab').removeClass('active');
			$('#custom-tabs-four-send-tab').addClass('active');
			$('#custom-tabs-four-saved-tab').removeClass('active');
			
			$('#custom-tabs-four-unchecked-tab').attr('aria-selected', 'false');
			$('#custom-tabs-four-recv-tab').attr('aria-selected', 'false');
			$('#custom-tabs-four-send-tab').attr('aria-selected', 'true');
			$('#custom-tabs-four-saved-tab').attr('aria-selected', 'false');
			</script>
		</c:when>
		<c:when test="${ page == 4 }">
			<script>
			$('#custom-tabs-four-unchecked').removeClass('show active');
			$('#custom-tabs-four-recv').removeClass('show active');
			$('#custom-tabs-four-send').removeClass('show active');
			$('#custom-tabs-four-saved').addClass('show active');
			
			$('#custom-tabs-four-unchecked-tab').removeClass('active');
			$('#custom-tabs-four-recv-tab').removeClass('active');
			$('#custom-tabs-four-send-tab').removeClass('active');
			$('#custom-tabs-four-saved-tab').addClass('active');
			
			$('#custom-tabs-four-unchecked-tab').attr('aria-selected', 'false');
			$('#custom-tabs-four-recv-tab').attr('aria-selected', 'false');
			$('#custom-tabs-four-send-tab').attr('aria-selected', 'false');
			$('#custom-tabs-four-saved-tab').attr('aria-selected', 'true');
			</script>
		</c:when>
	</c:choose>
	</div>
</div>
</div>
	<jsp:include page="../common/footer.jsp"/>

<script>
// 일반 상세 조회 페이지 
$(function() {
	$("#WorkShareTable tbody tr").click(
			function() {
			var wno = $(this).children().eq(0).text();
			console.log("wno : " + wno);
			
			location.href = "detail.ws?wno="+wno;
				
			});
});

// 임시저장 상세 조회 페이지
$(function() {
	$("#savedWSTable tbody tr").click(
			function() {
			var wno = $(this).children().eq(0).text();
			console.log("wno : " + wno);
			
			location.href = "sDetail.ws?wno="+wno;
				
			});
});

</script>
</body>
</html>