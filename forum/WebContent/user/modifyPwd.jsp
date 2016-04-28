<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>他山之石--密码修改页</title>
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
	document.form_modify.action = "modifyPwd.do";
	document.form_modify.submit();	
}
function availablePwd(){
	var length = document.form_modify.newpassword.value.length;
	if(length<6 || length>12){
		alert("密码长度应该大于等于6并且小于等于12");
		document.form_modify.newpassword.value = "";
		document.form_modify.newpassword.focus();
	}
}
function checkPwd(){
	var pwd = document.form_modify.newpassword.value;
	var repwd = document.form_modify.repassword.value;
	if( repwd == ""){
		alert("密码长度应该大于等于6并且小于等于12");
		document.form_modify.repassword.value = "";
		document.form_modify.repassword.focus();
	}else if( repwd != pwd){
		alert("您两次输入的密码不相同");
		document.form_modify.repassword.value = "";
		document.form_modify.repassword.focus();
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
            <input type="image" name="logo" id="logo" src="img/logo.jpg" style="width:150px"/>
          </td>
        </tr>       
      </table>
      </form>
    </div>
  </div>
  
  <div class="div_center">
  <form id="form_modify" name="form_modify" method="post">
    <div class="div_sub">
      <div class="div_sub_title">
        <table width="100%">
          <tr>
            <td align="left"><b>修改密码</b></td>
            <td colspan="3" align="right"><a href="user/singel.jsp"><b>返回个人中心</b></a></td>
          </tr>
        </table>
      </div>
      <table align="center">
        <tr>
          <td width="127" height="30px" align="right">新密码：</td>
          <td colspan="3" align="left">
            <input name="newpassword" type="password" id="newpassword" onblur="availablePwd()"/>
          </td>
        </tr>
        <tr>
          <td width="127" height="30px" align="right">确认密码：</td>
          <td colspan="3" align="left">
            <input name="repassword" type="password" id="repassword" onblur="checkPwd()"/>
          </td>
        </tr>
        <tr>
          <td width="127" height="35px"></td>
          <td colspan="3" align="left" valign="middle">
          	<input type="button" name="modify" id="return" value="修改" onclick="SubmitForm()"/>
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