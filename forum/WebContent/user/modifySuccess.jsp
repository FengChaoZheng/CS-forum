<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>他山之石--密码成功修改页</title>
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
	document.form_modifySuccess.action = "toLogin.do";
	document.form_modifySuccess.submit();	
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
    <form id="form_modify" name="form_modify" method="post" action="">
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
  <form id="form_modifySuccess" name="form_modifySuccess" method="post">
    <div class="div_sub">
      <div class="div_sub_title">
        <table width="100%">
          <tr>
            <td align="left"><b>修改密码</b></td>
          </tr>
        </table>
      </div>
      <table align="center">
        <tr>
          <td colspan="3" align="left" valign="middle">
          	恭喜您密码修改成功！&nbsp;&nbsp;<input type="button" name="modify" id="return" value="点击重新登录" onclick="SubmitForm()"/>
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