<%@page import="org.olc.dao.CustUserManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html; charset=euc-kr"%>
<% request.setCharacterEncoding("euc-kr"); %>
<%@ page errorPage="custerror.jsp" %>
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
alert('고객 삭제에 성공했습니다.');
location.href='custcontrol.jsp?command=list';
</script>
<%
}
else {
%>
<script type= "text/javascript">
alert('고객 삭제를 실패했습니다.');
location.href='custcontrol.jsp?command=list';
</script>
<%
}
%>
</body>
</html>