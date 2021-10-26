<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			   	<div class="card" style="margin-bottom: 0px;">
					<table id="searchTable">
						<tr>
							<th>검색 조건</th>
							<td>
							<form action="searchEmployee.or">
							<div class="row" style="margin-left: 0px;">
									&nbsp;&nbsp;
									<button id="allEmployeeSearchBtn" type="button" class="btn btn-default btn-sm" onclick="selectAllRecvList();">전체보기</button>
									&nbsp;&nbsp;
									
										<select id="optionType" name="optionType" class="custom-select custom-select-sm" style="width: 10%;" onchange="searchSelect(this.value);">
											<option value="searchTitle">제목</option>
											<option value="searchContent" >내용</option>
											<option value="searchWriter">작성자</option>
										</select>
										&nbsp;&nbsp;
										<div class="input-group" style="width: 30%;">
											<input type="search" id="searchInput"
												class="form-control form-control-sm"
												placeholder="검색어를 입력하세요." name="searchWorkShare" value="${ search }">
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
					</table>
				</div>
            </div>
            <!-- /.card-header -->
            
    	<div class="card-body">

    	
	<!-- 업무 목록 리스트 테이블 -->
	<div class="row">
          <div class="col-12" id="savedWSTable">
            <div class="card">
              <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap">
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