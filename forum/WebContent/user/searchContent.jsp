<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>他山之石--搜索结果页</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/foreground.css">
</head>
<body>
<div class="div_main">
  <div class="div_collect">
    <div class="div_collect_content"> 设为首页 &nbsp;&nbsp;
      收藏本站 </div>
  </div>
  <div class="div_list">
    <div class="div_logo">
      <form id="form_logo" name="form_logo" method="post" action="">
        <table width="327" border="0" class="table_logo">
          <tr>
            <td width="332"><input type="image" name="logo" id="logo" src="<%=request.getContextPath() %>/img/logo.jpg" style="width:150px"/></td>
          </tr>
        </table>
      </form>
    </div>
  </div>
  <div class="div_center">
    <div class="div_sub"  style="height: 460px;">
      <div class="div_sub_title">
        <table width="100%">
          <tr>
            <td align="left"><b>${sectionName}</b></td>
            <td colspan="3" align="right"><a href="<%= request.getContextPath() %>/toIndex.do?value=1"><b>返回首页</b></a></td>
          </tr>
        </table>
      </div>
      <c:if test="${pageCount>0}">
        共有${pageCount}页，这是第${pageNo}页。
        <c:if test="${pageNo>1}"> <a href="<%= request.getContextPath() %>/listContent.do?pageNo=1&value=2">第一页</a> <a href="<%= request.getContextPath() %>/listContent.do?pageNo=${pageNo-1}&value=2">上一页</a> </c:if>
        <c:if test="${pageNo!=pageCount}"> <a href="<%= request.getContextPath() %>/listContent.do?pageNo=${pageNo+1}&value=2">下一页</a> <a href="<%= request.getContextPath() %>/listContent.do?pageNo=${pageCount}&value=2">最后一页</a> </c:if>
        <table class="table_document">
          <tr>
            <th>发帖人</th>
            <th>标题</th>
            <th>内容</th>
            <th>发布时间</th>
          </tr>
          <c:forEach items="${contentlist}" var="content" >
            <tr>
              <td>${content.userName}</td>
              <td>${content.title}</td>
              <td>${content.message}</td>
              <td>${content.postTime}</td>
            </tr>
          </c:forEach>
        </table>
        共有${pageCount}页，这是第${pageNo}页。
        <c:if test="${pageNo>1}"> <a href="listContent.do?pageNo=1&value=2">第一页</a> <a href="listContent.do?pageNo=${pageNo-1}&value=2">上一页</a> </c:if>
        <c:if test="${pageNo!=pageCount}"> <a href="listContent.do?pageNo=${pageNo+1}&value=2">下一页</a> <a href="listContent.do?pageNo=${pageCount}&value=2">最后一页</a> </c:if>
        <br>
      </c:if>
      <c:if test="${pageCount==0}">
        <p>目前没有记录</p>
      </c:if>
    </div>
    
  </div>
  <div class="div_bottom">
    <p>Powerd by ZhengFengchao!<br>
      Friday, 2016-04-22  19:15</p>
  </div>
</div>

</body>
</html>