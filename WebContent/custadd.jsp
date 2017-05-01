<%@page import="org.olc.dto.CustUserDto"%>
<%@page import="org.olc.dao.CustUserManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html; charset=euc-kr"%>
<% request.setCharacterEncoding("euc-kr"); %>
<%@ page errorPage="custerror.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>custadd</title>
</head>
<body>
<jsp:useBean id="dto" class ="org.olc.dto.CustUserDto"/>
<jsp:setProperty property="id" name="dto"/>
<jsp:setProperty property="name" name="dto"/>
<jsp:setProperty property="address" name="dto"/>
<jsp:useBean id="dao" class="org.olc.dao.CustUserManager"/>
<%


boolean ret = dao.addCustUser(dto);

if(ret){
	%>
<script type= "text/javascript">
alert('고객 추가에 성공했습니다.');
location.href='custuserlist.jsp';
</script>
<%
}
else {
%>
<script type= "text/javascript">
alert('고객 추가에 실패했습니다.');
location.href='custaddform.jsp';
</script>
<%
}
%>
</body>
</html>