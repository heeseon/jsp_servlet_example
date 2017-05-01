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
<%

String pid = request.getParameter("id");

CustUserManager dao = new CustUserManager();
boolean ret = dao.deleteCustUser(pid);

if(ret){
%>
<script type= "text/javascript">
alert('고객 삭제에 성공했습니다.');
location.href='custuserlist.jsp';
</script>
<%
}
else {
%>
<script type= "text/javascript">
alert('고객 삭제를 실패했습니다.');
location.href='custuserdetail.jsp?id=<%=pid%>';
</script>
<%
}
%>
</body>
</html>