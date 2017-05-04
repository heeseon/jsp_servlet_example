<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="euc-kr"/>
<html>
<head>
<title>custadd</title>
</head>
<body>

<c:if test="${requestScope.ret}">
	<script type= "text/javascript">
	alert('고객 추가에 성공했습니다.');
	<c:url var='custlist' value='custcontrol.jsp'>
	<c:param name="command" value="list"></c:param>
	</c:url>
	location.href='${custlist}';
	</script>

</c:if>
<c:if test="${requestScope.ret eq false}">
	<script type= "text/javascript">
	alert('고객 추가에 실패했습니다.');
	<c:url var='custadd' value='custcontrol.jsp'>
	<c:param name="command" value="bfadd"></c:param>
	</c:url>
	location.href='${custadd}';
	</script>
</c:if>
</body>
</html>