<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
		            <h4><i class="fas fa-chart-pie"></i> <b>전자 결재</b></h4>
		          </div>
		        </div>
		      </div><!-- /.container-fluid -->
		</section>	
		
		<section class="content">
			<form id="normalApprovalForm" method="post" enctype="multipart/form-data">
				<input type="hidden" class="apNo class" id="apNo" name="apNo" value="${approval.apNo}">
				<input type="hidden" class="doc_type class" id="doc_type" name="doc_type" value="인사">
				<div class="container-fluid">
					<div class="row">
						<div class="col-12">							
							<!-- 인사  -->
							
							<div class="card card-outline card-info" id="humanr_div">
								<div class="card-header" >
									<h3 class="card-title" >인사결재</h3>
								</div>
								<div class="card-body">
									<table width="400px" style="font-size:0.8em;" height="50px" align="right">
										<tbody>
											<tr>
												<td>
													<table class="table table-bordered" id="process_table">
														<tbody>
															<tr>															
																<th rowspan="2"  colspan="5">결재</th>
																<th class="table emp_level" colspan="5">
																	<input type="text" class="border_none" id="emp_level0" value="${loginUser.jobName}" name="writerJob" readonly/>
																</th>
																<th class="table emp_level" colspan="5">
																	<input type="text" class="border_none" id="emp_level4_1" name="job" readonly/>
																</th>
																<th class="table emp_level" colspan="5" >
																	<input type="text" class="border_none" id="emp_level4_2" name="job" readonly/>
																</th>
																<th class="table emp_level" colspan="5" >
																	<input type="text" class="border_none" id="emp_level4_3" name="job" readonly/>
																</th>
																<th class="table emp_level" colspan="5" >
																	<input type="text" class="border_none" id="emp_level4_4" name="job" readonly/>
																</th>															
															</tr>
															<tr>
																<td class="table emp_name" colspan="5" >
																	<input type="text" class="border_none" id="emp_name0" value="${loginUser.empName}" disabled/>
																	<input type="hidden" id="writer" name="writer" value="${loginUser.empNo}">
																</td>
																<td class="table emp_name" colspan="5" >
																	<input type="text" class="border_none" id="emp_name4_1" name="lineName" readonly/>
																	<input type="hidden" id="line4_1" name="line" >
																</td>
																<td class="table emp_name" colspan="5" >
																	<input type="text" class="border_none" id="emp_name4_2" name="lineName" readonly/>
																	<input type="hidden" id="line4_2" name="line" >
																</td>
																<td class="table emp_name" colspan="5">
																	<input type="text" class="border_none" id="emp_name4_3" name="lineName" readonly/>
																	<input type="hidden" id="line4_3" name="line" >
																</td>
																<td class="table emp_name" colspan="5">
																	<input type="text" class="border_none" id="emp_name4_4" name="lineName" readonly/>
																	<input type="hidden" id="line4_4" name="line" >
																</td>											
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
											<tr>
												<td>
													<table class="table table-bordered" id="process_table">
														<tbody>
															<tr>
																<th rowspan="2" colspan="5">협조</th>
																<th class="table coo_level" colspan="5">
																	<input type="text" class="coo_level4_1" id="coo_level4_1"  name="cooJob" readonly/>
																</th>
																<th class="table coo_level" colspan="5">
																	<input type="text" class="coo_level4_2" id="coo_level4_2" disabled/>
																</th>
																<th class="table coo_level" colspan="5">
																	<input type="text" class="coo_level4_3" id="coo_level4_3" disabled/>
																</th>
																<th class="table coo_level" colspan="5">
																	<input type="text" class="coo_level4_4" id="coo_level4_4" disabled/>
																</th>
																<th class="table coo_level" colspan="5">
																	<input type="text" class="coo_level4_5" id="coo_level4_5" disabled/>
																</th>											
															</tr>
															<tr>
																<td class="table coo_name" colspan="5">
																	<input type="text" class="coo_name4_1" id="coo_name4_1" name="cooName" readonly/>
																	<input type="hidden" id="cooperator4_1" name="cooperator0">
																</td>
																<td class="table coo_name" colspan="5">
																	<input type="text" class="coo_name4_2" id="coo_name4_2" disabled/>
																	<input type="hidden" id="cooperator4_2" name="cooperator1" >
																</td>
																<td class="table coo_name" colspan="5">
																	<input type="text" class="coo_name4_3" id="coo_name4_3" disabled/>
																	<input type="hidden" id="cooperator4_3" name="cooperator2" >
																</td>
																<td class="table coo_name" colspan="5">
																	<input type="text" class="coo_name4_4" id="coo_name4_4" disabled/>
																	<input type="hidden" id="cooperator4_4" name="cooperator3" >
																</td>
																<td class="table coo_name" colspan="5">
																	<input type="text" class="coo_name4_5" id="coo_name4_5" disabled/>
																	<input type="hidden" id="cooperator4_5" name="cooperator4" >
																</td>										
															</tr>
														</tbody>
													</table>
												</td>											
											</tr>
											<tr>
												<td colspan="2" align="right">
													<button type="button" class="btn btn-default" style="font-size:0.8rem" id="plus_line_btn" onclick="plusLine(4);">+ 결재라인 추가</button>
													<button type="button" class="btn btn-default" style="font-size:0.8rem" id="plus_line_btn" onclick="plusCoo(4);">+ 협조 추가</button>
												</td>
											</tr>										
										</tbody>
									</table>							
									<table width="100%" style="font-size:0.8rem" vertical-align="middle" >
										<tr>
											<td>
												<table class="table table-bordered" id="detail_table">
													<tbody>
													<tr height="30px">
														<td width="10%" colspan="4">
															<span>수신참조 </span>												
														</td>
														<td colspan="8">											
															<div class="input-group" style="width:30% !important;">														
															<input type="text" id="ccName4" class="form-control" name="ccName" width="30%"/>	
															<input type="hidden" id="ccCode4" name="ccCode" value=""/>
															<div class="input-group-append">															
																<button type="button" class="btn btn-default" style="font-size:0.8rem" onclick="plusCC(4)">수신자등록</button>																				
															</div>
														</div>	
														</td>
													</tr>
													<tr>
														<td colspan="4">
															<span>제목</span>
														</td>
														<td colspan="8">
															<input type=text class="form-control" id="ap_title" name="ap_title" value="${approval.title}">
														</td>
													</tr>
													<tr>
														<td colspan="2">
															<span>기안일자</span>
														</td>
														<td colspan="4">
															<c:set var="now" value="<%=new java.util.Date()%>" />
															<c:set var="sysdate"><fmt:formatDate value="${now}" pattern="yyyy/MM/dd HH:mm:ss" /></c:set> 
															<c:out value="${sysdate}" />
														</td>
														<td colspan="2">
															<span>처리시한</span>
														</td>
														<td colspan="4">
															<select name="dueDate" class="form-control" >
																<option value="none"> === 선택 ==== </option>
																<option value="5일 이내"> 5일 이내 </option>
																<option value="10일 이내"> 10일 이내 </option>
																<option value="30일 이내"> 30일 이내 </option>
															</select>
														</td>
													</tr>
													<tr>
														<td colspan="4">
															<span>기안자</span>
														</td>
														<td colspan="8">
															<input type="text" id="fieldWriter4" class="form-control" value="${loginUser.empName}" />
														</td>
													</tr>
													<tr>
														<td colspan="4">
															<span>소속</span>
														</td>
														<td colspan="8">
															<input type="text" name="userDept" id="userDept4" class="form-control" value="${loginUser.deptDname}" />
														</td>
													</tr>
													<tr>
														<td colspan="12">
															<textarea id="summernote4" name="apContent">${approval.content}</textarea>
														</td>
													</tr>
													<tr>
														<td colspan="4">
															<span>부서공유</span>
														</td>
														<td colspan="8">	
														<c:if test="${approval.deptShare eq 'Y'}">										
															<input type="checkbox" id="deptShare" name="deptShare" value='Y' checked/> 
														</c:if>
														<c:if test="${approval.deptShare eq 'N'}">										
															<input type="checkbox" id="deptShare" name="deptShare" value='Y'/> 
														</c:if>														
															<input type="hidden" id="deptShare_hidden" name="deptShare" value='N'/> 														
														</td>										
													</tr>
													<tr>
														<td colspan="12">															
															<div class="btn btn-default btn-file btn-xs">
											                    <i class="fas fa-paperclip"></i> 첨부파일
											                    <input type="file" class="normalAttach" name="normalAttach" id="normalAttach" multiple="true">
									                  		</div> 
														</td>
													</tr>
													<tr>
														<td width="60%" colspan="6">
															<span>파일명</span>
														</td>
														<td colspan="3">
															<span>크기</span>
														</td>
														<td colspan="3">
															<span>삭제</span>
														</td>
													<tr>
													<tr id="fileRow">
														<td colspan="6">
															<span class="normalAttachName">${apAttach.originName}</span>
														</td >
														<td colspan="3">
															<span class="normalAttachSize"></span>
														</td>
														<td colspan="3">
															<button type="button" class="btn btn-danger" style="font-size:1em">삭제</button>
														</td>
													</tr>
													</tbody>
												</table>
											</td>
										</tr>
									</table>
								</div>
							</div>														
						</div>
					</div>
				</div>
							<div class="card-footer">
								<div class="float-right">
									<button id="tempSaveBtn" type="button" class="btn btn-secondary btn-sm" onclick="insertTemp();">임시저장</button>
									&nbsp;
									<button id="submitBtn" type="button" class="btn btn-primary btn-sm" onclick="insertApp();">등록</button>
									&nbsp;
									<button type="reset" class="btn btn-danger btn-sm" >취소</button>
									&nbsp;
								</div>
							</div>
				
			</form>
		</section>
	</div>
	<jsp:include page="../common/footer.jsp"/>




<!---------- script------------>
	<script>		
		var arr = new Array();
		<c:forEach items="${ lineList }" var="line">
			arr.push({job:"${line.jobName}", name:"${line.empName}", number:"${line.empNo}"});
		</c:forEach>
		
		var n=1;
		
		for(var i=0;i<arr.length;i++){
			$('input[id="emp_level4_'+n+'"]').val(arr[i].job);
			$('input[id="emp_name4_'+n+'"]').val(arr[i].name);
			$('input[id="line4_'+n+'"]').val(arr[i].number);
			n++;
		}
	</script>
	<!-- 수신참조 -->
	<script>
		var deptName = null;
		var ccDept = null;
		var memberName = null;
		var ccMember = null;
		<c:choose>
			<c:when test="${ not empty apCC.ccName }">
				deptName = "${apCC.ccName}"
				ccDept = "${apCC.ccDept}"
				
			</c:when>
			<c:when test="${ not empty apCC.ccName }">
				memberName = "${ apCC.ccName }"
				ccMember = "${apCC.ccMember}"
			</c:when>	
		</c:choose>
		
		if(deptName != null){
			$('input[id="ccName4"]').val(deptName);
			$('input[id="ccCode4"]').val(ccDept);
		} else if (memberName != null){
			$('input[id="ccName4"]').val(memberName);
			$('input[id="ccCode4"]').val(ccMember);
		}
	
	</script>
	
	<!-- Summernote -->
	<script src="./resources/plugins/summernote/summernote-bs4.min.js"></script>

	<script>
    	$(document).ready(function() {
    	  $('#summernote4').summernote({
    	    height : 400
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
		function insertApp(){		
			
			$("#normalApprovalForm").each(function(){
				
					if($("summernote4").length > 1300){
						alert("입력 가능한 결재 내용의 크기를 초과하셨습니다.")
					} else if ($("input[name='lineName']").val() == ""){
						alert("결재라인을 추가해주세요.")
					} else if ($("input[name='title']").val() == ""){
						alert("제목을 입력해주세요.")
					} else if( $("#summernote4").val() == "" ){
						alert("결재내용을 입력해주세요.")
					} else if($("input[id='hr_type']:checked").length == 0){
						alert("세부항목을 선택해주세요.")
					} else if($("input[name='dueDate'").val() == 'none'){
						alert("처리시한을 입력해주세요.")
					} else {
						
						$("#normalApprovalForm").attr("action", "<%=request.getContextPath()%>/insertApproval.ea?status=Y");
						$("#normalApprovalForm").submit();
										
						alert("결재 작성이 완료되었습니다.");
					}
				
			});		
		}
		
		function insertTemp(){
			$("#normalApprovalForm").each(function(){
				
					if($("summernote4").length > 1300){
						alert("입력 가능한 결재 내용의 크기를 초과하셨습니다.")
					} else if ($("input[name='lineName']").val() == ""){
						alert("결재라인을 추가해주세요.")
					} else if ($("input[name='title']").val() == ""){
						alert("제목을 입력해주세요.")
					} else if( $("#summernote4").val() == "" ){
						alert("결재내용을 입력해주세요.")
					} else if($("input[id='hr_type']:checked").length == 0){
						alert("세부항목을 선택해주세요.")
					} else if($("input[name='dueDate'").val() == 'none'){
						alert("처리시한을 입력해주세요.")
					} else {
						
						$("#normalApprovalForm").attr("action", "<%=request.getContextPath()%>/insertApproval.ea?status=Y");
						$("#normalApprovalForm").submit();
										
						alert("결재 작성이 완료되었습니다.");
					}
				
			});		
		}
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