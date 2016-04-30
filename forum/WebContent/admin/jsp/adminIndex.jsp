<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>他山之石--后台首页</title>
</head>
<frameset rows="100,*,80" cols="*" frameborder="no" border="0" framespacing="0">
  <frame src="adminIndexTop.jsp" name="topFrame" scrolling="no" id="topFrame" title="topFrame" />
  <frameset cols="200,*" frameborder="no" border="0" framespacing="0">
    <frame src="adminIndexLeft.jsp" name="leftFrame" scrolling="no" noresize="noresize" id="leftFrame" title="leftFrame" />
    <frame src="adminIndexRight.jsp" name="mainFrame" id="mainFrame" title="mainFrame" scrolling="auto"/>
  </frameset>
  <frame src="adminIndexBottom.jsp" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" title="topFrame" />
</frameset>
<noframes><body>
</body></noframes>
</html>