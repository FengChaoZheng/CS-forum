<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发布公告</title>
</head>

<body>
<form id="form_publish" name="form_publish" method="post" action="../../publishNotice.do">
  <table align="center">
  <tr>
  <td align="right" valign="top">公告：</td>
  <td><textarea name="content" id="content" cols="45" rows="5"></textarea></td>
  </tr>
  <tr><td></td><td align="left"><input type="submit" value="发布"/></td></tr>
  </table>
</form>
</body>
</html>
