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
								<button class="btn btn-default" id="confirmBtn">	
									<i class="far fa-trash-alt">승인완료</i> 
								</button>
								<button class="btn btn-default" id="cancelBtn">	
									<i class="far fa-trash-alt">승인취소</i> 
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
							<option value="e">비품 신청 목록</option>
							<option value="i">사원증 신청 목록</option>
						</select>
					</div>
				</div>
				<!-- /.card-header -->
				<div class="card-body">
					<!-- 비품 신청 목록 -->
						<table id="eqListTable" class="table table-bordered table-striped">
							<thead>
								<tr align="center">
									<th>비품신청번호</th>
									<th>비품신청인(사번)</th>
									<th>부서</th>
									<th>직급</th>
									<th>접수일</th>
									<th>처리상태</th>
									<th><input type='checkbox' name='updateEqAll'
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
									<th>사원증신청번호</th>
									<th>사원증신청인(사번)</th>
									<th>부서</th>
									<th>직급</th>
									<th>접수일</th>
									<th>처리상태</th>
									<th><input type='checkbox' name='updateIdAll' value='selectIdall'></th>
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
		
		// 비품- 선택한 항목:  제출 -> 승인완료  바꾸기
		$("#confirmBtn").click(function (){
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
		$("#cancelBtn").click(function (){
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
		$("#confirmBtn").click(function (){
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
		$("#cancelBtn").click(function (){
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
		
			// 선택한 테이블만 보이게
			$("select[name=selectedList]").change(function() {
				//alert($(this).val());
				console.log($("select[name=selectedList] option:selected").text()); //text값 가져오기  
			
			// 비품신청목록 선택시
			if (($(this).val()) == "e") {
				// 비품신청목록만 보이게하고
				$("#eqListTable").css("display", '');
				$("#idListTable").attr("style", "display:none");
			
			// 컨트롤러에서 비품신청목록 가져오기
			$.ajax({
				url:"list.eq",
				dataType: "json",
				success:function(list){					
					var value="";
					$.each(list, function(i, obj){
						
						if(obj.empNo == ${loginUser.empNo }|| '${loginUser.deptDname }' == '총무팀'){
						value += "<tr align='center'>" + 
									"<td>"+ obj.requestEqNo +"</td>" +
									"<td>"+ obj.empName + "(" +  obj.empNo+ ")" +"</td>" + 
									"<td>"+ obj.deptDname +"</td>" + 
									"<td>"+ obj.jobName +"</td>" + 
									"<td>"+ obj.requestDate +"</td>" + 
									"<td>"+ obj.erCondition +"</td>" + 
									"<td>"+"<input type='checkbox' name='updateEqOne' value=" + obj.requestEqNo + ">"+"</td>"
								+ "</tr>";
						}
					});
					$("#eqListTable tbody").html(value);
				},error:function(){
					console.log("비품리스트 ajax 통신 실패");
				}
			});
			// 사원증신청목록 선택시
			}else if (($(this).val()) == "i") {
					// 사원증 신청목록만 보이게 하고
					$("#idListTable").css("display", '');
					$("#eqListTable").attr("style", "display:none");
					
					// 컨트롤러에서 사원증신청목록 가져오기
					$.ajax({
						url:"list.id",
						success:function(list){					
							var value="";
							$.each(list, function(i, obj){
								
								if(obj.empNo == ${loginUser.empNo} || '${loginUser.deptDname }' == '총무팀'){
								value += "<tr align='center'>" + 
											"<td>" +  obj.requestIdNo + "</td>" + 
											"<td>" +  obj.empKName + "(" +  obj.empNo+ ")" + "</td>" + 
											"<td>" +  obj.deptDname + "</td>" + 
											"<td>" +  obj.jobName + "</td>" + 
											"<td>" +  obj.requestDate + "</td>" +  
											"<td>" +  obj.irCondition + "</td>" + 
											"<td>"+"<input type='checkbox' name='updateIdOne' value=" + obj.requestIdNo + ">"+"</td>"
							        + "</tr>";
								}
							});
							$("#idListTable tbody").html(value);
						},error:function(){
							console.log("사원증리스트 ajax 통신 실패");
						}
				});
			}
		});
	})
	</script>
</body>
</html>