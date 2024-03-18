<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

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
  <link rel="stylesheet" href="<%= request.getContextPath() %>/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="<%= request.getContextPath() %>/vendors/select2/select2.min.css">
  <link rel="stylesheet" href="<%= request.getContextPath() %>/vendors/select2-bootstrap-theme/select2-bootstrap.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="<%= request.getContextPath() %>/images/favicon.png" />
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
table {
	width: 100%;
	border-collapse: separate;
	border-spacing: 0 15px;
}

</style>
<script>
function goDelete() {
    var confirmed = confirm("정말로 삭제하겠습니까?"); 
    if (confirmed) {
        var form = document.writeFrm;      
        form.method = "post"; 
        form.action = "./fileDelete.do"; 
        form.submit();         
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
                  <h4 class="card-title">게시물 상세 보기</h4>
                  
                  <form name="writeFrm" method="post"
                  		action="./fileEdit.do" class="forms-sample">
                  <!-- <form name="writeFrm" class="forms-sample"> -->
                  	<input type="hidden" name="no" value="${ dto.no }" />
                  	<table>
                  	  <tbody>
                  	    <tr>
                  		  <td>
                      		<label for="exampleInputName1">제목</label>
                      		<input type="text" class="form-control" id="exampleInputName1" value="${ dto.id }" readonly />
                  		  </td>
                  		  <td style="width: 130px;">
                      		<label for="exampleInputCity1">조회수</label>
                      		<input type="text" class="form-control" id="exampleInputCity1" value="${ dto.visitcount }" readonly />
                  		  </td>
                  		</tr>
                  		<tr>
                  		  <td>
	                        <label for="exampleInputEmail3">작성자</label>
	                        <input type="text" class="form-control" id="exampleInputEmail3" value="${ dto.title }" readonly />
                  		  </td>
                  		  <td style="width: 130px;">
                      		<label for="exampleInputPassword4">작성일</label>
                     		<input type="text" class="form-control" id="exampleInputPassword4" value="${ dto.postdate }" readonly />
                  		  </td>
                  		</tr>
                  		<tr>
                  		  <td>
                  			<label for="exampleInputPassword4">
                  				첨부파일
                  			<c:if test="${ not empty dto.ofile }">
					        	<%-- <a href="./download.do?ofile=${ dto.ofile }&sfile=${ dto.sfile }&no=${ dto.no }">
					        		[다운로드]
					        	</a> --%>
					          <button type="button" class="btn btn-outline-info btn-icon-text btn-sm">
	                            <i class="ti-download btn-icon-prepend"></i>                                                    
	                            다운로드
	                          </button>
				        	</c:if>
                  			</label>
					        <input type="text" class="form-control" id="exampleInputPassword4" value="${ dto.ofile }" readonly />
                  		  </td>
                  		  <td style="width: 130px; padding-top:13px">
                  		  <label for="exampleInputPassword4">다운로드수</label>
                  		  <input type="text" class="form-control" id="exampleInputPassword4" value="${ dto.downcount }" readonly />
                  		  </td>
                  		</tr>
                  	  </tbody>
                  	</table>
                  	
                    <div class="form-group">
                      <label for="exampleTextarea1">내용</label>
                      <textarea class="form-control" id="exampleTextarea1" rows="14" readonly >${ dto.contents }</textarea>
                    </div>
                    <c:if test="${ not empty dto.ofile and whatExt eq 'img' }">
		        		<br><img src="Uploads/${ dto.sfile }" style="max-width:100%;"/>
		        	</c:if>
                    <c:if test="${ not empty dto.ofile and whatExt eq 'video' }">
		        		<br><video src="Uploads/${ dto.sfile }" style="max-width:100%;" controls></video>
		        	</c:if>
                    <c:if test="${ not empty dto.ofile and whatExt eq 'audio' }">
		        		<br><audio src="Uploads/${ dto.sfile }" style="max-width:100%;" controls autoplay></audio>
		        	</c:if>
                    <div style="display: flex; justify-content: space-between; margin-top:30px">
                    	<div>
		                    <button type="button" class="btn btn-primary mr-2" onclick="location.href='./fileList.do';">목록</button>
                    	</div>
                    <c:if test="${ id eq dto.id }">
	                   	<div>
	    	                <button type="button" class="btn btn-outline-light" onclick="location.href='./fileEdit.do?no=${dto.no}';">수정</button>
		                    <button type="button" class="btn btn-outline-light" onclick="goDelete();" >삭제</button>
<!-- 		                    <button type="button" class="btn btn-light" onclick="location.href='./fileDelete.do';" >삭제</button> -->
	                   	</div>
                    </c:if>
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
  
  <script>
  function golikeAdd(mu_co_no) {
		var showmemId = $("#mem_id").val();
		console.log(showmemId);
		console.log(mu_co_no);
		
		$.ajax({
			url : "likeAddAction",
			type : "POST",
			data : {
				mu_co_no : mu_co_no,
				mem_id : showmemId
			},
			success : function(result) {
				$("#" + mu_co_no + "like")
						.attr("src",
								"${pageContext.request.contextPath}/image/likegreen.svg");
				$("#" + mu_co_no + "dislike")
						.attr("src",
								"${pageContext.request.contextPath}/image/001-dislike.svg");
			}
		});
	}
  </script>
</body>
</html>