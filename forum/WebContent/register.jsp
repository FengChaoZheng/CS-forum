<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>论坛注册页面</title>
<style type="text/css">
.div_register {
	text-align: center;
	vertical-align: middle;
	border-top-width: 50px;
	border-bottom-width: 50px;
	padding-top: 50px;
	padding-bottom: 50px;
	position: relative;
	visibility: visible;
	height: 30%;
	width: 40%;
	left: 30%;
	top: 200px;
	right: 30%;
	bottom: 35%;
	background-color: #66FFFF;
}
</style>

<script language="javascript">
function CheckForm(){
	if(document.form_register.username.value == ""){
		alert("用户名不能为空");
		document.form_register.username.focus();
	}else if(document.form_register.password.value == ""){
		alert("密码不能为空");
		document.form_register.password.focus();
	}else if(document.form_register.email.value == ""){
		alert("邮箱不能为空");
		document.form_register.email.focus();
	}else{
		document.form_register.action = "userRegister.do";
		document.form_register.submit();
	}
}
</script>

</head>

<body>
<form id="form_register" name="form_register" method="post">
  <div class="div_register">
    <table width="260" align="center">
      <tr>
        <td width="72" align="right">用户名：</td>
        <td width="172"><label for="username"></label>
        <input type="text" name="username" id="username" /></td>
      </tr>
      <tr>
        <td align="right">密码：</td>
        <td><label for="password"></label>
        <input name="password" type="password" id="password" /></td>
      </tr>
      <tr>
        <td align="right">邮箱：</td>
        <td><label for="email"></label>
        <input name="email" type="text" id="email" /></td>
      </tr>
      <tr>
        <td colspan="2" align="center" valign="middle"><input type="button" name="register" id="register" value="注册" onclick="CheckForm()"/></td>
      </tr>
    </table>
  </div>
</form>
</body>
</html>