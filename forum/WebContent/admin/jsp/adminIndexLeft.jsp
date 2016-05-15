<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>无标题文档</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/menuLink.css"/>
<script src="<%=request.getContextPath() %>/js/menuLink.js"></script>
</head>

<body>
<div class="left">
<table width="101%">
  <tr>
    <td><div> <a href="menu1.html" class="menuLink">用户管理</a>
      <ul class="menu" id="menu1">
        <li><a href="<%=request.getContextPath() %>/listUser.do" target="mainFrame">查看用户</a></li>
        <li><a href="<%=request.getContextPath() %>/listAuthority.do" target="mainFrame">权限管理</a></li>
        </ul>
    </div></td>
    </tr>
  <tr>
    <td><div> <a href="menu2.html" class="menuLink">模块管理</a>
      <ul class="menu" id="menu2">
        <li><a href="<%=request.getContextPath() %>/listSection.do" target="mainFrame">查看模块</a></li>
        <li><a href="<%=request.getContextPath() %>/listSection.do" target="mainFrame">添加模块</a></li>
        <li><a href="<%=request.getContextPath() %>/listSection.do" target="mainFrame">修改模块</a></li>
        <li><a href="<%=request.getContextPath() %>/listSection.do" target="mainFrame">删除模块</a></li>
        </ul>
    </div></td>
    </tr>
    <tr>
    <td><div> <a href="menu3.html" class="menuLink">资料管理</a>
      <ul class="menu" id="menu3">
        <li><a href="adminDocumentPublish.jsp" target="mainFrame">资料上传</a></li>
        <li><a href="<%=request.getContextPath() %>/listDocument.do?value=2" target="mainFrame">查看资料</a></li>
        </ul>
    </div></td>
    </tr>
  <tr>
    <td><div> <a href="menu4.html" class="menuLink">事务管理</a>
      <ul class="menu" id="menu4">
        <li><a href="adminNoticePublish.jsp" target="mainFrame">发布公告</a></li>
        <li><a href="<%=request.getContextPath() %>/listNotice.do?value=2" target="mainFrame">管理公告</a></li>
        <li><a href="<%=request.getContextPath() %>/listNotice.do?value=2" target="mainFrame">添加友链</a></li>
        <li><a href="<%=request.getContextPath() %>/listNotice.do?value=2" target="mainFrame">管理友链</a></li>
        </ul>
    </div></td>
  </tr>
  
</table>
</div>
</body>
</html>
