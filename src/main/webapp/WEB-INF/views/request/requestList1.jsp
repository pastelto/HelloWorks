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
						</div>
					</div>
				</div>
				<div class="col-2">
					<div class="form-group">
						<select class="custom-select form-control-border"
							id="exampleSelectBorder" name="selectedList">
							<option value="eq">비품 신청 목록</option>
							<option value="id">사원증 신청 목록</option>
						</select>
					</div>
				</div>
				<!-- /.card-header -->
				<div class="card-body">
					<!-- 비품 신청 목록 -->
					<table id="eqListTable" class="table table-bordered table-striped">
						<thead>
							<tr align="center">
								<th>사번</th>
								<th>비품 신청인</th>
								<th>부서</th>
								<th>직급</th>
								<th>접수일</th>
								<th>처리상태</th>
								<th><input type='checkbox' name='updateAll'
									value='selectall'></th>
							</tr>
						</thead>
						<tbody>
							<!-- 비품 신청 목록 띄우기 -->
							<c:forEach items="${ list }" var="e">
								<tr align="center">
									<th>사번</th>
									<th>비품 신청인</th>
									<th>부서</th>
									<th>직급</th>
									<th>접수일</th>
									<th>처리상태</th>
									<td><input type='checkbox' name='updateOne' value="${e.requestEqNo}"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- 사원증 신청 목록 -->
					<table id="idListTable" class="table table-bordered table-striped">
						<thead>
							<tr align="center">
								<th>${e.empNo}</th>
								<th>${e.empNo}</th>
								<th>${e.empNo}</th>
								<th>${e.empNo}</th>
								<th>${e.requestDate}</th>
								<th>${e.eqCondition}</th>
								<th><input type='checkbox' name='updateAll'
									value='selectall'></th>
							</tr>
						</thead>
						<tbody>
							<!-- 사원증 신청 목록 띄우기 -->
							<c:forEach items="${ list }" var="i">
								<tr align="center">
									<th>사번</th>
									<th>사원증 신청인</th>
									<th>부서</th>
									<th>직급</th>
									<th>접수일</th>
									<th>처리상태</th>
									<td><input type='checkbox' name='updateOne' value=""></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!--./card-body-->
			</div>
		</div>
	</div>
	<script>
	//selected 테이블 띄우기
  	$(function(){
		
		$("#eqListTable").attr("style","display:none");
		$("#idListTable").attr("style","display:none");		
		
		 $("select[name=selectedList]").change(function(){
/* 			alert($(this).val());
			console.log($(this).val()); //value값 가져오기
		    console.log($("select[name=selectedList] option:selected").text()); //text값 가져오기  */
		    
		    if(($(this).val())=="e"){
		    	$("#eqListTable").css("display",'');
		    	$("#idListTable").attr("style", "display:none");
		    };
		    
		    if(($(this).val())=="i"){
		    	$("#idListTable").css("display",'');
		    	$("#eqListTable").attr("style", "display:none");
		    };
		}); 
	}); 
	
	//tr -> 테이블 상세조회
	
	//체크박스-> 업데이트
	$("input[name='updateAll']").click(function(){
		
		if(($("input[name='updateAll']")).prop("checked")){
			$("input[name='updateOne']").prop("checked",true);
		}else{
			$("input[name='updateOne']").prop("checked",false);
		}
	});
</script>
</body>
</html>