<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


    <section class="content">
      <div class="row">
        <div class="col-md-12">
          <div class="card card-outline card-info">
            <div class="card-header">
			    <!-- 업무 목록 검색 -->			
			   	<ul class="box1 b1">
					<li> 
					<strong class="label1">검색조건</strong>
					<span class="sel1">
						<a href="javascript:void(0);" class="btn1" id="btn_all">전체보기</a>
						<select name="strkey" id="strkey">
							<option value="subject">제목</option>
							<option value="content">내용</option>
							
								<option value="name_kor">작성자</option>
							
						</select>
						<input type="text" name="keyword" id="keyword" class="input_st1" onkeyup="if(event.keyCode==13) search();" maxlength="100">
						<input type="text" name="hiddenTxt" class="input_st1" style="display: none;">
						<a href="javascript:void(0);" class="btn1" id="btn_search">검색</a>
					</span>
					</li>
				</ul>
            </div>
            <!-- /.card-header -->
            
    	<div class="card-body">

    	
	<!-- 업무 목록 리스트 테이블 -->
	<div class="row">
          <div class="col-12" id="WorkShareTable">
            <div class="card">
              <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap" id="workShareTable">
                  <thead align="center">
                    <tr>
                      <th width="10px;">No.</th>
                      <th width="10px;">⭐</th>
                      <th width="500px;">제목</th>
                      <th width="50px;">발신인</th>
                      <th width="50px;">등록일</th>
                    </tr>
                  </thead>
                <tbody align="center">
                	<c:forEach items="${ list }" var="ws">
	                    <tr>
	                        <td width="10px;">${ ws.ws_no }</td>
	                        <c:if test="${ ws_favb eq Y }">
	                        	<td id="${ ws_no }" class="btn-like" width="10px;" onclick="clickFavb('${ ws_no }');">⭐</td>
	                        </c:if>
	                        <c:if test="${ ws_favb ne Y }">
	                        	<td width="10px;">&nbsp;</td>
	                        </c:if>
	                        <td width="500px;">${ ws.ws_title }</td>
	                        <td width="50px;">${ ws.ws_senderName } ${ ws.ws_senderJobName }</td>
	                        <td width="50px;">${ ws.createDate }</td>
	                    </tr>
                    </c:forEach>
                </tbody>
                </table>
              </div>
             
            </div>
            <!-- /.card -->
          </div>
        </div>
            </div>
             <!-- /.card-body -->
            <div class="card-footer">
             	<button id="sendBtn" type="button" class="btn btn-primary btn-sm" onClick="location.href='sendFormView.ws'">보내기</button>
            </div>
          </div>
        </div>
	  </div>
    </section>

</body>
</html>