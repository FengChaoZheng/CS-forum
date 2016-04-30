<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.springframework.web.servlet.ModelAndView"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>无标题文档</title>
<style type="text/css">
.top {
	background-color: #6fF;
}

a:link {
	text-decoration: none;
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
</style>
</head>

<body>
	<div class="top">
		<table width="100%"
			style="border-bottom-width: 1; border-bottom-style: solid">
			<tr>
				<td width="50%"><a href="../../toIndex.do?value=2"
					target="_parent"><img src="../../img/logo.jpg" width="165"
						height="65" />
				</a>
				</td>
				<%
					if (session.getAttribute("userName") != null) {
				%>
				<td width="50%" align="right" valign="bottom"><font
					style="font-size: 20px; padding-right: 15px">${userName}&nbsp;&nbsp;<a
						href="../../exit.do?value=2" target="_parent">安全退出</a>
				</font>
				</td>
				<%
					}
				%>
			</tr>
		</table>
	</div>
</body>
</html>
