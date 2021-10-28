<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>HelloWorks</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="./resources/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="./resources/dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="./resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>
</head>
<body class="hold-transition sidebar-mini layout-fixed sidebar-collapse" data-panel-auto-height-mode="height">
	<c:if test="${ !empty msg }">
		<script>
			alert("${msg}");
		</script>
		<c:remove var="msg" scope="session"/>
	</c:if>
<div class="wrapper">

  <!-- Navbar -->
	<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars mt-1"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="index3.html" class="nav-link">사람 아이콘</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a class="nav-link">${loginUser.empName}&nbsp;&nbsp;${loginUser.jobName}</a>
      </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">

      <!-- 마이페이지 -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-comments"></i>
        </a>
      </li>
      
      <!-- 근태관리 -->
      <li class="nav-item">
         <a class="nav-link" href="attendanceApiView.ps">
         <!--  전체화면 기능아이콘 <i class="fas fa-expand-arrows-alt"></i>-->
    		<i class="fas fa-briefcase"></i>
        </a>
      </li>
      
      <!-- 전사공지 아이콘 -->
      <li class="nav-item">
        <a class="nav-link" href="list.nt">
	        	<!-- 알림 
	          <i class="far fa-bell"></i>
	          <span class="badge badge-warning navbar-badge">15</span>
	          -->
	         <i class="fas fa-bullhorn"></i>
        </a>
      </li>
      
      <!-- 예약현황 -->
      <li class="nav-item">
        <a class="nav-link" href="request.menu" role="button">
          <i class="fas fa-clipboard-list"></i>
        </a>
      </li>
      
      <!-- 일정관리 -->
      <li class="nav-item">
        <a class="nav-link" href="schMain.sc" role="button">
			<i class="far fa-calendar-check"></i>
        </a>
      </li>
      
      <!-- 주소록 -->
      <li class="nav-item">
        <a class="nav-link" href="officeAddressBook.adb" role="button">
          <i class="fas fa-address-book"></i>
        </a>
      </li>
      
    <!-- 직원검색 / 사원검색 -->
      <li>
      	<form action="searchEmployee.or">
	      <div class="input-group">
	      	<input type="hidden" name="optionType" value="allType">
	      	<input type="hidden" name="deptTypeOption" value="A">
	        <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search" name="searchEmployee" value="${ search }">
	        <div class="input-group-append">
	          <button class="btn btn-navbar" type="submit">
	            <i class="fas fa-search"></i>
	          </button>
	        </div>
	      </div>
	     </form>
      </li>
      
      <!-- 화면 확장   -->
      <li class="nav-item">
        <a class="nav-link" data-widget="fullscreen" href="#" role="button">
          <i class="fas fa-expand-arrows-alt"></i>
        </a>
      </li>
      
      <!-- 로그아웃 -->
      <li class="nav-item">
        <a class="nav-link" data-slide="true" href="logout.me" role="button">
          <i class="fas fa-sign-out-alt"></i>
        </a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <div class="brand-link" style="height: 57px; margin-left:1px;">
      <img src="resources/common/icon.png" alt="HelloWorks Logo" class="brand-image elevation-3" style="opacity: .8; margin-top: 2px;">
	 <span class="brand-text font-weight-light"> 
      	<img src="resources/common/logoLetters.png" alt="HelloWorks Letters" class="brand-image elevation-3" style="opacity: .8; margin-top: 3.5px;">
      </span>
    </div>

    <!-- Sidebar -->
    <div class="sidebar">

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
         
         <!-- HOME -->
          <li class="nav-item">
            <a href="main.mi" class="nav-link">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
               	HOME
              </p>
            </a>
          </li>
          
          <!-- 메일 -->
		  <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-envelope"></i>
              <p>메일
              	<i class="fas fa-angle-left right"></i>
                <span class="badge badge-info right">6</span>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="compose.ml" class="nav-link">
                  <p>메일쓰기</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="inbox.ml" class="nav-link">
                  <p>받은 메일함</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="sent.ml" class="nav-link">
                  <p>보낸 메일함</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="draft.ml" class="nav-link">
                  <p>임시 보관함</p>
                </a>
              <li class="nav-item">
                <a href="important.ml" class="nav-link">
                  <p>중요 메일함</p>
                </a>
              </li>
			  <li class="nav-item">
                <a href="trash.ml" class="nav-link">
                  <p>휴지통</p>
                </a>
              </li>
              </li>
            </ul>
          </li>

          
          <!-- 전자결재 -->
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-chart-pie"></i>
              <p>
                                     전자결재
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="normalApprovalForm.ea" class="nav-link">
              	  <p>일반결재</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="expenditureApprovalForm.ea" class="nav-link">
                  <p>지출결재</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/charts/inline.html" class="nav-link">
                  <p>근태/휴가 결재</p>
                </a>
              </li>
               <li class="nav-item">
                <a href="temporarySave.ea" class="nav-link">
                  <p>임시저장함</p>
                </a>
              </li>
               <li class="nav-item">
                <a href="myApproval.ea" class="nav-link">
                  <p>내결재함</p>
                </a>
              </li>
               <li class="nav-item">
                <a href="pendingTray.ea" class="nav-link">
                  <p>미결재문서</p>
                </a>
              </li>
               <li class="nav-item">
                <a href="signedTray.ea" class="nav-link">
                  <p>결재완료문서</p>
                </a>
              </li>
               <li class="nav-item">
                <a href="ccTray.ea" class="nav-link">
                  <p>수신참조함</p>
                </a>
              </li>
               <li class="nav-item">
                <a href="deptTray.ea" class="nav-link">
                  <p>부서문서함</p>
                </a>
              </li>
            </ul>
          </li>
          
          <!-- 업무공유 -->
          <li class="nav-item">
            <a href="#" class="nav-link">
            <i class="nav-icon fas fa-link"></i>
              <p>
              	 업무공유
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="unCheckedListWS.ws" class="nav-link">
                  <p>미확인 업무</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="recvListWS.ws" class="nav-link">
                  <p>수신내역</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="sendListWS.ws" class="nav-link">
                  <p>발신내역</p>
                </a>
              </li>
            </ul>
          </li>
          
          <!-- 일일보고 -->
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-edit"></i>
              <p>
              	일일보고
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="enrollReportForm.dr" class="nav-link">
              	  <p>일일보고 작성</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="recvReport.dr" class="nav-link">
                  <p>수신함</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="sendReport.dr" class="nav-link">
                  <p>발신함</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="tempReport.dr" class="nav-link">
                  <p>임시저장</p>
                </a>
              </li>
            </ul>
          </li>
          
          <!-- 오피스룸 -->
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-table"></i>
              <p>
            	    오피스룸
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="commResourcesList.or" class="nav-link">
                  <p>공통 자료실</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="deptResourcesList.or" class="nav-link">
                  <p>부서별 자료실</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="searchEmpMain.or" class="nav-link">
                  <p>직원검색</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="officeAddressBook.adb" class="nav-link">
                  <p>주소록</p>
                </a>
              </li>
            </ul>
          </li>
          
          <!-- 인사관리 -->
          <li class="nav-header">인사관리</li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-envelope"></i>
              <p>
                	인사관리
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="pages/mailbox/mailbox.html" class="nav-link">
                  <p>사원 등록</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="empManageMain.hr" class="nav-link">
                  <p>사원 관리</p>
                </a>
              </li>
            </ul>
          </li>
		</ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    
    <!-- /.sidebar -->
  </aside>

<!-- Content Wrapper. Contains page content -->
<!--  <div class="content-wrapper iframe-mode" data-widget="iframe" data-loading-screen="750">
   
  </div> -->
  
	

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
  
</div>
<!-- ./wrapper -->

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
