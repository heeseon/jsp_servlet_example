<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=euc-kr"%>
<% request.setCharacterEncoding("euc-kr"); %>
<%@include file="custinclude.jsp"%>
<%@ page errorPage="custerror.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>custdel</title>
</head>
<body>
<%
Class.forName(driver);
String sql = "DELETE FROM CUSTUSER WHERE ID=?";
String pid = request.getParameter("id");
Connection conn = null;
PreparedStatement psmt = null;
int count = 0;
try{
conn = DriverManager.getConnection(url, user, password);
psmt = conn.prepareStatement(sql);
int i = 1;
psmt.setString(1, pid);
count = psmt.executeUpdate();
}catch(SQLException se){
throw new SQLException("custdel : " + se.getMessage());
}finally {
	psmt.close();
	conn.close();
}
if(count > 0 ){
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