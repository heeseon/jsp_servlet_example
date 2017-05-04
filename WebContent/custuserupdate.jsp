<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="euc-kr"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>custuserupdate</title>
</head>
<body>
<c:set var='cust' value='${requestScope.cust}'/>
<c:if test="${not empty cust}">
<center>
<form action="custcontrol.jsp" method='post'>
<input type="hidden" name="command" value="update"/>
<table border = "1">
<col width = 200/><col width = 500/>
<tr align = "center" bgcolor='#ddaabb'>
<tr  bgcolor='#ddaabb'>
<td>아이디</td>
<td><input type="text" name="id" size="20" value="${cust.id}" readonly="readonly"/>
</td>
</tr>
<tr bgcolor='#ddaabb'>
<td>이 름</td>
<td><input type="text" name="name" size="20" value="${cust.name}"/>
</td>
</tr>
<tr  bgcolor='#ddaabb'>
<td>주 소</td>
<td><input type="text" name="address" size="50" value="${cust.address}" />
</td>
</tr>
<tr align = "center" bgcolor='#ddaabb'>
<td colspan="2">
<input type="submit" value="고객 정보 변경" />
 </td>
</tr>
</table>
</form>
<c:url var='custlist' value='custcontrol.jsp'>
<c:param name="command" value="list"></c:param>
</c:url>
<a href='${custlist}'>모든 고객 목록 보기</a>
</center>
</c:if>

</body>
</html>