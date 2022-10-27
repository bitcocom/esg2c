<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript">
    $(document).ready(function(){
    	$("button[data-oper='register']").click(function(){
    		location.href="register.do";
    	});
    });  
    function delPopup(){
		//alert("삭제된 게시물 입니다.");
		// jQuery model 띄우기? id="myModal"
		$("#myModal").modal("show");		
				
	}
  </script>
</head>
<body>
 
  <div class="card">
    <div class="card-header">
		<div class="jumbotron jumbotron-fluid">
		  <div class="container">
		    <h1>Spring Framework!!</h1>
		    <p>Bootstrap is the most popular HTML, CSS...</p>
		  </div>
		</div>
    </div>
    <div class="card-body">
      <div class="row">
         <div class="col-lg-2">
            <jsp:include page="left.jsp"/>
         </div>
         <div class="col-lg-7">
            <div class="card" style="min-height: 500px;max-height: 1000px;">
               <div class="card-body">
                  <h4 class="card-title">BOARD</h4>
                  <!-- 게시판 리스트보기 화면 구현 -->
		        <table class="table table-hover">
		        <thead>
		           <th>번호</th>
		           <th>제목</th>
		           <th>작성자</th>
		           <th>작성일</th>
		           <th>조회수</th>
		        </thead>
		        <tbody>
		          <c:forEach var="vo" items="${list}">
		          <tr>
		            <td>${vo.idx}</td>
		            <td>
		            <c:if test="${vo.blevel>0}">
		               <c:forEach begin="1" end="${vo.blevel}">
		                  <span style="padding-left: 15px"></span>		                  
		               </c:forEach>
		               <i class="bi bi-arrow-return-right"></i>
		               [RE]
		            </c:if> 
		            <c:if test="${vo.bdelete!=1}">
		              <a href="get.do?idx=${vo.idx}">${vo.title}</a>
		            </c:if>
		            <c:if test="${vo.bdelete==1}">
		              <a href="javascript:delPopup()">삭제된 게시물 입니다.</a>
		            </c:if>
		            </td>
		            <td>${vo.writer}</td>
		            <td><fmt:formatDate value="${vo.indate}"  pattern="yyyy-MM-dd"/></td>
		            <td>${vo.count}</td>
		          </tr>
		          </c:forEach>
		        </tbody>
		      </table>  
		      <c:if test="${!empty m}">
		        <button data-oper="register" class="btn btn-sm btn-default">글쓰기</button>
              </c:if>
             </div>
            </div> 
         </div>
         <div class="col-lg-3">
             <jsp:include page="right.jsp"/>
         </div>
      </div>    
    </div> 
    <div class="card-footer">AI.BigData 취업역량강화_박매일</div>
  </div>
	<!-- The Modal -->
	<div class="modal" id="myModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">Message</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	        삭제된 게시물 입니다.
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	      </div>
	
	    </div>
	  </div>
	</div>
</body>
</html>  