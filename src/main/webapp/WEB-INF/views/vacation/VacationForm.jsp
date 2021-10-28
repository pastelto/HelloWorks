<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
					<div class="card card-outline card-info" id="dipl_div">
								<div class="card-header" >
									<h3 class="card-title" >휴가계</h3>
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
																	<input type="text" class="border_none" id="emp_level0" value="${loginUser.jobName}" disabled/>
																</th>
																<th class="table emp_level" scope="col">
																	<input type="text" class="border_none" id="emp_level2_1" disabled/>
																</th>
																<th class="table emp_level" scope="col" >
																	<input type="text" class="border_none" id="emp_level2_2" disabled/>
																</th>
																<th class="table emp_level" scope="col" >
																	<input type="text" class="border_none" id="emp_level2_3" disabled/>
																</th>
																<th class="table emp_level" scope="col" >
																	<input type="text" class="border_none" id="emp_level2_4" disabled/>
																</th>															
															</tr>
															<tr>
																<td class="table emp_name" scope="col" >
																	<input type="text" class="border_none" id="emp_name0" value="${loginUser.empName}" disabled/>
																	<input type="hidden" id="writer" name="writer" value="${loginUser.empNo}">
																</td>
																<td class="table emp_name" scope="col" >
																	<input type="text" class="border_none" id="emp_name2_1" disabled/>
																	<input type="hidden" id="line2_1" name="line1" >
																</td>
																<td class="table emp_name" scope="col" >
																	<input type="text" class="border_none" id="emp_name2_2" disabled/>
																	<input type="hidden" id="line2_2" name="line2" >
																</td>
																<td class="table emp_name" scope="col" >
																	<input type="text" class="border_none" id="emp_name2_3" disabled/>
																	<input type="hidden" id="line2_3" name="line3" >
																</td>
																<td class="table emp_name"scope="col" >
																	<input type="text" class="border_none" id="emp_name2_4" disabled/>
																	<input type="hidden" id="line2_4" name="line4" >
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
																	<input type="text" class="coo_level2_1" id="coo_level2_1" disabled/>
																</th>
																<th class="table coo_level" scop="col">
																	<input type="text" class="coo_level2_2" id="coo_level2_2" disabled/>
																</th>
																<th class="table coo_level"  scop="col">
																	<input type="text" class="coo_level2_3" id="coo_level2_3" disabled/>
																</th>
																<th class="table coo_level" scop="col">
																	<input type="text" class="coo_level2_4" id="coo_level2_4" disabled/>
																</th>											
															</tr>
															<tr>
																<td class="table coo_name"  scop="col">
																	<input type="text" class="coo_name2_1" id="coo_name2_1" disabled/>
																	<input type="hidden" id="cooperator2_1" name="cooperator0">
																</td>
																<td class="table coo_name"  scop="col">
																	<input type="text" class="coo_name2_2" id="coo_name2_2" disabled/>
																	<input type="hidden" id="cooperator2_2" name="cooperator1" >
																</td>
																<td class="table coo_name" scop="col">
																	<input type="text" class="coo_name2_3" id="coo_name2_3" disabled/>
																	<input type="hidden" id="cooperator2_3" name="cooperator2" >
																</td>
																<td class="table coo_name" scop="col">
																	<input type="text" class="coo_name2_4" id="coo_name2_4" disabled/>
																	<input type="hidden" id="cooperator2_4" name="cooperator3" >
																</td>										
															</tr>
														</tbody>
													</table>
												</td>											
											</tr>
											<tr>
												<td colspan="2" align="right">
													<button type="button" class="btn btn-default" style="font-size:0.8rem" id="plus_line_btn" onclick="plusLine(2);">+ 결재라인 추가</button>
													<button type="button" class="btn btn-default" style="font-size:0.8rem" id="plus_line_btn" onclick="plusCoo(2);">+ 협조 추가</button>
												</td>
											</tr>										
										</tbody>
									</table>							
									<table width="100%" style="font-size:0.8rem" vertical-align="middle" >
										<tr>
											<td>
												<table class="table table-bordered" id="detail_table">
													<tbody>
													<tr>
														<td colspan="3">
															<span>문서 종류</span>
														</td>
														<td colspan="6">
															<div class="row" style="margin-left: 0px;">	&nbsp;&nbsp;	
																										
																	<select id="vcType" name="vcType" class="custom-select custom-select-sm" style="width: 20%;" >
																		<option value="보건휴가">보건휴가</option>
																		<option value="출산휴가">출산휴가</option>
																		<option value="경조사">경조사</option>
																		<option value="육아휴직">육아휴직</option>
																	</select>&nbsp;&nbsp;&nbsp;
															</div>
															
														</td>
													</tr>
													<tr height="30px">
														<td width="10%" colspan="4">
															<span>수신참조 </span>												
														</td>
														<td colspan="8">											
														<div class="input-group" style="width:30% !important;">														
															<input type="text" id="ccName2" class="form-control" name="ccName" width="30%"/>	
															<input type="hidden" id="ccCode2" name="ccCode"/>	
															<div class="input-group-append">															
																<button type="button" class="btn btn-default" style="font-size:0.8rem" onclick="plusCC(2);">수신자등록</button>																				
															</div>
														</div>																		
														</td>
													</tr>
													<tr>
														<td colspan="4">
															<span>제목</span>
														</td>
														<td colspan="8">
															<input type=text class="form-control" id="ap_title" name="ap_title"/>
														</td>
													</tr>
													<tr>
														<td colspan="3">
															<span>요청일자</span>
														</td>
														<td colspan="6">
															<div class="container-fluid">시작일자
																<input type="date" class="form-control datetimepicker-input col-2" data-target="#startVDate" name="startVDate" style="font-size:0.8rem">														
															</div>
															<br>
															<div class="container-fluid">종료일자
																<input type="date" class="form-control datetimepicker-input col-2" data-target="#endVDate" name=endVDate style="font-size:0.8rem">										
															</div>
														</td>
													</tr>
													<tr>
														<td colspan="3">
															<span>연락처</span>
														</td>
														<td colspan="6">
															<input type=text class="form-control col-md-3" id="vWorker" name="vWorker">
														</td>
													</tr>
													<tr>
														<td colspan="3">
															<span>대체근무자</span>
														</td>
														<td colspan="6">
															<div class="input-group" style="width:30% !important;">														
															<input type="text" id="ccName1" class="form-control" name="ccName" width="30%" />	
															<input type="hidden" id="ccCode1" name="ccCode"/>
															<div class="input-group-append">															
																<button type="button" class="btn btn-default" style="font-size:0.8rem" onclick="worker(1);">근무자 등록</button>																				
															</div>
														</div> 
														</td>
													</tr>
													<tr>
														<td colspan="12">
															<textarea id="summernote2" name="apContent"></textarea>
														</td>
													</tr>
													<tr>
														<td colspan="4">
															<span>부서공유</span>
														</td>
														<td colspan="8">													
															<input type="checkbox" id="deptShare" name="deptShare" value='Y'/> 
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
															 <span class="normalAttachName"></span>
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
							
</body>
</html>