<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公告列表</title>
      <style>
        th,td{width:150px;border:2px solid gray;text-align:center;padding:2px 10px;}
        table{border-collapse:collapse;margin: 0px auto;}
        body{text-align:center;}
        a{text-decoration:none;}
      </style>
   </head>
   <body> 



    <c:if test="${pageCount>0}">
      <h2>所有公告信息</h2>
      共有${pageCount}页，这是第${pageNo}页。
      <c:if test="${pageNo>1}">
         <a href="listNotice.do?pageNo=1">第一页</a>
         <a href="listNotice.do?pageNo=${pageNo-1}">上一页</a>
      </c:if>
      <c:if test="${pageNo!=pageCount}">
         <a href="listNotice.do?pageNo=${pageNo+1}">下一页</a>
         <a href="listNotice.do?pageNo=${pageCount}">最后一页</a>
      </c:if>
      <table >
        <tr><th>公告编号</th><th>公告内容</th><th>发布人</th><th>操作</th></tr>
        <c:forEach items="${noticelist}" var="notice" >
         

           <tr>
            <td>${notice.id}</td>
            <td>${notice.content}</td>
            <td>${notice.userId}</td>
            <td>删除</td>
            </tr>

         
        </c:forEach>
      </table>
      <br>
    </c:if>
    <c:if test="${pageCount==0}">
       <p>目前没有记录</p>
    </c:if>
   
  </body>
</html>