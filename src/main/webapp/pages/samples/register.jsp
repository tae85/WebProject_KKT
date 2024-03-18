<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Skydash Admin</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
  	if(!form.name.value) {
	 	alert("이름을 입력하세요.");
	  	form.name.focus();
	  	return false;
  	}
  	if(!form.email.value) {
	  	alert("이메일을 입력하세요.");
	  	form.email.focus();
	  	return false;
  	}
  	if(!form.agree.checked) {
	 	 alert("하단의 동의 버튼을 체크해주세요.");
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
              <h3>회원 가입</h3>
              <h6 class="font-weight-light">아래 항목들을 모두 기입해주세요.</h6>
              
<!----------------------------------------------------------------------------------------------->
              <form action="./register.do" method="post" name="registerFrm" class="pt-3"
              		onsubmit="return validateForm(this);">
                <div class="form-group">
                  <span id="idResult"></span>
                  <input type="text" name="id" class="form-control form-control-lg" id="exampleInputId1" placeholder="ID">
                </div>
                <div class="form-group">
                  <span id="pwdResult"></span>
                  <input type="password" name="pass" class="form-control form-control-lg" id="exampleInputPassword1" placeholder="Password">
                </div>
                <!-- <div class="form-group">
                  <input type="password" class="form-control form-control-lg" id="exampleInputPassword1" placeholder="Password Check">
                </div> -->
                <div class="form-group">
                  <input type="text" name="name" class="form-control form-control-lg" id="exampleInputUsername1" placeholder="Username">
                </div>
                <div class="form-group">
                  <input type="email" name="email" class="form-control form-control-lg" id="exampleInputEmail1" placeholder="Email">
                </div>
                <div class="mb-4">
                  <div class="form-check">
                    <label class="form-check-label text-muted">
                      <input name="agree" type="checkbox" class="form-check-input">
                      I agree to all Terms & Conditions
                    </label>
                  </div>
                </div>
                <div class="mt-3">
                  <input type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" value="SIGN UP"/>
<!--                   <a class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" href="../../index.html">SIGN UP</a> -->
                </div>
                <div class="text-center mt-4 font-weight-light">
                  Already have an account? <a href="./login.do" class="text-primary">Login</a>
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
<script type="text/javascript">
$("#exampleInputPassword1").on("keyup", function(){
	var a = $("#exampleInputPassword1").val();
	var regex = /^[A-Za-z0-9_]{4,10}/;
	/* if(!regex.exec(a)){ */
	if(!regex.test(a)){
		$("#pwdResult").html("비밀번호 형식에 맞지 않습니다");
		return;
	}
	else {
		$("#pwdResult").html("비밀번호 형식OK");
	}
});


  
</script>
</body>

</html>
