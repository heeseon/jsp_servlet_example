<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html; charset=euc-kr"%>
<% request.setCharacterEncoding("euc-kr"); %>
<%@include file="custinclude.jsp"%>
<%@ page errorPage="custerror.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>custadd</title>
</head>
<body>
<%
Class.forName(driver);
String sql = "INSERT INTO CUSTUSER(ID, NAME, ADDRESS  ) VALUES(?, ?,?)";
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
	psmt.setString(1, pid);
	psmt.setString(2, pname);
	psmt.setString(3, paddress);
	count = psmt.executeUpdate();
}catch(SQLException se){
throw new SQLException("custadd : " + se.getMessage());
}finally {
psmt.close();
conn.close();
}
if(count > 0 ){
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