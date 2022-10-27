<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>          
           <div class="card" style="min-height: 500px;max-height: 1000px;">
               <div class="card-body">
                 <c:if test="${empty m}">
                 <h4 class="card-title">GUST</h4>
                 <p class="card-text">회원님 Welcome!</p>
                 <form action="login.do" method="post">
                    <div class="form-group">
                      <label for="memId">아이디</label>
                      <input type="text" class="form-control" name="memId"/>
                    </div>
                    <div class="form-group">
                      <label for="memPwd">비밀번호</label>
                      <input type="password" class="form-control" name="memPwd"/>
                    </div>
                    <button type="submit" class="btn btn-sm btn-primary form-control">로그인</button>
                 </form>
                 </c:if>
                 <c:if test="${!empty m}">
                   <h4 class="card-title">${m.memName}</h4>
                   <p class="card-text">회원님 Welcome!</p>
                   <form action="logout.do">  
                    <button type="submit" class="btn btn-sm btn-primary form-control">로그아웃</button>
                   </form>
                 </c:if>
               </div>
            </div>