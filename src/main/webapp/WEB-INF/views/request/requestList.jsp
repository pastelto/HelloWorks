<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신청 내역</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.content-wrapper {
	overflow: auto; 
}
</style>
</head>
<body>
	<div class="card card-outline card-info ">
		<div class="card-header p-0 border-bottom-0">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card-header">
							<h3 class="card-title">신청 내역</h3>
							<c:if test="${ loginUser.deptCode eq 'A2'}">
							<div class="float-right">
								<button class="btn btn-primary" id="confirmListBtn">	
									승인완료
								</button>
								<button class="btn btn-warning" id="cancelListBtn">	
									승인취소
								</button>
								<button class="btn btn-danger" id="deleteListBtn">	
									삭제
								</button>
							</div>
							</c:if>
						</div>
					</div>
				</div>
				<div class="col-2">
					<div class="form-group">
						<select class="custom-select form-control-border"
							id="exampleSelectBorder" name="selectedList">
							<option >선택하세요</option>
							<option value="m">회의실 신청 목록</option>
							<option value="e">비품 신청 목록</option>
							<option value="i">사원증 신청 목록</option>
						</select>
					</div>
				</div>
				<!-- /.card-header -->
				<div class="card-body">
						<!-- 회의실 신청 목록 -->
						<table id="mtrListTable" class="table table-bordered table-striped">
							<thead>
								<tr align="center">
									<th width="10%">신청번호</th>
									<th width="30%">회의실신청인(사번)</th>
									<th width="10%">부서</th>
									<th width="10%">직급</th>
									<th width="20%">접수일시</th>
									<th width="10%">회의실명</th>
									<th width="10%">용도</th>
								</tr>
							</thead>
							<tbody>
								<!-- 회의실 신청 목록 띄우기 -->								
							</tbody>
						</table>
						<!-- 비품 신청 목록 -->
						<table id="eqListTable" class="table table-bordered table-striped">
							<thead>
								<tr align="center">
									<th width="10%">신청번호</th>
									<th width="30%">비품신청인(사번)</th>
									<th width="10%">부서</th>
									<th width="10%">직급</th>
									<th width="25%">접수일</th>
									<th width="10%">처리상태</th>
									<th width="5%"><input type='checkbox' name='updateEqAll'
										value='selectEqall'></th>
								</tr>
							</thead>
							<tbody>
								<!-- 비품 신청 목록 띄우기 -->								
							</tbody>
						</table>
						<!-- 사원증 신청 목록 -->
						<table id="idListTable" class="table table-bordered table-striped">
							<thead>
								<tr align="center">
									<th width="10%">신청번호</th>
									<th width="30%">사원증신청인(사번)</th>
									<th width="10%">부서</th>
									<th width="10%">직급</th>
									<th width="25%">접수일</th>
									<th width="10%">처리상태</th>
									<th width="5%"><input type='checkbox' name='updateIdAll' value='selectIdall'></th>
								</tr>
							</thead>
							<tbody>
								<!-- 사원증 신청 목록 띄우기 -->
							</tbody>
						</table>
					</div>
				<!--./card-body-->
			</div>
		</div>
	</div>
	<script>

		//tr -> 테이블 상세조회
/* 		$(function(){
    		$("#eqListTable>tbody>tr").click(function(){
    			console.log("hi");
    			location.href="detail.eq?requestEqNo=" + $(this).children().eq(0).text();
    		});
    	}); */
		
    	//비품 체크박스 모두 선택
		$("input[name='updateEqAll']").click(function() {

			if (($("input[name='updateEqAll']")).prop("checked")) {
				$("input[name='updateEqOne']").prop("checked", true);
			} else {
				$("input[name='updateEqOne']").prop("checked", false);
			}
		});
		
		//사원증 체크박스 모두 선택
		$("input[name='updateIdAll']").click(function() {

			if (($("input[name='updateIdAll']")).prop("checked")) {
				$("input[name='updateIdOne']").prop("checked", true);
			} else {
				$("input[name='updateIdOne']").prop("checked", false);
			}
		});
		
		// 비품 신청 삭제
		$("#deleteListBtn").click(function (){
			var checkArr = [];
			$("input[name='updateEqOne']:checked").each(function(){
				var ckvalue = $(this).val();
				console.log(ckvalue);
				checkArr.push(ckvalue);
			});
			console.log(checkArr);
			$.ajax({
				  url : "deleteList.eq",
				  type : "post",
				  data : {
					  checkArr : checkArr
				  },
				  success : function(result){
				    if(result == "??!") {
						alert("비품신청 삭제성공!");
						//location.reload(true);
						location.href = "request.menu"; //페이지 새로고침
						//history.go(0);
				    }
				  }
				});
		});	
		
		// 사원증 신청 삭제
		$("#deleteListBtn").click(function (){
			var checkArr = [];
			$("input[name='updateIdOne']:checked").each(function(){
				var ckvalue = $(this).val();
				console.log(ckvalue);
				checkArr.push(ckvalue);
			});
			console.log(checkArr);
			$.ajax({
				  url : "deleteList.id",
				  type : "post",
				  data : {
					  checkArr : checkArr
				  },
				  success : function(result){
				    if(result == "??!") {
						alert("사원증신청 삭제성공!");
						//location.reload(true);//페이지 새로고침
						location.href = "request.menu";
						//history.go(0);
				    }
				  }
				});
		});
		
		// 비품- 선택한 항목:  제출 -> 승인완료  바꾸기
		$("#confirmListBtn").click(function (){
			var checkArr = [];
			$("input[name='updateEqOne']:checked").each(function(){
				var ckvalue = $(this).val();
				console.log(ckvalue);
				checkArr.push(ckvalue);
			});
			console.log(checkArr);
			$.ajax({
				  url : "confirm.eq",
				  type : "post",
				  data : {
					  checkArr : checkArr
				  },
				  success : function(result){
				    if(result == "??!") {
						alert("비품 승인완료!");
						location.reload(true);//페이지 새로고침
						//location.href = location.href;
						//history.go(0);
				    }
				  }
				});
		});
		// 비품- 선택한 항목:  제출 -> 승인취소  바꾸기
		$("#cancelListBtn").click(function (){
			var checkArr = [];
			$("input[name='updateEqOne']:checked").each(function(){
				var ckvalue = $(this).val();
				console.log(ckvalue);
				checkArr.push(ckvalue);
			});
			console.log(checkArr);
			$.ajax({
				  url : "cancel.eq",
				  type : "post",
				  data : {
					  checkArr : checkArr
				  },
				  success : function(result){
				    if(result == "??!") {
						alert("비품 승인취소!");
						location.reload(true);//페이지 새로고침
						//location.href = location.href;
						//history.go(0);
				    }  
				  }
				});
		});
		
		// 사원증- 선택한 항목:  제출 -> 승인완료  바꾸기
		$("#confirmListBtn").click(function (){
			var checkArr = [];
			$("input[name='updateIdOne']:checked").each(function(){
				var ckvalue = $(this).val();
				console.log(ckvalue);
				checkArr.push(ckvalue);
			});
			console.log(checkArr);
			$.ajax({
				  url : "confirm.id",
				  type : "post",
				  data : {
					  checkArr : checkArr
				  },
				  success : function(result){
				    if(result == "??!") {
						alert("사원증 승인완료!");
						location.reload(true);//페이지 새로고침
						//location.href = location.href;
						//history.go(0);
				    } 
				  }
				});
		});
		// 사원증- 선택한 항목:  제출 -> 승인취소  바꾸기
		$("#cancelListBtn").click(function (){
			var checkArr = [];
			$("input[name='updateIdOne']:checked").each(function(){
				var ckvalue = $(this).val();
				console.log(ckvalue);
				checkArr.push(ckvalue);
			});
			console.log(checkArr);
			$.ajax({
				  url : "cancel.id",
				  type : "post",
				  data : {
					  checkArr : checkArr
				  },
				  success : function(result){
				    if(result == "??!") {
						alert("사원증 승인취소!");
						location.reload(true);//페이지 새로고침
						//location.href = location.href;
						//history.go(0);
				    } 
				  }
				});
		});
				
		//컨트롤러에서 신청목록 가져오기
		$(function() {
			
			// 테이블 모두 숨기기
			$("#eqListTable").attr("style", "display:none");
			$("#idListTable").attr("style", "display:none");
			$("#mtrListTable").attr("style", "display:none");
		
			// 선택한 테이블만 보이게
			$("select[name=selectedList]").change(function() {
				//alert($(this).val());
				console.log($("select[name=selectedList] option:selected").text()); //text값 가져오기  
			
			// 비품신청목록 선택시
			if (($(this).val()) == "e") {
				// 비품신청목록만 보이게하고
				$("#eqListTable").css("display", '');
				$("#idListTable").attr("style", "display:none");
				$("#mtrListTable").attr("style", "display:none");
			
			// 컨트롤러에서 비품신청목록 가져오기
			$.ajax({
				url:"list.eq",
				dataType: "json",
				success:function(list){					
					var value="";
					$.each(list, function(i, obj){
						
						if(obj.empNo == ${loginUser.empNo }|| '${loginUser.deptDname }' == '총무팀'){
							value +="<tr align='center'>" + 
									"<td onclick='detailEq("+ obj.requestEqNo+")'>"+ obj.requestEqNo +"</td>" +
									"<td onclick='detailEq("+ obj.requestEqNo+")'>"+ obj.empName + "(" +  obj.empNo+ ")" +"</td>" + 
									"<td onclick='detailEq("+ obj.requestEqNo+")'>"+ obj.deptDname +"</td>" + 
									"<td onclick='detailEq("+ obj.requestEqNo+")'>"+ obj.jobName +"</td>" + 
									"<td onclick='detailEq("+ obj.requestEqNo+")'>"+ obj.requestDate +"</td>" + 
									"<td onclick='detailEq("+ obj.requestEqNo+")'>"+ obj.erCondition +"</td>" + 
									"<th>"+"<input type='checkbox' name='updateEqOne' value=" + obj.requestEqNo + ">"+"</th>"
								+ "</tr>"; 
				
						}
					});
					$("#eqListTable tbody").html(value);
 					/* $(function(){
			    		$("#eqListTable>tbody>tr").click(function(){
			    			console.log($(this).text());
			    			//location.href="detail.eq?requestEqNo=" + $(this).children().eq(0).text();
			    		}); 
			    	}); */
			    	
				},error:function(){
					console.log("비품리스트 ajax 통신 실패");
				}
			});
			// 사원증신청목록 선택시
			}else if (($(this).val()) == "i") {
					// 사원증 신청목록만 보이게 하고
					$("#idListTable").css("display", '');
					$("#eqListTable").attr("style", "display:none");
					$("#mtrListTable").attr("style", "display:none");
					
					// 컨트롤러에서 사원증신청목록 가져오기
					$.ajax({
						url:"list.id",
						success:function(list){					
							var value="";
							$.each(list, function(i, obj){
								
								if(obj.empNo == ${loginUser.empNo} || '${loginUser.deptDname }' == '총무팀'){
								value += "<tr align='center'>" + 
											"<td onclick='detailId("+ obj.requestIdNo+")'>" +  obj.requestIdNo + "</td>" + 
											"<td onclick='detailId("+ obj.requestIdNo+")'>" +  obj.empKName + "(" +  obj.empNo+ ")" + "</td>" + 
											"<td onclick='detailId("+ obj.requestIdNo+")'>" +  obj.deptDname + "</td>" + 
											"<td onclick='detailId("+ obj.requestIdNo+")'>" +  obj.jobName + "</td>" + 
											"<td onclick='detailId("+ obj.requestIdNo+")'>" +  obj.requestDate + "</td>" +  
											"<td onclick='detailId("+ obj.requestIdNo+")'>" +  obj.irCondition + "</td>" + 
											"<th>"+"<input type='checkbox' name='updateIdOne' value=" + obj.requestIdNo + ">"+"</th>"
							        + "</tr>";
								}
							});
							$("#idListTable tbody").html(value);
						},error:function(){
							console.log("사원증리스트 ajax 통신 실패");
						}
				});
			}else if (($(this).val()) == "m") {
				// 회의실 신청목록만 보이게 하고
				$("#mtrListTable").css("display", '');
				$("#eqListTable").attr("style", "display:none");
				$("#idListTable").attr("style", "display:none");
				
				// 컨트롤러에서 회의실신청리스트 가져오기
				$.ajax({
					url:"rlist.mtr",
					success:function(list){					
						var value="";
						$.each(list, function(i, obj){
							
							if(obj.empNo == ${loginUser.empNo} || '${loginUser.deptDname }' == '총무팀'){
							value += "<tr align='center'>" + 
										"<td>" +  obj.mRNo + "</td>" + 
										"<td>" +  obj.empName + "(" +  obj.rEmpNo+ ")" + "</td>" + 
										"<td>" +  obj.deptDname + "</td>" + 
										"<td>" +  obj.jobName + "</td>" + 
										"<td>" +  obj.mRDate +"/ " + obj.mRTime +"시" + "</td>" +  
										"<td>" +  obj.mMName + "</td>" + 
										"<td>" +  obj.mRUsg +"</td>"
						        + "</tr>";
							}
						});
						$("#mtrListTable tbody").html(value);
					},error:function(){
						console.log("회의실 신청리스트 ajax 통신 실패");
					}
			});
		}
		});
	})
	function detailEq(requestEqNo){
    		location.href="detail.eq?requestEqNo=" + requestEqNo;
    }
	function detailId(requestIdNo){
    		location.href="detail.id?requestIdNo=" + requestIdNo;
    }
	</script>
</body>
</html>