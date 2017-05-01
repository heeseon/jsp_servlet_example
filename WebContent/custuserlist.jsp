<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager" %>
<%@ page contentType="text/html; charset=euc-kr"%>
<% request.setCharacterEncoding("euc-kr"); %>
<%@include file="custinclude.jsp"%>
<%@ page errorPage="custerror.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>custuserlist</title>
<script type="text/javascript">
function deletechecks(e){
	var x = document.getElementsByName("delck");
	for(var i = 0 ; i < x.length; ++i){
		x[i].checked = e;
	}
}
</script>
</head>
<body>
<%
Class.forName(driver);
String sql = "SELECT ID, NAME FROM CUSTUSER ";
Connection conn = null;
PreparedStatement psmt = null;
ResultSet rs = null;
try{
	conn = DriverManager.getConnection(url, user, password);
	psmt = conn.prepareStatement(sql);
	rs = psmt.executeQuery();
%>
<center>
<form action="custmuldel.jsp" method="post">
<table border = "1">
<col width = 100/><col width = 200/><col width = 400/>
<tr align = "center" bgcolor='#ddaabb'>
<td><input type='checkbox' name='alldel' onclick='deletechecks(this.checked);'/>삭제</td>
<td>아이디</td>
<td>이  름</td>
</tr>
	
<%
int rows = 1;
	while(rs.next()){
%>
<tr <%= (rows++ %2)==1?"bgcolor='#aabbcc'": "bgcolor='#05aabb'"%>>
<%
String id = rs.getString("ID");
String name = rs.getString("NAME");
rows ++;
%>
<td align="center"><input type='checkbox' name='delck' value='<%=id%>' /></td>
<td><%=id%></td>
<td><a href='custuserdetail.jsp?id=<%=id%>'><%=name%></a></td>
</tr>
<%
}
%>
<tr align="center" bgcolor='#ddaabb'>
<td colspan="3"> <input type="submit" value="여러 고객 삭제" />
</td>
</table>
</form>
<a href = custaddform.jsp>고객 추가</a><br>
<a href = index.jsp>HOME</a>

</center>
<%
}catch(SQLException se){
	throw new SQLException("custuserlist.jsp : " + se.getMessage());
}finally {
	if(rs != null) rs.close();
	if(psmt != null) psmt.close();
	if(conn != null) conn.close();
}
%>
</body>
</html>