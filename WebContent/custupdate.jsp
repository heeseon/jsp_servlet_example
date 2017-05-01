<%@page import="org.olc.dto.CustUserDto"%>
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
<title>custupdate</title>
</head>
<body>
<%
String pid = request.getParameter("id");
String pname = request.getParameter("name");
String paddress = request.getParameter("address");
CustUserManager dao = new CustUserManager();
CustUserDto dto = new CustUserDto(pid, pname, paddress);
boolean ret = dao.updateCustUser(dto);
if(ret){
%>
<script type= "text/javascript">
alert('고객 정보 변경에 성공했습니다.');
location.href='custuserdetail.jsp?id=<%=pid%>';
</script>
<%
}
else {
%>
<script type= "text/javascript">
alert('고객 정보 변경에 실패했습니다.');
location.href='custuserlist.jsp';
</script>
<%
}
%>
</body>
</html>