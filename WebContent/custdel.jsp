<%@page import="org.olc.dao.CustUserManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=euc-kr"%>
<% request.setCharacterEncoding("euc-kr"); %>
<%@ page errorPage="custerror.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>custdel</title>
</head>
<body>
<jsp:useBean id="dto" class="org.olc.dto.CustUserDto"/>
<jsp:setProperty property="id" name="dto"/>
<jsp:useBean id="dao" class="org.olc.dao.CustUserManager"/>
<%
boolean ret = dao.deleteCustUser(dto.getId());

if(ret){
%>
<script type= "text/javascript">
alert('�� ������ �����߽��ϴ�.');
location.href='custuserlist.jsp';
</script>
<%
}
else {
%>
<script type= "text/javascript">
alert('�� ������ �����߽��ϴ�.');
location.href='custuserdetail.jsp?id=<jsp:getProperty property="id" name="dto"/>';
</script>
<%
}
%>
</body>
</html>