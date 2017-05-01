<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html; charset=euc-kr"%>
<% request.setCharacterEncoding("euc-kr"); %>
<%@include file="custinclude.jsp"%>
<%@ page errorPage="custerror.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>custuserudpate</title>
</head>
<body>
<%
Class.forName(driver);
String sql = "SELECT ID, NAME, ADDRESS FROM CUSTUSER WHERE ID=? ";
String pid = request.getParameter("id");
if(pid == null || pid.trim().equals("")){
	response.sendRedirect("custuserlist.jsp");
}
Connection conn = null;
PreparedStatement psmt = null;
ResultSet rs = null;
try{
conn = DriverManager.getConnection(url, user, password);
psmt = conn.prepareStatement(sql);
psmt.setString(1, pid);
rs = psmt.executeQuery();
%>
<center>
<form action="custupdate.jsp" method='post'>
<table border = “1”>
<col width = 200/><col width = 500/>
<tr align = "center" bgcolor='#ddaabb'>
<%
int rows = 0;
String id = "";
String name = "";
String address="";
while(rs.next()){
	rows ++;
	id = rs.getString("ID");
	name = rs.getString("NAME");
	address = rs.getString("ADDRESS");
}
%>
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
<td><input type="text" name="address" size="50" value="<%=address%>"/>
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
<%
}catch(SQLException se){
throw new SQLException("custuserdetail.jsp : " + se.getMessage());
}finally {
if(rs != null) rs.close();
if(psmt != null) psmt.close();
if(conn != null) conn.close();
}
%>
</body>
</html>
