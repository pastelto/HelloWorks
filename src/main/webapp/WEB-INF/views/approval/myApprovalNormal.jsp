<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재-임시저장함</title>
<style>
	.content-wrapper {
		overflow: auto;
	}
	#normalApprovalSearchTable>thead{
		border-bottom: 1px solid #DAE1E7;
	}
	#normalApprovalSearchTable>thead>tr>th	{
		background-color: #DAE1E7;
		border-bottom: 1px solid #DAE1E7;
		width: 20%;
		text-align: center !important;
	}
	#normalApprovalSearchTable>tbody>tr>th	{
		background-color: #DAE1E7;
		border-bottom: 1px solid #DAE1E7;
		width: 20%;
		text-align: center !important;
	}
	#startDate, #endDate, #conditionOption, #conditionInput{
		width : 25% !important;
	}
	#normalBadge{
		background: #8DEFE6;
		color: white;
	}
	#minutesBadge{
		background: #8DDCEF;
		color: white;
	}
	#diplomaBadge{
		background: #8DBAEF;
		color: white;
	}
	#hrBadge{
		background: #8DA5EF;
		color: white;
	}
	
</style>
</head>
<body>
	
		<!-- Main content -->
		
		              
		              <div class="card-body">
						<div class="tab-content" id="custom-tabs-tempororyApproval-tab">
						
							<!-- 일반결재 탭 -->
							<div class="tab-pane fade show active" id="custom-tabs-normalApproval-tab" role="tabpanel" aria-labelledby="custom-tabs-normalApproval-tab">
								<div class="card" style="margin-bottom: 0px;">
									<form action="searchApproval.ea">	
									<input type="hidden" name='status' value='Y'/>
										<table id="normalApprovalSearchTable">
										<tbody>
											<tr>
												<th colspan="4">작성일자</th>
												<td colspan="8">												
													<div class="row mt-1 mb-1" style="margin-left: 0px;">
															&nbsp;&nbsp;
															<button id="btnsysdate" type="button" class="btn btn-default btn-xs" name="startDate" style="font-size:0.7rem" value="당일">당일</button>
															&nbsp;&nbsp;
															<button id="btnweekBtn" type="button" class="btn btn-default btn-xs" name="startDate" style="font-size:0.7rem" value="1주일">1주일</button>
															&nbsp;&nbsp;
															<button id="btnoneMbtn" type="button" class="btn btn-default btn-xs" name="startDate" style="font-size:0.7rem" value="1개월">1개월</button>
															&nbsp;&nbsp;
															<button id="btnthreeMbtn" type="button" class="btn btn-default btn-xs" name="startDate" style="font-size:0.7rem" value="3개월">3개월</button>
															&nbsp;&nbsp;
															<button id="btnsixMbtn" type="button" class="btn btn-default btn-xs" name="startDate" style="font-size:0.7rem" value="6개월">6개월</button>
															&nbsp;&nbsp;
															<button id="btnoneYbtn" type="button" class="btn btn-default btn-xs" name="startDate" style="font-size:0.7rem" value="1년">1년</button>
															&nbsp;&nbsp;
															<div class="form-group mb-0">
																<div class="input-group">
																	<input type="date" class="form-control form-control-sm datetimepicker-input datepicker" id="startDate" name="startDate" style="font-size:0.8rem">
																		<div class="input-group-append">
																			<span class="input-group-text input-group-xs form-control-sm badge-light" style="border-right: 0px;">~</span>
																		</div>
																	<input type="date" class="form-control form-control-sm datetimepicker-input datepicker" id="endDate" name="endDate" style="font-size:0.8rem">																														
																	<div class="input-group-append">
																    <button class="btn btn-xs btn-default" type="button" onclick="searchNormalApproval();" style="width: 30px; font-size: 14px; important">
																	<i class="fa fa-search"></i></button>
																	</div>
																</div>
															</div>
													</div>													
												</td>
											</tr>
											<tr>
												<th colspan="4">문서검색</th>
												<td colspan="8">
													<div class="row mt-1 mb-1" style="margin-left: 0px;">
														<button id="allSelect" type="button" class="btn btn-default btn-xs" name="selectAll" style='margin-left:3px' onclick="selectAllNormalTemp('일반');">전체보기</button>
														&nbsp;&nbsp;
															<select	id="conditionOption" name="conditionOption" class="form-control" style="font-size:0.8rem">
																<option value="제목"> 제목 </option>
																<option value="문서번호"> 문서번호 </option>
															</select>
															&nbsp;&nbsp;
														<div class="input-group" style="width: 30%;">
															<input type="text" class="form-control " id="conditionInput" name="conditionInput" style="font-size:0.8rem" placeholder="검색어를 입력하세요." />
															<div class="input-group-append">
																<button type="button" id="searchBtn" class="btn btn-sm btn-default" onclick="searchNormalApproval();" style="width: 30px; font-size: 14px;">
																	<i class="fa fa-search"></i>
																</button>
															</div>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<th colspan="4">일반 결재 문서</th>
												<td style="font-size:0.7rem;" colspan="8">
													<div  class="mt-1 mb-1" style="margin-left: 0px;">
														<label style="display: inline-block" class="bottom-margin0" >
															<input type="radio" name="doc_type"  value = "기안" id="normal_radio" style='margin-left:3px'>
															<span class="co_docu_cd_old" docu_cd="기안" style="cursor: pointer;">기안서</span>											
														</label>
														&nbsp;&nbsp;
														<label style="display: inline-block" class="bottom-margin0">
															<input type="radio" name="doc_type" value = "공문" id="dipl_radio">
															<span class="co_docu_cd_old" docu_cd="공문" style="cursor: pointer;">공문서</span>										
														</label>
														&nbsp;&nbsp;
														<label style="display: inline-block" class="bottom-margin0">
															<input type="radio" name="doc_type" value = "회의" id="minut_radio">
															<span class="co_docu_cd_old" docu_cd="회의" style="cursor: pointer;">회의록</span>
														</label>
														&nbsp;&nbsp;
														<label style="display: inline-block" class="bottom-margin0">
															<input type="radio" name="doc_type" value = "인사" id="humanr_radio">
															<span class="co_docu_cd_old" docu_cd="인사" style="cursor: pointer;">인사</span>
														</label>
														&nbsp;&nbsp;
													</div>
												</td>
											</tr>
											</tbody>
										</table>
										</form>
									</div>
									
									<hr>
									
									<!-- 내결재함 결재 list -->
									<div class="col-12" >
									<div>
									<div style="height: 450px; overflow:auto;">
									<table id="myApprovalTable" class="table table-sm" >
									<caption style="caption-side:top">* 정렬 기준 : <span id="sortOption">전체</span></caption>
										<thead>
											<tr>
												<th style="width: 5%">No.</th>
												<th style="width: 20%">제목</th>
												<th style="width: 10%">문서분류</th>
												<th style="width: 20%">문서번호</th>
												<th style="width: 10%">상태</th>
												<th style="width: 15%">작성일</th>
												<th style="width: 10%">부서</th>
												<th style="width: 10%">기안자</th>
											</tr>
										</thead>
										<tbody>
										
											<c:forEach items="${ approvalList }" var="approvalList" varStatus="status">
							                    <tr onclick="detailApproval(${ approvalList.apNo },'${ approvalList.detailClass }');">							      
							                        <td>${ approvalList.rownum }</td>
							                        <td>${ approvalList.title}</td>
							                        <c:if test="${ approvalList.detailClass == '기안'}">
							                        	<td><span class="badge" id="normalBadge">${ approvalList.detailClass }</span></td>
							                        </c:if>
							                        <c:if test="${ approvalList.detailClass == '회의'}">
							                       	 <td><span class="badge" id="minutesBadge">${ approvalList.detailClass }</span></td>
							                        </c:if>
							                        <c:if test="${ approvalList.detailClass == '공문'}">
							                        	<td><span class="badge" id="diplomaBadge">${ approvalList.detailClass }</span></td>
							                        </c:if>
							                        <c:if test="${ approvalList.detailClass == '인사'}">
							                        	<td><span class="badge" id="hrBadge">${ approvalList.detailClass }</span></td>
							                        </c:if>
							                        <td>${ approvalList.apNo }</td>
							                        <td>${ approvalList.progress }</td>
							                        <td>${ approvalList.createDate }</td>
							                        <td>${ approvalList.deptName }</td>
							                        <td>${ approvalList.writerName }</td>							                       
							                    </tr>
						                    </c:forEach>
										</tbody>
									</table>
									</div>
									</div>
									
									<br>
									
									<div id="pagingArea">
						                <ul class="pagination">
						                	<c:choose>
						                		<c:when test="${ pi.currentPage ne 1 }">
						                			<li class="page-item"><a class="page-link" href="${pageURL}?optionType=${ optionType }&deptTypeOption=${ deptTypeOption }&searchEmployee=${ searchEmployee }&currentPage=${ pi.currentPage-1 }">Previous</a></li>
						                		</c:when>
						                		<c:otherwise>
						                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
						                		</c:otherwise>
						                	</c:choose>
						                	
						                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
						                    	<c:choose>
							                		<c:when test="${ pi.currentPage ne p }">
					                    			<li class="page-item"><a class="page-link" href="${pageURL}?optionType=${ optionType }&deptTypeOption=${ deptTypeOption }&searchEmployee=${ searchEmployee }&currentPage=${ p }">${ p }</a></li>
							                		</c:when>
							                		<c:otherwise>
							                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
							                		</c:otherwise>
							                	</c:choose>
						                    </c:forEach>
						                    
						                    
						                    <c:choose>
						                		<c:when test="${ pi.currentPage ne pi.maxPage }">
						                			<li class="page-item"><a class="page-link" href="${pageURL}?optionType=${ optionType }&deptTypeOption=${ deptTypeOption }&searchEmployee=${ searchEmployee }&currentPage=${ pi.currentPage+1 }">Next</a></li>
						                		</c:when>
						                		<c:otherwise>
						                			<li class="page-item disabled"><a class="page-link" href="${pageURL}?currentPage=${ pi.currentPage+1 }">Next</a></li>
						                		</c:otherwise>
						                	</c:choose>
						                </ul>
						            </div>
								</div>
								<!-- /.col -->								
		                  	</div>
		                  
		                </div>
		              </div>
		              <!-- /.card -->
	
	<!-- 전체보기  -->
	 <script>
	 	function selectAllNormalTemp(cOption){
			var status = 'Y';
	 		$.ajax({
	 			url: "selectAllApproval.ea",
	 			type: "post",
	 			data :{
	 				cOption : cOption,
	 				status : status
	 			},
	 			success: function(list){
	 				
	 				var value = "";
	 				
 					$.each(list, function(i, obj){
 						value += '<tr onclick="detailApproval(' + obj.apNo + ",'" + obj.detailClass + "'" + ');">'+								      
                        '<td>'+obj.rownum+'</td>' +
                        '<td>'+obj.title+'</td>';
                        if(obj.detailClass == '기안'){
                        	value += '<td>'+'<span class="badge" id="normalBadge">'+obj.detailClass+'</span>'+'</td>'
                        } else if(obj.detailClass == '회의'){
                        	value += '<td>'+'<span class="badge" id="minutesBadge">'+ obj.detailClass+'</span>'+'</td>'
                        } else if(obj.detailClass == '공문'){
                        	value += '<td>'+'<span class="badge" id="diplomaBadge">'+obj.detailClass+'</span>'+'</td>'
                        } else if(obj.detailClass == '인사'){
                        	value += '<td>'+'<span class="badge" id="hrBadge">'+obj.detailClass+'</span>'+'</td>'
                        }
                        value += '<td>'+obj.apNo +'</td>' +
                        '<td>'+obj.progress+'</td>' +
                        '<td>'+obj.createDate+'</td>' +
                        '<td>'+obj.deptName+'</td>' +
                        '<td>'+obj.writerName+'</td>' +							                       
                    '</tr>';
 					});
 					
 					console.log("ajax 통신 성공")
 					console.log(list)
 					
 					$("#myApprovalTable>tbody").html(value);
 					$("#sortOption").text("전체");
 				},
 				error:function(){
 					console.log("기간별 임시저장 결재 검색 ajax 통신 실패")
 				}
	 			 			
	 		});
	 	}	 
	 </script>
	
	<!-- 날짜 버튼 검색 -->
	<script>
	 	$(function(){
	 		$("#normalApprovalSearchTable>tbody>tr:eq(0)>td>div>button").click(
	 				
		 		function(){		 		
		 			var sdate = $(this).val();
		 			var apClass = '일반';
		 			var status = 'Y';
		 			console.log(sdate)
			 			
			 		$.ajax({
			 			url: "selectDateSort.ea",
			 			type: "post",
			 			data : {
			 				sdate:sdate,
			 				apClass : apClass,
			 				status : status
			 			},
			 			success: function(list){
			 				var value = "";
			 				$.each(list, function(i, obj){			 				
			 					if(list.length != 0){
			 						value += '<tr onclick="detailApproval(' + obj.apNo + ",'" + obj.detailClass + "'" + ');">'+								      
			                        '<td>'+obj.rownum+'</td>' +
			                        '<td>'+obj.title+'</td>';
			                        if(obj.detailClass == '기안'){
			                        	value += '<td>'+'<span class="badge" id="normalBadge">'+obj.detailClass+'</span>'+'</td>'
			                        } else if(obj.detailClass == '회의'){
			                        	value += '<td>'+'<span class="badge" id="minutesBadge">'+ obj.detailClass+'</span>'+'</td>'
			                        } else if(obj.detailClass == '공문'){
			                        	value += '<td>'+'<span class="badge" id="diplomaBadge">'+obj.detailClass+'</span>'+'</td>'
			                        } else if(obj.detailClass == '인사'){
			                        	value += '<td>'+'<span class="badge" id="hrBadge">'+obj.detailClass+'</span>'+'</td>'
			                        }
			                        value += '<td>'+obj.apNo +'</td>' +
			                        '<td>'+obj.progress+'</td>' +
			                        '<td>'+obj.createDate+'</td>' +
			                        '<td>'+obj.deptName+'</td>' +
			                        '<td>'+obj.writerName+'</td>' +							                       
			                    '</tr>';
			 					} else {
			 						value += '<tr>'+							      
				                       '<td>검색된 결과가 없습니다.</td>'+
				                   '</tr>';
			 					}
			 				});
			 					
			 				console.log("ajax 통신 성공")
			 				console.log(list)
			 				
			 				
		 					$("input[name='doc_type']").prop('checked', false);
		 					$("#conditionInput").val("");
		 					$("#endDate").val("");
		 					$("#startDate").val(""); 
			 					
			 				$("#myApprovalTable>tbody").html(value);
			 				$("#sortOption").text(sdate);
			 			},
			 			error:function(){
			 				console.log("기간별 임시저장 결재 검색 ajax 통신 실패")
			 			}
			 		});
		 		}	 	
	 		)
	 	});
	</script>
	
	<!-- 검색 -->
	<script>
		function searchNormalApproval(){
			
			var optionType = $("#conditionOption").val();
			var optionInput = $("#conditionInput").val();
			var startDate = $("#startDate").val();
			var endDate = $("#endDate").val();
			var detailOption = null
			var apClass = '일반';
			var status = 'Y';
			if($("input[name='doc_type']").checked){
				detailOption = $("input[name='doc_type']:checked").val();
			}		
			
			console.log("type : " + optionType)
			console.log("Input : " + optionInput)
			console.log("endDate : " + endDate)
			console.log("startDate : " + startDate);
			console.log("detailOption : " + detailOption);	
		
					
			if((endDate == "" && startDate != "" )|| (startDate == "" && endDate != "")){				
				alert("검색하고자 하는 날짜를 입력해주세요.");
				$("input[name='doc_type']").prop('checked', false);
			} else if((endDate == "" && startDate == "" && optionInput == "" )){
				alert("검색어 또는 날짜를 입력해주세요.");
				$("input[name='doc_type']").prop('checked', false);
			} else {
				
					$.ajax({
		 				url: "selectSearchSort.ea",
		 				type: "post",
		 				data : {
		 					optionType : optionType,
		 					optionInput : optionInput,
		 					startDate : startDate,
		 					endDate : endDate,
		 					detailOption : detailOption,
		 					apClass : apClass,
		 					status : status
		 					
		 				},
		 				success: function(list){
			 				var value = "";
			 				$.each(list, function(i, obj){			 				
			 					if(list.length != 0){
			 						value += '<tr onclick="detailApproval(' + obj.apNo + ",'" + obj.detailClass + "'" + ');">'+								      
			                        '<td>'+obj.rownum+'</td>' +
			                        '<td>'+obj.title+'</td>';
			                        if(obj.detailClass == '기안'){
			                        	value += '<td>'+'<span class="badge" id="normalBadge">'+obj.detailClass+'</span>'+'</td>'
			                        } else if(obj.detailClass == '회의'){
			                        	value += '<td>'+'<span class="badge" id="minutesBadge">'+ obj.detailClass+'</span>'+'</td>'
			                        } else if(obj.detailClass == '공문'){
			                        	value += '<td>'+'<span class="badge" id="diplomaBadge">'+obj.detailClass+'</span>'+'</td>'
			                        } else if(obj.detailClass == '인사'){
			                        	value += '<td>'+'<span class="badge" id="hrBadge">'+obj.detailClass+'</span>'+'</td>'
			                        }
			                        value += '<td>'+obj.apNo +'</td>' +
			                        '<td>'+obj.progress+'</td>' +
			                        '<td>'+obj.createDate+'</td>' +
			                        '<td>'+obj.deptName+'</td>' +
			                        '<td>'+obj.writerName+'</td>' +							                       
			                    '</tr>';
			 					} else {
			 						value += '<tr>'+							      
				                       '<td>검색된 결과가 없습니다.</td>'+
				                   '</tr>';
			 					}
			 				});
			 					
			 				console.log("ajax 통신 성공")
			 				console.log(list)
			 				
			 				
		 					$("input[name='doc_type']").prop('checked', false);
		 					$("#conditionInput").val("");
		 					$("#endDate").val("");
		 					$("#startDate").val(""); 
			 					
			 				$("#myApprovalTable>tbody").html(value);
			 				$("#sortOption").text(sdate);
			 			},
			 			error:function(){
			 				console.log("기간별 임시저장 결재 검색 ajax 통신 실패")
			 			}
			 		});
			}
		}	
	</script>

	
	<!-- 페이징 클릭시 정렬기준 처리 -->
	<script>
		function previousClick(){
			$("#sortOption").text("검색어 ( "+'${searchEmployee}'+" )");
		}
		function pageClick(){
			$("#sortOption").text("검색어 ( "+'${searchEmployee}'+" )");
		}
		function nextClick(){
			$("#sortOption").text("검색어 ( "+'${searchEmployee}'+" )");
		}
	</script>
	
	
</body>
</html>