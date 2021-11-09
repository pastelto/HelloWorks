<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
<!-- css NoticeListView  -->
<link href="resources/css/notice/Notice.css" rel="stylesheet" type="text/css"> 
<style>


</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="content-wrapper">
		 <!-- 공지사항 타이틀 -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-6">
						<h4>
							<i class="fas fa-bullhorn"></i><b> &nbsp;공지사항</b>
						</h4>
					</div>
				</div>
			</div>
		</section>
		
		
		<section class="content">
			<div class="col-md-12">
				<div class="card card-outline card-info">
						
						<!-- 제목 -->
						<div class="card-header" >
						
						   <div class="titlefloat1"> &nbsp; &nbsp;제목 :  &nbsp; ${ n.noticeTitle }</div>
						   <div class="titlefloat2">${ n.createDate }</div>
						   <div class="titlefloat2">조회수 : ${ n.nt_count }</div>
						   <div class="titlefloat2">작성자  : ${ n.noticeWriter }&nbsp; ${ n.jobName } </div>
						</div>
						<!-- 내용 -->
						<div class="card-body detail1">
							<div class="col-md-12">
								<div class="card">
									<div class="card-header detailContent">내용</div>
									<div class="card-header"><br>${ n.noticeContent }</div>
									<div class="card-header detailAttachment">
									<c:if test="${ !empty n.originName }">
										첨부파일  &nbsp;
			                        	<a href="${ pageContext.servletContext.contextPath }/resources/upload_files/${n.changeName}" download="${ n.originName }">${ n.originName }</a>
			                        </c:if>
			                        <c:if test="${ empty n.originName }">
			                        	첨부파일이 없습니다.
			                        </c:if>
									</div>
								</div>
							</div>
						</div>
				
						
						<%-- <!-- 댓글영역 -->
						<div class="card-body detail2">
							<div class="col-md-12">
								 <table id="replyArea" class="table" align="center">
							                <thead>
							                    <tr>
							                    							               
							                    	 
							                    		<c:if test="${ !empty loginUser }">
								                    		<th colspan="3" style="width:75%">
									                            <textarea class="form-control" id="replyContent" rows="2" style="resize:none; width:100%" placeholder="댓글내용을 입력해주세요."></textarea>
									                        </th>
									                        <th style="vertical-align: middle"><button class="btn btn-secondary btn-sm" id="addReply" >등록하기</button></th>
							                    		
							                    		</c:if>
							                    
							                    </tr>
							                    <tr>
							                       <td colspan="3">댓글 (<span id="rcount">0</span>) </td> 
							                    </tr>
							                </thead>
							                <tbody>
							                
							                </tbody>
							            </table>
							</div>
						</div> --%>
						<!--버튼 -->
						<div class="card-footer clearfix">
							<div class="writeBtn">
								<button class="btn btn-secondary btn-sm" onclick = "location.href='list.nt'">목록으로</button>
							</div>
							<!-- 본인만 수정삭제 가능하게  -->
							<c:if test="${ loginUser.empNo eq n.empNo  }">
								<div class="writeBtn">
									<button class="btn btn-danger btn-sm" onclick = "postFormSubmit(2);">삭제</button>
								</div>
								<div class="writeBtn">
									<button class="btn btn-warning btn-sm" onclick = "postFormSubmit(1)">수정</button>
								</div>
							</c:if>
						</div>
					
				            <form id="postForm" action="" method="post">
								<input type="hidden" name="bno" value="${ n.noticeNo }">
								<input type="hidden" name="fileName" value="${ n.changeName }"> 
							</form>
							
					
					
			</div>
		</section>
		
	<script>
		function postFormSubmit(num){
			var postForm = $("#postForm");
			
			if(num == 1){
				postForm.attr("action", "updateForm.nt");
				postForm.submit();
			}else{
				 var answer;
		   		 answer = confirm("정말로 삭제하시겠습니까?");
				
				 if(answer == true){
		   			 
					 postForm.attr("action", "delete.nt");
					 postForm.submit();
					 
		   			 alert("공지사항이 삭제되었습니다.");
		   		 }
			}
		}
	</script>	
	
	 <script>
    	// 댓글 리스트 가져온 후 댓글 등록하기
		$(function(){
			selectReplyList();
			
			$("#addReply").click(function(){
		   		var bno = ${n.noticeNo};
		
				if($("#replyContent").val().trim().length != 0){
					
					$.ajax({
						url:"rinsert.ps",
						type:"post",
						data:{ replyContent:$("#replyContent").val(),
							  refBoardNo:bno,
							  replyWriter:"${loginUser.empNo}"},
						success:function(result){
							if(result > 0){
								$("#replyContent").val("");
								selectReplyList();
								
							}else{
								alert("댓글등록실패");
							}
						},error:function(){
							console.log("댓글 작성 ajax 통신 실패");
						}
					});
					
				}else{
					alert("내용을 입력해주세요.");
				}
				
			});
		});
		
		// 댓글 리스트 불러오기
 		function selectReplyList(){
			var bno = ${n.noticeNo};
			$.ajax({
				url:"rlist.ps",
				data:{bno:bno},
				type:"get",
				success:function(list){
					$("#rcount").text(list.length);
					
					var value="";
					$.each(list, function(i, obj){
						
						if(obj.wsr_empNo == ${loginUser.empNo}){
						value += "<tr>" +
								 "<th>" + obj.replyWriter + "</th>" + 
								 "<td>" + obj.replyContent + "</td>" + 
							     "<td>" + obj.createDate + "</td>" +
							     "<td>" + "<a onclick='deleteReply("+obj.replyNo+");'><b>삭제하기</b></a> | " + "<a onclick='updateReply("+obj.replyNo+");'>수정하기</a>" + "</td>" +
							     "</tr>";
						}else {
							value += "<tr>" +
							 "<th>" + obj.replyWriter + "</th>" + 
							 "<td>" + obj.replyContent + "</td>" + 
						     "<td>" + obj.createDate + "</td>" +
						     "<td></td>" +
						     "</tr>";
						}
					});
					$("#replyArea tbody").html(value);
				},error:function(){
					console.log("댓글 리스트조회용 ajax 통신 실패");
				}
			});
		} 
		
/* 		// 댓글 삭제하기
		function deleteReply(num){
			
			var del = confirm("댓글을 삭제하시겠습니까?");
			
			if(del){
				$.ajax({
					url:"#",
					type:"post",
					data:{rno:num},
					success:function(result){
						if(result > 0){
							alert("댓글이 삭제되었습니다.");
							selectReplyList();		
						}else{
							alert("댓글삭제실패");
						}
					},error:function(){
						console.log("댓글 삭제 ajax 통신 실패");
					}
				});
			}
			
		} */
		
		// 댓글 수정하기
/* 		function updateReply(num){
			
			var del = confirm("댓글을 삭제하시겠습니까?");
			
			if(del){
				$.ajax({
					url:"deleteReply.ws",
					type:"post",
					data:{rno:num},
					success:function(result){
						if(result > 0){
							alert("댓글이 삭제되었습니다.");
							selectReplyList();			
						}else{
							alert("댓글삭제실패");
						}
					},error:function(){
						console.log("댓글 삭제 ajax 통신 실패");
					}
				});
			}
		} */
  </script>
		
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>