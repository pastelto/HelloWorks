<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="./resources/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="./resources/dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="./resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>


<style>
	*{padding:0; margin:0;}
	ul{list-style:none;}
	a{text-decoration:none; color:#555;}
	a:hover{text-decoration:underline;}
	#deptMenu{margin:30px 0 0 30px;}
	#deptMenu li{line-height:18px; padding:0 0 10px 20px; position:relative; background:url(http://hcs1105.com/wp/wp-content/themes/hcs1105/images/bg_tree.gif) no-repeat 4px top; font-size:13px;}
	#deptMenu li.end{background:url(http://hcs1105.com/wp/wp-content/themes/hcs1105/images/bg_treeEnd.gif) no-repeat 4px 0;}
	#deptMenu li button{width:9px; height:9px; border:0 none; display:block; position:absolute; left:0; top:3px; overflow:hidden; text-indent:-9999em;}
	#deptMenu li button.open{background:url(http://hcs1105.com/wp/wp-content/themes/hcs1105/images/treeOpen.gif) no-repeat 0 0;}
	#deptMenu li button.close{background:url(http://hcs1105.com/wp/wp-content/themes/hcs1105/images/treeClose.gif) no-repeat 0 0;}
</style>
</head>
<body>
<div class="content-wrapper" style="width:700px;">
	<div class="content">
		<div class="content-fluid">
			<div class="row">
				<div class="card card-info">
					<div class="card-header">
						<h3 class="card-title">부서 선택</h3>
					</div>
					<div class="card-body">
					<form>
						<ul id="deptMenu">
							<li>
								<a href="#submenu" class="open">HelloWorks</a>
								<!--  <input type="text" id="hidden_parent" name="hidden_parent" class="hidden" />-->
								<ul id="submenu">
									<li>
										<a href="manage" class="open" onclick="selectDept('경영지원본부')">경영지원본부</a>
										<ul id="manage">
											<li><a href="#" onclick="selectDept('인사팀')">인사팀</a></li>
											<li><a href="#" onclick="selectDept('재무회계팀')">재무회계팀</a></li>
											<li><a href="#" onclick="selectDept('총무팀')">총무팀</a></li>
										</ul>
									</li>
									<li>
										<a href="sales" class="open" onclick="selectDept('영업지원본부')">영업지원본부</a>
										<ul id="sales">
											<li><a href="#" onclick="selectDept('영업팀')">영업팀</a></li>
											<li><a href="#" onclick="selectDept('운영지원팀')">운영지원팀</a></li>
										</ul>
									</li>
									<li>
										<a href="business" class="open" onclick="selectDept('사업본부')">사업본부</a>
										<ul id="business">
											<li><a href="#" onclick="selectDept('디자인팀')">디자인팀</a></li>
											<li><a href="#" onclick="selectDept('마케팅킴')">마케팅킴</a></li>
											<li><a href="#" onclick="selectDept('IT개발팀')">IT개발팀</a></li>
										</ul>
									</li>
								</ul>
							</li>
						</ul>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- 부서검색 연결 -->
<script>

	function selectDept(dept){
		
		var val = $("hidden_parent").val();
		console.log(val); 
		
		$(opener.document).find(val).val(dept);
		//window.close();
	}
	
</script>


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
</body>
</html>