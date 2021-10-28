<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- Member loginUser = new Member(); --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재</title>

<!-- summernote -->
 <link rel="stylesheet" href="./resources/plugins/summernote/summernote-bs4.min.css">

<style>	
	 td, span, input{
		font-weight:normal;!important;
		vertical-align: middle;!important;
	}
	#plus_line_btn{
		margin-bottom:15px;
	}
	#ccName{
		width: 300px; !important;
	}
	.bottom-margin0{
		margin-right:8px;
		margin-botton:0px;
	}
	.content-wrapper{
		overflow:auto;
	}
	input[id^="emp_level"], input[id^="emp_name"], input[id^="line"], input[id^="coo_level"], input[id^="coo_name"]{
		border : none;
		background-color: white;
		pointer-events: none;
	}
	input[id^="ccName"]{
		background-color: white;
		pointer-events: none;
	}
	input[id^="fieldWriter"], input[id^="userDept"]{
		border : none;
		background-color: white;
		pointer-events: none;
	}
	
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />


		<div class="content-wrapper">
			<!-- 페이지 헤더 -->
			<section class="content-header">
		      <div class="container-fluid">
		        <div class="row mb-2">
		          <div class="col-sm-6">
		            <h4><i class="fas fa-chart-pie"></i> <b>근태/휴가 결재</b></h4>
		          </div>
		        </div>
		      </div><!-- /.container-fluid -->
		    </section>
		    
			<section class="content">
			<form id="#" method="post" enctype="multipart/form-data">
				<div class="container-fluid">
					<div class="row">
						<div class="col-12">
							<div class="callout callout-info">							
								<table class="table table-bordered">
									<tbody>
										<tr>
											<td width="150px" colspan="3">
												<p style="font-size:0.8em;">근태/휴가 결재</p>
											</td>
											<td style="font-size:0.8em;" colspan="5">
												<label style="display: inline-block" class="bottom-margin0" >
													<input type="radio" name="doc_type"  value = "근태구분" id="normal_radio" >
													<span class="co_docu_cd_old" docu_cd="근태구분" style="cursor: pointer;">근태구분</span>											
												</label>
												&nbsp;
												<label style="display: inline-block" class="bottom-margin0">
													<input type="radio" name="doc_type" value = "휴가구분" id="dipl_radio">
													<span class="co_docu_cd_old" docu_cd="휴가구분" style="cursor: pointer;">휴가구분</span>										
												</label>
												&nbsp;
												<label style="display: inline-block" class="bottom-margin0">
													<input type="radio" name="doc_type" value = "조정신청" id="humanr_radio">
													<span class="co_docu_cd_old" docu_cd="조정신청" style="cursor: pointer;">조정신청</span>
												</label>
												&nbsp;
											</td>
										</tr>
									<!-- 	<tr id="attendance">
											<td  colspan="3">
												<p style="font-size:0.8em;">분류</p>
											</td>
											<td style="font-size:0.8em;"colspan="5">
												<label style="display: inline-block" class="bottom-margin0" >
													<input type="radio" name="hr_type"  value = "반차" id="prom_radio" >
													<span class="co_docu_cd_old" docu_cd="반차" style="cursor: pointer;">반차</span>											
												</label>
												&nbsp;
												<label style="display: inline-block" class="bottom-margin0">
													<input type="radio" name="hr_type" value = "연차" id="come_radio">
													<span class="co_docu_cd_old" docu_cd="연차" style="cursor: pointer;">연차</span>										
												</label>
												&nbsp;
												<label style="display: inline-block" class="bottom-margin0">
													<input type="radio" name="hr_type" value = "조퇴" id="come_radio">
													<span class="co_docu_cd_old" docu_cd="조퇴" style="cursor: pointer;">조퇴</span>										
												</label>
												&nbsp;	
												<label style="display: inline-block" class="bottom-margin0">
													<input type="radio" name="hr_type" value = "결근" id="come_radio">
													<span class="co_docu_cd_old" docu_cd="결근" style="cursor: pointer;">결근</span>										
												</label>
												&nbsp;														
											</td>
										</tr>
										
										<tr id="vacation">
											<td  colspan="3">
												<p style="font-size:0.8em;">분류</p>
											</td>
											<td style="font-size:0.8em;"colspan="5">
												<label style="display: inline-block" class="bottom-margin0" >
													<input type="radio" name="hr_type"  value = "보건휴가" id="prom_radio" >
													<span class="co_docu_cd_old" docu_cd="보건휴가" style="cursor: pointer;">보건휴가</span>											
												</label>
												&nbsp;
												<label style="display: inline-block" class="bottom-margin0">
													<input type="radio" name="hr_type" value = "출산휴가" id="come_radio">
													<span class="co_docu_cd_old" docu_cd="출산휴가" style="cursor: pointer;">출산휴가</span>										
												</label>
												&nbsp;
												<label style="display: inline-block" class="bottom-margin0">
													<input type="radio" name="hr_type" value = "경조사" id="come_radio">
													<span class="co_docu_cd_old" docu_cd="경조사" style="cursor: pointer;">경조사</span>										
												</label>
												&nbsp;	
												<label style="display: inline-block" class="bottom-margin0">
													<input type="radio" name="hr_type" value = "육아휴직" id="come_radio">
													<span class="co_docu_cd_old" docu_cd="육아휴직" style="cursor: pointer;">육아휴직</span>										
												</label>
												&nbsp;													
											</td>
										</tr>
										
										
										<tr id="cancle">
											<td  colspan="3">
												<p style="font-size:0.8em;">분류</p>
											</td>
											<td style="font-size:0.8em;"colspan="5">
												<label style="display: inline-block" class="bottom-margin0" >
													<input type="radio" name="hr_type"  value = "근태조정" id="prom_radio" >
													<span class="co_docu_cd_old" docu_cd="근태조정" style="cursor: pointer;">근태조정</span>											
												</label>
												&nbsp;
												<label style="display: inline-block" class="bottom-margin0">
													<input type="radio" name="hr_type" value = "휴가취소" id="come_radio">
													<span class="co_docu_cd_old" docu_cd="휴가취소" style="cursor: pointer;">휴가취소</span>										
												</label>
												&nbsp;												
											</td>
										</tr>
										 -->
										
									</tbody>
								</table> 
							</div>
							<!-- 근태구분 -->
							<jsp:include page="AttendanceForm.jsp" />
							
							<!-- 휴가구분  -->
							<jsp:include page="VacationForm.jsp" />
												
							<!-- 조정신청 -->
							<jsp:include page="CancelForm.jsp" />
							
							
				
				</form>
			</section>
		</div>	
		

	<jsp:include page="../common/footer.jsp"/>


<!---------- script------------>

	
	<!-- Summernote -->
	<script src="./resources/plugins/summernote/summernote-bs4.min.js"></script>

	<script>
    	$(document).ready(function() {
    	  $('#summernote').summernote({
    	    height : 280
    	  });
    	});
    </script>
    <script>
    	$(document).ready(function() {
    	  $('#summernote2').summernote({
    	    height : 280
    	  });
    	});
    </script>
    <script>
    	$(document).ready(function() {
    	  $('#summernote3').summernote({
    	    height : 280
    	  });
    	});
    </script>
    <script>
    	$(document).ready(function() {
    	  $('#summernote4').summernote({
    	    height : 280
    	  });
    	});
    </script>
    
<!-- div 전환 , disabled 주기-->	
	<script>
		$(function(){
			$("#normal_div").attr("style", "display:none")		
			$("#dipl_div").attr("style", "display:none")
			$("#humanr_div").attr("style", "display:none")
			
			
			$("#attendance").attr("style", "display:none")
			$("#attendance").attr("style", "display:none")
			$("#vacation").attr("style", "display:none")
			$("#vacation").attr("style", "display:none")
			$("#cancle").attr("style", "display:none")
			$("#cancle").attr("style", "display:none")
						
			$('#normal_radio').click(function(){
				$("#normal_div").css("display",'')
				$("#normal_div").attr("disabled", false)
				$("#dipl_div").attr("style", "display:none")
				$("#dipl_div").attr("disabled", true)
				$("#humanr_div").attr("style", "display:none")
				$("#humanr_div").attr("disabled", true)
				
				
				$("#attendance").css("display",'')
				$("#attendance").attr("disabled", false)
				$("#vacation").attr("style", "display:none")
				$("#vacation").attr("disabled", true)
				$("#cancle").attr("style", "display:none")
				$("#cancle").attr("disabled", true)
			});
			
			$('#dipl_radio').click(function(){
				$("#dipl_div").css("display",'')
				$("#dipl_div").attr("disabled", false)
				$("#normal_div").attr("style", "display:none")
				$("#normal_div").attr("disabled", true)
				$("#humanr_div").attr("style", "display:none")
				$("#humanr_div").attr("disabled", true)

				$("#vacation").css("display",'')
				$("#vacation").attr("disabled", false)
				$("#attendance").attr("style", "display:none")
				$("#attendance").attr("disabled", true)
				$("#cancle").attr("style", "display:none")
				$("#cancle *").attr("disabled", true)
			});					
			
			$('#humanr_radio').click(function(){
				$("#humanr_div").css("display",'')
				$("#humanr_div").attr("disabled", false)
				$("#normal_div").attr("style", "display:none")
				$("#normal_div").attr("disabled", true)
				$("#dipl_div").attr("style", "display:none")
				$("#dipl_div").attr("disabled", true)
				
				$("#cancle").css("display",'')
				$("#cancle ").attr("disabled", false)
				$("#vacation").attr("style", "display:none")
				$("#vacation ").attr("disabled", true)
				$("#attendance").attr("style", "display:none")
				$("#attendance ").attr("disabled", true)
			});	

		});
	</script>
	
<!-- 첨부파일 추가 / 삭제 -->
	<script>
		
		var cnt = 0;
		
		$(".normalAttach").on("change", function(e) {	
			
			var filename = $(this)[0].files[0].name;
			var filesize = $(this)[0].files[0].size;
			console.log("name : "+ filename);
			console.log("size : "+ filesize); 	
			
			$(".normalAttachName").text(filename);
			$(".normalAttachSize").text(filesize);
		
			cnt++
		});

		function deletefile(){
		
			if(cnt < 1){
				alert("삭제할 파일이 없습니다.");
			} else {
				
				if(confirm("삭제하시겠습니까?")){
					
					$(".normalAttach").val('');
					$(".normalAttachName").text('');
					$(".normalAttachSize").text('');
				}			
			}			
		}
	</script>
<!-- 부서공유 check -->
	<script>
		$(function(){
			
			if($("#deptShare").checked){
				$("#deptShare_hidden").disabled = true;
			}
		});
	</script>
	

	
	<script>
	function plusLine(num){
		
		var _width = '900';
		var _height = '1500';
		
		var _left = Math.ceil((window.screen.width - _width)/2);
		var _top = Math.ceil((window.screen.height - _height)/2);
		
		var windowObj = window.open("plusAppLineForm.ea?val="+num, "결재라인 추가 ",' width='+_width +', height='+_height + ', left='+_left + ', top=' + _top);
		
	}
	</script>
	
	<script>
	function plusCC(num){
		
		var _width = '900';
		var _height = '1500';
		
		var _left = Math.ceil((window.screen.width - _width)/2);
		var _top = Math.ceil((window.screen.height - _height)/2);
		
		var windowObj = window.open("plusccForm.ea?val="+num, "수신자 등록 ",' width='+_width +', height='+_height + ', left='+_left + ', top=' + _top);
		
		
	}
	
	function worker(num){
		
		var _width = '900';
		var _height = '1500';
		
		var _left = Math.ceil((window.screen.width - _width)/2);
		var _top = Math.ceil((window.screen.height - _height)/2);
		
		var windowObj = window.open("plusccForm.ea?val="+num, "대체근무자 등록 ",' width='+_width +', height='+_height + ', left='+_left + ', top=' + _top);
		
		
	}
	</script>
	
	<script>
	function plusCoo(num){
		var _width = '900';
		var _height = '1500';
		
		var _left = Math.ceil((window.screen.width - _width)/2);
		var _top = Math.ceil((window.screen.height - _height)/2);
		
		var windowObj = window.open("plusCooForm.ea?val="+num, "협조 추가",' width='+_width +', height='+_height + ', left='+_left + ', top=' + _top);
		
	}	
	</script>


</body>
</html>