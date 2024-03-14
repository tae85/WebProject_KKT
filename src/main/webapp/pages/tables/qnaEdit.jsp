<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/vendors/feather/feather.css">
  <link rel="stylesheet" href="<%= request.getContextPath() %>/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="<%= request.getContextPath() %>/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="<%= request.getContextPath() %>/vendors/select2/select2.min.css">
  <link rel="stylesheet" href="<%= request.getContextPath() %>/vendors/select2-bootstrap-theme/select2-bootstrap.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="<%= request.getContextPath() %>/images/favicon.png" />
<style>
table {
	width: 100%;
	border-collapse: separate;
	border-spacing: 0 15px;
}
</style>
<script type="text/javascript">
function validateForm(form) {  // 필수 항목 입력 확인
    if (form.title.value == "") {
        alert("제목을 입력하세요.");
        form.title.focus();
        return false;
    }
    if (form.contents.value == "") {
        alert("내용을 입력하세요.");
        form.contents.focus();
        return false;
    }
}
</script>
</head>

<body>
  <div class="container-scroller">
    <!-- partial:../../partials/_navbar.html -->
    <%@ include file="../samples/nav.jsp" %>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:../../partials/_settings-panel.html -->
      <%@ include file="../samples/sidebar.jsp" %>
      
      <!-- partial -->
      <div class="main-panel">        
        <div class="content-wrapper">
          <div class="row">
            <div class="col-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">게시물 수정</h4>
                  <p class="card-description">
                    게시물 수정
                  </p>
                  <form name="wirteFrm" method="post" action="qnaEdit.do" 
                  		onsubmit="return validateForm(this);" class="forms-sample">
                  	<input type="hidden" name="no" value="${ dto.no }" />
                  	<table>
                  	  <tbody>
                  	  	<tr>
                  	  	  <td>
	                        <label for="exampleInputName1">제목</label>
	                        <input name="title" type="text" value="${ dto.title }" class="form-control" id="exampleInputName1"/>
                  	  	  </td>
                  	  	  <td style="width: 130px;">
                     	    <label for="exampleInputEmail3">작성자</label>
                      		<input name="id" type="text" value="${dto.id }" readonly class="form-control" id="exampleInputEmail3"/>
                  	  	  </td>
                  	  	</tr>
                  	  </tbody>
                  	</table>
                    <div class="form-group">
                      <label for="exampleTextarea1">내용</label>
                      <textarea name="contents" class="form-control" id="exampleTextarea1" rows="10">${ dto.contents }</textarea>
                    </div>
                    <div style="display: flex; justify-content: space-between;">
	                   	<div>
	    	                <button type="reset" class="btn btn-light" onclick="window.history.back()">뒤로가기</button>
	                   	</div>
                    	<div>
		                    <button type="submit" class="btn btn-primary mr-2">수정하기</button>
                    	</div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
            </div>
        </div>
        <!-- content-wrapper ends -->
        <!-- partial:../../partials/_footer.html -->
        <footer class="footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2021.  Premium <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap admin template</a> from BootstrapDash. All rights reserved.</span>
            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted & made with <i class="ti-heart text-danger ml-1"></i></span>
          </div>
        </footer>
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="<%= request.getContextPath() %>/vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="<%= request.getContextPath() %>/vendors/typeahead.js/typeahead.bundle.min.js"></script>
  <script src="<%= request.getContextPath() %>/vendors/select2/select2.min.js"></script>
  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="<%= request.getContextPath() %>/js/off-canvas.js"></script>
  <script src="<%= request.getContextPath() %>/js/hoverable-collapse.js"></script>
  <script src="<%= request.getContextPath() %>/js/template.js"></script>
  <script src="<%= request.getContextPath() %>/js/settings.js"></script>
  <script src="<%= request.getContextPath() %>/js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="<%= request.getContextPath() %>/js/file-upload.js"></script>
  <script src="<%= request.getContextPath() %>/js/typeahead.js"></script>
  <script src="<%= request.getContextPath() %>/js/select2.js"></script>
  <!-- End custom js for this page-->
</body>
</html>