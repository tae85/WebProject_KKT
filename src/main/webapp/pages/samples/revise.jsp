<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Skydash Admin</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/vendors/feather/feather.css">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="<%=request.getContextPath() %>/images/favicon.png" />
  <script>
  function validateForm(form) {
	  if(!form.id.value) {
		  alert("아이디를 입력하세요.");
		  return false;
	  }
	  if(!form.pass.value) {
		  alert("패스워드를 입력하세요.");
		  return false;
	  }
	  if(!form.name.value) {
		  alert("이름을 입력하세요.");
		  return false;
	  }
	  if(!form.email.value) {
		  alert("이메일을 입력하세요.");
		  return false;
	  }
  }
  </script>
</head>
<body>
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
              <div class="brand-logo">
                <img src="<%=request.getContextPath() %>/images/logo.svg" alt="logo">
              </div>
              <h4>회원 정보 수정</h4>
              <h6 class="font-weight-light">패스워드, 이름, 이메일을<br/> 변경할 수 있습니다.</h6>
              
<!----------------------------------------------------------------------------------------------->
              <form action="./revise.do" method="post" name="registerFrm" class="pt-3"
              		onsubmit="return validateForm(this);">
              	<input type="hidden" name="prevPass" value="${dto.pass }"/>
                <div class="form-group">
                  <input type="text" name="id" class="form-control form-control-lg" id="exampleInputId1" placeholder="ID" value="${dto.id }" readonly>
                </div>
                <div class="form-group">
                  <input type="password" name="pass" class="form-control form-control-lg" id="exampleInputPassword1" placeholder="Password" value="${dto.pass }">
                </div>
                <!-- <div class="form-group">
                  <input type="password" class="form-control form-control-lg" id="exampleInputPassword1" placeholder="Password Check">
                </div> -->
                <div class="form-group">
                  <input type="text" name="name" class="form-control form-control-lg" id="exampleInputUsername1" placeholder="Username" value="${dto.name }">
                </div>
                <div class="form-group">
                  <input type="email" name="email" class="form-control form-control-lg" id="exampleInputEmail1" placeholder="Email" value="${dto.email }">
                </div>
                <div class="mt-3">
                  <input type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" value="Revise Info"/>
<!--                   <a class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" href="../../index.html">SIGN UP</a> -->
                </div>
                <div class="text-center mt-4 font-weight-light">
                  <a href="index.jsp" class="text-primary">메인 화면으로 가기</a>
                </div>
              </form>
<!----------------------------------------------------------------------------------------------->

            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="<%=request.getContextPath() %>/vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="<%=request.getContextPath() %>/js/off-canvas.js"></script>
  <script src="<%=request.getContextPath() %>/js/hoverable-collapse.js"></script>
  <script src="<%=request.getContextPath() %>/js/template.js"></script>
  <script src="<%=request.getContextPath() %>/js/settings.js"></script>
  <script src="<%=request.getContextPath() %>/js/todolist.js"></script>
  <!-- endinject -->
</body>

</html>
