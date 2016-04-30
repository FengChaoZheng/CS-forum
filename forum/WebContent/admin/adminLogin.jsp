<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>他山之石--后台登录页</title>
<style type="text/css">
a:link{text-decoration:none;}
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
<script language="javascript">
function checkForm(){	
    if(document.form_login.name.value==""){
	  alert("用户名不能为空!");
	  document.form_login.name.focus();
	}else if(document.form_login.password.value==""){
	  alert("密码长度应该大于等于6并且小于等于12");
	  document.form_login.password.focus();
	}else{
	  document.form_login.action = "../userLogin.do?value=2";
	  document.form_login.submit();	
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
            <a href="../toIndex.do">
              <img src="../img/logo.jpg" style="width:150px"/>
            </a>
          </td>
        </tr>
      </table>
      </form>
    </div>
  </div>
  
  <div class="div_center">
  
    <div class="div_sub">
      <div class="div_sub_title">
        <table width="100%">
          <tr>
            <td align="left"><b>登录</b></td>
            <td align="right"><a href="../toRegister.do?value=2"><b>没有账号？注册</b></a></td>
          </tr>
        </table>
      </div>
      <form id="form_login" name="form_login" method="post">
      <table width="38%" align="center">
        <tr>
          <td width="37%" height="30px" align="right">用户名：</td>
          <td width="63%" align="left">
            <input name="loginName" type="text" id="name""/>
          </td>
        </tr>
        <tr>
          <td width="37%" height="30px" align="right">密码：</td>
          <td width="63%" align="left">
            <input name="loginPassword" type="password" id="password""/>
          </td>
        </tr>
        <tr>
          <td width="37%" height="35px"></td>
          <td width="63%" align="left" valign="middle">
          	<input type="button" name="login" id="login" value="登录" onclick="checkForm()"/>
          </td>
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