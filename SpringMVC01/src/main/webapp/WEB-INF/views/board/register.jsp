<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript">
   $(document).ready(function(){
	  $("button").on("click",function(e){
		  var oper=$(this).data("oper"); // data-oper="reg"
		  var frm=$("#frm");
		  if(oper=="reg"){
			  // form을 전송하는 코드
			  frm.submit();
		  }else if(oper=="reset"){
			  // 폼초기화
			  frm[0].reset();
		  }else if(oper=="list"){
			 location.href="list.do"; 
		  }
	  }); 
   });
  </script> 
</head>
<body>
<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1>Bootstrap Tutorial</h1>
    <p>Bootstrap is the most popular HTML, CSS...</p>
  </div>
</div> 
<div class="container">
  <h2>Spring MVC01</h2>
  <div class="card">
    <div class="card-header">BOARD</div>
    <div class="card-body">
		<form id="frm" action="insert.do" method="post">
		  <div class="form-group">
		    <label for="title">제목:</label>
		    <input type="text" class="form-control" placeholder="Enter title" name="title">
		  </div>
		  <div class="form-group">
		    <label for="content">내용:</label>
		    <textarea rows="7" class="form-control" name="content"></textarea> 
		  </div>
		  <div class="form-group">
		    <label for="writer">작성자:</label>
		    <input type="text" class="form-control" placeholder="Enter writer" name="writer">
		  </div>
		  <button type="button" data-oper="reg" class="btn btn-sm btn-primary">등록</button>
		  <button type="button" data-oper="reset" class="btn btn-sm btn-warning">취소</button>
		  <button type="button" data-oper="list" class="btn btn-sm btn-success">목록</button>
		</form>
    </div> 
    <div class="card-footer">AI.BigData 취업역량강화_박매일</div>
  </div>
</div>

</body>
</html>
    