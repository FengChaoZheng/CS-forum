<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>资料上传</title>
</head>

<body>
<form id="form_document" name="form_document" enctype="multipart/form-data" method="post" action="../../publishDocument.do">
<table>
<tr>
  <td align="right" valign="top">上传资料：</td>
  <td><input type="file" name="data" id="data" /></td>
  </tr>
  <tr>
  <td>${message }</td><td align="left"><input type="submit" value="上传"/></td>
  </tr>
  </table>
</form>
</body>
</html>
