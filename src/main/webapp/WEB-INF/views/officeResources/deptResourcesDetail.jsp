<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.content-wrapper{
		overflow:auto;
	}
	th{
		background-color: #DAE1E7;
		width: 15%;
		text-align: center !important;
	}
	#replyTable{
		text-align: center !important;
	}
	#drContentDiv>p{
		margin-bottom: 0px;
	}
	#replyArea{
		text-align: center;
	}
	#sharingType{
		background: #00909E;
		color: white;
	}
	#documentType{	
		background: #27496D;
		color: white;
	}
	#etcType{
		background: #DAE1E7;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-6">

						<h4>
							<i class="nav-icon fas fa-edit"></i><b> 부서별 자료실</b>
						</h4>
					</div>
				</div>
			</div>
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-12">
					<div class="card card-outline card-info">

						<div class="card-header text-center">
							<h6 style="margin-bottom: 0px">
								<b>수신함</b>
							</h6>
						</div>

							<div class="card-body">
								<div class="row">
									<div class="col-12">

										<div class="card" style="margin-bottom: 0px;">
											<div class="row">
												<div class="col-12">
			
													<table class="table table-bordered table-sm mb-0">
														<tr>
															<th>작성자</th>
															<td style="width: 35%;">
															&nbsp;
															<b>${ deptResources.writerName } ${ deptResources.writerJobName }</b>
															</td>
															<th>작성일</th>
															<td style="width: 35%;">
																&nbsp;
																<fmt:formatDate value="${ deptResources.deptrCreateDate }" pattern="yyyy/MM/dd HH:mm"/>
															 </td>
														</tr>
														<tr>
															<th>자료 유형</th>
															<td colspan="3">
																&nbsp;
																<c:if test="${ deptResources.deptrCategory == '공유' }">
																	<span class="badge" id="sharingType">공유</span>
																</c:if>
																<c:if test="${ deptResources.deptrCategory == '문서' }">
																	<span class="badge" id="documentType">문서</span>
																</c:if>
																<c:if test="${ deptResources.deptrCategory == '기타' }">
																	<span class="badge" id="etcType">기타</span>
																</c:if>
															</td>
														</tr>
														<tr>
															<th>제목</th>
															<td colspan="3">
																&nbsp;
																${ deptResources.deptrTitle }
															</td>
														</tr>
														<tr>
															<th>파일첨부</th>
															<td colspan="3">
																<c:if test="${ deptResources.deptrAttach == 'N' }">
											                        	&nbsp; <small style="color: gray;">첨부파일이 없습니다.</small>
										                        		<!-- <small style="color: gray;">첨부파일이 없습니다.</small> -->
											                  	</c:if>
																<c:forEach items="${ deptResourcesAttach }" var="deptResourcesAttach">
																	<c:if test="${ !empty deptResourcesAttach.deptrAttachOrigin }">
											                        	&nbsp;<a href="${ pageContext.servletContext.contextPath }/resources/deptResources_files/${deptResourcesAttach.deptrAttachChange}" download="${deptResourcesAttach.deptrAttachOrigin}">${ deptResourcesAttach.deptrAttachOrigin }</a>
											                        	</br>
											                        </c:if>
											                        
																</c:forEach>
																
															</td>
														</tr>
														
														<tr>
															<td colspan="4"><div style="height: 400px; overflow:auto;" id="drContentDiv">${ deptResources.deptrContent }</div></td>
														</tr>
													</table>
			
			
												</div>
											</div>
										</div>										

									</div>
								</div>
								
								<hr>
								
								<div class="row">
								
									<div class="col-12">
										<div class="card" style="margin-bottom: 0px;">
											<div class="row">
												<div class="col-12">
												<table id="replyTable" class="table table-boarderd mb-0 text-center">
													<tbody>
													<tr>
														<th>
															<div class="row" style="height: 60px">
																<div class="col-12 align-self-center text-center">
																댓글
																</div>
															</div>
														</th>
														<td>
														
															<textarea class="form-control" rows="2" cols="100" id="replyText" style="resize:none; overflow: auto;"></textarea>
														
														</td>
														<td>
															<div class="row" style="height: 60px">
																<div class="col-12 align-self-center text-center">
																	<button type="button" class="btn btn-primary" style="width: 90%" onclick="addReply();">등록</button>
																</div>
															</div>
														</td>
													</tr>
													</tbody>
												</table>
												</div>
											</div>
										</div>
										
										<div class="col-12">
											<table id="replyArea" class="table table-sm" align="center">
											<caption style="caption-side:top">댓글 (<span id="rcount">0</span>)</caption>
								                <tbody>
								                
								                </tbody>
								            </table>
										</div>
									
									</div>
								</div>
						            


							</div>

							<div class="card-footer">
								<div class="col-12"  align='right'>
									<button onclick="location.href='deptResourcesList.or'" class="btn btn-sm btn-primary" type="button">돌아가기</button>&nbsp;
									
									<c:if test="${loginUser.empNo == deptResources.deptrWriterNo or loginUser.jobCode == 'J1' or loginUser.jobCode == 'J2' or loginUser.jobCode == 'J3'}">
										<button onclick="updateDeptResource(${deptResources.deptrNo});" class="btn btn-sm btn-danger" type="button">수정하기</button>&nbsp;
									</c:if>
								</div>
							</div>

					</div>
				</div>
			</div>

		</section>
	</div>
	
	<jsp:include page="../common/footer.jsp" />	
	
	<script>
		window.onload = function() {
			selectReplyList();
		};
	</script>
	
	<!-- 댓글 등록 -->
	<script>
		function addReply(){
			var deptrNo = ${deptResources.deptrNo}
			var writerNo = ${loginUserNo}
			
			if($("#replyText").val().trim().length != 0){
				$.ajax({
					url:"addDeptResourcesReply.or",
					type:"post",
					data:{
						deptrNo:deptrNo,
						deptrRepContent:$("#replyText").val(),
						deptrRepWriterNo:writerNo
					},
					success:function(result){
						if(result>0){
							$("#replyText").val("");
							selectReplyList();
						}else{
							alert("댓글 등록 실패")
						}
					},
					error:function(){
						console.log("댓글 등록 ajax 통신 실패");
					}
				});
			}else{
				alert("댓글을 입력해주세요.")
			}
		}
		
		

	</script>
	
	<!-- 댓글 리스트 불러오기 -->
	<script>
	function selectReplyList(){
		var deptrNo = ${deptResources.deptrNo}
		$.ajax({
			url:"deptResourcesRelplyList.or",
			data:{deptrNo:deptrNo},
			type:"get",
			success:function(list){
				$("#rcount").text(list.length);
				
				var value="";
				$.each(list, function(i, obj){
					console.log("성공")
						 
					if("${loginUserNo}" == obj.deptrRepWriterNo &&  obj.deptrRepCode == "NEW" && obj.deptrRepStatus=="Y"){
						value += "<tr>"+
									"<td id='nameTd' style='width: 10%; color: blue;'><b>[ " + obj.writerName+" "+obj.writerJobName + " ]</b></td>" + 
									"<td>" + obj.deptrRepContent + "</td>" + 
									"<td style='width: 10%;'><small>" + obj.deptrRepCreateDate + "</small></td>" + 
									"<td style='width: 5%;' align='right'>" + "<button class='btn btn-sm btn-primary' onclick='deleteReply("+ obj.deptrRepNo +");'>삭제하기</button>" + "</td>" +
								 "</tr>";
					}else if(obj.deptrRepCode == "NEW" && obj.deptrRepStatus=="Y"){
						value += "<tr>"+
									"<td id='nameTd' style='width: 10%;'><b>[ " + obj.writerName+" "+obj.writerJobName + " ]</b></td>" + 
									"<td>" + obj.deptrRepContent + "</td>" + 
									"<td style='width: 10%;'><small>" + obj.deptrRepCreateDate + "</small></td>" + 
									"<td style='width: 5%;' align='right'>" + "<button class='btn btn-sm btn-primary' disabled>삭제하기</button>"+ "</td>" +
								 "</tr>";
					}else if(obj.deptrRepCode == "NEW" && obj.deptrRepStatus=="N"){
						value += "<tr style='background:#F6F6F6'>"+
									"<td colspan='5'>삭제된 댓글입니다.</td>"
								 "</tr>";
					}
						 
				});
				$("#replyArea tbody").html(value);
			},error:function(){
				console.log("댓글 리스트조회용 ajax 통신 실패");
			}
		});
	}
	</script>
	
	<!-- 댓글 삭제 -->
	<script>
		function deleteReply(deptrNo){
			
			$.ajax({
				url:"deleteDeptResourcesReply.or",
				type:"post",
				data:{
					deptrNo:deptrNo
				},
				success:function(result){
					if(result>0){
						selectReplyList();
					}else{
						alert("댓글 삭제 실패")
					}
				},
				error:function(){
					console.log("댓글 삭제 ajax 통신 실패");
				}
			});
			
		}
	</script>
	
	<!-- 업데이트 -->
	<script>
		function updateDeptResource(deptrNo){
			location.href="<%=request.getContextPath()%>/updateDeptResourceForm.or?deptrNo="+deptrNo;
		}
	</script>
</body>
</html>