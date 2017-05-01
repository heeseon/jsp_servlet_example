<%@ page contentType="text/html; charset=euc-kr"%>
<% request.setCharacterEncoding("euc-kr"); %>
<%@ page errorPage="custerror.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>custaddform</title>
</head>
<body>
<center>
<form action="custcontrol.jsp" method="post">
<input type="hidden" name="command" value="add"/>
<table border = "1">
<col width = 200/><col width = 500/>
<tr bgcolor='#ddaabb'>
<td align = "center">아이디</td>
<td><input type="text" name="id" size="20"/></td>
</tr>
<tr bgcolor='#aaccbb'>
<td align = "center">이름</td>
<td><input type="text" name="name" size="20"/></td>
</tr>
<tr bgcolor='#ddaabb'>
<td align = "center">주소</td>
<td><input type="text" name="address" size="50"/></td>
</tr>
<tr align = "center" bgcolor='#ddaabb'>
<td colspan="2"><input type="submit" value="고객추가"/></td>
</tr>
</table>
</form>
<a href='custcontrol.jsp?command=list'>고객 목록 보기 </a>
</center>
</body>
</html>