<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>他山之石--登录页</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/foreground.css"/>
<script language="javascript">
function checkForm(){	
    if(document.form_login.name.value==""){
	  alert("用户名不能为空!");
	  document.form_login.name.focus();
	}else if(document.form_login.password.value==""){
	  alert("密码长度应该大于等于6并且小于等于12");
	  document.form_login.password.focus();
	}else{
	  document.form_login.action = "<%=request.getContextPath() %>/userLogin.do?value=1";
	  document.form_login.submit();	
	}
}
function postForm(){
	if(document.form_login.name.value==""){
		alert("请输入您的用户名");
		document.form_login.name.focus();
		return false;
	}else{
		document.form_login.action = "<%=request.getContextPath()%>/toForgetPwd.do";
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
            <a href="<%=request.getContextPath() %>/toIndex.do?value=1">
              <img src="<%=request.getContextPath() %>/img/logo.jpg" style="width:150px"/>
            </a>
          </td>
        </tr>
      </table>
      </form>
    </div>
  </div>
  
  <div class="div_center">
    <%if(session.getAttribute("info") != null){
    	out.println("<script language='JavaScript'>");
    	out.println("alert('"+session.getAttribute("info")+"')");
    	//out.println("history.go(-1)");
    	out.println("</script>");
    	session.removeAttribute("info");
    }%>
    <div class="div_sub" style="height: 560px;">
      <div class="div_sub_title">
        <table width="100%">
          <tr>
            <td align="left"><b>登录</b></td>
            <td align="right"><a href="<%=request.getContextPath() %>/toRegister.do?value=1"><b>没有账号？注册</b></a></td>
          </tr>
        </table>
      </div>
      <form id="form_login" name="form_login" method="post">
      <table align="center" style="margin-top: 200px;">
        <tr>
          <td width="25%" height="30px" align="right">用户名：</td>
          <td width="75%" align="left">
            <input name="loginName" type="text" id="name""/>
          </td>
        </tr>
        <tr>
          <td width="25%" height="30px" align="right">密码：</td>
          <td width="75%" align="left">
            <input name="loginPassword" type="password" id="password""/>
          </td>
        </tr>
        <tr>
          <td width="25%" height="35px"></td>
          <td width="75%" align="left" valign="middle">
          	<input type="button" name="login" id="login" value="登录" onclick="checkForm()"/>
          	&nbsp;&nbsp;<input type="button" name="forgetPwd" id="forgetPwd" value="忘记密码" onclick="postForm()"/>
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
