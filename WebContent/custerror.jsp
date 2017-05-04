<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="euc-kr"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CustUser Error</title>
</head>

<c:choose>
	<c:when test="empty ${requestScope.errormsg}">
		${requestScope.errormsg} = "잘못된 요청을 하였습니다. ";
	</c:when>
	<c:when test="empty ${requestScope.errortype}">
		${requestScope.errortype} = "Parameter Missing";
	</c:when>
	<c:when test="empty ${requestScope.url}">
		${requestScope.url} = "index.jsp";
	</c:when>
</c:choose>

<body>
<center>
<table width="700" border="0" cellpadding="0" cellspacing="0">
<col width = "700">
<tr><td height="2" bgcolor="#0000ff"></td></tr>
<tr><td>예외발생</td></tr>
<tr><td height="2" bgcolor="#0000ff"></td></tr>
<tr><td>
불편을 드려서 죄송합니다. 계속 반복되면 관리자에게 알려주십시요 <br/>
내용 : ${requestScope.errormsg}<br/>
종류 : ${requestScope.errortype}<br/>
<a href = '${requestScope.url}'>${requestScope.url}</a><br/>
<tr><td>
<tr><td height="2" bgcolor="#0000ff"></td></tr>
</table>
</center>
</body>
</html>