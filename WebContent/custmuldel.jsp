<%@page import="org.olc.dao.CustUserManager"%>
<%@page import="java.sql.SQLException"%>
<%@ page contentType="text/html; charset=euc-kr"%>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>custmuldel</title>
</head>
<body>
<%
boolean ret = false;
Object oRet = request.getAttribute("ret");

if(oRet != null){
	ret = (Boolean) oRet;
}

if(ret){
%>
<script type= "text/javascript">
alert('�� ������ �����߽��ϴ�.');
location.href='custcontrol.jsp?command=list';
</script>
<%
}
else {
%>
<script type= "text/javascript">
alert('�� ������ �����߽��ϴ�.');
location.href='custcontrol.jsp?command=list';
</script>
<%
}
%>
</body>
</html>