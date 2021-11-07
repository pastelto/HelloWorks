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
	input[id^="fieldWriter"], input[id^="userDept"], #sumTd{
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
			<form id="expenditureApprovalForm" method="post" action="insertExApproval.ea" enctype="multipart/form-data">
				<input type="hidden" class="apNo class" id="apNo" name="apNo" value="${approval.apNo}">
				<input type="hidden" class="doc_type class" id="doc_type" name="doc_type" value="지출">
				<div class="container-fluid">
					<div class="row">
						<div class="col-12">
							<div class="callout callout-info">		
							<table class="table table-bordered">
									<tbody>
										<tr>
											<td width="150px" colspan="3">
												<p style="font-size:0.8em;">지출결재</p>
											</td>
											<td style="font-size:0.8em;" colspan="5">
												<label style="display: inline-block" class="bottom-margin0" >
													<input type="hidden" name="doc_type"  value = "지출" id="ex_hidden">
													<span class="co_docu_cd_old" docu_cd="지출" style="cursor: pointer;">지출결의서</span>											
												</label>
												&nbsp;
											</td>
										</tr>
									</tbody>
								</table> 
							</div>
							<div class="card card-outline card-info" id="normal_div">
								<div class="card-header" >
									<h3 class="card-title" >지출결의서</h3>
								</div>
								<div class="card-body">
										<table width="400px" style="font-size:0.8em;" height="50px" align="right">
										<tbody>
											<tr>
												<td>
													<table class="table table-bordered" id="process_table">
														<tbody>
															<tr>															
																<th rowspan="2" colspan="5">결재</th>
																<th class="table emp_level" colspan="5">
																	<input type="text" class="emp_level0" id="emp_level1_0" value="${loginUser.jobName}" name="writerJob" readonly/>
																</th>
																<th class="table emp_level" colspan="5">
																	<input type="text" class="emp_level1" id="emp_level1_1" name="job "readonly/>
																</th>
																<th class="table emp_level" colspan="5">
																	<input type="text" class="emp_level2" id="emp_level1_2" name="job "readonly/>
																</th>
																<th class="table emp_level" colspan="5">
																	<input type="text" class="emp_level3" id="emp_level1_3" name="job "readonly/>
																</th>
																<th class="table emp_level" colspan="5" >
																	<input type="text" class="emp_level4" id="emp_level1_4" name="job "readonly/>
																</th>															
															</tr>
															<tr>
																<td class="table emp_name" colspan="5">
																	<input type="text" class="emp_name0" id="emp_name0" value="${loginUser.empName}" disabled/>
																	<input type="hidden" class="line0" id="writer" name="writer" value="${loginUser.empNo}">
																</td>
																<td class="table emp_name" colspan="5">
																	<input type="text" class="emp_name1" id="emp_name1_1" name="lineName "readonly/>
																	<input type="hidden" class="line1" id="line1_1" name="line" >
																</td>
																<td class="table emp_name" colspan="5">
																	<input type="text" class="emp_name2" id="emp_name1_2" name="lineName "readonly/>
																	<input type="hidden" class="line2" id="line1_2" name="line" >
																</td>
																<td class="table emp_name" colspan="5">
																	<input type="text" class="emp_name3" id="emp_name1_3" name="lineName "readonly/>
																	<input type="hidden" class="line3" id="line1_3" name="line" >
																</td>
																<td class="table emp_name" colspan="5">
																	<input type="text" class="emp_name4" id="emp_name1_4" name="lineName "readonly/>
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
														<tbody>
															<tr>
																<th rowspan="2"  colspan="5">협조</th>
																<th class="table coo_level" colspan="5">
																	<input type="text" class="coo_level1" id="coo_level1_1" name="cooJob" readonly/>
																</th>
																<th class="table coo_level" colspan="5">
																	<input type="text" class="coo_level1" id="coo_level1_2" disabled/>
																</th>
																<th class="table coo_level"  colspan="5">
																	<input type="text" class="coo_level1" id="coo_level1_3" disabled/>
																</th>
																<th class="table coo_level" colspan="5">
																	<input type="text" class="coo_level1" id="coo_level1_4" disabled/>
																</th>
																<th class="table coo_level" colspan="5">
																	<input type="text" class="coo_level1" id="coo_level1_5" disabled/>
																</th>											
															</tr>
															<tr>
																<td class="table coo_name"  colspan="5">
																	<input type="text" class="coo_name1_1" id="coo_name1_1" name="cooName" readonly/>
																	<input type="hidden" id="cooperator1_1" name="cooperator0">
																</td>
																<td class="table coo_name"  colspan="5">
																	<input type="text" class="coo_name1_2" id="coo_name1_2" disabled/>
																	<input type="hidden" id="cooperator1_2" name="cooperator1" >
																</td>
																<td class="table coo_name" colspan="5">
																	<input type="text" class="coo_name1_3" id="coo_name1_3" disabled/>
																	<input type="hidden" id="cooperator1_3" name="cooperator2" >
																</td>
																<td class="table coo_name" colspan="5">
																	<input type="text" class="coo_name1_4" id="coo_name1_4" disabled/>
																	<input type="hidden" id="cooperator1_4" name="cooperator3" >
																</td>	
																<td class="table coo_name" colspan="5">
																	<input type="text" class="coo_name1_5" id="coo_name1_5" disabled/>
																	<input type="hidden" id="cooperator1_5" name="cooperator4" >
																</td>									
															</tr>
														</tbody>
													</table>
												</td>											
											</tr>
											<tr>
												<td colspan="2" align="right">
													<button type="button" class="btn btn-default" style="font-size:0.8rem" id="plus_line_btn" onclick="plusLine(1);">+ 결재라인 추가</button>
													<button type="button" class="btn btn-default" style="font-size:0.8rem" id="plus_line_btn" onclick="plusCoo(1);">+ 협조 추가</button>
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
														<td width="10%" colspan="1">
															<span>수신참조 </span>												
														</td>
														<td colspan="11" style="text-align:left !important;">
														<div class="input-group" style="width:30% !important;">														
															<input type="text" id="ccName1" class="form-control" name="ccName" width="30%" "/>	
															<input type="hidden" id="ccCode1" name="ccCode"/>
															<div class="input-group-append">															
																<button type="button" class="btn btn-default" style="font-size:0.8rem" onclick="plusCC(1);">수신자등록</button>																				
															</div>
														</div>
														</td>
													</tr>
													<tr>
														<td colspan="1">
															<span>지출형식</span>
														</td>
														<td colspan="11">
															<label style="display: inline-block" class="bottom-margin0" >
																<input type="radio" name="ex_radio"  value = "법인카드" id="corpor_radio" />
																<span class="co_docu_cd_old" style="cursor: pointer;">법인카드</span>											
															</label>
															<label style="display: inline-block" class="bottom-margin0" >
																<input type="radio" name="ex_radio"  value = "송금" id="remitt_radio" >
																<span class="co_docu_cd_old" style="cursor: pointer;">송금</span>											
															</label>
															<label style="display: inline-block" class="bottom-margin0" >
																<input type="radio" name="ex_radio"  value = "현금가지급" id="temporory_radio" >
																<span class="co_docu_cd_old"  style="cursor: pointer;">현금가지급정산</span>											
															</label>
															<label style="display: inline-block" class="bottom-margin0" >
															
															<c:if test="${ae.exCommon eq 'Y' }">															
																<input type="checkbox" name="commonEx"  value = 'Y' id="commonEx" checked="true"/>
															</c:if>	
															<c:if test="${ae.exCommon eq 'N' }">
																<input type="checkbox" name="commonEx"  value = 'Y' id="commonEx" />
															</c:if>	
																<input type="hidden" name="commonEx" value='N' id="commonEx_hidden"/>
																<span>공통경비</span>											
															</label>
																												
														</td>
													</tr>
													<tr>
														<td colspan="1">
															<span>일자</span>
														</td>
														<td colspan="3">
															<c:set var="now" value="<%=new java.util.Date()%>" />
															<c:set var="sysdate"><fmt:formatDate value="${now}" pattern="yyyy/MM/dd HH:mm:ss" /></c:set> 
															<c:out value="${sysdate}" />
														</td>
														<td colspan="1">
															<span>부서</span>
														</td>
														<td colspan="3">
															<input type="text" name="userDept" id="userDept" class="form-control" value="${loginUser.deptDname}" style="font-size:0.9em"/> 
														</td>
														<td colspan="1">
															<span>이름</span>
														</td>
														<td colspan="3">
														 	<input type="text" id="fieldWriter" class="form-control" value="${loginUser.empName}" style="font-size:0.9em"/>
														</td>
													</tr>
													<tr>
														<td colspan="1">
															<span>제목</span>
														</td>
														<td colspan="11">
															<input type=text class="form-control" id="ap_title" name="ap_title" value="${approval.title}"/>
														</td>
													</tr>
													<tr id="temp_hidden">
														<td colspan="2">
															<span>지급유형</span>
														</td>
														<td colspan="4">
															<select name="exType" class="form-control" id='corpor_select' style="font-size:0.8rem" onchange="changeExNum();">
																<option> 선택  </option>
																<option value="법인카드"> 법인카드 </option>
																<option value="체크카드"> 체크카드 </option>
															</select>
															<select name="exType" class="form-control" id='remitt_select' style="font-size:0.8rem">
																<option value=""> 선택  </option>
																<option value="세금계산서"> 세금계산서 </option>
																<option value="사업소득자"> 사업소득자 </option>
																<option value="기타"> 기타 </option>
															</select>
														</td>
														<td colspan="2">
															<span id='exNum'>지급번호</span>
														</td>
														<td colspan="4">
															<select name="exNum" class="form-control" id='card_select1' style="font-size:0.8rem">
																	<option value="" style="font-size:0.8rem">선택해주세요.</option>
																<c:forEach items="${ chlist }" var="approvalExDetails">																	
																	<option value="${ approvalExDetails.exNum }" style="font-size:0.8rem">${ approvalExDetails.exNum }</option>																	
																</c:forEach>
															</select>
															<select name="exNum" class="form-control" id='card_select2' style="font-size:0.8rem">
																	<option value="" style="font-size:0.8rem">선택해주세요.</option>
																<c:forEach items="${ colist }" var="approvalExDetails">																	
																	<option value="${ approvalExDetails.exNum }" style="font-size:0.8rem">${ approvalExDetails.exNum }</option>																	
																</c:forEach>
															</select>
															<select class="form-control" id='card_select3' style="font-size:0.8rem">
																<option value="">선택해주세요.</option>
																<option value="">--------------------</option>
															</select>
														</td>
													</tr>
													
													<tr>
														<th colspan="1">
															<span>선택</span>
														</th>
														<th colspan="1">
															<span>년월일</span>
														</th>
														<th colspan="1">
															<span>내용</span>
														</th>
														<th colspan="1">
															<span>금액</span>
														</th>
														<th colspan="2">
															<span>업체명</span> &nbsp;
															<button type="button" class="btn btn-default" id="acc_select" style="font-size:0.8rem" onclick='searchAcc();'>찾기</button>
														</th>
														<th colspan="1">
															<span>지급은행</span>
														</th>
														<th colspan="2">
															<span>계좌번호(-포함)</span>
														</th>
														<th colspan="1">
															<span>예금주</span>
														</th>
														<th colspan="1">
															<span>지출부서</span>
														</th>
														<th colspan="1">
															<span>비고</span>
														</th>														
													</tr>										
													<tr name="exRow">
														<td colspan='1'>
															<!--  <input type="checkbox"  id="exCheck1">-->
														</td>
														<td colspan="1">															
															<input type="date" class="form-control datetimepicker-input" data-target="#exDate" name="exDate" id="exDate1" style="font-size:0.8rem">
														</td>
														<td colspan="1">
															<select name="exContent" class="form-control" id='exContent_select1'style="font-size:0.8rem">
																<option value="none"> 선택  </option>
																<option value="교통비"> 교통비 </option>
																<option value="복리후생"> 복리후생 </option>
																<option value="사무비품"> 사무비품 </option>
																<option value="소모품비"> 소모품비 </option>																
																<option value="지급수수료"> 지급수수료 </option>
																<option value="출장비"> 출장비 </option>
															</select>
														</td>
														<td colspan="1">
															<input type="text" class="form-control" id="price1" name="price" style="font-size:0.8rem" onkeyup="priceSum();"/>
														</td>
														<th colspan="2">
															<input type="text" class="form-control" id="accountName1" name="accName" class="form-control" style="font-size:0.8rem">											
														</th>
														<td colspan="1">
															<select name="bankName" class="form-control" id='exBank1' style="font-size:0.8rem">
																<option> 은행선택  </option>
																<option value="경남"> 경남 </option>
																<option value="광주"> 광주 </option>
																<option value="국민"> 국민 </option>
																<option value="기업은행"> 기업은행 </option>																
																<option value="농협중앙"> 농협중앙 </option>
																<option value="대구"> 대구 </option>
																<option value="부산"> 부산 </option>
																<option value="산업"> 산업 </option>
																<option value="상호저축"> 상호저축 </option>
																<option value="새마을금고"> 새마을금고 </option>
																<option value="수출입"> 수출입 </option>
																<option value="수협"> 수협 </option>
																<option value="신한"> 신한 </option>
																<option value="신협"> 신협 </option>
																<option value="외환"> 외환 </option>
																<option value="우리"> 우리 </option>
																<option value="우체국"> 우체국 </option>
																<option value="전북"> 전북 </option>
																<option value="제주"> 제주 </option>
																<option value="지역농협"> 지역농협 </option>
																<option value="축협"> 축협 </option>
																<option value="카카오뱅크"> 카카오뱅크 </option>
																<option value="케이뱅크"> 케이뱅크 </option>
																<option value="하나"> 하나 </option>
																<option value="한국"> 한국 </option>
																<option value="한국씨티"> 한국씨티 </option>
																<option value="SC제일"> SC제일 </option>
															</select>
														</td>
														<td colspan="2">
															<input type="text" class="form-control" id="accountNum1" name="accNum" style="font-size:0.8rem">
														</td>
														<td colspan="1">
															<input type="text" class="form-control" id="accHolder1" name="accHolder" style="font-size:0.8rem">
														</td>
														<td colspan="1">
															<input type="text" class="form-control" id="exDept1" name="exDept" style="font-size:0.8rem" onclick="searchDept(this.id);"/>
														</td>
														<td colspan="1">
															<input type="text" class="form-control" id="exNote1" name="note" style="font-size:0.8rem">
														</td>					
													</tr>
													<tr>
														<th colspann="1">
															<span>합계</span>
														</th>
														<td colspan="5" >
															<input type="text" id="sumTd" class="form-control"/>
														</td>
														<td colspan="6" align="right">
															<button type="button" class="btn btn-default" id="plusEx1" style="font-size:0.8rem" onclick="plusExrow();">지출항목 추가 </button>&nbsp;
															<button type="button" class="btn btn-default" id="minusEx1" style="font-size:0.8rem" onclick="minusExrow();">지출항목 삭제</button>
														</td>
													</tr>													
													<tr>
														<th colspan="1">
															결재문서첨부
														</th>
														<td colspan="10">
															<select multiple class='form-control' id="exfile_select">
															</select>
														</td>
														<td colspan="1" >
															<button type="button" class="btn btn-default" id="plusFile1" style="font-size:0.8rem">문서 추가 </button> <!-- 문서검색 연결 -->
															<button type="button" class="btn btn-default" id="minusFiLE1" style="font-size:0.8rem">문서 삭제</button>
														</td>
													</tr>								
													<tr>
														<td colspan="12">
															<textarea id="summernote" name="apContent">${approval.content}</textarea>
														</td>
													</tr>
													<tr>
														<td colspan="2">
															<span>부서공유</span>
														</td>
														<td colspan="10">	
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
											                    <input type="file" class="expenditureAttach" name="expenditureAttach" id="expenditureAttach" multiple="true">
									                  		</div> 
														</td>
													</tr>
													<tr>
														<td colspan="6">
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
															<span class="expenditureAttachName">${apAttach.originName}</span>
														</td >
														<td colspan="3">
															<span class="expenditureAttachSize"></span>
														</td>
														<td colspan="3">
															<button type="button" class="btn btn-danger" style="font-size:1em" onclick="deletefile();">삭제</button>
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
	<!-- 결재라인 -->
	<script>		
		var arr = new Array();
		<c:forEach items="${ lineList }" var="line">
			arr.push({job:"${line.jobName}", name:"${line.empName}", number:"${line.empNo}"});
		</c:forEach>
		
		var n=1;
		
		for(var i=0;i<arr.length;i++){
			$('input[id="emp_level1_'+n+'"]').val(arr[i].job);
			$('input[id="emp_name1_'+n+'"]').val(arr[i].name);
			$('input[id="line1_'+n+'"]').val(arr[i].number);
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
			$('input[id="ccName1"]').val(deptName);
			$('input[id="ccCode1"]').val(ccDept);
		} else if (memberName != null){
			$('input[id="ccName1"]').val(memberName);
			$('input[id="ccCode1"]').val(ccMember);
		}	
	</script>
	<!-- 지출유형 -->
	<script>
		var exForm = null;
		<c:choose>
			<c:when test="${ ae.exForm eq '법인카드'}">
				exForm = '법인카드';
			</c:when>
			<c:when test="${ ae.exForm eq '송금'}">
				exForm = '송금';
			</c:when>
			<c:when test="${ ae.exForm eq '현금가지급'}">
				exForm = '현금가지급';
			</c:when>
		</c:choose>
		
		if(exForm == '법인카드'){
			$('input[id=corpor_radio]').prop('checked',true);
		} 
		else if( exForm == '송금'){
			$('input[id=remitt_radio]').prop('checked',true);
		}
		else if( exForm == '현금가지급'){
			$('input[id=temporory_radio]').prop('checked',true);
		}
	</script>
	

	
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
		$(function(){
			
			if($("input[id='corpor_radio']:checked").length > 0) {				
				$("#corpor_select").css("display",'')
				if($("#corpor_select").val() == '법인카드'){
					$("#card_select2").css("display",'')
					$("#card_select1").attr("style", "display:none")
					$("#card_select3").attr("style", "display:none")
				} else if($("#corpor_select").val() == '체크카드'){
					$("#card_select1").css("display",'')
					$("#card_select2").attr("style", "display:none")
					$("#card_select3").attr("style", "display:none")
				} else {
					$("#temp_hidden").css("display",'')
					$("#card_select3").css("display",'')
					$("#card_select2").attr("style", "display:none")
					$("#card_select1").attr("style", "display:none")
				}					
				$("#temp_hidden").css("display",'')
				$("#remitt_select").attr("style", "display:none")
				$('input[name="accNum"]').attr("disabled",true);
				$('input[name="accHolder"]').attr("disabled",true);
			}
			
			if($("input[id='remitt_radio']:checked").length > 0){
				$("#remitt_select").css("display",'')
				$("#temp_hidden").css("display",'')
				$("#corpor_select").attr("style", "display:none")
				$("#card_select1").attr("style", "display:none")
				$("#card_select2").attr("style", "display:none")
				$("#card_select3").attr("style", "display:none")
				$('input[name="accNum"]').attr("disabled",false);
				$('input[name="accHolder"]').attr("disabled",false);
				
			}
			
			if($("input[id='temporory_radio']:checked").length > 0){
				$("#temp_hidden").attr("style", "display:none")
				$('input[name="accNum"]').attr("disabled",true);
				$('input[name="accHolder"]').attr("disabled",true);
				
			}
			
			if($("input[id='commonEx']:checked").length > 0) {
				$("input[name='exDept']").attr('disabled',true);
			}				
			
			
			
			$('#corpor_radio').click(function(){				
				$("#corpor_select").css("display",'')
				$("#temp_hidden").css("display",'')
				$("#card_select3").css("display",'')
				$("#remitt_select").attr("style", "display:none")
				$("#card_select1").attr("style", "display:none")
				$('input[name="accNum"]').attr("disabled",true);
				$('input[name="accHolder"]').attr("disabled",true);
				
			});
			
			
			
			$('#remitt_radio').click(function(){
				$("#remitt_select").css("display",'')
				$("#temp_hidden").css("display",'')
				$("#corpor_select").attr("style", "display:none")
				$("#card_select1").attr("style", "display:none")
				$("#card_select2").attr("style", "display:none")
				$("#card_select3").attr("style", "display:none")
				$('input[name="accNum"]').attr("disabled",false);
				$('input[name="accHolder"]').attr("disabled",false);
							
			});
						
			$('#temporory_radio').click(function(){				
				$("#temp_hidden").attr("style", "display:none")
				$('input[name="accNum"]').attr("disabled",true);
				$('input[name="accHolder"]').attr("disabled",true);
			});
			
			$('#commonEx').click(function(){
					if(this.checked){
						$("input[name='exDept']").attr('disabled',true);
					}else {
						$("input[name='exDept']").attr('disabled', false);
					}
			});
		
		});
		
		function changeExNum(){
			
			if($("#corpor_select").val() == "법인카드"){
				$("#card_select2").css("display",'')
				$("#card_select1").attr("style", "display:none")
				$("#card_select3").attr("style", "display:none")
			} else if($("#corpor_select").val()=="체크카드"){
				$("#card_select1").css("display",'')
				$("#card_select2").attr("style", "display:none")
				$("#card_select3").attr("style", "display:none")
			}
		}
	</script>
	
	<!-- 지급유형 지급번호 -->
	<script>
		var arr = new Array();
		<c:forEach items="${ adList }" var="ad">
			arr.push({type:"${ad.exType}", cardNum:"${ad.exNum}"});
		</c:forEach>
		
		var type = arr[0].type;
		var num = arr[0].cardNum;
		
		
		if($("input[id='corpor_radio']:checked").length > 0) {			
			$("#corpor_select").val(type).prop("selected",true);			
			if(type == '법인카드'){
				$("#card_select2").css("display",'');
				$("#card_select1").attr("style", "display:none");
				$("#card_select3").attr("style", "display:none");
				$("#card_select2").val(num).prop("selected",true);
			} else if(type == '체크카드'){
				$("#card_select1").css("display",'')
				$("#card_select2").attr("style", "display:none");
				$("#card_select3").attr("style", "display:none");
				$("#card_select1").val(num).prop("selected",true);
			} else {
				$("#card_select3").css("display",'');
				$("#card_select1").attr("style", "display:none");
				$("#card_select2").attr("style", "display:none");
			}
			
		} else if($("input[id='remitt_radio']:checked").length > 0) {
			
			$("#remitt_select").val(type).prop("selected",true);
			
		} 
	</script>
	
	
	<!-- 임시저장된 지출 내역 불러오기  -->
	<script>
	$(function(){	
		var arr = new Array();
		<c:forEach items="${ adList }" var="ad">
			arr.push({date:"${ad.exDate2}", type:"${ad.exType}", cardNum:"${ad.exNum}",
					  content:"${ad.exContent}", price:"${ad.price}", accName:"${ad.accName}", bank:"${ad.bankName}",
					  accNum:"${ad.accNum}", holder:"${ad.accHolder}", dept:"${ad.exDept}", note:"${ad.note}"});
		</c:forEach>
		
		console.log(arr);
		
		var n=1;
		var addRow = null;
		
		for(var i=1; i<arr.length; i++){
			n++;
			var addRow = 
				'<tr ' + 'name=exRow>'+
					"<td colspan='1'>" +
						'<input type="checkbox"  id="exCheck'+n+'">'+
					"</td>"+
					'<td colspan="1">'+													
						'<input type="date" class="form-control datetimepicker-input" data-target="#exDate'+n+'" name="exDate" id="exDate'+n+'"style="font-size:0.8rem">'+
					'</td>'+
					'<td colspan="1">'+
						'<select name="exContent" class="form-control" id="exContent_select'+n+'" style="font-size:0.8rem">'+
							'<option value="none"> 선택  </option>'+
							'<option value="교통비"> 교통비 </option>'+
							'<option value="복리후생"> 복리후생 </option>'+
							'<option value="사무비품"> 사무비품 </option>'+
							'<option value="소모품비"> 소모품비 </option>'+															
							'<option value="지급수수료"> 지급수수료 </option>'+
							'<option value="출장비"> 출장비 </option>'+
						'</select>'+
					'</td>'+
					'<td colspan="1">'+
						'<input type="text" class="form-control" id="price'+n+'" name="price" style="font-size:0.8rem" onkeyup="priceSum();">'+
					'</td>'+
					'<th colspan="2">'+
						'<input type="text" class="form-control" id="accountName'+n+'" name="accName" class="form-control" style="font-size:0.8rem">'+									
					'</th>'+
					'<td colspan="1">'+
						'<select name="bankName" class="form-control" id="exBank'+n+'" style="font-size:0.8rem">'+
							'<option value="none"> 은행선택  </option>'+
							'<option value="경남"> 경남 </option>'+
							'<option value="광주"> 광주 </option>'+
							'<option value="국민"> 국민 </option>'+
							'<option value="기업은행"> 기업은행 </option>'+																
							'<option value="농협중앙"> 농협중앙 </option>'+
							'<option value="대구"> 대구 </option>'+
							'<option value="부산"> 부산 </option>'+
							'<option value="산업"> 산업 </option>'+
							'<option value="상호저축"> 상호저축 </option>'+
							'<option value="새마을금고"> 새마을금고 </option>'+
							'<option value="수출입"> 수출입 </option>'+
							'<option value="수협"> 수협 </option>'+
							'<option value="신한"> 신한 </option>'+
							'<option value="신협"> 신협 </option>'+
							'<option value="외환"> 외환 </option>'+
							'<option value="우리"> 우리 </option>'+
							'<option value="우체국"> 우체국 </option>'+
							'<option value="전북"> 전북 </option>'+
							'<option value="제주"> 제주 </option>'+
							'<option value="지역농협"> 지역농협 </option>'+
							'<option value="축협"> 축협 </option>'+
							'<option value="카카오뱅크"> 카카오뱅크 </option>'+
							'<option value="케이뱅크"> 케이뱅크 </option>'+
							'<option value="하나"> 하나 </option>'+
							'<option value="한국"> 한국 </option>'+
							'<option value="한국씨티"> 한국씨티 </option>'+
							'<option value="SC제일"> SC제일 </option>'+
						'</select>'+
					'</td>'+
					'<td colspan="2">'+
						'<input type="text" class="form-control" id="accountNum'+n+'" name="accNum" style="font-size:0.8rem">'+
					'</td>'+
					'<td colspan="1">'+
						'<input type="text" class="form-control" id="accHolder'+n+'" name="accHolder" style="font-size:0.8rem">'+
					'</td>'+
					'<td colspan="1">'+
						'<input type="text" class="form-control" id="exDept'+n+'" name="exDept" style="font-size:0.8rem" onclick="searchDept(this.id);"/>'+
					'</td>'+
					'<td colspan="1">'+
						'<input type="text" class="form-control" id="exNote'+n+'" name="note" style="font-size:0.8rem">'+
					'</td>'+			
				'</tr>'	;	
				
			var trHtml = $("tr[name='exRow']:last");
			trHtml.after(addRow);
			
			if($("input[id='corpor_radio']:checked").length > 0) {
				$('input[name="accNum"]').attr("disabled",true);
				$('input[name="accHolder"]').attr("disabled",true);
			}
			
			if($("input[id='temporory_radio']:checked").length > 0){
				$('input[name="accNum"]').attr("disabled",true);
				$('input[name="accHolder"]').attr("disabled",true);
				
			}
			
			if($("input[id='commonEx']:checked").length > 0) {
				$("input[name='exDept']").attr('disabled',true);
			}				
			
		}
		
		var k=2;
		
	
		for(var i=0; i<arr.length; i++){
			if(i==0){
				$("#exDate1").val(arr[i].date);
				$("#exContent_select1").val(arr[i].content).prop("selected", true);
				$("#price1").val(arr[i].price);
				$("#accountName1").val(arr[i].accName);
				$("#exBank1").val(arr[i].bank).prop("selected", true);
				$("#accHolder1").val(arr[i].holder);
				$("#accountNum1").val(arr[i].accNum);
				$("#exDept1").val(arr[i].dept);
				$("#exNote1").val(arr[i].note);
				
			}else {
				$('#exDate'+k).val(arr[i].date);
				$('#exContent_select'+k).val(arr[i].content).prop("selected",true);
				$('#price'+k).val(arr[i].price);
				$('#accountName'+k).val(arr[i].accName);
				$('#exBank'+k).val(arr[i].bank).prop("selected", true);
				$('#accountNum'+k).val(arr[i].accNum);
				$('#accHolder'+k).val(arr[i].holder);
				$('#exDept'+k).val(arr[i].dept);
				$('#exNote'+k).val(arr[i].note);
			}
		}
	
	});
	</script>
	
	
	<!-- 지출항목 추가  -->
	<script>
		var n = $("tr[name='exRow']").length;
		
		function plusExrow(){
				n+=1			
				var addRow = 
					'<tr ' + 'name=exRow>'+
						"<td colspan='1'>" +
							'<input type="checkbox"  id="exCheck'+n+'">'+
						"</td>"+
						'<td colspan="1">'+													
							'<input type="date" class="form-control datetimepicker-input" data-target="#exDate'+n+'" name="exDate" id="exDate'+n+'" style="font-size:0.8rem">'+
						'</td>'+
						'<td colspan="1">'+
							'<select name="exContent" class="form-control" id="exContent_select'+n+'" style="font-size:0.8rem">'+
								'<option value="none"> 선택  </option>'+
								'<option value="교통비"> 교통비 </option>'+
								'<option value="복리후생"> 복리후생 </option>'+
								'<option value="사무비품"> 사무비품 </option>'+
								'<option value="소모품비"> 소모품비 </option>'+															
								'<option value="지급수수료"> 지급수수료 </option>'+
								'<option value="출장비"> 출장비 </option>'+
							'</select>'+
						'</td>'+
						'<td colspan="1">'+
							'<input type="text" class="form-control" id="price'+n+'" name="price" style="font-size:0.8rem" onkeyup="priceSum();">'+
						'</td>'+
						'<th colspan="2">'+
							'<input type="text" class="form-control" id="accountName'+n+'" name="accName" class="form-control" style="font-size:0.8rem">'+									
						'</th>'+
						'<td colspan="1">'+
							'<select name="bankName" class="form-control" id="exBank'+n+'" style="font-size:0.8rem">'+
								'<option value="none"> 은행선택  </option>'+
								'<option value="경남"> 경남 </option>'+
								'<option value="광주"> 광주 </option>'+
								'<option value="국민"> 국민 </option>'+
								'<option value="기업은행"> 기업은행 </option>'+																
								'<option value="농협중앙"> 농협중앙 </option>'+
								'<option value="대구"> 대구 </option>'+
								'<option value="부산"> 부산 </option>'+
								'<option value="산업"> 산업 </option>'+
								'<option value="상호저축"> 상호저축 </option>'+
								'<option value="새마을금고"> 새마을금고 </option>'+
								'<option value="수출입"> 수출입 </option>'+
								'<option value="수협"> 수협 </option>'+
								'<option value="신한"> 신한 </option>'+
								'<option value="신협"> 신협 </option>'+
								'<option value="외환"> 외환 </option>'+
								'<option value="우리"> 우리 </option>'+
								'<option value="우체국"> 우체국 </option>'+
								'<option value="전북"> 전북 </option>'+
								'<option value="제주"> 제주 </option>'+
								'<option value="지역농협"> 지역농협 </option>'+
								'<option value="축협"> 축협 </option>'+
								'<option value="카카오뱅크"> 카카오뱅크 </option>'+
								'<option value="케이뱅크"> 케이뱅크 </option>'+
								'<option value="하나"> 하나 </option>'+
								'<option value="한국"> 한국 </option>'+
								'<option value="한국씨티"> 한국씨티 </option>'+
								'<option value="SC제일"> SC제일 </option>'+
							'</select>'+
						'</td>'+
						'<td colspan="2">'+
							'<input type="text" class="form-control" id="accountNum'+n+'" name="accNum" style="font-size:0.8rem">'+
						'</td>'+
						'<td colspan="1">'+
							'<input type="text" class="form-control" id="accHolder'+n+'" name="accHolder" style="font-size:0.8rem">'+
						'</td>'+
						'<td colspan="1">'+
							'<input type="text" class="form-control" id="exDept'+n+'" name="exDept" style="font-size:0.8rem" onclick="searchDept(this.id);"/>'+
						'</td>'+
						'<td colspan="1">'+
							'<input type="text" class="form-control" id="exNote'+n+'" name="note" style="font-size:0.8rem">'+
						'</td>'+			
					'</tr>'	;	
					
				var trHtml = $("tr[name='exRow']:last");
				trHtml.after(addRow);
				
				if($("input[id='corpor_radio']:checked").length > 0) {
					$('input[name="accNum"]').attr("disabled",true);
					$('input[name="accHolder"]').attr("disabled",true);
				}
				
				if($("input[id='temporory_radio']:checked").length > 0){
					$('input[name="accNum"]').attr("disabled",true);
					$('input[name="accHolder"]').attr("disabled",true);
					
				}
				
				if($("input[id='commonEx']:checked").length > 0) {
					$("input[name='exDept']").attr('disabled',true);
				}				
		};
	</script>
	
	<!-- 지출항목 삭제 -->
	<script>
		function minusExrow(){
			$("input[id^='exCheck']:checked").parent().parent().remove();
		};	
	</script>
	
	<!-- 금액 합계  -->	
	<script >	
	$(function(){
		var cnt = $('input[id^="price"]').length; 
		var sum = 0;
		
		for(var i=1; i<=cnt; i++){				
			sum += parseInt($('input[id^="price'+i+'"]').val());				
		};
		
			$("#sumTd").val(sum);	
	})
	
	
	function priceSum(){
		
		var cnt = $('input[id^="price"]').length; 
		var sum = 0;
		
		for(var i=1; i<=cnt; i++){				
			sum += parseInt($('input[id^="price'+i+'"]').val());				
		};
		document.getElementById("sumTd").value = sum;	
	}
	</script>
	
	<!-- 첨부파일 추가 / 삭제 -->
	<script>
		
		var cnt = 0;
		
		$(".expenditureAttach").on("change", function(e) {	
			
			var filename = $(this)[0].files[0].name;
			var filesize = $(this)[0].files[0].size;
			console.log("name : "+ filename);
			console.log("size : "+ filesize); 	
			
			$(".expenditureAttachName").text(filename);
			$(".expenditureAttachSize").text(filesize);
		
			cnt++
		});

		function deletefile(){
		
			if(cnt < 1){
				alert("삭제할 파일이 없습니다.");
			} else {
				
				if(confirm("삭제하시겠습니까?")){
					
					$(".expenditureAttach").val('');
					$(".expenditureAttachName").text('');
					$(".expenditureAttachSize").text('');
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
	<!-- 공통경비 check -->
	<script>
		$(function(){
			
			if($("#commonEx").checked){
				$("#commonEx_hidden").disabled = true;
			}
		});
	</script>
	
	<script>
		function insertApp(){	
			
			$("#expenditureApprovalForm").each(function(){
				if($("input[type=text]:enabled").val() == ""){
					alert("지출내역을 모두 입력해주세요.")
				} else if($("#corpor_select").val() == "" && $("#remitt_select").val()== ""){
					alert("지급 유형을 선택해주세요.")
				} else if($("#card_select1").val()=="" && $("#card_select").val()==""){
					alert("지급 계좌를 선택해주세요.")
				} else {
					$("#expenditureApprovalForm").attr("action", "<%=request.getContextPath()%>/insertExApproval.ea?status=Y");
					$("#expenditureApprovalForm").submit();
					
					alert("결재 작성이 완료되었습니다.");
				}
			});		
		}
		
		function insertTemp(){
			$("#expenditureApprovalForm").each(function(){
				if($("input[type=text]:enabled").val() == ""){
					alert("지출내역을 모두 입력해주세요.")
				} else if($("#corpor_select").val() == "" && $("#remitt_select").val()== ""){
					alert("지급 유형을 선택해주세요.")
				} else if($("#card_select1").val()=="" && $("#card_select").val()==""){
					alert("지급 계좌를 선택해주세요.")
				} else {
					$("#expenditureApprovalForm").attr("action", "<%=request.getContextPath()%>/insertExApproval.ea?status=Y");
					$("#expenditureApprovalForm").submit();
					
					alert("결재 작성이 완료되었습니다.");
				}
			});		
		}
	</script>
	
	<!-- 부서검색 팝업창 -->		
	<script language="javascript">		
		function searchDept(click_id){	
			console.log(click_id);	
			var windowObj = window.open("searchDeptForm.ea?val="+click_id, "부서 검색", "width=450, height=600, left=100, top=50");			
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