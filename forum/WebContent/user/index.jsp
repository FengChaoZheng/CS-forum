<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>他山之石--首页</title>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/foreground.css"/>

<script language="javascript">
function CheckForm(){
	if(document.form_index.loginName.value == ""){
		alert("用户名不能为空");
		document.form_index.loginName.focus();
	}else if(document.form_index.loginPassword.value == ""){
		alert("密码不能为空");
		document.form_index.loginPassword.focus();
	}else{
		document.form_index.action = "<%=request.getContextPath()%>/userLogin.do?value=0";
		document.form_index.submit();
	}
}
</script>

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
    <%if(session.getAttribute("userName")==null) {%>
    <form id="form_index" name="form_index" method="post">
      <table width="327" border="0" class="table_logo">
        <tr>
          <td width="332" rowspan="2">
            <a href="<%=request.getContextPath() %>/toIndex.do?value=1">
              <img src="<%=request.getContextPath() %>/img/logo.jpg" style="width:150px"/>
            </a>
          </td>
          <td width="142" height="34" align="right" valign="middle">用户名：</td>
          <td width="218">
            <input type="text" name="loginName" id="loginName" height="25px"/>
          </td>
          <td width="71" align="left"><a href="forgetPwd.jsp">忘记密码</a></td>
        </tr>
        <tr>
          <td height="34" align="right" valign="middle">密码：</td>
          <td>
            <input type="password" name="loginPassword" id="loginPassword" height="25px"/>
            <input type="button" name="login" id="login" value="登录" style="height:25px" onclick="CheckForm()"/>
          </td>
          <td align="left"><a href="<%=request.getContextPath() %>/toRegister.do?value=1">注册</a></td>
        </tr>
      </table>
      </form>
      <%}else{ %>
      <form id="form_index" name="form_index" method="post" action="">
      <table width="327" border="0" class="table_logo">
        <tr>
          <td width="332" rowspan="2">
            <input type="image" name="logo" id="logo" src="<%=request.getContextPath() %>/img/logo.jpg" style="width:150px"/>
          </td>
          
        </tr>
        <tr>
          <td align="right" valign="bottom">
          	欢迎<%=session.getAttribute("userName") %>&nbsp;&nbsp;
            <a href="<%=request.getContextPath() %>/toSingle.do">个人中心</a>&nbsp;&nbsp;
            <a href="<%=request.getContextPath() %>/exit.do?value=1">安全退出</a>
          </td>
        </tr>
      </table>
      </form>
      <%} %>
    </div>
  </div>
  
  <div class="div_center">
    <div class="div_sub">
      <div class="div_sub_title"><b>计算机专业课</b></div>
      <div class="div_sub_content">
        <table width="200" border="0" class="table_content">
          <tr>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=计算机专业课">数据结构</a></td>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=计算机专业课">操作系统</a></td>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=计算机专业课">计算机网络</a></td>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=计算机专业课">计算机组成原理</a></td>
          </tr>
        </table>
      </div>
    </div>
    <div class="div_sub">
      <div class="div_sub_title"><b>考研公共课</b></div>
      <div class="div_sub_content">
        <table width="200" border="0" class="table_content">
          <tr>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=考研公共课">考研数学</a></td>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=考研公共课">考研英语</a></td>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=考研公共课">考研政治</a></td>
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
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=交流互动">生活交流</a></td>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=交流互动">心路历程</a></td>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=交流互动">跨考专版</a></td>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=交流互动">面试经验</a></td>
          </tr>
        </table>
      </div>
    </div>
    <div class="div_sub">
      <div class="div_sub_title"><b>资料下载</b></div>
      <div class="div_sub_content">
        <table width="200" border="0" class="table_content">
          <tr>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listDocument.do?value=1">视频资料</a></td>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listDocument.do?value=1">历年真题</a></td>
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
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=名校交流">华北、东北地区</a></td>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=名校交流">华东、华中、华南地区</a></td>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=名校交流">西北、西南地区</a></td>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=名校交流"></a></td>
          </tr>
        </table>
      </div>
    </div>
    <div class="div_sub">
      <div class="div_sub_title"><b>二手市场</b></div>
      <div class="div_sub_content">
        <table width="200" border="0" class="table_content">
          <tr>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=二手市场">考研资料</a></td>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=二手市场">其他</a></td>
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
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=休闲角落">原创美文</a></td>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=休闲角落">好书推荐</a></td>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=休闲角落">电影推荐</a></td>
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
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listNotice.do?value=1">站务公告</a></td>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listNotice.do?value=1">友链申请</a></td>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listNotice.do?value=1">建议反馈</a></td>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listNotice.do?value=1">违规检举</a></td>
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