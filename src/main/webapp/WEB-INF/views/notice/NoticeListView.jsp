<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/admin-lte@3.1/dist/js/adminlte.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/admin-lte@3.1/dist/css/adminlte.min.css">
<!-- Select2 -->
<link rel="stylesheet" href="../../plugins/select2/css/select2.min.css">
<!-- css NoticeListView -->
<link href="resources/css/notice/Notice.css" rel="stylesheet" type="text/css">  
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	
	<div class="content-wrapper">
	<div class="all">

		<!--공지사항 글쓰기 버튼 -->
		<div class="col-12 dnTitle">
			<i class="far fa-file-alt fa-lg"></i>
			<p class="nTitle" style="width: 100px;">공지사항</p>
			<button id="writenotice">글쓰기</button>
		</div>
			
		</div>

		<!--검색영역 -->
			<div class="card" id="scdivdiv" style="width: 1100px; height: 40px; ">
				<!-- /.card-header -->
				<div class="card-body">
					<form action="#">
						<div class="row">
							<div class="col-md-10 offset-md-1">
								<div class="row">
									<div class="form-group col-2" id="detailsearch">
										<p id="detail">상세검색</p>
									</div>
									<div class="form-group" id=nticedropdiv>
										<select class="nticedrop" name="scdetail">
											<option selected>전체보기</option>
											<option>작성자</option>
											<option>제목</option>
											<option>내용</option>
										</select>

									</div>
									<div class="form-group">
										<div class="input-group input-group-lg" id="nsearchdiv">
											<input type="search" id="searchinput" name="search"
												class="form-control form-control-lg" value="${ search }">
											<div class="input-group-append">
												<button type="submit" id="searchbtn"
													class="btn btn-lg btn-default  col-4">
													<div id="nsearchi">
														<i class="fa fa-search fa-xs"></i>
													</div>
												</button>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
					</form>
				</div>
			</div>
			<script>
				$(function() {
					switch ('${search}') {
					case "writer":
						$("#nsearchArea option").eq(0).attr("selected", true);
						break;
					case "title":
						$("#nsearchArea option").eq(1).attr("selected", true);
						break;
					case "content":
						$("#nsearchArea option").eq(2).attr("selected", true);
						break;
					}
				})
			</script>

		

		<!--공지사항리스트-->
		<div class="noticeList">
          <div class="col-12">
            <div class="card"  id="noticeListcard">
              <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap">
                  <thead align="center">
                    <tr>
                      <th>No.</th>
                      <th>⭐</th>
                      <th>제목</th>
                      <th>발신인</th>
                      <th>등록일</th>
                    </tr>
                  </thead>
                  <tbody align="center">
                    <tr>
                      <td>183</td>
                      <td>John Doe</td>
                      <td>11-7-2014</td>
                      <td><span class="tag tag-success">Approved</span></td>
                      <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                    </tr>
                    <tr>
                      <td>219</td>
                      <td>Alexander Pierce</td>
                      <td>11-7-2014</td>
                      <td><span class="tag tag-warning">Pending</span></td>
                      <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                    </tr>
                    <tr>
                      <td>657</td>
                      <td>Bob Doe</td>
                      <td>11-7-2014</td>
                      <td><span class="tag tag-primary">Approved</span></td>
                      <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                    </tr>
                    <tr>
                      <td>175</td>
                      <td>Mike Doe</td>
                      <td>11-7-2014</td>
                      <td><span class="tag tag-danger">Denied</span></td>
                      <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
        </div>
		
		
		
		
		
		
		
		
	</div>	
	</div>
		






	<jsp:include page="../common/footer.jsp"/>


	<!-- Select2 -->
	<script src="../../plugins/select2/js/select2.full.min.js"></script>

</body>
</html>