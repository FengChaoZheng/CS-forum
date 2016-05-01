<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>他山之石--下载出错页</title>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/foreground.css"/>

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
            <input type="image" name="logo" id="logo" src="<%=request.getContextPath() %>/img/logo.jpg" style="width:150px"/>
          </td>
          
        </tr>
        
      </table>
      </form>
    </div>
  </div>
  
  <div class="div_center">
  <form id="form_login" name="form_login" method="post">
    <div class="div_sub" style="height: 560px;">
      <div class="div_sub_title">
        <table width="100%">
          <tr>
            <td align="left"><b>资料下载</b></td>
            <td colspan="3" align="right"><a href="<%=request.getContextPath()%>/toIndex.do"><b>返回首页</b></a></td>
          </tr>
        </table>
      </div>
      <table align="center" width="100%" height="100%">
      	<tr>
      		<td align="center" valign="bottom">${message}</td>
      	</tr>
      	<tr>
      		<td align="center" valign="top"><a href="<%=request.getContextPath() %>/listDocument.do"><input type="button" value="返回下载列表"></a></td>
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