<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page isErrorPage="true" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%@page import="java.sql.SQLException"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CustUser Error</title>
</head>
<%
String errormsg = "�߸��� ��û�� �Ͽ����ϴ�. ";
Object oErrormsg = request.getAttribute("errormsg");
String errortype = "Parameter Missing";
Object oErrortype = request.getAttribute("errortype");
String url = "index.jsp";
Object oUrl = request.getAttribute("url");

if(oErrormsg != null){
	errormsg= (String) oErrormsg;
}
if(oErrortype != null){
	errortype = (String)oErrortype;
}
if(oUrl != null){
	url = (String)oUrl;
}


%>
<body>
<center>
<table width="700" border="0" cellpadding="0" cellspacing="0">
<col width = "700">
<tr><td height="2" bgcolor="#0000ff"></td></tr>
<tr><td>���ܹ߻�</td></tr>
<tr><td height="2" bgcolor="#0000ff"></td></tr>
<tr><td>
������ ����� �˼��մϴ�. ��� �ݺ��Ǹ� �����ڿ��� �˷��ֽʽÿ� <br/>
���� : <%=errormsg%><br/>
���� : <%=errortype%><br/>
<a href = '<%=url%>'><%=url%></a><br/>
<tr><td>
<tr><td height="2" bgcolor="#0000ff"></td></tr>
</table>
</center>
</body>
</html>