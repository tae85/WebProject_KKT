<%@page import="utils.CookieManager"%>
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
		  form.id.focus();
		  return false;
	  }
	  if(!form.pass.value) {
		  alert("패스워드를 입력하세요.");
		  form.pass.focus();
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
              <h4>안녕하세요!!</h4>
              <h6 class="font-weight-light">아이디와 패스워드를 입력해주세요.</h6>
              
<!----------------------------------------------------------------------------------------------->
              <form action="login.do" method="post" name="loginFrm" class="pt-3"
              		onsubmit="return validateForm(this);">
                <div class="form-group">
                	<!-- email -> text -->
                  <input type="text" name="id" class="form-control form-control-lg" id="exampleInputEmail1" placeholder="User ID" value="${cookieLogin }">
                </div>
                <div class="form-group">
                  <input type="password" name="pass" class="form-control form-control-lg" id="exampleInputPassword1" placeholder="Password">
                </div>
                <div class="mt-3">
                  <!-- <a class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" href="../../index.html">SIGN IN</a> -->
                  <input type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" value="LOGIN" />
                </div>
                <div class="my-2 d-flex justify-content-between align-items-center">
                  <div class="form-check">
                    <label class="form-check-label text-muted">
                      <input name="cookieCheck" type="checkbox" class="form-check-input" value="Y" "${ cookieCheck }" />
                      아이디 저장하기
                    </label>
                  </div>
                  <a href="#" class="auth-link text-black">Forgot password?</a>
                </div>
                <div class="mb-2">
                  <button type="button" class="btn btn-block btn-facebook auth-form-btn">
                    <i class="ti-facebook mr-2"></i>Connect using facebook
                  </button>
                </div>
                <div class="text-center mt-4 font-weight-light">
                  Don't have an account? <a href="register.do" class="text-primary">Create</a>
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
