<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>他山之石--忘记密码</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/foreground.css"/>
<script type="text/javascript">
function SubmitForm(){	
	document.form_resetPwd.action = "<%=request.getContextPath()%>/forgetPwd.do";
	document.form_resetPwd.submit();	
}
function availableEmail(){
	var str = document.form_resetPwd.email.value;
    var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
    if(str==""){
	   alert("邮箱不能为空!");
	   document.form_resetPwd.email.focus();
       return false;
	}else if(!reg.test(str)){
       alert("邮箱格式不正确!");
	   document.form_resetPwd.email.value="";
	   document.form_resetPwd.email.focus();
       return false;
    }
    return true;
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
  <form id="form_resetPwd" name="form_resetPwd" method="post">
    <div class="div_sub" style="height: 460px">
      <div class="div_sub_title">
        <table width="100%">
          <tr>
            <td align="left"><b>忘记密码</b></td>
            <td colspan="3" align="right"><a href="<%=request.getContextPath()%>/toIndex.do?value=1"><b>返回首页</b></a></td>
          </tr>
        </table>
      </div>
      
      <table align="center" style="margin-top: 150px">
      	<tr style="visibility: hidden;">
          <td width="127" height="30px" align="right">用户名：</td>
          <td colspan="3" align="left">
            <input name="userName" type="text" id="userName" value="${forgetPwdUserName }"/>
          </td>
        </tr>
        <tr>
          <td width="127" height="30px" align="right">邮箱：</td>
          <td colspan="3" align="left">
            <input name="email" type="text" id="email" onblur="availableEmail()"/>
          </td>
        </tr>
        <tr>
          <td width="127" height="35px"></td>
          <td colspan="3" align="left" valign="middle">
          	<input type="button" name="modify" id="return" value="发送" onclick="SubmitForm()"/>
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