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
	#normalApprovalForm > input{
		border : none;
		background-color: white;
		pointer-events: none;
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
	.confirm{
		width:50px;
		length:50px;
	}
	#confirm0{
		font-family: "나눔손글씨 펜", 함초롱바탕, cursive;
	}
	#confirm1{
		font-family: "교보 손글씨 2019", 함초롱바탕, cursive;
	}
	#confirm2{
		font-family: "LG 그램", 함초롱바탕, cursive;
	}
	#confirm3{
		font-family: "문체부 쓰기 정체", 함초롱바탕, cursive;
	}
	#confirm4{
		font-family: 필기, 함초롱바탕, cursive;
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
				<div class="container-fluid">
					<div class="row">
						<div class="col-12">							
							<!-- 기안서 -->
							<div class="card card-outline card-info" id="normal_div">
								<div class="card-header" >
									<h3 class="card-title" >회의록</h3>
								</div>
								<div class="card-body">
									<table width="400px" style="font-size:0.8em;" height="50px" align="right">
										<tbody>
											<tr>
												<td>
													<table class="table table-bordered" id="process_table">
															<colgroup>
																<col width="15%" />
																<col width="17%" />
																<col width="17%" />
																<col width="17%" />
																<col width="17%" />
																<col width="17%" />
															</colgroup>
														<tbody>
															<tr>															
																<th rowspan="2"  scope="col">결재</th>
																<th class="table emp_level" scope="col">
																	<input type="text" class="emp_level0" id="emp_level1_0" name ="writerJob" value="${loginUser.jobName}" readonly/>
																</th>																																																																
																<th class="table emp_level" scope="col">
																	<input type="text" class="emp_level1" id="emp_level1_1" name="job" readonly/>
																	</th>
																<th class="table emp_level" scope="col" >																
																	<input type="text" class="emp_level2" id="emp_level1_2" name="job" readonly/>																	
																</th>
																<th class="table emp_level" scope="col" >																
																	<input type="text" class="emp_level2" id="emp_level1_3" name="job" readonly/>																	
																</th>		
																<th class="table emp_level" scope="col" >																
																	<input type="text" class="emp_level2" id="emp_level1_4" name="job" readonly/>																	
																</th>																																						
															</tr>
															<tr>
																<td class="table emp_name" scope="col" >
																	<input type="text" class="emp_name0" id="emp_name0" value="${loginUser.empName}" disabled/>
																	<div class="confirm" id="divConfirm0">
																		<input type="text" class="confirm-input" id="confirm0" name="job" readonly/>
																	</div>																	
																</td>
																<td class="table emp_name" scope="col">
																	<input type="text" class="emp_name1" id="emp_name1_1" name="job" readonly/>
																	<div class="confirm" id="divConfirm0">
																		<input type="text" class="confirm-input" id="confirm1" readonly/>
																	</div>
																</td>
																<td class="table emp_name" scope="col">
																	<input type="text" class="emp_name2" id="emp_name1_2" name="job" readonly/>
																	<div class="confirm" id="divConfirm0">
																		<input type="text" class="confirm-input" id="confirm2" readonly/>
																	</div>
																</td>
																<td class="table emp_name" scope="col">
																	<input type="text" class="emp_name3" id="emp_name1_3" name="job" readonly/>
																	<div class="confirm" id="divConfirm0">
																		<input type="text" class="confirm-input" id="confirm3"  readonly/>
																	</div>
																</td>
																<td class="table emp_name" scope="col">
																	<input type="text" class="emp_name4" id="emp_name1_4" name="job" readonly/>
																	<div class="confirm" id="divConfirm0">
																		<input type="text" class="confirm-input" id="confirm4" readonly/>
																	</div>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
											<tr>
												<td>
													<table class="table table-bordered" id="process_table">
														<colgroup>
																<col width="15%" />
																<col width="22%" />
																<col width="22%" />
																<col width="22%" />
																<col width="22%" />
															</colgroup>
														<tbody>
															<tr>
																<th rowspan="2"  scop="col">협조</th>
																<th class="table coo_level" scop="col">
																	<input type="text" class="coo_level1" id="coo_level1_1" name="cooJob" value="${approval.cooJob}" readonly/>
																</th>
																<th class="table coo_level" scop="col">
																	<input type="text" class="coo_level1" id="coo_level1_2" disabled/>
																</th>
																<th class="table coo_level"  scop="col">
																	<input type="text" class="coo_level1" id="coo_level1_3" disabled/>
																</th>
																<th class="table coo_level" scop="col">
																	<input type="text" class="coo_level1" id="coo_level1_4" disabled/>
																</th>											
															</tr>
															<tr>
																<td class="table coo_name"  scop="col">
																	<input type="text" class="coo_name1_1" id="coo_name1_1" name="cooName" value ="${approval.cooName}" readonly/>
																</td>
																<td class="table coo_name"  scop="col">
																	<input type="text" class="coo_name1_2" id="coo_name1_2" disabled/>
																</td>
																<td class="table coo_name" scop="col">
																	<input type="text" class="coo_name1_3" id="coo_name1_3" disabled/>
																</td>
																<td class="table coo_name" scop="col">
																	<input type="text" class="coo_name1_3" id="coo_name1_4" disabled/>
																</td>										
															</tr>
														</tbody>
													</table>
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
														<td colspan="6" style="text-align:left !important;">
														<div class="input-group" style="width:30% !important;">														
															<input type="text" id="ccName1" class="form-control" name="ccName" width="30%" "/>	
														</div>
														</td>
													</tr>
													<tr>
														<td colspan="3">
															<span>제목</span>
														</td>
														<td colspan="6">
															<input type=text class="form-control" id="ap_title" name="ap_title" value="${approval.title}"/>
														</td>
													</tr>
													<tr>
														<td colspan="3">
															<span>기안일자</span>
														</td>
														<td colspan="6">
															<input type=text class="form-control" id="createDate" name="createDate" value="${approval.createDate}"/>
														</td>
													</tr>
													<tr>
														<td colspan="3">
															<span>기안자</span>
														</td>
														<td colspan="6">
															<input type="text" id="fieldWriter1" class="form-control" value="${loginUser.empName}" />
														</td>
													</tr>
													<tr>
														<td colspan="3">
															<span>소속</span>
														</td>
														<td colspan="6">
															<input type="text" name="userDept" id="userDept1" class="form-control" value="${loginUser.deptDname}" /> 
														</td>
													</tr>
													<tr>
														<td colspan="3">
															<span>회의 이름</span>
														</td>
														<td colspan="6">
															<input type=text class="form-control" id="mm_title" value="${ am.title }">
														</td>
													</tr>
													<tr>
														<td colspan="3">
															<span>참석자 </span>												
														</td>
														<td colspan="6">											
															<input type="text" id="attendees" value= "${ am.attendees }"/>																				
														</td>
													</tr>
													<tr>
														<td colspan="9">
															<textarea id="summernote" name="apContent">${approval.content}</textarea>
														</td>
													</tr>
													<tr>
														<td colspan="9">															
															<div class="btn btn-default btn-file btn-xs">
											                    <i class="fas fa-paperclip"></i> 파일이름									                    
									                  		</div> 
														</td>
													</tr>
													</tbody>
												</table>
												<table class="table table-bordered" id="logTable" style="margin-top:10px">
													<tr>
														<th colspan="3">
															<b>결재로그</b>
														</th>
														<td colspan="6">
															<span id="approval_log">
																<strong>[${ approval.createDate }]</strong>
																&nbsp;${ approval.deptName }&nbsp;${ approval.writerName }&nbsp;${ approval.writerJob }
																<b>제출</b> 
															</span>
														</td>
													</tr>
												</table>
												<table class="table table-bordered" id="commentTable" style="margin-top:10px">
													<tr>
														<th colspan="3">
															<b>결재의견</b>
														</th>
														<td colspan="6">
															<span id="approval_comment">																
															</span>
														</td>
													</tr>												
												</table>
												<table class="table table-bordered" id="writeTable" style="margin-top:10px">
													<tr>
														<th colspan="3">
															<b>의견작성</b>
															<br>
															"(250자 이내)"
														</th>
														<td colspan="4">
															<textarea id="approval_comment"></textarea>
														</td>
														<td colspan="2">
															<button type="button" class="btn btn-primary" onclick="writeComment();">등록</button>
														</td>
													</tr>												
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
								<div class="float-left">
									<button id="backBtn" type="button" class="btn btn-secondary btn-sm" onclick="goBack();">목록</button>
								</div>
								<div class="float-right">					
									<button id="confirmBtn" type="button" class="btn btn-success btn-sm" onclick="confirmApproval();">결재</button>
									<button id="returnBtn" type="button" class="btn btn-danger btn-sm" onclick="returnApproval();">반려</button>
								</div>
							</div>
				
			</form>
		</section>
	</div>
	<jsp:include page="../common/footer.jsp"/>




<!---------- script------------>
	<!-- 결재라인 -->
	<script>		
		var arr = new Array();
		<c:forEach items="${ lineList }" var="line">
			arr.push({job:"${line.jobName}", name:"${line.empName}", number:"${line.empNo}", lineNo:"${line.lineNo}",
					  status:"${line.confirmStatus}"});
		</c:forEach>
		
		$("#confirm1").append("${approval.writerName}");
		
		var n=1;
		var user = ${ loginEmpNo };
		
		for(var i=0;i<arr.length;i++){
			$('input[id="emp_level1_'+n+'"]').val(arr[i].job);
			$('input[id="emp_name1_'+n+'"]').val(arr[i].name);
			$('input[id="line1_'+n+'"]').val(arr[i].number);
			
			
			if(arr[i].lineNo <= arr[i].status){
				$('#confirm'+n).val(arr[i].name);
			}			
		}		
		for(var i=0;i<arr.length;i++){
			if(user == arr[i].number){
				$("#confirmBtn").css("display", "");
				$("#returnBtn").css("display", "");
				break;
			}else {
				$("#confirmBtn").attr("style", "dispaly:none");
				$("#returnBtn").attr("style", "dispaly:none");
			}
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
			$('input[id="ccName1"]').val(deptName);
			$('input[id="ccCode1"]').val(ccDept);
		} else if (memberName != null){
			$('input[id="ccName1"]').val(memberName);
			$('input[id="ccCode1"]').val(ccMember);
		}
	
	</script>

	<script>
	
		var apNo = ${approval.apNo}
		
		function goBack(){									
				location.href= "<%=request.getContextPath()%>/myNormal.ea";
			};		
		}
		
		function confirmApproval(){						
				location.href= "<%=request.getContextPath()%>/confirmApproavl.ea?apNo=apNo";
			};		
		}
		
		function returnApproval(){						
			location.href= "<%=request.getContextPath()%>/returnApproavl.ea?apNo=apNo";
			};		
		}
		
		
	</script>
	
</body>
</html>