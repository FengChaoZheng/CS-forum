<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>资料上传</title>
<script language="javascript">
function checkUpload(){
	if(document.form_document.data.value == ""){
		alert("请选择上传文件");
	}else{
		document.form_document.action = "../../publishDocument.do";
		document.form_document.submit();
	}
}
</script>
<%if(session.getAttribute("uploadMessage") != null){
	  out.print("<script language='javascript'>");
	  out.print("alert('"+session.getAttribute("uploadMessage")+"')");
	  out.print("</script>");
	  session.removeAttribute("uploadMessage");
  }%>
</head>

<body>
<form id="form_document" name="form_document" enctype="multipart/form-data" method="post">
<table>
<tr>
  <td align="right" valign="top">上传资料：</td>
  <td><input type="file" name="data" id="data" /></td>
  </tr>
  <tr>
  <td>&nbsp;</td><td align="left"><input type="button" value="上传" id="upload" name="upload" onclick="checkUpload()"/></td>
  </tr>
  </table>
</form>
</body>
</html>
