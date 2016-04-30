<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>他山之石--个人中心页</title>
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
<script type="text/javascript">
function SubmitForm(){	
	document.form_info.action = "../toIndex.do?value=1";
	document.form_info.submit();	
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
            <input type="image" name="logo" id="logo" src="../img/logo.jpg" style="width:150px"/>
          </td>
          
        </tr>
        
      </table>
      </form>
    </div>
  </div>
  
  <div class="div_center">
  <form id="form_info" name="form_info" method="post">
    <div class="div_sub">
      <div class="div_sub_title">
        <table width="100%">
          <tr>
            <td align="left"><b>个人信息</b></td>
            <td colspan="3" align="right"><a href="../toModifyPwd.do"><b>修改密码</b></a></td>
          </tr>
        </table>
      </div>
      <table align="center">
        <tr>
          <td width="127" height="30px" align="right">用户名：</td>
          <td colspan="3" align="left">
            <input name="username" type="text" readonly="readonly" value="${userName}"/>
          </td>
        </tr>
        <tr>
          <td width="127" height="30px" align="right">性别：</td>
          <td colspan="3" align="left">
            <input name="sex" type="text" readonly="readonly" value="${userSex}"/>
          </td>
        </tr>
        <tr>
          <td width="127" height="30px" align="right">邮箱：</td>
          <td width="180" align="left">
            <input name="email" type="text" readonly="readonly" value="${userEmail}"/>
          </td>
        </tr>
        <tr>
          <td width="127" height="30px" align="right">身份：</td>
          <td width="180" align="left">
            <input name="authority" type="text" readonly="readonly" value="${userAuthority}"/>
          </td>
        </tr>
        <tr>
          <td width="127" height="30px" align="right">最后登录时间：</td>
          <td width="180" align="left">
            <input name="lastTime" type="text" readonly="readonly" value="${userLastTime}"/>
          </td>
        </tr>
        <tr>
          <td width="127" height="35px"></td>
          <td colspan="3" align="left" valign="middle">
          	<input type="button" name="return" id="return" value="返回" onclick="SubmitForm()"/>
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