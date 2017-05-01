<%@page import="java.sql.SQLException"%>
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
<title>custuserupdate</title>
</head>
<body>
<%
Class.forName(driver);
String sql = "UPDATE CUSTUSER SET NAME =? ,  ADDRESS = ? WHERE ID = ? ";
String pid = request.getParameter("id");
String pname = request.getParameter("name");
String paddress = request.getParameter("address");
Connection conn = null;
PreparedStatement psmt = null;
int count = 0;
try{
conn = DriverManager.getConnection(url, user, password);
psmt = conn.prepareStatement(sql);
int i = 1;
psmt.setString(1, pname);
psmt.setString(2, paddress);
psmt.setString(3, pid);
count = psmt.executeUpdate();
}catch(SQLException se){
	throw new SQLException("custupdate : " + se.getMessage());
}finally {
	psmt.close();
	conn.close();
}
if(count > 0 ){
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