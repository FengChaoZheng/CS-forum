<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>他山之石--欢迎页</title>
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
          <td width="332" rowspan="2">
            <a href="<%=request.getContextPath() %>toIndex.do?value=1">
              <img src="<%=request.getContextPath() %>/img/logo.jpg" style="width:150px"/>
            </a>
          </td>
        </tr>
      </table>
      </form>
    </div>
  </div>
  
  <div class="div_center">
    <div class="div_sub" style="height: 560px;">
    <table width="100%" height="100%">
    	<tr>
    		<td width="50%" align="right" valign="middle">恭喜您注册成功 !!!${username}</td>
    		<td width="50%" align="left" valign="middle"><a href="<%=request.getContextPath() %>/toLogin.do"><input type="submit" value="现在登录"></a></td>
    	</tr>
    </table>
             

    </div>
  </div>
  <div class="div_bottom">
  Powerd by ZhengFengchao!<br>
  Friday, 2016-04-22  19:15
  </div>

</div>
</body>
</html>