<%@page import="java.util.List"%>
<%@page import="org.olc.dto.CustUserDto"%>
<%@page import="org.olc.dao.CustUserManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager" %>
<%@ page contentType="text/html; charset=euc-kr"%>
<% request.setCharacterEncoding("euc-kr"); %>
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
<jsp:useBean id="dao" class="org.olc.dao.CustUserManager"/>
<%
List<CustUserDto> lists = dao.getCustLists();
%>
<center>
<form action="custmuldel.jsp" method="post">
<table border = "1">
<col width = "100"/><col width = "200"/><col width = "400"/>
<tr align = "center" bgcolor='#ddaabb'>
<td><input type='checkbox' name=‘alldel’ onclick="deletechecks(this.checked)" />삭제</td>
<td>아이디</td>
<td>이  름</td>
</tr>
	
<%
int rows = 1;
for(CustUserDto dto : lists){
%>
<tr <%= (rows++ %2)==1?"bgcolor='#aabbcc'": "bgcolor='#05aabb'"%>>
<%

%>
<td align="center"><input type='checkbox' name='delck' value='<%=dto.getId()%>' /></td>
<td><%=dto.getId()%></td>
<td><a href='custuserdetail.jsp?id=<%=dto.getId()%>'><%=dto.getName()%></a></td>
</tr>
<%
}
%>
<tr bgcolor='#ddaabb'>
<td colspan="3" align="center"> <input type="submit" value="여러 고객 삭제" />
</td>
</tr>
</table>
</form>
<a href=custaddform.jsp>고객 추가</a><br>
<a href=index.jsp>HOME</a>
</center>
</body>
</html>