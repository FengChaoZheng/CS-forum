<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>他山之石--看帖发帖页</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/foreground.css">
<script type="text/javascript">
function checkForm(){
	var str = "${userName}";
	if(str == ""){
		alert("请先登录！！！");
		document.form_content.action="<%=request.getContextPath()%>/toLogin.do?value=1";
		document.form_content.submit();
	}else if(document.form_content.title.value==""){
		alert("请输入标题！！");
		document.form_content.title.focus();
		return false;
	}else if(document.form_content.message.value==""){
		alert("请输入内容！！");
		document.form_content.message.focus();
		return false;
	}else{
		document.form_content.action = "<%=request.getContextPath()%>/publishContent.do?sectionName=${sectionName}";
		document.form_content.submit();
	}
}
</script>
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
            <td width="332"><a href="<%=request.getContextPath() %>/toIndex.do?value=1">
              <img src="<%=request.getContextPath() %>/img/logo.jpg" style="width:150px"/>
            </a></td>
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
        <c:if test="${pageNo>1}"> <a href="<%= request.getContextPath() %>/listContent.do?pageNo=1">第一页</a> <a href="<%= request.getContextPath() %>/listContent.do?pageNo=${pageNo-1}">上一页</a> </c:if>
        <c:if test="${pageNo!=pageCount}"> <a href="<%= request.getContextPath() %>/listContent.do?pageNo=${pageNo+1}">下一页</a> <a href="<%= request.getContextPath() %>/listContent.do?pageNo=${pageCount}">最后一页</a> </c:if>
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
        <c:if test="${pageNo>1}"> <a href="listContent.do?pageNo=1">第一页</a> <a href="listContent.do?pageNo=${pageNo-1}">上一页</a> </c:if>
        <c:if test="${pageNo!=pageCount}"> <a href="listContent.do?pageNo=${pageNo+1}">下一页</a> <a href="listContent.do?pageNo=${pageCount}">最后一页</a> </c:if>
        <br>
      </c:if>
      <c:if test="${pageCount==0}">
        <p>目前没有记录</p>
      </c:if>
    </div>
    <div class="div_submit">
      <form id="form_content" name="form_content" method="post">
        <table width="100%">
        	<tr>
            	<td align="right" valign="middle">标题：</td>
                <td align="left" valign="middle"><input type="text" name="title" id="title"/></td>
            </tr>
            <tr>
            	<%if(session.getAttribute("userName") != null){ %>
            	<td align="right" valign="top">内容：</td>
                <td align="left" valign="top"><textarea name="message" id="message" cols="50" rows="6"></textarea></td>
                <%}else{ %>
                <td align="right" valign="top">内容：</td>
                <td align="left" valign="top"><textarea name="message" id="message" cols="50" rows="6"></textarea></td>
                <%} %>
            </tr>
            <tr>
            	<td></td>
                <td><input type="button" name="publish" value="发布" onclick="checkForm()"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="clear" value="取消"/></td>
            </tr>
        </table>
      </form>
    </div>
  </div>
  <div class="div_bottom">
    <p>Powerd by ZhengFengchao!<br>
      Friday, 2016-04-22  19:15</p>
  </div>
</div>
</body>
</html>