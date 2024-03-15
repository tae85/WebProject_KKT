<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Skydash Admin</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="<%= request.getContextPath() %>/vendors/feather/feather.css">
  <link rel="stylesheet" href="<%= request.getContextPath() %>/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="<%= request.getContextPath() %>/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="<%= request.getContextPath() %>/images/favicon.png" />
<style>
td, th {
	text-align:center;
}
</style>
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
      <!-- 검색 폼 -->
	    <!-- <form method="get">  
	    <table border="1" width="90%">
	    <tr>
	        <td align="center">
	            <select name="searchField">
	                <option value="title">제목</option>
	                <option value="content">내용</option>
	                <option value="name">작성자</option>
	            </select>
	            <input type="text" name="searchWord" />
	            <input type="submit" value="검색하기" />
	        </td>
	    </tr>
	    </table>
	    </form> -->
<!------------------------------------------------------------------------------------------>
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">QnA 게시판</h4>
                  <p class="card-description">
                    QnA Board
                  </p>
                  <div class="table-responsive">
                    <table class="table table-striped" style="margin-bottom:15px">
                      <thead>
                        <tr>
                          <th style="width:100px;">
                            No.
                          </th>
                          <th>
                            제 목
                          </th>
                          <th style="width:120px;">
                            작성자
                          </th>
                          <th style="width:130px;">
                            작성일
                          </th>
                          <th style="width:100px;">
                            조회수
                          </th>
                        </tr>
                      </thead>
                      <tbody>
                      
                      	<!-- 반복문 -->
				<c:choose>
					<c:when test="${ empty boardLists }">
						<tr>
				            <td colspan="6" align="center">
				                등록된 게시물이 없습니다^^*
				            </td>
				        </tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${ boardLists }" var="row" varStatus="loop">
							<tr>
		                         <td class="py-1">
		                           ${ map.totalCount - (((map.pageNum - 1) * map.pageSize) + loop.index) }
		                         </td>
		                         <td>
		                         	<!-- <a href="qnaView.do"> -->
		                         	<a href="qnaView.do?no=${ row.no }">
		                            ${ row.title }
		                         	</a>
		                         </td>
		                         <td>
		                           ${ row.id }
		                         </td>
		                         <td>
		                           ${ row.postdate }
		                         </td>
		                         <td>
		                           ${ row.visitcount }
		                         </td>
		                       </tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
                        <!-- 반복문 -->
                      </tbody>
                    </table>
                    
                    <!-- 페이지네이션 -->
                    <table width="100%">
				        <tr align="center">
				            <td>
				                ${ map.pagingImg }
				            </td>
				            <td width="100"><button position="right" type="button" class="btn btn-primary btn-sm"
				                onclick="location.href='qnaWrite.do';">글쓰기</button></td>
				        </tr>
				    </table>
                    <!-- 페이지네이션 -->
                    
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
<!------------------------------------------------------------------------------------------>

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
  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="<%= request.getContextPath() %>/js/off-canvas.js"></script>
  <script src="<%= request.getContextPath() %>/js/hoverable-collapse.js"></script>
  <script src="<%= request.getContextPath() %>/js/template.js"></script>
  <script src="<%= request.getContextPath() %>/js/settings.js"></script>
  <script src="<%= request.getContextPath() %>/js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <!-- End custom js for this page-->
</body>

</html>
