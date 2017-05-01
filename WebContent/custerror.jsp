<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page isErrorPage="true" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%@page import="java.sql.SQLException"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Exception Handling</title>
</head>
<body>
<center>
<table width="700" border="0" cellpadding="0" cellspacing="0">
<col width = "700">
<tr><td height="2" bgcolor="#0000ff"></td></tr>
<tr><td>예외발생</td></tr>
<tr><td height="2" bgcolor="#0000ff"></td></tr>
<tr><td>
<%
if(exception instanceof ClassNotFoundException){
	out.println(exception.toString());
} else if(exception instanceof SQLException){
	out.println(exception.toString());
} else if(exception instanceof Exception){
	out.println(exception.toString());
} 
%>
<tr><td>
<tr><td height="2" bgcolor="#0000ff"></td></tr>
<tr><td>예외가 계속 발생하며 관리자에게 알려 주십시오</td></tr>
<tr><td height="2" bgcolor="#0000ff"></td></tr>
</table>
<a href='index.jsp'>HOME</a>
</center>
</body>
</html>