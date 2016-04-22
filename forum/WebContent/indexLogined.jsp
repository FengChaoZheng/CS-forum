<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>他山之石--首页</title>
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
}
.div_sub {
	margin-right: 15%;
	margin-left: 15%;
}
.div_sub_title {
	background-color: #66ffff;
	text-align: left;
	padding-bottom:3px;
	padding-top:3px;
	border-left-style:solid;
	border-right-style:solid;
	border-left-width:thin;
	border-right-width:thin;
}
.div_sub_content{
	border-left-style:solid;
	border-right-style:solid;
	border-left-width:thin;
	border-right-width:thin;
}
.div_sub_content_last{
	border-left-style:solid;
	border-right-style:solid;
	border-left-width:thin;
	border-right-width:thin;
	border-bottom-style:solid;
	border-bottom-width:thin;
}
.table_content{
	vertical-align: middle;
	width: 100%;
	padding-bottom: 10px;
	padding-top: 10px;
}
</style>
</head>

<body>
<div class="div_main">
  <div class="div_collect">
    <div class="div_collect_content"> 
    	<a href="">设为首页</a>&nbsp;&nbsp;
    	<a href="">收藏本站</a>
    </div>
  </div>
  
  <div class="div_list">
    <div class="div_logo">
    <form id="form_logo" name="form_logo" method="post" action="">
      <table width="327" border="0" class="table_logo">
        <tr>
          <td width="332" rowspan="2">
            <input type="image" name="logo" id="logo" src="img/logo.jpg" style="width:150px"/>
          </td>
          
        </tr>
        <tr>
          <td align="right" valign="bottom">
          	欢迎<%=session.getAttribute("email") %>&nbsp;&nbsp;
            <a href="exit.do">安全退出</a>
          </td>
        </tr>
      </table>
      </form>
    </div>
  </div>
  
  <div class="div_center">
    <div class="div_sub">
      <div class="div_sub_title"><b>计算机专业课</b></div>
      <div class="div_sub_content">
        <table width="200" border="0" class="table_content">
          <tr>
            <td align="center" valign="middle" width="25%"><a href="">数据结构</a></td>
            <td align="center" valign="middle" width="25%"><a href="">操作系统</a></td>
            <td align="center" valign="middle" width="25%"><a href="">计算机网络</a></td>
            <td align="center" valign="middle" width="25%"><a href="">计算机组成原理</a></td>
          </tr>
        </table>
      </div>
    </div>
    <div class="div_sub">
      <div class="div_sub_title"><b>考研公共课</b></div>
      <div class="div_sub_content">
        <table width="200" border="0" class="table_content">
          <tr>
            <td align="center" valign="middle" width="25%"><a href="">考研数学</a></td>
            <td align="center" valign="middle" width="25%"><a href="">考研英语</a></td>
            <td align="center" valign="middle" width="25%"><a href="">考研政治</a></td>
            <td align="center" valign="middle" width="25%"><a href=""></a></td>
          </tr>
        </table>
      </div>
    </div>
    <div class="div_sub">
      <div class="div_sub_title"><b>交流互动</b></div>
      <div class="div_sub_content">
        <table width="200" border="0" class="table_content">
          <tr>
            <td align="center" valign="middle" width="25%"><a href="">生活交流</a></td>
            <td align="center" valign="middle" width="25%"><a href="">心路历程</a></td>
            <td align="center" valign="middle" width="25%"><a href="">跨考专版</a></td>
            <td align="center" valign="middle" width="25%"><a href="">面试经验</a></td>
          </tr>
        </table>
      </div>
    </div>
    <div class="div_sub">
      <div class="div_sub_title"><b>资料下载</b></div>
      <div class="div_sub_content">
        <table width="200" border="0" class="table_content">
          <tr>
            <td align="center" valign="middle" width="25%"><a href="">视频资料</a></td>
            <td align="center" valign="middle" width="25%"><a href="">历年真题</a></td>
            <td align="center" valign="middle" width="25%"><a href=""></a></td>
            <td align="center" valign="middle" width="25%"><a href=""></a></td>
          </tr>
        </table>
      </div>
    </div>
    <div class="div_sub">
      <div class="div_sub_title"><b>名校交流</b></div>
      <div class="div_sub_content">
        <table width="200" border="0" class="table_content">
          <tr>
            <td align="center" valign="middle" width="25%"><a href="">华北、东北地区</a></td>
            <td align="center" valign="middle" width="25%"><a href="">华东、华中、华南地区</a></td>
            <td align="center" valign="middle" width="25%"><a href="">西北、西南地区</a></td>
            <td align="center" valign="middle" width="25%"><a href=""></a></td>
          </tr>
        </table>
      </div>
    </div>
    <div class="div_sub">
      <div class="div_sub_title"><b>二手市场</b></div>
      <div class="div_sub_content">
        <table width="200" border="0" class="table_content">
          <tr>
            <td align="center" valign="middle" width="25%"><a href="">考研资料</a></td>
            <td align="center" valign="middle" width="25%"><a href="">其他</a></td>
            <td align="center" valign="middle" width="25%"><a href=""></a></td>
            <td align="center" valign="middle" width="25%"><a href=""></a></td>
          </tr>
        </table>
      </div>
    </div>
    <div class="div_sub">
      <div class="div_sub_title"><b>休闲角落</b></div>
      <div class="div_sub_content">
        <table width="200" border="0" class="table_content">
          <tr>
            <td align="center" valign="middle" width="25%"><a href="">原创美文</a></td>
            <td align="center" valign="middle" width="25%"><a href="">好书推荐</a></td>
            <td align="center" valign="middle" width="25%"><a href="">电影推荐</a></td>
            <td align="center" valign="middle" width="25%"><a href=""></a></td>
          </tr>
        </table>
      </div>
    </div>
    <div class="div_sub">
      <div class="div_sub_title"><b>事务专区</b></div>
      <div class="div_sub_content_last">
        <table width="200" border="0" class="table_content">
          <tr>
            <td align="center" valign="middle" width="25%"><a href="">站务公告</a></td>
            <td align="center" valign="middle" width="25%"><a href="">友链申请</a></td>
            <td align="center" valign="middle" width="25%"><a href="">建议反馈</a></td>
            <td align="center" valign="middle" width="25%"><a href="">违规检举</a></td>
          </tr>
        </table>
      </div>
    </div>

  </div>
  <div class="div_bottom">
  Powerd by ZhengFengchao!<br>
  Friday, 2016-04-22  19:15
  </div>

</div>
</body>
</html>