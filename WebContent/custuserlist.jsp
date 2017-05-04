<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="euc-kr"/>

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
<center>
<form action="custcontrol.jsp" method="post">
<input type='hidden' name="command" value="muldel" />
<table border = "1">
<col width = "100"/><col width = "200"/><col width = "400"/>
<tr align = "center" bgcolor='#ddaabb'>
<td><input type='checkbox' name=‘alldel’ onclick="deletechecks(this.checked)" />삭제</td>
<td>아이디</td>
<td>이  름</td>
</tr>

<c:set var='custlists' value='${requestScope.custs}'/>
<c:if test="${empty custlists}">

<tr bgcolor='#f6f6d6'>
	<td colspan='3' align = 'center'> 고객 리스트가 존재하지 않습니다.</td>
</tr>

</c:if>

<c:forEach var='cust' items='${custlists}' varStatus="status">
	<c:choose>
		<c:when test="${status.count%2==0}">
			<c:set var="bgcol" value="#f6f6d6"/>
		</c:when>
		<c:otherwise>
			<c:set var="bgcol" value="#f4f4a4"/>
		</c:otherwise>
	</c:choose>	
<tr bgcolor='${bgcol}'>
<td><input type='checkbox' name='delck' value='${cust.id}' /></td>
<td>${cust.id}</td>

<c:url var='custdetail' value='custcontrol.jsp'>
<c:param name="command" value="detail"></c:param>
<c:param name="id" value='${cust.id}'></c:param>
</c:url>

<td><a href='${custdetail}'>${cust.name}</a></td>
</tr>
</c:forEach>	
<tr bgcolor='#ddaabb'>
<td colspan="3" align="center"> <input type="submit" value="여러 고객 삭제" />
</td>
</tr>
</table>
</form>

<c:url var='custadd' value='custcontrol.jsp'>
<c:param name="command" value="bfadd"></c:param>
</c:url>
<a href='${custadd}'>고객 추가</a><br>

<c:url var='home' value='index.jsp'></c:url>
<a href='${home}'>HOME</a>
</center>
</body>
</html>
