<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- Member loginUser = new Member(); --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
			<form id="normalApprovalForm" method="post" enctype="multipart/form-data">
				<div class="container-fluid">
					<div class="row">
						<div class="col-12">
							<div class="callout callout-info">							
								<table class="table table-bordered">
									<tbody>
										<tr>
											<td width="150px" colspan="3">
												<p style="font-size:0.8em;">일반결재</p>
											</td>
											<td style="font-size:0.8em;" colspan="5">
												<label style="display: inline-block" class="bottom-margin0" >
													<input type="radio" name="doc_type"  value = "기안" id="normal_radio" >
													<span class="co_docu_cd_old" docu_cd="기안" style="cursor: pointer;">기안서</span>											
												</label>
												&nbsp;
												<label style="display: inline-block" class="bottom-margin0">
													<input type="radio" name="doc_type" value = "공문" id="dipl_radio">
													<span class="co_docu_cd_old" docu_cd="공문" style="cursor: pointer;">공문서</span>										
												</label>
												&nbsp;
												<label style="display: inline-block" class="bottom-margin0">
													<input type="radio" name="doc_type" value = "회의" id="minut_radio">
													<span class="co_docu_cd_old" docu_cd="회의" style="cursor: pointer;">회의록</span>
												</label>
												&nbsp;
												<label style="display: inline-block" class="bottom-margin0">
													<input type="radio" name="doc_type" value = "인사" id="humanr_radio">
													<span class="co_docu_cd_old" docu_cd="인사" style="cursor: pointer;">인사</span>
												</label>
												&nbsp;
											</td>
										</tr>
										<tr id="hr_detail">
											<td  colspan="3">
												<p style="font-size:0.8em;">인사분류</p>
											</td>
											<td style="font-size:0.8em;"colspan="5">
												<label style="display: inline-block" class="bottom-margin0" >
													<input type="radio" name="hr_type"  value = "승진" id="prom_radio" >
													<span class="co_docu_cd_old" docu_cd="승진" style="cursor: pointer;">승진</span>											
												</label>
												&nbsp;
												<label style="display: inline-block" class="bottom-margin0">
													<input type="radio" name="hr_type" value = "복직" id="come_radio">
													<span class="co_docu_cd_old" docu_cd="복작" style="cursor: pointer;">복직</span>										
												</label>
												&nbsp;
												<label style="display: inline-block" class="bottom-margin0">
													<input type="radio" name="hr_type" value = "이동" id="move_radio">
													<span class="co_docu_cd_old" docu_cd="이동" style="cursor: pointer;">이동</span>
												</label>
												&nbsp;
												<label style="display: inline-block" class="bottom-margin0">
													<input type="radio" name="hr_type" value = "입사" id="hire_radio">
													<span class="co_docu_cd_old" docu_cd="입사" style="cursor: pointer;">입사</span>
												</label>
												&nbsp;
												<label style="display: inline-block" class="bottom-margin0">
													<input type="radio" name="hr_type" value = "퇴사" id="fire_radio">
													<span class="co_docu_cd_old" docu_cd="퇴사" style="cursor: pointer;">퇴사</span>
												</label>
												&nbsp;
												<label style="display: inline-block" class="bottom-margin0">
													<input type="radio" name="hr_type" value = "휴직" id="vaca_radio">
													<span class="co_docu_cd_old" docu_cd="휴직" style="cursor: pointer;">휴직</span>
												</label>
												&nbsp;
											</td>
										</tr>
									</tbody>
								</table> 
							</div>
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
																	<span id="emp_level0">팀원</span>
																</th>
																<th class="table emp_level" scope="col">
																	<span id="emp_level1">팀장</span>
																</th>
																<th class="table emp_level" scope="col" >
																	<span id="emp_level2"></span>
																</th>
																<th class="table emp_level" scope="col" >
																	<span id="emp_level3"></span>
																</th>
																<th class="table emp_level" scope="col" >
																	<span id="emp_level4"></span>
																</th>															
															</tr>
															<tr>
																<td class="table emp_name" scope="col" >
																	<span id="emp_name0">최승철</span>
																	<input type="hidden" id="writer" name="writer" value="202100011">
																</td>
																<td class="table emp_name" scope="col" >
																	<span id="emp_name1">김소원</span>
																	<input type="hidden" id="line1" name="line1" value="202100004">
																</td>
																<td class="table emp_name" scope="col" >
																	<span id="emp_name2"></span>
																	<input type="hidden" id="line2" name="line2" >
																</td>
																<td class="table emp_name" scope="col" >
																	<span id="emp_name3"></span>
																	<input type="hidden" id="line3" name="line3" >
																</td>
																<td class="table emp_name"scope="col" >
																	<span id="emp_name4"></span>
																	<input type="hidden" id="line4" name="line4" >
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
																<th class="table emp_level" scop="col">
																	<span id="emp_level0">팀장</span>
																</th>
																<th class="table emp_level" scop="col">
																	<span id="emp_level1"></span>
																</th>
																<th class="table emp_level"  scop="col">
																	<span id="emp_level2"></span>
																</th>
																<th class="table emp_level" scop="col">
																	<span id="emp_level3"></span>
																</th>											
															</tr>
															<tr>
																<td class="table emp_name"  scop="col">
																	<span id="emp_name0">김다혜</span>
																	<input type="hidden" id="cooperator0" name="cooperator0" value="202100003">
																</td>
																<td class="table emp_name"  scop="col">
																	<span id="emp_name1"></span>
																	<input type="hidden" id="cooperator1" name="cooperator1" >
																</td>
																<td class="table emp_name" scop="col">
																	<span id="emp_name2"></span>
																	<input type="hidden" id="cooperator2" name="cooperator2" >
																</td>
																<td class="table emp_name" scop="col">
																	<span id="emp_name3"></span>
																	<input type="hidden" id="cooperator3" name="cooperator3" >
																</td>										
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
															<input type="text" id="ccName" name="ccName" value="경영지원본부"/>																				
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
															<c:set var="now" value="<%=new java.util.Date()%>" />
															<c:set var="sysdate"><fmt:formatDate value="${now}" pattern="yyyy/MM/dd HH:mm:ss" /></c:set> 
															<c:out value="${sysdate}" />
														</td>
													</tr>
													<tr>
														<td colspan="3">
															<span>기안자</span>
														</td>
														<td colspan="6">
															<input type="text" name="writer" id="writer" class="form-control" value="${loginUser.empName}" readonly/>
														</td>
													</tr>
													<tr>
														<td colspan="3">
															<span>소속</span>
														</td>
														<td colspan="6">
															<input type="text" name="userDept" id="userDept" class="form-control" value="C1" readonly/> 
														</td>
													</tr>
													<tr>
														<td colspan="9">
															<textarea id="summernote" name="apContent"></textarea>
														</td>
													</tr>
													<tr>
														<td colspan="3">
															<span>부서공유</span>
														</td>
														<td colspan="6">													
															<input type="checkbox" id="deptShare" name="deptShare" value="'Y'"/> 
															<input type="hidden" id="deptShare_hidden" name="deptShare" value="'N'"/> 														
														</td>
													</tr>
													<tr>
														<td colspan="9">															
															<div class="btn btn-default btn-file btn-xs">
											                    <i class="fas fa-paperclip"></i> 첨부파일
											                    <input type="file" name="normalAttach" id="normalAttach" multiple="true">
									                  		</div> 
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
													<tr id="fileRow">
														<td colspan="5">
															 <span class="normalAttachName"></span>
														</td >
														<td colspan="2">
															<span class="normalAttachSize"></span>
														</td>
														<td colspan="2">
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
							
							<!-- 공문서  -->
							
							<div class="card card-outline card-info" id="dipl_div">
								<div class="card-header" >
									<h3 class="card-title" >공문서</h3>
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
																	<span id="emp_level0"></span>
																</th>
																<th class="table emp_level" scope="col">
																	<span id="emp_level1"></span>
																</th>
																<th class="table emp_level" scope="col" >
																	<span id="emp_level2"></span>
																</th>
																<th class="table emp_level" scope="col" >
																	<span id="emp_level3"></span>
																</th>
																<th class="table emp_level" scope="col" >
																	<span id="emp_level4"></span>
																</th>															
															</tr>
															<tr>
																<td class="table emp_name" scope="col" >
																	<span id="emp_name0"></span>
																	<input type="hidden" id="writer" name="writer" value="직원이름">
																</td>
																<td class="table emp_name" scope="col" >
																	<span id="emp_name1"></span>
																	<input type="hidden" id="line1" name="line1" value="직원이름">
																</td>
																<td class="table emp_name" scope="col" >
																	<span id="emp_name2"></span>
																	<input type="hidden" id="line2" name="line2" value="직원이름">
																</td>
																<td class="table emp_name" scope="col" >
																	<span id="emp_name3"></span>
																	<input type="hidden" id="line3" name="line3" value="직원이름">
																</td>
																<td class="table emp_name"scope="col" >
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
																<th class="table emp_level" scop="col">
																	<span id="emp_level0"></span>
																</th>
																<th class="table emp_level" scop="col">
																	<span id="emp_level1"></span>
																</th>
																<th class="table emp_level"  scop="col">
																	<span id="emp_level2"></span>
																</th>
																<th class="table emp_level" scop="col">
																	<span id="emp_level3"></span>
																</th>											
															</tr>
															<tr>
																<td class="table emp_name"  scop="col">
																	<span id="emp_name0"></span>
																	<input type="hidden" id="cooperator0" name="cooperator0" value="직원이름">
																</td>
																<td class="table emp_name"  scop="col">
																	<span id="emp_name1"></span>
																	<input type="hidden" id="cooperator1" name="cooperator1" value="직원이름">
																</td>
																<td class="table emp_name" scop="col">
																	<span id="emp_name2"></span>
																	<input type="hidden" id="cooperator2" name="cooperator2" value="직원이름">
																</td>
																<td class="table emp_name" scop="col">
																	<span id="emp_name3"></span>
																	<input type="hidden" id="cooperator3" name="cooperator3" value="직원이름">
																</td>										
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
														<td width="10%" colspan="4">
															<span>수신참조 </span>												
														</td>
														<td colspan="8">											
															<button type="button" class="btn btn-default" style="font-size:0.8rem">수신자등록</button>																					
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
														<td colspan="4">
															<span>일자</span>
														</td>
														<td colspan="8">
															<c:set var="now" value="<%=new java.util.Date()%>" />
															<c:set var="sysdate"><fmt:formatDate value="${now}" pattern="yyyy/MM/dd HH:mm:ss" /></c:set> 
															<c:out value="${sysdate}" />
														</td>
													</tr>
													<tr>
														<td colspan="2">
															<span>작성자</span>
														</td>
														<td colspan="4">
															<!-- 로그인 유저 이름  -->
														</td>
														<td colspan="2">
															<span>e-mail</span>
														</td>
														<td colspan="4">
															<input type=text class="form-control" id="email" name="email"/>
														</td>
													</tr>
													<tr>
														<td colspan="2">
															<span>소속</span>
														</td>
														<td colspan="4">
															<!-- 로그인 유저 소속 부서 -->
														</td>
														<td colspan="2">
															<span>TEL.</span>
														</td>
														<td colspan="4">
															<input type=text class="form-control" id="phone" name="phone"/>
														</td>														
													</tr>
													<tr>
														<td colspan="4">
															<span>주소</span>
														</td>
														<td colspan="8">
															<input type=text class="form-control" id="officeAddress" name="officeAddress"/>
														</td>
													</tr>
													<tr>
														<td colspan="12">
															<textarea id="summernote2"></textarea>
														</td>
													</tr>
													<tr>
														<td colspan="4">
															<span>부서공유</span>
														</td>
														<td colspan="8">													
															<input type="checkbox" name="deptShare" value="Y"> 														
														</td>
													</tr>
													<tr>
														<td colspan="12">
															<div class="btn btn-default btn-file btn-xs">
											                    <i class="fas fa-paperclip"></i> 첨부파일
											                    <input type="file" name="normalAttach" id="normalAttach" multiple="true">
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
														<td colspan="5">
															 <span class="normalAttachName"></span>
														</td >
														<td colspan="2">
															<span class="normalAttachSize"></span>
														</td>
														<td colspan="2">
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
							
							<!-- 회의록  -->
							
							<div class="card card-outline card-info" id="minut_div">
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
																	<span id="emp_level0"></span>
																</th>
																<th class="table emp_level" scope="col">
																	<span id="emp_level1"></span>
																</th>
																<th class="table emp_level" scope="col" >
																	<span id="emp_level2"></span>
																</th>
																<th class="table emp_level" scope="col" >
																	<span id="emp_level3"></span>
																</th>
																<th class="table emp_level" scope="col" >
																	<span id="emp_level4"></span>
																</th>															
															</tr>
															<tr>
																<td class="table emp_name" scope="col" >
																	<span id="emp_name0"></span>
																	<input type="hidden" id="writer" name="writer" value="직원이름">
																</td>
																<td class="table emp_name" scope="col" >
																	<span id="emp_name1"></span>
																	<input type="hidden" id="line1" name="line1" value="직원이름">
																</td>
																<td class="table emp_name" scope="col" >
																	<span id="emp_name2"></span>
																	<input type="hidden" id="line2" name="line2" value="직원이름">
																</td>
																<td class="table emp_name" scope="col" >
																	<span id="emp_name3"></span>
																	<input type="hidden" id="line3" name="line3" value="직원이름">
																</td>
																<td class="table emp_name"scope="col" >
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
																<th class="table emp_level" scop="col">
																	<span id="emp_level0"></span>
																</th>
																<th class="table emp_level" scop="col">
																	<span id="emp_level1"></span>
																</th>
																<th class="table emp_level"  scop="col">
																	<span id="emp_level2"></span>
																</th>
																<th class="table emp_level" scop="col">
																	<span id="emp_level3"></span>
																</th>											
															</tr>
															<tr>
																<td class="table emp_name"  scop="col">
																	<span id="emp_name0"></span>
																	<input type="hidden" id="cooperator0" name="cooperator0" value="직원이름">
																</td>
																<td class="table emp_name"  scop="col">
																	<span id="emp_name1"></span>
																	<input type="hidden" id="cooperator1" name="cooperator1" value="직원이름">
																</td>
																<td class="table emp_name" scop="col">
																	<span id="emp_name2"></span>
																	<input type="hidden" id="cooperator2" name="cooperator2" value="직원이름">
																</td>
																<td class="table emp_name" scop="col">
																	<span id="emp_name3"></span>
																	<input type="hidden" id="cooperator3" name="cooperator3" value="직원이름">
																</td>										
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
															<c:set var="now" value="<%=new java.util.Date()%>" />
															<c:set var="sysdate"><fmt:formatDate value="${now}" pattern="yyyy/MM/dd HH:mm:ss" /></c:set> 
															<c:out value="${sysdate}" />
														</td>
													</tr>
													<tr>
														<td colspan="3">
															<span>기안자</span>
														</td>
														<td colspan="6">
															<input type="text" name="writer" id="writer" class="forn-control" value= "${loginUser.empName}" readonly>
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
														<td colspan="3">
															<span>참석자 </span>												
														</td>
														<td colspan="6">											
															<button type="button" class="btn btn-default" style="font-size:0.8rem">참석자 등록</button>	
															<input type="text" id="attendees" name="attendees"/>																				
														</td>
													</tr>
													<tr>
														<td colspan="9">
															<textarea id="summernote3"></textarea>
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
															<div class="btn btn-default btn-file btn-xs">
											                    <i class="fas fa-paperclip"></i> 첨부파일
											                    <input type="file" name="normalAttach" id="normalAttach" multiple="true">
									                  		</div>
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
													<tr id="fileRow1">
														<td colspan="5">
															 <span class="normalAttachName"></span>
														</td >
														<td colspan="2">
															<span class="normalAttachSize"></span>
														</td>
														<td colspan="2">
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
																	<span id="emp_level0"></span>
																</th>
																<th class="table emp_level" scope="col">
																	<span id="emp_level1"></span>
																</th>
																<th class="table emp_level" scope="col" >
																	<span id="emp_level2"></span>
																</th>
																<th class="table emp_level" scope="col" >
																	<span id="emp_level3"></span>
																</th>
																<th class="table emp_level" scope="col" >
																	<span id="emp_level4"></span>
																</th>															
															</tr>
															<tr>
																<td class="table emp_name" scope="col" >
																	<span id="emp_name0"></span>
																	<input type="hidden" id="writer" name="writer" value="직원이름">
																</td>
																<td class="table emp_name" scope="col" >
																	<span id="emp_name1"></span>
																	<input type="hidden" id="line1" name="line1" value="직원이름">
																</td>
																<td class="table emp_name" scope="col" >
																	<span id="emp_name2"></span>
																	<input type="hidden" id="line2" name="line2" value="직원이름">
																</td>
																<td class="table emp_name" scope="col" >
																	<span id="emp_name3"></span>
																	<input type="hidden" id="line3" name="line3" value="직원이름">
																</td>
																<td class="table emp_name"scope="col" >
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
																<th class="table emp_level" scop="col">
																	<span id="emp_level0"></span>
																</th>
																<th class="table emp_level" scop="col">
																	<span id="emp_level1"></span>
																</th>
																<th class="table emp_level"  scop="col">
																	<span id="emp_level2"></span>
																</th>
																<th class="table emp_level" scop="col">
																	<span id="emp_level3"></span>
																</th>											
															</tr>
															<tr>
																<td class="table emp_name"  scop="col">
																	<span id="emp_name0"></span>
																	<input type="hidden" id="cooperator0" name="cooperator0" value="직원이름">
																</td>
																<td class="table emp_name"  scop="col">
																	<span id="emp_name1"></span>
																	<input type="hidden" id="cooperator1" name="cooperator1" value="직원이름">
																</td>
																<td class="table emp_name" scop="col">
																	<span id="emp_name2"></span>
																	<input type="hidden" id="cooperator2" name="cooperator2" value="직원이름">
																</td>
																<td class="table emp_name" scop="col">
																	<span id="emp_name3"></span>
																	<input type="hidden" id="cooperator3" name="cooperator3" value="직원이름">
																</td>										
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
														<td width="10%" colspan="4">
															<span>수신참조 </span>												
														</td>
														<td colspan="8">											
															<button type="button" class="btn btn-default" style="font-size:0.8rem">수신자등록</button>																					
														</td>
													</tr>
													<tr>
														<td colspan="4">
															<span>제목</span>
														</td>
														<td colspan="8">
															<input type=text class="form-control" id="ap_title" name="ap_title">
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
														<td colspan="3">
															<span>기안자</span>
														</td>
														<td colspan="6">
															<input type="text" name="writer" id="writer" class="forn-control" value= "${loginUser.empName}" readonly>
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
															<textarea id="summernote4"></textarea>
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
															<div class="btn btn-default btn-file btn-xs">
											                    <i class="fas fa-paperclip"></i> 첨부파일
											                    <input type="file" name="normalAttach" id="normalAttach" multiple="true">
									                  		</div>
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
													<tr id="fileRow">
														<td colspan="5">
															 <span class="normalAttachName"></span>
														</td >
														<td colspan="2">
															<span class="normalAttachSize"></span>
														</td>
														<td colspan="2">
															<button type="button" class="btn btn-danger" style="font-size:1em" onclick='deletefile();'>삭제</button>
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

	
	<!-- Summernote -->
	<script src="./resources/plugins/summernote/summernote-bs4.min.js"></script>

	<script>
    	$(document).ready(function() {
    	  $('#summernote').summernote({
    	    height : 400
    	  });
    	});
    </script>
    <script>
    	$(document).ready(function() {
    	  $('#summernote2').summernote({
    	    height : 400
    	  });
    	});
    </script>
    <script>
    	$(document).ready(function() {
    	  $('#summernote3').summernote({
    	    height : 400
    	  });
    	});
    </script>
    <script>
    	$(document).ready(function() {
    	  $('#summernote4').summernote({
    	    height : 400
    	  });
    	});
    </script>
    
<!-- div 전환 , disabled 주기-->	
	<script>
		$(function(){
			$("#normal_div").attr("style", "display:none")		
			$("#dipl_div").attr("style", "display:none")
			$("#minut_div").attr("style", "display:none")
			$("#humanr_div").attr("style", "display:none")
			$("#hr_detail").attr("style", "display:none")
			$("#hr_detail").attr("style", "display:none")
						
			$('#normal_radio').click(function(){
				$("#normal_div").css("display",'')
				$("#normal_div *").attr("disabled", false)
				$("#dipl_div").attr("style", "display:none")
				$("#dipl_div *").attr("disabled", true)
				$("#minut_div").attr("style", "display:none")
				$("#minut_div *").attr("disabled", true)
				$("#humanr_div").attr("style", "display:none")
				$("#humanr_div *").attr("disabled", true)
				$("#hr_detail").attr("style", "display:none")
				$("#hr_detail *").attr("disabled", true)
			});
			
			$('#dipl_radio').click(function(){
				$("#dipl_div").css("display",'')
				$("#dipl_div *").attr("disabled", false)
				$("#normal_div").attr("style", "display:none")
				$("#normal_div *").attr("disabled", true)
				$("#minut_div").attr("style", "display:none")
				$("#minut_div *").attr("disabled", true)
				$("#humanr_div").attr("style", "display:none")
				$("#humanr_div").attr("disabled", true)
				$("#hr_detail").attr("style", "display:none")
				$("#hr_detail").attr("disabled", true)
			});		
			
			$('#minut_radio').click(function(){
				$("#minut_div").css("display",'')
				$("#minut_div").attr("disabled", false)
				$("#normal_div").attr("style", "display:none")
				$("#normal_div").attr("disabled", true)
				$("#dipl_div").attr("style", "display:none")	
				$("#dipl_div").attr("disabled", true)
				$("#humanr_div").attr("style", "display:none")
				$("#humanr_div *").attr("disabled", true)
				$("#hr_detail").attr("style", "display:none")
				$("#hr_detail *").attr("disabled", true)
			});		
			
			$('#humanr_radio').click(function(){
				$("#hr_detail").css("display",'')
				$("#hr_detail *").attr("disabled", false)
				$("#humanr_div").css("display",'')
				$("#humanr_div *").attr("disabled", false)
				$("#normal_div").attr("style", "display:none")
				$("#normal_div *").attr("disabled", true)
				$("#dipl_div").attr("style", "display:none")
				$("#dipl_div *").attr("disabled", true)
				$("#minut_div").attr("style", "display:none")
				$("#minut_div *").attr("disabled", true)
			});	

		});
	</script>
	
<!-- 첨부파일 라벨 추가 -->
	<script>
		
		$("#normalAttach").on("change", function(e) {	
			
			var filename = $(this)[0].files[0].name;
			var filesize = $(this)[0].files[0].size;
			console.log("name : "+ filename);
			console.log("size : "+ filesize); 	
			
			$(".normalAttachName").text(filename);
			$(".normalAttachSize").text(filesize);
			
			
			/****** multi
			console.log("n=" + n);
					
			if(n > 1){
				var addRow = 
					'<tr id=' + '"fileRow'+n+'">'+
						'<td colspan="5">'+
							'<span name="normalAttachName'+n+'"></span>'+
						'</td >'+
						'<td colspan="2">' +
							'<span name="normalAttachSize'+n+'"></span>'+
						'</td>'+
						'<td colspan="2">'+
							'<button type="button" class="btn btn-danger" style="font-size:1em">삭제</button>'+
						'</td>'+
					'</tr>';
					
				var trHtml = $("tr[id^='fileRow']:last");
				trHtml.after(addRow);
				
				var index = n-1;
	
				var filename = $(this)[0].files[0].name;
				var filesize = $(this)[0].files[0].size;
				console.log("name : "+ filename);
				console.log("size : "+ filesize); 	
				$(".normalAttachName:last").text(filename);
				$(".normalAttachSize:last").text(filesize);
				
				n+=1
			
			}else {
				
				var filename = $(this)[0].files[0].name;
				var filesize = $(this)[0].files[0].size;
				console.log("name : "+ filename);
				console.log("size : "+ filesize);		
				$(".normalAttachName:last").text(filename);
				$(".normalAttachSize:last").text(filesize);
				
				n+=1;			
			}		 */	
		});
	</script>
<!-- 첨부파일 삭제 
	<script>
		if(confirm("파일을 삭제하시겠습니까?")){
			
			var file = 
			
		}
	</script>-->
	
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
				$("#normalApprovalForm").attr("action", "<%=request.getContextPath()%>/insertApproval.ea?status=Y");
				$("#normalApprovalForm").submit();
				
				alert("결재 작성이 완료되었습니다.");
			});		
		}
		
		function insertTemp(){
			$("#normalApprovalForm").each(function(){
				$("#normalApprovalForm").attr("action", "<%=request.getContextPath()%>/insertApproval.ea?status=N");
				$("#normalApprovalForm").submit();
				
				alert("임시저장되었습니다..");
			});		
		}
	</script>

</body>
</html>