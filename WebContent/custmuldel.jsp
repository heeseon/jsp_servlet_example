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
<title>custmuldel</title>
</head>
<body>
<%
Class.forName(driver);
String sql = "DELETE FROM CUSTUSER WHERE ID=?";
String pid[] = request.getParameterValues("delck");
if(pid == null || pid.length == 0){
	throw new SQLException("������ �ϱ� ���ؼ��� �� �� �̻��� �����Ͻʽÿ�");
}
Connection conn = null;
PreparedStatement psmt = null;
int count = 0;
try{
conn = DriverManager.getConnection(url, user, password);
conn.setAutoCommit(false);
psmt = conn.prepareStatement(sql); //�غ��س���
for(int i = 0 ; i < pid.length ; ++ i){
	psmt.setString(1, pid[i].trim());
	psmt.addBatch(); //����Ÿ �ְ�
}
count = psmt.executeBatch().length;
conn.commit();
}catch(SQLException se){
conn.rollback();
throw new SQLException("custmuldel : " + se.getMessage());
}finally {
	conn.setAutoCommit(true);
	psmt.close();
	conn.close();
}
if(count > 0 ){
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
location.href='custuserlist.jsp';
</script>
<%
}
%>
</body>
</html>