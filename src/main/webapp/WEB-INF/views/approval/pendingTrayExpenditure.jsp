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
	#expenditureApprovalSearchTable>thead{
		border-bottom: 1px solid #DAE1E7;
	}
	#expenditureApprovalSearchTable>thead>tr>th	{
		background-color: #DAE1E7;
		border-bottom: 1px solid #DAE1E7;
		width: 20%;
		text-align: center !important;
	}
	#expenditureApprovalSearchTable>tbody>tr>th	{
		background-color: #DAE1E7;
		border-bottom: 1px solid #DAE1E7;
		width: 20%;
		text-align: center !important;
	}
	#startDate2, #endDate2, #conditionOption2, #conditionInput2{
		width : 25% !important;
	}
</style>
</head>
<body>
	
		<!-- Main content -->
		
				<div class="card-body">
						<div class="tab-content" id="custom-tabs-tempororyApproval-tab">			
						
							<!-- 지출결재 탭 -->
							<div class="tab-pane fade show active" id="custom-tabs-expenditureApproval-tab" role="tabpanel" aria-labelledby="custom-tabs-expenditureApproval-tab">	
								<div class="card" style="margin-bottom: 0px;">
									<form action="searchApproval.ea">	
									<input type="hidden" name='status' value='Y'/>
										<table id="expenditureApprovalSearchTable">
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
															<input type="date" class="form-control datetimepicker-input datepicker" id="startDate2" name="startDate" style="font-size:0.8rem">
															&nbsp; ~ &nbsp;
															<input type="date" class="form-control datetimepicker-input datepicker" id="endDate2" name="endDate" style="font-size:0.8rem">																														
													</div>													
												</td>
											</tr>
											<tr>
												<th colspan="4">문서검색</th>
												<td colspan="8">
													<div class="row mt-1 mb-1" style="margin-left: 0px;">
														<button id="allSelect" type="button" class="btn btn-default btn-xs" name="selectAll" style='margin-left:3px' onclick="selectAllExTemp('지출');">전체보기</button>
														&nbsp;&nbsp;
														<select	id="conditionOption2" name="conditionOption" class="form-control" style="font-size:0.8rem">
															<option value="제목"> 제목 </option>
															<option value="문서번호"> 문서번호 </option>
														</select>
														&nbsp;&nbsp;
														<input type="text" class="form-control" id="conditionInput2" name="conditionInput" style="font-size:0.8rem"/>
														&nbsp;&nbsp;
														<button type="button" id="searchBtn" class="btn btn-primary btn-xs" onclick="searchExApproval();">검색</button>
													</div>
												</td>
											</tr>				
											</tbody>
										</table>
										</form>
									</div>
									
									<hr>
									
									<!-- 미결재함 결재 list -->
									<div class="col-12" >
									<div>
									<div style="height: 450px; overflow:auto;">
									<table id="pendingApprovalTable" class="table table-sm" >
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
							                        <td>${ approvalList.detailClass }</td>
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
									
		          
	
	<!-- 전체보기  -->
	 <script>
	 	function selectAllExTemp(cOption){
	 	
	 		resetSearch();
	 		
	 		$.ajax({
	 			url: "selectAllPending.ea",
	 			type: "post",
	 			data :{
	 				cOption : cOption
	 			},
	 			success: function(list){
	 				
	 				var value = "";
	 				
 					$.each(list, function(i, obj){
 						value += '<tr onclick="detailApproval(' + obj.apNo + ",'" + obj.detailClass + "'" + ');">'+								      
                        '<td>'+obj.rownum+'</td>' +
                        '<td>'+obj.title+'</td>' +
                        '<td>'+obj.detailClass+'</td>' +
                        '<td>'+obj.apNo +'</td>' +
                        '<td>'+obj.progress+'</td>' +
                        '<td>'+obj.createDate+'</td>' +
                        '<td>'+obj.deptName+'</td>' +
                        '<td>'+obj.writerName+'</td>' +							                       
                    '</tr>';
 					});
 					
 					console.log("ajax 통신 성공")
 					console.log(list)
 					
 					$("#pendingApprovalTable>tbody").html(value);
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
	 		$("#expenditureApprovalSearchTable>tbody>tr:eq(0)>td>div>button").click(
	 				
		 		function(){		 		
		 			var sdate = $(this).val();
		 			var apClass = '지출'
		 			console.log(sdate)
			 			
			 		$.ajax({
			 			url: "selectDateSortPending.ea",
			 			type: "post",
			 			data : {
			 				sdate:sdate,
			 				apClass : apClass
			 			},
			 			success: function(list){
			 				var value = "";
			 				$.each(list, function(i, obj){			 				
			 					if(list.length != 0){
				 					value += '<tr onclick="detailApproval(' + obj.apNo + ",'" + obj.detailClass + "'" + ');">'+							      
				                       '<td>'+obj.rownum+'</td>' +
				                       '<td>'+obj.title+'</td>' +
				                       '<td>'+obj.detailClass+'</td>' +
				                       '<td>'+obj.apNo +'</td>' +
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
			 				
			 				$("#conditionInput").val("");
		 					$("#endDate").val("");
		 					$("#startDate").val(""); 
			 					
			 				$("#pendingApprovalTable>tbody").html(value);
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
		function searchExApproval(){
			
			var optionType = $("#conditionOption").val();
			var optionInput = $("#conditionInput").val();
			var startDate = $("#startDate").val();
			var endDate = $("#endDate").val();
			var apClass = '지출'
						
			console.log("type : " + optionType)
			console.log("Input : " + optionInput)
			console.log("endDate : " + endDate)
			console.log("startDate : " + startDate);

		
					
			if((endDate == "" && startDate != "" )|| (startDate == "" && endDate != "")){				
				alert("검색하고자 하는 날짜를 입력해주세요.");
				
			} else if((endDate == "" && startDate == "" && optionInput == "" )){
				alert("검색어 또는 날짜를 입력해주세요.");
				
			} else {
				
					$.ajax({
		 				url: "selectSearchSortPending.ea",
		 				type: "post",
		 				data : {
		 					optionType : optionType,
		 					optionInput : optionInput,
		 					startDate : startDate,
		 					endDate : endDate,
		 					apClass : apClass
		 					
		 				},
		 				success: function(list){
			 				var value = "";
			 				$.each(list, function(i, obj){			 				
			 					if(list.length != 0){
			 						value += '<tr onclick="detailApproval(' + obj.apNo + ",'" + obj.detailClass + "'" + ');">'+								      
				                       '<td>'+obj.rownum+'</td>' +
				                       '<td>'+obj.title+'</td>' +
				                       '<td>'+obj.detailClass+'</td>' +
				                       '<td>'+obj.apNo +'</td>' +
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
			 							 	
		 					$("#conditionInput").val("");
		 					$("#endDate").val("");
		 					$("#startDate").val(""); 
			 					
			 				$("#pendingApprovalTable>tbody").html(value);
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