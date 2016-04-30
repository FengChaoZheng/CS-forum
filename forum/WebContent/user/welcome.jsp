<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>他山之石--欢迎页</title>
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
	height:600px;
	line-height:600px;
	margin-right: 15%;
	margin-left: 15%;
	background-color: #66ffff;
	text-align: center;
	padding-bottom:3px;
	padding-top:3px;
	vertical-align:middle;
}
</style>
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
          <td width="332" rowspan="2">
            <a href="toIndex.do?value=1">
              <img src="img/logo.jpg" style="width:150px"/>
            </a>
          </td>
        </tr>
      </table>
      </form>
    </div>
  </div>
  
  <div class="div_center">
    <div class="div_sub">
             恭喜您注册成功 !!!${username}&nbsp;&nbsp;<a href="toLogin.do"><input type="submit" value="现在登录"></a>

    </div>
  </div>
  <div class="div_bottom">
  <p>Powerd by ZhengFengchao!</p><br>
  <p>Friday, 2016-04-22  19:15</p>
  </div>

</div>
</body>
</html>