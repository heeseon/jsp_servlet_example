<%@page import="org.olc.dao.CustUserManager"%>
<%@page import="org.olc.dto.CustUserDto"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
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
<title>custuserudpate</title>
</head>
<body>
<jsp:useBean id="dto" class="org.olc.dto.CustUserDto"/>
<jsp:setProperty property="id" name="dto"/>
<jsp:useBean id="dao" class="org.olc.dao.CustUserManager"/>
<%

if(dto.getId() == null || dto.getId().trim().equals("")){
response.sendRedirect("custuserlist.jsp");
}

CustUserDto dto2 = dao.getCustUser(dto.getId());
String id = dto2.getId();
String name = dto2.getName();
String address = dto2.getAddress();
%>
<center>
<form action="custupdate.jsp" method='post'>
<table border = "1">
<col width = 200/><col width = 500/>
<tr align = "center" bgcolor='#ddaabb'>
<tr  bgcolor='#ddaabb'>
<td>아이디</td>
<td><input type="text" name="id" size="20" value="<%=id%>" readonly="readonly"/>
</td>
</tr>
<tr bgcolor='#ddaabb'>
<td>이 름</td>
<td><input type="text" name="name" size="20" value="<%=name%>"/>
</td>
</tr>
<tr  bgcolor='#ddaabb'>
<td>주 소</td>
<td><input type="text" name="address" size="50" value="<%=address%>" />
</td>
</tr>
<tr align = "center" bgcolor='#ddaabb'>
<td colspan="2">
<input type="submit" value="고객 정보 변경" />
 </td>
</tr>
</table>
</form>
<a href = custuserlist.jsp>모든 고객 목록 보기</a>
</center>
</body>
</html>
