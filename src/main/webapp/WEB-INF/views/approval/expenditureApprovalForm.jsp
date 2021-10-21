<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			<form id="expenditureApprovalForm" method="post" action="insertApproval.ea" enctype="multipart/form-data">
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
													<input type="hidden" name="doc_type"  value = "지출결의" id="ex_hidden">
													<span class="co_docu_cd_old" docu_cd="지출결의" style="cursor: pointer;">지출결의서</span>											
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
														<td width="10%" colspan="1">
															<span>수신참조 </span>												
														</td>
														<td colspan="11">											
															<button type="button" class="btn btn-default" style="font-size:0.8rem">수신자등록</button>																					
														</td>
													</tr>
													<tr>
														<td colspan="1">
															<span>지출형식</span>
														</td>
														<td colspan="11">
															<label style="display: inline-block" class="bottom-margin0" >
																<input type="radio" name="ex_radio"  value = "법인카드" id="corpor_radio" checked="true">
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
																<input type="checkbox" name="commonEx_check"  value = "공통경비" id="commonEx_check" >
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
															<!-- 유저 부서 -->
														</td>
														<td colspan="1">
															이름
														</td>
														<td colspan="3">
														 	유저 부서
														</td>
													</tr>
													<tr>
														<td colspan="1">
															<span>제목</span>
														</td>
														<td colspan="11">
															<input type=text class="form-control" id="ap_title" name="ap_title">
														</td>
													</tr>
													<tr id="temp_hidden">
														<td colspan="2">
															<span>지급유형</span>
														</td>
														<td colspan="4">
															<select name="exType" class="form-control" id='corpor_select' style="font-size:0.8rem">
																<option value="none"> 선택  </option>
																<option value="법인카드"> 법인카드 </option>
																<option value="체크카드"> 체크카드 </option>
															</select>
															<select name="exType" class="form-control" id='remitt_select' style="font-size:0.8rem">
																<option value="none"> 선택  </option>
																<option value="세금계산서"> 세금계산서 </option>
																<option value="사업소득자"> 사업소득자 </option>
																<option value="기타"> 기타 </option>
															</select>
														</td>
														<td colspan="2">
															<span id='exNum'>지급번호</span>
														</td>
														<td colspan="4">
															<select name="exNum" class="form-control" id='card_select' style="font-size:0.8rem">
															<%--<% for(int i=0; i < numList.length; i++) { %> --%>
															<%-- <option value="<%= numList[i]%>"><%= numList[i]%> </option> --%>
															<%-- <%} %> --%>	
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
															<input type="date" class="form-control datetimepicker-input" data-target="#exDate" name="exDetailList[0].exDate" style="font-size:0.8rem">
														</td>
														<td colspan="1">
															<select name="exDetailList[0].exContent" class="form-control" id='exContent_select1'style="font-size:0.8rem">
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
															<input type="text" class="form-control" id="price1" name="exDetailList[0].price" style="font-size:0.8rem"/>
														</td>
														<th colspan="2">
															<input type="text" class="form-control" id="accountName1" name="exDetailList[0].accName" class="form-control" style="font-size:0.8rem">											
														</th>
														<td colspan="1">
															<select name="exDetailList[0].bankName" class="form-control" id='exBank1' style="font-size:0.8rem">
																<option value="none"> 은행선택  </option>
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
															<input type="text" class="form-control" id="accountNum1" name="exDetailList[0].accNum" style="font-size:0.8rem">
														</td>
														<td colspan="1">
															<input type="text" class="form-control" id="accHolder1" name="exDetailList[0].accHolder" style="font-size:0.8rem">
														</td>
														<td colspan="1">
															<input type="text" class="form-control" id="exDept1" name="exDetailList[0].exDept" style="font-size:0.8rem" onclick="searchDept(this.id);"/>
														</td>
														<td colspan="1">
															<input type="text" class="form-control" id="exNote1" name="exDetailList[0].note" style="font-size:0.8rem">
														</td>					
													</tr>
													<tr>
														<th colspann="1">
															<span>합계</span>
														</th>
														<td colspan="5" id="sumTd">
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
															<textarea id="summernote"></textarea>
														</td>
													</tr>
													<tr>
														<td colspan="2">
															<span>부서공유</span>
														</td>
														<td colspan="10">													
															<input type="checkbox" name="deptShare" value="Y"> 														
														</td>
													</tr>
													<tr>
														<td colspan="12">
															<label for="file_up" class="btn btn-primary" style="font-size:1em">파일추가</label>
															<input type="file" id="file_up" style="display:none" multiple="multiple">
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
													<tr>
														<td colspan="6">
															<!-- 파일명 -->
														</td >
														<td colspan="3">
															<!-- 파일크기-->
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
									<button id="tempSaveBtn" type="button" class="btn btn-secondary btn-sm">임시저장</button>
									&nbsp;
									<button id="submitBtn" type="button" class="btn btn-primary btn-sm">등록</button>
									&nbsp;
									<button type="button" class="btn btn-danger btn-sm" >취소</button>
									&nbsp;
								</div>
							</div>
				</form>
			</section>
		</div>	
		
	<jsp:include page="../common/footer.jsp"/>
	

<!-- script -->
	
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
			
			$("#remitt_select").attr("style", "display:none")
			$('input[name$="accNum"]').attr("disabled",true);
			
			
			$('#corpor_radio').click(function(){				
				$("#corpor_select").css("display",'')
				$("#temp_hidden").attr("display",'')
				$("#remitt_select").attr("style", "display:none")
				$('input[name$="accNum"]').attr("disabled",true);
				
			});
			
			$('#remitt_radio').click(function(){
				$("#remitt_select").css("display",'')
				$("#temp_hidden").css("display",'')
				$("#corpor_select").attr("style", "display:none")
				$('input[name$="accNum"]').attr("disabled",false);
							
			});
						
			$('#temporory_radio').click(function(){				
				$("#temp_hidden").attr("style", "display:none")
			});
			
			$('#commonEx_check').click(function(){
					if(this.checked){
						$("input[id^='exDept']").attr('disabled',true);
					}else {
						$("input[id^='exDept']").attr('disabled', false);
					}
			});
		});
	</script>
	
	<!-- 부서검색 팝업창 -->		
	<script language="javascript">		
		function searchDept(click_id){	
			console.log(click_id);	
			var windowObj = window.open("searchDeptForm.ea?val="+click_id, "부서 검색", "width=450, height=600, left=100, top=50");			
		}
	</script>	
	
	
	<!-- 지출항목 추가  -->
	<script>
		var n = 1;
		
		function plusExrow(){
				n+=1			
				var addRow = 
					'<tr ' + 'name=exRow>'+
						"<td colspan='1'>" +
							'<input type="checkbox"  id="exCheck'+n+'">'+
						"</td>"+
						'<td colspan="1">'+													
							'<input type="date" class="form-control datetimepicker-input" data-target="#exDate'+n+'" name="exDetailList['+n+'].exDate" style="font-size:0.8rem">'+
						'</td>'+
						'<td colspan="1">'+
							'<select name="exDetailList['+n+'].exContent" class="form-control" id="exContent_select'+n+'" style="font-size:0.8rem">'+
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
							'<input type="text" class="form-control" id="price'+n+'" name="exDetailList['+n+'].price" style="font-size:0.8rem">'+
						'</td>'+
						'<th colspan="2">'+
							'<input type="text" class="form-control" id="accountName'+n+'" name="exDetailList['+n+'].accName"class="form-control" style="font-size:0.8rem">'+									
						'</th>'+
						'<td colspan="1">'+
							'<select name="exDetailList['+n+'].bankName" class="form-control" id="exBank'+n+'" style="font-size:0.8rem">'+
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
							'<input type="text" class="form-control" id="accountNum'+n+'" name="exDetailList['+n+'].accNum" style="font-size:0.8rem">'+
						'</td>'+
						'<td colspan="1">'+
							'<input type="text" class="form-control" id="accHolder'+n+'" name="exDetailList['+n+'].accHolder" style="font-size:0.8rem">'+
						'</td>'+
						'<td colspan="1">'+
							'<input type="text" class="form-control" id="exDept'+n+'" name="exDetailList['+n+'].exDept" style="font-size:0.8rem" onclick="searchDept(this.id);"/>'+
						'</td>'+
						'<td colspan="1">'+
							'<input type="text" class="form-control" id="exNote'+n+'" name="exDetailList['+n+'].note" style="font-size:0.8rem">'+
						'</td>'+			
					'</tr>'	;	
					
				var trHtml = $("tr[name='exRow']:last");
				trHtml.after(addRow);
				
				if($("input[id='corpor_radio']:checked").length > 0) {
					$('input[name$="accNum"]').attr("disabled",true);
				}
				
				if($("input[id='commonEx_check']:checked").length > 0) {
					$("input[name$='exDept']").attr('disabled',true);
				}				
		};
	</script>
	
	<!-- 지출항목 삭제 -->
	<script>
		function minusExrow(){
			
			//var tableRow = $('#detail_table').length;
			
			/* for(var row=1; row <tableRow; row++){	
				if($("input[id^='exCheck']:checked").length > 0){
					$(this).parent().remove();
				}
			} */
			
			$("input[id^='exCheck']:checked").parent().parent().remove();
		};	
	</script>
	
	<!-- 금액 합계  -->	
	<script type="text/javascript">
	$(function(){			
		var sum = 0;		
		$("input[id^='price']").each(function(){
			if(!isNaN(this.value)&&this.value.length!=0){
				console.log($(this).val())
				sum += parseInt($(this).val());
				$("#sumTd").val(sum);
			}
		});				
		
	});
	</script>
</body>
</html>