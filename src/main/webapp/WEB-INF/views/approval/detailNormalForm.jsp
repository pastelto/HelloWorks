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
	input{
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
				<input type="hidden" class="doc_type class" id="doc_type" name="doc_type" value="기안">
				<div class="container-fluid">
					<div class="row">
						<div class="col-12">							
							<!-- 기안서 -->
							<div class="card card-outline card-info" id="normal_div">
								<div class="card-header" >
									<h3 class="card-title" >기안서</h3>
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
																	<input type="hidden" class="line0" id="writer" name="writer" value="${loginUser.empNo}">
																</td>
																<td class="table emp_name" scope="col">
																	<input type="text" class="emp_name1" id="emp_name1_1" name="job" readonly/>
																	<input type="hidden" class="line1" id="line1_1" name="line">
																</td>
																<td class="table emp_name" scope="col">
																	<input type="text" class="emp_name2" id="emp_name1_2" name="job" readonly/>
																	<input type="hidden" class="line2" id="line1_2" name="line" >
																</td>
																<td class="table emp_name" scope="col">
																	<input type="text" class="emp_name3" id="emp_name1_3" name="job" readonly/>
																	<input type="hidden" class="line3" id="line1_3" name="line" >
																</td>
																<td class="table emp_name" scope="col">
																	<input type="text" class="emp_name4" id="emp_name1_4" name="job" readonly/>
																	<input type="hidden" class="line4" id="line1_4" name="line" >
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
																	<input type="hidden" id="cooperator1_1" name="cooperator0" value="${approval.cooper }">
																</td>
																<td class="table coo_name"  scop="col">
																	<input type="text" class="coo_name1_2" id="coo_name1_2" disabled/>
																	<input type="hidden" id="cooperator1_2" name="cooperator1" >
																</td>
																<td class="table coo_name" scop="col">
																	<input type="text" class="coo_name1_3" id="coo_name1_3" disabled/>
																	<input type="hidden" id="cooperator1_3" name="cooperator2" >
																</td>
																<td class="table coo_name" scop="col">
																	<input type="text" class="coo_name1_3" id="coo_name1_4" disabled/>
																	<input type="hidden" id="cooperator1_4" name="cooperator3" >
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
															<input type=text class="form-control" id="createDate" name="createDate"/>
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
														<td colspan="9">
															<textarea id="summernote" name="apContent">${approval.content}</textarea>
														</td>
													</tr>
													<tr>
														<td colspan="9">															
															<div class="btn btn-default btn-file btn-xs">
											                    <i class="fas fa-paperclip"></i> 파일이름
											                    <input type="file" class="normalAttach" name="normalAttach" id="normalAttach" multiple="true">
									                  		</div> 
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
									<button id="returnBtn" type="button" class="btn btn-secondary btn-sm" onclick="returnList();">목록</button>
								</div>
							</div>
				
			</form>
		</section>
	</div>
	<jsp:include page="../common/footer.jsp"/>




<!---------- script------------>

	<script>
		function returnList(){						
				alert("내결재함으로 돌아갑니다.")
			});		
		}
	</script>
	
</body>
</html>