<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴지통</title>
<style>
.content-wrapper {
	overflow: auto;
}
</style>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h4>
							<i class="nav-icon fas fa-envelope"><b> 휴지통</b></i>
						</h4>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active">휴지통</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-md-3">
					<a href="compose.ml" class="btn btn-primary btn-block mb-3">메일쓰기</a>

					<div class="card card-outline card-info">
						<div class="card-header">
							<h3 class="card-title">Folders</h3>

							<div class="card-tools">
								<button type="button" class="btn btn-tool"
									data-card-widget="collapse">
									<i class="fas fa-minus"></i>
								</button>
							</div>
						</div>
						<div class="card-body p-0">
							<ul class="nav nav-pills flex-column">
								<li class="nav-item active"><a href="inbox.ml"
									class="nav-link"> <i class="fas fa-inbox"></i> 받은 메일함 <span
										class="badge bg-primary float-right">12</span>
								</a></li>
								<li class="nav-item"><a href="sent.ml" class="nav-link">
										<i class="far fa-envelope"></i> 보낸 메일함
								</a></li>
								<li class="nav-item"><a href="draft.ml" class="nav-link">
										<i class="far fa-file-alt"></i> 임시 보관함
								</a></li>
								<li class="nav-item"><a href="important.ml"
									class="nav-link"> <i class="fas fa-filter"></i> 중요 메일함 <span
										class="badge bg-warning float-right">65</span>
								</a></li>
								<li class="nav-item"><a href="trash.ml" class="nav-link">
										<i class="far fa-trash-alt"></i> 휴지통
								</a></li>
							</ul>
						</div>
						<!-- /.card-body -->
					</div>
				</div>
				<!-- /.col -->
				<div class="col-md-9">
					<div class="card card-outline card-info">
						<div class="card-header">
							<h3 class="card-title">휴지통</h3>

							<div class="card-tools">
								<div class="input-group input-group-sm">
									<input type="text" class="form-control"
										placeholder="Search Mail">
									<div class="input-group-append">
										<div class="btn btn-primary">
											<i class="fas fa-search"></i>
										</div>
									</div>
								</div>
							</div>
							<!-- /.card-tools -->
						</div>
						<!-- /.card-header -->
						<div class="card-body p-0">
							<div class="mailbox-controls">
								<!-- Check all button -->
								<button type="button"
									class="btn btn-default btn-sm checkbox-toggle">
									<i class="far fa-square"></i>
								</button>
								<div class="btn-group">
									<button type="button" class="btn btn-default btn-sm">
										<i class="far fa-trash-alt"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm">
										<i class="fas fa-reply"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm">
										<i class="fas fa-share"></i>
									</button>
								</div>
								<!-- /.btn-group -->
								<button type="button" class="btn btn-default btn-sm">
									<i class="fas fa-sync-alt"></i>
								</button>
								<div class="float-right">
									1-50/200
									<div class="btn-group">
										<button type="button" class="btn btn-default btn-sm">
											<i class="fas fa-chevron-left"></i>
										</button>
										<button type="button" class="btn btn-default btn-sm">
											<i class="fas fa-chevron-right"></i>
										</button>
									</div>
									<!-- /.btn-group -->
								</div>
								<!-- /.float-right -->
							</div>
							<div class="table-responsive mailbox-messages">
								<table class="table table-hover table-striped">
									<tbody>
										<tr>
											<td>
												<div class="icheck-primary">
													<input type="checkbox" value="" id="check1"> <label
														for="check1"></label>
												</div>
											</td>
											<td class="mailbox-star"><a href="#"><i
													class="fas fa-star text-warning"></i></a></td>
											<td class="mailbox-name"><a href="read.ml">Alexander
													Pierce</a></td>
											<td class="mailbox-subject"><b>AdminLTE 3.0 Issue</b> -
												Trying to find a solution to this problem...</td>
											<td class="mailbox-attachment"></td>
											<td class="mailbox-date">5 mins ago</td>
										</tr>
									</tbody>
								</table>
								<!-- /.table -->
							</div>
							<!-- /.mail-box-messages -->
						</div>
						<!-- /.card-body -->
						<div class="card-footer p-0">
							<div class="mailbox-controls">
								<!-- Check all button -->
								<button type="button"
									class="btn btn-default btn-sm checkbox-toggle">
									<i class="far fa-square"></i>
								</button>
								<div class="btn-group">
									<button type="button" class="btn btn-default btn-sm">
										<i class="far fa-trash-alt"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm">
										<i class="fas fa-reply"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm">
										<i class="fas fa-share"></i>
									</button>
								</div>
								<!-- /.btn-group -->
								<button type="button" class="btn btn-default btn-sm">
									<i class="fas fa-sync-alt"></i>
								</button>
								<div class="float-right">
									1-50/200
									<div class="btn-group">
										<button type="button" class="btn btn-default btn-sm">
											<i class="fas fa-chevron-left"></i>
										</button>
										<button type="button" class="btn btn-default btn-sm">
											<i class="fas fa-chevron-right"></i>
										</button>
									</div>
									<!-- /.btn-group -->
								</div>
								<!-- /.float-right -->
							</div>
						</div>
					</div>
					<!-- /.card -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->
	<jsp:include page="../common/footer.jsp" />
	<script>
  $(function () {
    //Enable check and uncheck all functionality
    $('.checkbox-toggle').click(function () {
      var clicks = $(this).data('clicks')
      if (clicks) {
        //Uncheck all checkboxes
        $('.mailbox-messages input[type=\'checkbox\']').prop('checked', false)
        $('.checkbox-toggle .far.fa-check-square').removeClass('fa-check-square').addClass('fa-square')
      } else {
        //Check all checkboxes
        $('.mailbox-messages input[type=\'checkbox\']').prop('checked', true)
        $('.checkbox-toggle .far.fa-square').removeClass('fa-square').addClass('fa-check-square')
      }
      $(this).data('clicks', !clicks)
    })

    //Handle starring for font awesome
    $('.mailbox-star').click(function (e) {
      e.preventDefault()
      //detect type
      var $this = $(this).find('a > i')
      var fa    = $this.hasClass('fa')

      //Switch states
      if (fa) {
        $this.toggleClass('fa-star')
        $this.toggleClass('fa-star-o')
      }
    })
  })
</script>
</body>
</html>