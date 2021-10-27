<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록</title>
	<!-- Google Font: Source Sans Pro -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="./resources/plugins/fontawesome-free/css/all.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="./resources/dist/css/adminlte.min.css">
	<!-- overlayScrollbars -->
	<link rel="stylesheet" href="./resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
	<script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>
	<!-- 스크립트 모음 -->
	<!-- jQuery -->
	<script src="./resources/plugins/jquery/jquery.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="./resources/plugins/jquery-ui/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
	  $.widget.bridge('uibutton', $.ui.button)
	</script>
	<!-- Bootstrap 4 -->
	<script src="./resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- overlayScrollbars -->
	<script src="./resources/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	<!-- AdminLTE App -->
	<script src="./resources/dist/js/adminlte.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="./resources/dist/js/demo.js"></script>
<style>
	.content-wrapper {
		overflow: auto;
	}
	#searchOfficeAddressBookTable>thead{
		border-bottom: 1px solid #DAE1E7;
	}
	#searchOfficeAddressBookTable>thead>tr>th	{
		background-color: #DAE1E7;
		width: 10%;
		text-align: center !important;
	}
	#searchOfficeAddressBookTable>tbody>tr>th	{
		background-color: #DAE1E7;
		width: 10%;
		text-align: center !important;
	}
	#searchPersonalAddressBookTable>thead{
		border-bottom: 1px solid #DAE1E7;
	}
	#searchPersonalAddressBookTable>thead>tr>th	{
		background-color: #DAE1E7;
		width: 10%;
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
</style>
</head>
<body>
	<!-- Content Wrapper. Contains page content -->
	<div class="content ml-3 mr-3 mt-3">

		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-12">
				
		            <div class="card card-outline card-info">

						<div class="card-header text-center">
							<h6 style="margin-bottom: 0px">
								<b>주소록</b>
							</h6>
						</div>
		              
		             
		              <div class="card-body">
		               <div class="row">
						<div class="col-8">
							<div class="card mb-0">
							<div class="card-body">
							<!-- 사내 주소록 탭 -->
								<div class="card" style="margin-bottom: 0px;">
										
										<table id="searchOfficeAddressBookTable">
										<tbody>
											<tr>
												<th>검색</th>
												<td>
												<form action="popUpSearchOfficeAddressBookEmployee.adb">
												<div class="row mt-1 mb-1" style="margin-left: 0px;">
														&nbsp;&nbsp;
														<a id="allEmployeeSearchBtn" type="button" class="btn btn-default btn-sm" href="officeAddressBook.adb">전체검색</a>
														&nbsp;&nbsp;
														
															<select id="optionType" name="optionType" class="custom-select custom-select-sm" style="width: 15%;" onchange="deptSelect(this.value);">
																<option value="allType">전체</option>
																<option value="deptType" >부서</option>
																<option value="empNoType">사번</option>
																<option value="empNameType">이름</option>
															</select>
															<span id="deptTypeBlank"style="display:none">&nbsp;&nbsp;</span>
															<select id="deptTypeOption" name="deptTypeOption" class="custom-select custom-select-sm" style="width: 20%; display:none">
																<option value="A">경영지원본부</option>
																<option value="A1">인사팀</option>
																<option value="A2">총무팀</option>
																<option value="A3">재무회계팀</option>
																<option value="B">영업지원본부</option>
																<option value="B1">영업팀</option>
																<option value="B2">운영지원팀</option>
																<option value="C">사업본부</option>
																<option value="C1">디자인팀</option>
																<option value="C2">마케팅팀</option>
																<option value="C3">IT개발팀</option>
															</select>
															&nbsp;&nbsp;
															<div class="input-group" style="width: 40%;">
																<input type="search" id="searchInput"
																	class="form-control form-control-sm"
																	placeholder="검색어를 입력하세요." name="searchEmployee" value="${ search }">
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
									
									<hr>
									
									<!-- 주소록 리스트 -->
									<div class="col-12" >
									<div>
										<div style="height: 278px; overflow:auto;">
										<table id="officeAddressBookTable" class="table table-sm" >
										<caption style="caption-side:top">* 정렬 기준 : <span id="sortOption">전체</span></caption>
											<thead>
												<tr>
													<th style="width: 5%"><input type='checkbox' name='checkAll' id='checkAll' onclick="checkAll();"></th>
													<th style="width: 20%">사번</th>
													<th style="width: 20%">이름</th>
													<th style="width: 20%">직급</th>
													<th style="width: 25%">부서</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${ officeAddresslist }" var="officeAddresslist" varStatus="status">
								                    <tr>
								                    	<th>
								                    		<input type='checkbox' name='receiveList' id='receiveList' value="${ officeAddresslist.oabEnrollNo }">
								                    	</th>
								                        <td>${ officeAddresslist.oabEnrollNo }</td>
								                        <td>${ officeAddresslist.empName}</td>
								                        <td>${ officeAddresslist.jobName }</td>
								                        <td>${ officeAddresslist.deptDname }</td>
								                    </tr>
							                    </c:forEach>
											</tbody>
										</table>
										</div>
									</div>
									
									
									<div id="pagingArea">
						                <ul class="pagination mb-0">
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
		                  	
		                  	<div class="col-1">
		                  		<div class="row" style="height: 50%">
		                  			<div class="col-12 align-self-center text-center">
		                  				<button type="button" class="btn btn-primary btn-xs" onclick="addReceiveList();">추가</button>
		                  				<br>
		                  				<button type="button" class="btn btn-danger btn-xs" onclick="delReceiveList();">삭제</button>
		                  			</div>
		                  		</div>
		                  		<div class="row" style="height: 50%">
		                  			<div class="col-12 align-self-center text-center">
		                  				<button type="button" class="btn btn-primary btn-xs">추가</button>
		                  				<br>
			                  			<button type="button" class="btn btn-danger btn-xs">삭제</button>
		                  			</div>
		                  		</div>
		                  	</div>
		                  	
		                  	<div class="col-3">
		                  		<div class="row" style="height: 50%">
		                  			<div class="col-12 mb-2 card">
			                  			<div class="card-header text-center">
			                  				<b>수신 직원</b>
			                  			</div>
			                  			<div class="card-body pr-1 pl-1 pt-2 pb-2" >
			                  				<div style="overflow:auto; height: 140px">
			                  				<table id="receiveTable" class="table table-bordered table-sm mb-0 text-center">
			                  					<!-- 
			                  					<tr>
			                  						<th style="width: 15%"><input type="checkbox"></th>
			                  						<td>1</td>
			                  					</tr>
			                  					<tr>
			                  						<td><input type="checkbox"></td>
			                  						<td>2</td>
			                  					</tr>
			                  					<tr>
			                  						<td><input type="checkbox"></td>
			                  						<td>3</td>
			                  					</tr>
			                  					<tr>
			                  						<td><input type="checkbox"></td>
			                  						<td>4</td>
			                  					</tr>
			                  					<tr>
			                  						<td><input type="checkbox"></td>
			                  						<td>5</td>
			                  					</tr>
			                  					 -->
			                  					 <tbody>
			                  					 
			                  					 </tbody>
			                  				</table>
			                  				</div>
			                  			</div>
		                  			</div>
		                  		</div>

		                  		<div class="row" style="height: 50%">
		                  			<div class="col-12 mt-2 mb-0 card">
			                  			<div class="card-header text-center">
			                  				<b>참조 직원</b>
			                  			</div>
			                  				<div class="card-body pr-1 pl-1 pt-2 pb-2" >
				                  				<div style="overflow:auto; height: 140px">
				                  				<table class="table table-bordered table-sm mb-0 text-center">
				                  				</table>
				                  			</div>
			                  			</div>
		                  			</div>
		                  		</div>
		                  	</div>
		                  </div>
		             </div>   
		             
		              <!-- /.card -->
		              
		              
		              <!-- card-footer -->
					<div class="card-footer">
						<!--  
						<div class="float-right">
							<button id="deleteOfficeAddressBookBtn" type="button" class="btn btn-danger btn-sm">선택</button>
						</div>
						-->
					</div>
				 </div>
				 </div>
			</div>
		</section>
	</div>
	
	<!-- 겁색 -->
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
			}
		}
	</script>
	 
	<!-- 전체 제크 -->
	<script>
		function checkAll(){
			if($("input[name='checkAll']").prop("checked")){
				$("input[name='receiveList']").prop("checked", true)
			}else{
				$("input[name='receiveList']").prop("checked", false)
			}
		}
	</script>
	
	<!-- checkBox 수신직원 -->
	<!-- 이렇게 하면 페이징 버튼 누르면 값이 사라짐... ajax 통신 필요....ㅎ -->
	<script>
		function addReceiveList(){
			let addReceiveList = [];
			
			$("input[name='receiveList']:checked").each(function(){
				let checkEmpNo = $(this).val();
				addReceiveList.push(checkEmpNo);
			});

			let value="";
			//alert(addReceiveList.length);
			for(var i=0; i< addReceiveList.length;i++){
				value +="<tr>"+
						"<td><input type='checkbox'></td>"+
						"<td>"+addReceiveList[i]+"</td>"+
						"</tr>";
			}
			//alert(value);
			$("#receiveTable>tbody").html(value);			
		}
	</script>

</body>
</html>