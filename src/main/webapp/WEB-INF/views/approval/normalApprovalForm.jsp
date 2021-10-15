<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>	
	 td, span, input{
		font-weight:normal;!important;
		vertical-align: middle;!important;
	}
	#plus_line_btn{
		margin-bottom:15px;
	}
	.bottom-margin0{
		margin-right:8px;
		margin-botton:0px;
	}
	.content-wrapper{
		overflow:auto;
	}
</style>


</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
		<!-- 타이틀 -->
		<div class="content-wrapper">
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h5>결재문서 작성</h5>
						</div>
					</div>
				</div>
			</section>
			<section class="content">
			<form id="normalApprovalForm" method="post" action="insertApproval.ea" enctype="multipart/form-data">
				<div class="container-fluid">
					<div class="row">
						<div class="col-12">
							<div class="callout callout-info">							
								<table class="table table-bordered">
									<tbody>
										<tr>
											<td width="150px" >
												<p style="font-size:0.8em;">일반결재</p>
											</td>
											<td style="font-size:0.8em;">
												<label style="display: inline-block" class="bottom-margin0" >
													<input type="radio" name="doc_type"  value = "기안" id="normal_radio" >
													<span class="co_docu_cd_old" docu_cd="기안" style="cursor: pointer;">기안서</span>											
												</label>
												&nbsp;
												<label style="display: inline-block" class="bottom-margin0">
													<input type="radio" name="doc_type" value = "공문" id="dipl">
													<span class="co_docu_cd_old" docu_cd="공문" style="cursor: pointer;">공문서</span>										
												</label>
												&nbsp;
												<label style="display: inline-block" class="bottom-margin0">
													<input type="radio" name="doc_type" value = "회의" id="minut">
													<span class="co_docu_cd_old" docu_cd="회의" style="cursor: pointer;">회의록</span>
												</label>
												&nbsp;
												<label style="display: inline-block" class="bottom-margin0">
													<input type="radio" name="doc_type" value = "인사" id="humanr">
													<span class="co_docu_cd_old" docu_cd="인사" style="cursor: pointer;">인사</span>
												</label>
												&nbsp;
											</td>
										</tr>
									</tbody>
								</table> 
							</div>
							<div class="card card-outline card-info" id="normal_div">
								<div class="card-header" >
									<h3 class="card-title" >기안서</h3>
								</div>
								<div class="card-body">
									<table width="30%" style="font-size:0.8em;" height="50px" align="right">
										<tbody>
											<tr>
												<td>
													<table class="table table-bordered" id="process_table" width="30%">
														<tbody>
															<tr>
																<th rowspan="2" width="15%">결재</th>
																<th class="table emp_level" width="17%">
																	<span id="emp_level0"></span>
																</th>
																<th class="table emp_level" width="17%">
																	<span id="emp_level1"></span>
																</th>
																<th class="table emp_level" width="17%">
																	<span id="emp_level2"></span>
																</th>
																<th class="table emp_level" width="17%">
																	<span id="emp_level3"></span>
																</th>
																<th class="table emp_level" width="17%">
																	<span id="emp_level4"></span>
																</th>															
															</tr>
															<tr>
																<td class="table emp_name" height="50%">
																	<span id="emp_name0"></span>
																	<input type="hidden" id="writer" name="writer" value="직원이름">
																</td>
																<td class="table emp_name" height="50%">
																	<span id="emp_name1"></span>
																	<input type="hidden" id="line1" name="line1" value="직원이름">
																</td>
																<td class="table emp_name" height="50%">
																	<span id="emp_name2"></span>
																	<input type="hidden" id="line2" name="line2" value="직원이름">
																</td>
																<td class="table emp_name" height="50%">
																	<span id="emp_name3"></span>
																	<input type="hidden" id="line3" name="line3" value="직원이름">
																</td>
																<td class="table emp_name" height="50%">
																	<span id="emp_name4"></span>
																	<input type="hidden" id="line4" name="line4" value="직원이름">
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
																<td rowspan="2">협조</th>
																<td class="table emp_level" >
																	<span id="emp_level0"></span>
																</td>
																<td class="table emp_level">
																	<span id="emp_level1"></span>
																</td>
																<td class="table emp_level" >
																	<span id="emp_level2"></span>
																</td>
																<td class="table emp_level" >
																	<span id="emp_level3"></span>
																</td>											
															</tr>
															<tr>
																<th class="table emp_name" height="50%">
																	<span id="emp_name0"></span>
																	<input type="hidden" id="cooperator0" name="cooperator0" value="직원이름">
																</th>
																<th class="table emp_name" height="50%">
																	<span id="emp_name1"></span>
																	<input type="hidden" id="cooperator1" name="cooperator1" value="직원이름">
																</th>
																<th class="table emp_name" height="50%">
																	<span id="emp_name2"></span>
																	<input type="hidden" id="cooperator2" name="cooperator2" value="직원이름">
																</th>
																<th class="table emp_name" height="50%">
																	<span id="emp_name3"></span>
																	<input type="hidden" id="cooperator3" name="cooperator3" value="직원이름">
																</th>										
															</tr>
														</tbody>
													</table>
												</td>											
											</tr>
											<tr>
												<td colspan="2" align="right">
													<button type="button" class="btn btn-default" style="font-size:0.8rem" id="plus_line_btn">+ 결재라인 추가</button>
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
														<td width="10%" colspan="3">
															<span>수신참조 </span>												
														</td>
														<td colspan="6">											
															<button type="button" class="btn btn-default" style="font-size:0.8rem">수신자등록</button>																					
														</td>
													</tr>
													<tr>
														<td colspan="3">
															<span>제목</span>
														</td>
														<td colspan="6">
															<input type=text class="form-control" id="ap_title" name="ap_title">
														</td>
													</tr>
													<tr>
														<td colspan="3">
															<span>기안일자</span>
														</td>
														<td colspan="6">
															<!-- 오늘날짜  -->
														</td>
													</tr>
													<tr>
														<td colspan="3">
															<span>기안자</span>
														</td>
														<td colspan="6">
															<!-- 로그인 유저 이름  -->
														</td>
													</tr>
													<tr>
														<td colspan="3">
															<span>소속</span>
														</td>
														<td colspan="6">
															<!-- 로그인 유저 소속 부서 -->
														</td>
													</tr>
													<tr>
														<td colspan="9">
															<!-- editor -->
														</td>
													</tr>
													<tr>
														<td colspan="3">
															<span>부서공유</span>
														</td>
														<td colspan="6">													
															<input type="checkbox" name="deptShare" value="Y"> 														
														</td>
													</tr>
													<tr>
														<td colspan="9">
															<label for="file_up" class="btn btn-primary" style="font-size:1em">파일추가</label>
															<input type="file" id="file_up" style="display:none">
														</td>
													</tr>
													<tr>
														<td width="60%" colspan="5">
															<span>파일명</span>
														</td>
														<td colspan="2">
															<span>크기</span>
														</td>
														<td colspan="2">
															<span>삭제</span>
														</td>
													<tr>
													<tr>
														<td colspan="5">
															<!-- 파일명 -->
														</td >
														<td colspan="2">
															<!-- 파일크기-->
														</td>
														<td colspan="2">
															<button type="button" class="btn btn-warning" style="font-size:1em">삭제</button>
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
				</form>
			</section>
		</div>	
	<jsp:include page="../common/footer.jsp"/>

<script>
	/*$(function(){
		/*$("#normal_div").attr("style", "display:none")
		if($("#normal_radio").prop("checked", true)){
			$("#normal_div").removeAttr("style", "display:none")
		}
				
		
		//('input:radio[#normal_radio]').is(':checked')
		
		if($('input:radio[id=normal_radio]').is(':checked')==false){
			$('#normal_div').hide();
		}else {
			$('#normal_div').show();
		}
	
	});*/
	
	$(function(){
		$("#normal_div").attr("style", "display:none")		
		$('#normal_radio').click(function(){
			$("#normal_div").attr("style", "display:block")
		});
	});
</script>

</body>
</html>