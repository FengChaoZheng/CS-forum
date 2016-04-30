<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.forum.model.User" %>
<%@ page import="com.forum.dao.UserDao,com.forum.dao.UserDaoImp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>他山之石--注册页</title>
<style type="text/css">
a:link{
    text-decoration:none;
}
a:visited {
    text-decoration: none;
}
a:hover {
   text-decoration: none;
}
a:active {
    text-decoration: none;
}
.div_main {
	background-color: #FFFFFF;
	text-align: center;
	vertical-align: middle;
	width: 100%;
}
.div_collect{
	background-color: #CCC;
}
.div_collect_content {
	text-align: left;
	vertical-align: middle;
	margin-right: 15%;
	margin-left: 15%;
	padding-bottom: 5px;
	padding-top: 5px;
}
.div_logo{
	background-color: #FFF;
	text-align: left;
	vertical-align: middle;
	margin-right: 15%;
	margin-left: 15%;
}
.table_logo{
	vertical-align: middle;
	width: 100%;
}
.div_bottom {
	background-color: #CCC;
	margin-top: 20px;
	padding: 5px;
}
.div_sub {
	margin-right: 15%;
	margin-left: 15%;
	text-align: center;
	padding-bottom:200px;
}
.div_sub_title {
	background-color: #66ffff;
	padding-bottom:3px;
	padding-top:3px;
	border-left-style:solid;
	border-right-style:solid;
	border-left-width:thin;
	border-right-width:thin;
	margin-bottom:200px;
}
</style>
<script type="text/javascript">
function SubmitForm(){	
    if(document.form_register.username.value==""){
	  alert("用户名不可用");
	  document.form_register.username.focus();
	}else if(document.form_register.password.value==""){
	  alert("密码长度应该大于等于6并且小于等于12");
	  document.form_register.password.focus();
	}else if(document.form_register.email.value==""){
	  alert("邮箱不能为空!");
	  document.form_register.email.focus();
	}else{
	  alert(document.form_register.authority.value);
	  document.form_register.action = "../userRegister.do";
	  document.form_register.submit();	
	}
}
function emailAvailable(){
	var str = document.form_register.email.value;
    var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
    if(str==""){
	   alert("邮箱不能为空!");
	   document.form_register.email.focus();
       return false;
	}else if(!reg.test(str)){
       alert("邮箱格式不正确!");
	   document.form_register.email.value="";
	   document.form_register.email.focus();
       return false;
    }
    return true;
}
function nameAvailable(){
	var name = document.form_register.username.value;
	var str = "23";
	if(name==str){
		alert("用户名不可用");
		document.form_register.username.value="";
		document.form_register.username.focus();
	}else if(name==""){
		alert("用户名不能为空");
		document.form_register.username.focus();
	}
}
function passwordAvailable(){
	var passwordLength = document.form_register.password.value.length;
	if(passwordLength<6 || passwordLength>12){
		alert("密码长度应该大于等于6并且小于等于12");
		document.form_register.password.value="";
		document.form_register.password.focus();
	}
}
function checkcodeAvailabe(){
	var cd = document.form_register.checkcode.value;
	var str = <%=session.getAttribute("checkCode")%>;
	if(cd==str){
		alert("验证码不正确");
		document.form_register.checkcode.value="";
		document.form_register.checkcode.focus();
	}
}
</script>
</head>

<body>
<div class="div_main">
  <div class="div_collect">
    <div class="div_collect_content"> 
    设为首页 &nbsp;&nbsp;
    收藏本站
    </div>
  </div>
  
  <div class="div_list">
    <div class="div_logo">
    <form id="form_logo" name="form_logo" method="post" action="">
      <table width="327" border="0" class="table_logo">
        <tr>
          <td width="332">
            <a href="../toIndex.do?value=1">
              <img src="../img/logo.jpg" style="width:150px"/>
            </a>
          </td>
          
        </tr>
        
      </table>
      </form>
    </div>
  </div>
  
  <div class="div_center">
  <form id="form_register" name="form_register" method="post">
    <div class="div_sub">
      <div class="div_sub_title">
        <table width="100%">
          <tr>
            <td align="left"><b>注册</b></td>
            <td align="right"><a href="../toLogin.do?value=1"><b>已有账号？现在登录</b></a></td>
          </tr>
        </table>
      </div>
      <table align="center">
        <tr>
          <td width="92" height="30px" align="right">用户名：</td>
          <td colspan="3" align="left">
            <input type="text" name="username" id="username" onblur="nameAvailable()"/>
          </td>
        </tr>
        <tr>
          <td width="92" height="30px" align="right">性别：</td>
          <td colspan="3" align="left">
            <input type="radio" name="sex" id="boy" value="男" checked="checked"/>
            <label for="boy">男</label>
            <input type="radio" name="sex" id="girl" value="女" />
            <label for="girl">女</label>
          </td>
        </tr>
        <tr>
          <td width="92" height="30px" align="right">密码：</td>
          <td colspan="3" align="left">
            <input name="password" type="password" id="password" onblur="passwordAvailable()"/>
          </td>
        </tr>
        <tr>
          <td width="92" height="30px" align="right">邮箱：</td>
          <td colspan="3" align="left">
            <input name="email" type="text" id="email" onblur="emailAvailable()"/>
          </td>
        </tr>
        <tr>
          <td width="92" height="30px" align="right">验证码：</td>
          <td width="177" align="left">
            <input name="checkcode" type="text" id="checkcode" onblur="checkcodeAvailabe()"/>
          </td>
          <td width="66px">
            <img border="0" src="../checkcode.do"/>
          </td>
          <td width="65">
            <a href="../changeCheckcode.do">
              <input name="changeCheckcode" type="button" id="changeCheckcode" value="换一换"/>
            </a>
          </td>
        </tr>
        <tr style="visibility: hidden;">
          <td width="92" height="30px" align="right">权限：</td>
          <td colspan="3" align="left">
            <input name="authority" type="text" id="authority" value="普通会员"/>
          </td>
        </tr>
        <tr>
          <td width="25%" height="35px"></td>
          <td colspan="3" width="75%" align="left" valign="middle">
          	<input type="button" name="register" id="register" value="注册" onclick="SubmitForm()"/>
          </td>
        </tr>
      </table>
    </div>
    </form>
  </div>
  <div class="div_bottom">
  <p>Powerd by ZhengFengchao!<br>
  Friday, 2016-04-22  19:15</p>
  </div>

</div>
</body>
</html>
