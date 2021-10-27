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
	#searchPersonalAddressBookTable>thead{
		border-bottom: 1px solid #DAE1E7;
	}
	#searchPersonalAddressBookTable>thead>tr>th	{
		background-color: #DAE1E7;
		width: 20%;
		text-align: center !important;
	}
	#searchPersonalAddressBookTable>tbody>tr>th	{
		background-color: #DAE1E7;
		width: 10%;
		text-align: center !important;
	}
	#officeAddressBookTable {
		text-align: center !important;
	}
	#employeeTable {
		text-align: center;
	}
	#detailEmployeeTable>tbody>tr>th {
		width: 15%;
	}
	#modalTitleDiv {
		background: #00909E;
		padding: 5px;
	}
	#startDate, #endDate, #conditionOption, #conditionInput{
		width : 25% !important;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">

		<!-- 페이지 헤더 -->
		<section class="content-header">
	      <div class="container-fluid">
	        <div class="row mb-2">
	          <div class="col-sm-6">
	            <h4><i class="fas fa-chart-pie"></i> <b>임시 저장함</b></h4>
	          </div>
	        </div>
	      </div><!-- /.container-fluid -->
	    </section>

		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-12">
				
		            <div class="card card-info card-outline card-outline-tabs">
		              <div class="card-header p-0 border-bottom-0">
		                <ul class="nav nav-tabs" id="custom-tabs-addressBook-tab" role="tablist">
		                  <li class="nav-item">
		                    <a class="nav-link active" id="custom-tabs-normalApproval-tab" data-toggle="pill" href="#custom-tabs-normalApproval" role="tab" aria-controls="custom-tabs-normalApproval" aria-selected="true">일반 결재</a>
		                  </li>
		                  <li class="nav-item">
		                    <a class="nav-link" id="custom-tabs-expenditureApproval-tab" data-toggle="pill" href="#custom-tabs-expenditureApproval" role="tab" aria-controls="custom-tabs-expenditureApproval" aria-selected="false">지출 결재</a>
		                  </li>
		                  <li class="nav-item">
		                    <a class="nav-link" id="custom-tabs-attendance-tab" data-toggle="pill" href="#custom-tabs-attendance" role="tab" aria-controls="custom-tabs-attendance" aria-selected="false">근태/휴가 결재</a>
		                  </li>
		                </ul>
		              </div>
		              
		              <div class="card-body">
						<div class="tab-content" id="custom-tabs-four-tabContent">
						
							<!-- 일반결재 탭 -->
							<div class="tab-pane fade show active" id="custom-tabs-normalApproval-tab" role="tabpanel" aria-labelledby="custom-tabs-normalApproval-tab">
								<div class="card" style="margin-bottom: 0px;">
									<form action="searchApproval.ea">	
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
															<input type="date" class="form-control datetimepicker-input" id="startDate" name="startDate" style="font-size:0.8rem">
															&nbsp; ~ &nbsp;
															<input type="date" class="form-control datetimepicker-input" id="endDate" name="endDate" style="font-size:0.8rem">																														
													</div>													
												</td>
											</tr>
											<tr>
												<th colspan="4">문서검색</th>
												<td colspan="8">
													<div class="row mt-1 mb-1" style="margin-left: 0px;">
														<button id="allSelect" type="button" class="btn btn-default btn-xs" name="selectAll" style='margin-left:3px' onclick="selectAllTemp('일반');">전체보기</button>
														&nbsp;&nbsp;
														<select	id="conditionOption" name="conditionOption" class="form-control" style="font-size:0.8rem">
															<option value="title"> 제목 </option>
															<option value="apNo"> 문서번호 </option>
														</select>
														&nbsp;&nbsp;
														<input type="text" class="form-control" id="conditionInput" name="conditionInput" style="font-size:0.8rem"/>
														&nbsp;&nbsp;
														<button type="button" id="searchApproval" class="btn btn-primary btn-xs">검색</button>
													</div>
												</td>
											</tr>
											<tr>
												<th colspan="4">일반 결재 문서</th>
												<td style="font-size:0.7rem;" colspan="8">
													<div class="row mt-1 mb-1" style="margin-left: 0px;">
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
									
									<!-- 임시저장된 결재 list -->
									<div class="col-12" >
									<div>
									<div style="height: 450px; overflow:auto;">
									<table id="tempApprovalTable" class="table table-sm" >
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
							                    <tr onclick="detailApproval(${approvalList.apNo })">							      
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
		                  
		                  	<!-- 외부 주소록 탭 -->
		                  	<div class="tab-pane fade" id="custom-tabs-personalAddressBook" role="tabpanel" aria-labelledby="custom-tabs-personalAddressBook-tab">

								<div class="card" style="margin-bottom: 0px;">
										
										<table id="searchPersonalAddressBookTable">
										 <thead>
											<tr>
												<th>추가</th>
												<td>
													<form action="#">
														<div class="input-group mt-1 mb-1">
															&nbsp;&nbsp;
													  		<div class="input-group-prepend">
															    <button type="button" class="btn btn-sm btn-default dropdown-toggle" data-toggle="dropdown">
															      	부서 선택
															    </button>
															    <div class="dropdown-menu">
															      <a class="dropdown-item" href="#">Link 1</a>
															      <a class="dropdown-item" href="#">Link 2</a>
															      <a class="dropdown-item" href="#">Link 3</a>
															    </div>
															  </div>
														  <input type="text" class="form-control form-control-sm" placeholder="Username">
														</div>
													</form>
												</td>
											</tr>
											</thead>
										<tbody>
											<tr>
												<th>검색</th>
												<td>
												<form action="searchOfficeAddressBookEmployee.adb">
												<div class="row mt-1 mb-1" style="margin-left: 0px;">
														&nbsp;&nbsp;
														<button id="allPersonSearchBtn" type="button" class="btn btn-default btn-sm" onclick="selectAllPeronalAddressBookEmployee();">전체검색</button>
														&nbsp;&nbsp;
														
															<select id="optionType" name="optionType" class="custom-select custom-select-sm" style="width: 10%;" onchange="deptSelect(this.value);">
																<option value="allType">전체</option>
																<option value="deptType" >부서</option>
																<option value="empNoType">사번</option>
																<option value="empNameType">이름</option>
																<option value="ePhoneType">내선번호</option>
																<option value="emailType">이메일</option>
															</select>
															
															&nbsp;&nbsp;
															<div class="input-group" style="width: 30%;">
																<input type="search" id="searchInput"
																	class="form-control form-control-sm"
																	placeholder="검색어를 입력하세요." name="searchPerson" value="${ search }">
																<div class="input-group-append">
																	<button type="submit" class="btn btn-sm btn-default">
																		<i class="fa fa-search"></i>
																	</button>
																</div>
															</div>
														</div>
													</form>
												</td>
											</tr>
											</tbody>
										</table>
									</div>



		                  	</div>
		                </div>
		              </div>
		              <!-- /.card -->
		              
		              
		              <!-- card-footer -->
					<div class="card-footer">
						<div class="float-right">
							<button id="deleteOfficeAddressBookBtn" type="button" class="btn btn-danger btn-sm" onclick="deleteOfficeAddressBookBtn();">주소록 삭제</button>
						</div>
					</div>
		              
		              
		              
		            </div>
		          </div>
			
			</div>
		</section>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	
	<!-- 전체보기  -->
	 <script>
	 	function selectAllTemp(cOption){
	 	
	 		$.ajax({
	 			url: "selectAllTempApproval.ea",
	 			type: "post",
	 			data :{
	 				cOption : cOption
	 			},
	 			success: function(list){
	 				
	 				var value = "";
	 				
 					$.each(list, function(i, obj){
 						value += '<tr onclick="detailApproval"('+obj.apNo+')>'+							      
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
 					
 					$("#tempApprovalTable>tbody").html(value);
 					$("#sortOption").text("전체");
 				},
 				error:function(){
 					console.log("기간별 임시저장 결재 검색 ajax 통신 실패")
 				}
	 			 			
	 		});
	 	}	 
	 </script>
	
	<!-- 날짜 검색 -->
	<script>
	 	$(function(){
	 		$("#normalApprovalSearchTable>tbody>tr:eq(0)>td>div>button").click(
		 		function(){
			 		
		 			var sdate = $(this).val();
		 			console.log(sdate)
			 			
			 			//resetSearch();
			 			
			 			$.ajax({
			 				url: "selectDateSortTemp.ea",
			 				type: "post",
			 				data : {
			 					sdate:sdate
			 				},
			 				success: function(list){
			 					var value = "";
			 					$.each(list, function(i, obj){
			 						value += '<tr onclick="detailApproval"('+obj.apNo+')>'+							      
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
			 					
			 					$("#tempApprovalTable>tbody").html(value);
			 					$("#sortOption").text(sdate);
			 				},
			 				error:function(){
			 					console.log("기간별 임시저장 결재 검색 ajax 통신 실패")
			 				}
			 			});
		 			}	 	
	 		)
	 	});
	 	
	 	$(function(){
	 		var start;
	 		var end;
	 		
	 		$("#startDate").datepicker({
	 			onSelect: function(dateText,inst) {
	 				start = $("#startDate").val();
	 				console.log(start)
	 			}
	 		})
	 		
	 		$("#endDate").datepicker({	 		
	 			onSelect: function(dateText, inst) {
	 				end = $("#endDate").val();
	 				console.log(end)
	 			}
	 		})
	 		
	 		if(start != null && end != null){
	 			
	 			$.ajax({
	 				url: "selectDateBoundSortTemp.ea",
	 				type: "post",
	 				data : {
	 					start:start,
	 					end:end
	 				},
	 				success: function(list){
	 					var value = "";
	 					$.each(list, function(i, obj){
	 						value += '<tr onclick="detailApproval"('+obj.apNo+')>'+							      
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
	 					
	 					$("#tempApprovalTable>tbody").html(value);
	 					$("#sortOption").text(sdate);
	 				},
	 				error:function(){
	 					console.log("기간별 임시저장 결재 검색 ajax 통신 실패")
	 				}
	 			});
	 		}
	 	});
	</script>
	
	
	
	
	<!-- 검색 -->
	<script>
		$(function() {
			switch ('${ optionType }') {
			case "allType":
				$("#optionType>option").eq(0).attr("selected", true);
				$("#searchInput").val("${ searchEmployee }");
				$("#sortOption").text("검색어 ( "+'${searchEmployee}'+" )");
				break;
			case "deptType":
				$("#deptTypeBlank").show();
				$("#deptTypeOption").show();
				$("#optionType>option").eq(1).attr("selected", true);
				
				switch ('${ deptTypeOption }') {
					case "A" :
						$("#deptTypeOption>option").eq(0).attr("selected", true);
						break;
					case "A1" :
						$("#deptTypeOption>option").eq(1).attr("selected", true);
						break;
					case "A2" :
						$("#deptTypeOption>option").eq(2).attr("selected", true);
						break;
					case "A3" :
						$("#deptTypeOption>option").eq(3).attr("selected", true);
						break;
					case "B" :
						$("#deptTypeOption>option").eq(4).attr("selected", true);
						break;
					case "B1" :
						$("#deptTypeOption>option").eq(5).attr("selected", true);
						break;
					case "B2" :
						$("#deptTypeOption>option").eq(6).attr("selected", true);
						break;
					case "C" :
						$("#deptTypeOption>option").eq(7).attr("selected", true);
						break;
					case "C1" :
						$("#deptTypeOption>option").eq(8).attr("selected", true);
						break;
					case "C2" :
						$("#deptTypeOption>option").eq(9).attr("selected", true);
						break;
					case "C3" :
						$("#deptTypeOption>option").eq(10).attr("selected", true);
						break;
				}
				$("#searchInput").val("${ searchEmployee }");
				$("#sortOption").text("검색어 ( "+'${searchEmployee}'+" )");
				break;
			case "empNoType":
				$("#optionType>option").eq(2).attr("selected", true);
				$("#searchInput").val("${ searchEmployee }");
				$("#sortOption").text("검색어 ( "+'${searchEmployee}'+" )");
				break;
			case "empNameType":
				$("#optionType>option").eq(3).attr("selected", true);
				$("#searchInput").val("${ searchEmployee }");
				$("#sortOption").text("검색어 ( "+'${searchEmployee}'+" )");
				break;
			case "ePhoneType":
				$("#optionType>option").eq(4).attr("selected", true);
				$("#searchInput").val("${ searchEmployee }");
				$("#sortOption").text("검색어 ( "+'${searchEmployee}'+" )");
				break;
			case "emailType":
				$("#optionType>option").eq(5).attr("selected", true);
				$("#searchInput").val("${ searchEmployee }");
				$("#sortOption").text("검색어 ( "+'${searchEmployee}'+" )");
				break;
			}
			
		})
	</script>
	
	<!-- select option 부서 선택시 -->
	<script>
		function deptSelect(selectOption){
			$("#searchInput").val("");
			
			switch (selectOption) {
			case "allType":
				$("#deptTypeBlank").hide();
				$("#deptTypeOption").hide();
				$("#searchInput").attr("placeholder","검색어를 입력하세요.");
				break;
			case "deptType":
				$("#deptTypeBlank").show();
				$("#deptTypeOption").show();
				$("#searchInput").attr("placeholder","이름을 입력하세요.");
				break;
			case "empNoType":
				$("#deptTypeBlank").hide();
				$("#deptTypeOption").hide();
				$("#searchInput").attr("placeholder","사번을 입력하세요.");
				break;
			case "empNameType":
				$("#deptTypeBlank").hide();
				$("#deptTypeOption").hide();
				$("#searchInput").attr("placeholder","이름을 입력하세요.");
				break;
			case "ePhoneType":
				$("#deptTypeBlank").hide();
				$("#deptTypeOption").hide();
				$("#searchInput").attr("placeholder","내선번호를 입력하세요.");
				break;
			case "emailType":
				$("#deptTypeBlank").hide();
				$("#deptTypeOption").hide();
				$("#searchInput").attr("placeholder","이메일을 입력하세요.");
				break;
			}
		}
	</script>
	
	<!-- 검색창 reset -->
	<script>
		function resetSearch(){
			$("#optionType>option").eq(0).attr("selected", true);
			$("#deptTypeBlank").hide();
			$("#deptTypeOption").hide();
			$("#searchInput").val("");
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