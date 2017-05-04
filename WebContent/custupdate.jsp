<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="euc-kr"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>custupdate</title>
</head>
<body>

<c:if test="${requestScope.ret}">
	<script type= "text/javascript">
	alert('고객 정보 변경에 성공했습니다.');
	<c:url var='custupdate' value='custcontrol.jsp'>
	<c:param name="command" value="detail"></c:param>
	<c:param name="id" value="${requestScope.pid}"></c:param>
	</c:url>
	location.href='${custupdate}';
	</script>

</c:if>
<c:if test="${requestScope.ret eq false}">
	<script type= "text/javascript">
	alert('고객 정보 변경에 실패했습니다.');
	<c:url var='custlist' value='custcontrol.jsp'>
	<c:param name="command" value="list"></c:param>
	</c:url>
	location.href='${custlist}';
	</script>
</c:if>
</body>
</html>