<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="euc-kr"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>custuserdetail</title>
</head>
<body>
<c:set var='cust' value='${requestScope.cust}'/>
<c:if test="${not empty cust}">
<center>
<table border = "1">
<col width = 200/><col width = 500/>
<tr align = "center" bgcolor='#ddaabb'>
<tr align = "center" bgcolor='#ddaabb'>
<td>아이디</td>
<td>${cust.id}</td>
</tr>
<tr align = "center" bgcolor='#ddaabb'>
<td>이 름</td>
<td>${cust.name}</td>
</tr>
<tr align = "center" bgcolor='#ddaabb'>
<td>주 소</td>
<td>${cust.address}</td>
</tr>
<tr align = "center" bgcolor='#ddaabb'>
<td colspan="2">

<form action="custcontrol.jsp" method='post'>
<input type="hidden" name="command" value="delete"/>
<input type="hidden" name="id" value="${cust.id}"/>
<input type="submit" value="고객 삭제" />
</form>

<form action="custcontrol.jsp" method='post'>
<input type="hidden" name="command" value="bfupdate"/>
<input type="hidden" name="id" value="${cust.id}"/>
<input type="submit" value="고객 정보 변경" />
</form>

</td>
</tr>
</table>
<c:url var='custlist' value='custcontrol.jsp'>
<c:param name="command" value="list"></c:param>
</c:url>
<a href='${custlist}'>모든 고객 목록 보기</a>
</center>
</c:if>
</body>
</html>