<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>他山之石--密码成功修改页</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/foreground.css"/>
<script type="text/javascript">
function SubmitForm(){	
	document.form_success.action = "<%=request.getContextPath()%>/toLogin.do?value=1";
	document.form_success.submit();	
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
            <input type="image" name="logo" id="logo" src="<%=request.getContextPath() %>/img/logo.jpg" style="width:150px"/>
          </td>
        </tr>       
      </table>
      </form>
    </div>
  </div>
  
  <div class="div_center">
  <form id="form_success" name="form_success" method="post">
    <div class="div_sub" style="height: 560px;">
    <%if(session.getAttribute("message") != null){ %>
      <div class="div_sub_title">
        <table width="100%">
          <tr>
            <td align="left"><b>修改密码</b></td>
          </tr>
        </table>
      </div>
      <table align="center" width="100%" height="100%">
        <tr>
          <td colspan="3" align="center" valign="middle">
          	${message }&nbsp;&nbsp;<input type="button" name="modify" id="return" value="点击重新登录" onclick="SubmitForm()"/>
          </td>
        </tr>
      </table>
      <%}else if(session.getAttribute("info") != null){ %>
      <div class="div_sub_title">
        <table width="100%">
          <tr>
            <td align="left"><b>忘记密码</b></td>
          </tr>
        </table>
      </div>
      <table align="center" width="100%" height="100%">
        <tr>
          <td colspan="3" align="center" valign="middle">
          	${info }&nbsp;&nbsp;<input type="button" name="modify" id="return" value="点击重新登录" onclick="SubmitForm()"/>
          </td>
        </tr>
      </table>
      <%} %>
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