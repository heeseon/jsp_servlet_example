<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="euc-kr"/>
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
<c:url var='custlist' value='custcontrol.jsp'>
<c:param name="command" value="list"></c:param>
</c:url>
<a href='${custlist}'>모든 고객 목록 보기</a>
</center>
</body>
</html>