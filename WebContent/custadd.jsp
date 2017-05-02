<%@page import="org.olc.dto.CustUserDto"%>
<%@page import="org.olc.dao.CustUserManager"%>
<%@ page contentType="text/html; charset=euc-kr"%>
<% request.setCharacterEncoding("euc-kr"); %>
<html>
<head>
<title>custadd</title>
</head>
<body>
<%

boolean ret = false;
Object oRet = request.getAttribute("ret");

if(oRet != null){
	ret = (Boolean) oRet;
}

if(ret){
	%>
<script type= "text/javascript">
alert('고객 추가에 성공했습니다.');
location.href='custcontrol.jsp?command=list';
</script>
<%
}
else {
%>
<script type= "text/javascript">
alert('고객 추가에 실패했습니다.');
location.href='custcontrol.jsp?command=bfadd';
</script>
<%
}
%>
</body>
</html>