<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>他山之石--首页</title>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/foreground.css"/>
<SCRIPT language="javascript">

//加入收藏

function AddFavorite(sURL, sTitle) {
    sURL = encodeURI(sURL);
    try {
        window.external.addFavorite(sURL, sTitle);
    } catch (e) {
    try {
        window.sidebar.addPanel(sTitle, sURL, "");
    } catch (e) {
        alert("加入收藏失败,请使用Ctrl+D进行添加,或手动在浏览器里进行设置.");
        }
    }
}
//设为首页
function SetHome(url) {
    if (document.all) {
        document.body.style.behavior = 'url(#default#homepage)';
        document.body.setHomePage(url);
    } else {
        alert("您好,您的浏览器不支持自动设置页面为首页功能,请您手动在浏览器里设置该页面为首页!");
    }
}
</SCRIPT>
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
function doSearch(){
	document.form_index.action = "<%=request.getContextPath()%>/listContent.do?value=2";
	document.form_index.submit();
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
    	<a onClick="SetHome('127.0.0.1:8080/forum/user/index.jsp')" href="javascript:void(0)" title="设为首页">设为首页</a>&nbsp;&nbsp;
    	<a onClick="AddFavorite('127.0.0.1:8080/forum/user/index.jsp','他山之石')" href="javascript:void(0)" title="加入收藏">收藏本站</a>
    </div>
  </div>
  
  <div class="div_list">
    <div class="div_logo">
    <%if(session.getAttribute("userName")==null) {%>
    <form id="form_index" name="form_index" method="post">
      <table width="327" border="0" class="table_logo">
        <tr>
          <td width="181" rowspan="2">
            <a href="<%=request.getContextPath() %>/toIndex.do?value=1">
              <img src="<%=request.getContextPath() %>/img/logo.jpg" style="width:150px"/>
            </a>
          </td>
          <td width="230" rowspan="2">
            <input type="search" name="search" id="search" value="搜索" size="30px" maxlength="30" style="color:gray" onfocus="if(this.value=='搜索'){this.value=''};this.style.color='black';" onblur="if(this.value==''||this.value=='搜索'){this.value='搜索';this.style.color='gray';}"/>
			<input type="button" name="request" id="request" value="搜索" onclick="doSearch()"/>
		  </td>
          <td width="56" height="34" align="right" valign="middle">用户名：</td>
          <td width="60">
            <input type="text" name="loginName" id="loginName" height="25px"/>
          </td>
          <td width="53" align="left"><a href="<%=request.getContextPath() %>/toRegister.do?value=1">注册</a></td>
        </tr>
        <tr>
          <td height="34" align="right" valign="middle">密码：</td>
          <td>
            <input type="password" name="loginPassword" id="loginPassword" height="25px"/>
            <input type="button" name="login" id="login" value="登录" style="height:25px" onclick="CheckForm()"/>
          </td>
          <td align="left"><input type="button" name="forgetPwd" id="forgetPwd" value="忘记密码" style="height:25px" onclick="postForm()"/></td>
        </tr>
      </table>
      </form>
      <%}else{ %>
      <form id="form_index" name="form_index" method="post" action="">
      <table width="327" border="0" class="table_logo">
        <tr>
          <td width="181" rowspan="2">
            <a href="<%=request.getContextPath() %>/toIndex.do?value=1">
              <img src="<%=request.getContextPath() %>/img/logo.jpg" style="width:150px"/>
            </a>
          </td>
          <td width="520" rowspan="2" align="center">
            <input type="search" name="search" id="search" value="搜索" size="30px" maxlength="30" style="color:gray" onfocus="if(this.value=='搜索'){this.value=''};this.style.color='black';" onblur="if(this.value==''||this.value=='搜索'){this.value='搜索';this.style.color='gray';}"/>
			<input type="button" name="request" id="request" value="搜索" onclick="doSearch()"/>
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
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=计算机专业课&value=1">数据结构</a></td>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=计算机专业课&value=1">操作系统</a></td>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=计算机专业课&value=1">计算机网络</a></td>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=计算机专业课&value=1">计算机组成原理</a></td>
          </tr>
        </table>
      </div>
    </div>
    <div class="div_sub">
      <div class="div_sub_title"><b>考研公共课</b></div>
      <div class="div_sub_content">
        <table width="200" border="0" class="table_content">
          <tr>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=考研公共课&value=1">考研数学</a></td>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=考研公共课&value=1">考研英语</a></td>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=考研公共课&value=1">考研政治</a></td>
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
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=交流互动&value=1">生活交流</a></td>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=交流互动&value=1">心路历程</a></td>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=交流互动&value=1">跨考专版</a></td>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=交流互动&value=1">面试经验</a></td>
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
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=名校交流&value=1">华北、东北地区</a></td>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=名校交流&value=1">华东、华中、华南地区</a></td>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=名校交流&value=1">西北、西南地区</a></td>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=名校交流&value=1"></a></td>
          </tr>
        </table>
      </div>
    </div>
    <div class="div_sub">
      <div class="div_sub_title"><b>二手市场</b></div>
      <div class="div_sub_content">
        <table width="200" border="0" class="table_content">
          <tr>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=二手市场&value=1">考研资料</a></td>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=二手市场&value=1">其他</a></td>
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
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=休闲角落&value=1">原创美文</a></td>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=休闲角落&value=1">好书推荐</a></td>
            <td align="center" valign="middle" width="25%"><a href="<%=request.getContextPath()%>/listContent.do?sectionName=休闲角落&value=1">电影推荐</a></td>
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