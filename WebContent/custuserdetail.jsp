<%@page import="org.olc.dto.CustUserDto"%>
<%@page import="org.olc.dao.CustUserManager"%>
<%@ page contentType="text/html; charset=euc-kr"%>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>custuserdetail</title>
</head>
<body>
<%
CustUserDto dto = new CustUserDto();

Object oDto = request.getAttribute("cust");

if(oDto != null){
	dto = (CustUserDto)oDto;
}
%>
<center>
<table border = "1">
<col width = 200/><col width = 500/>
<tr align = "center" bgcolor='#ddaabb'>
<%
String id = dto.getId();
String name = dto.getName();
String address= dto.getAddress();
%>
<tr align = "center" bgcolor='#ddaabb'>
<td>아이디</td>
<td><%=id%></td>
</tr>
<tr align = "center" bgcolor='#ddaabb'>
<td>이 름</td>
<td><%=name%></td>
</tr>
<tr align = "center" bgcolor='#ddaabb'>
<td>주 소</td>
<td><%=address%></td>
</tr>
<tr align = "center" bgcolor='#ddaabb'>
<td colspan="2">

<form action="custcontrol.jsp" method='post'>
<input type="hidden" name="command" value="delete"/>
<input type="hidden" name="id" value="<%=id%>"/>
<input type="submit" value="고객 삭제" />
</form>

<form action="custcontrol.jsp" method='post'>
<input type="hidden" name="command" value="bfupdate"/>
<input type="hidden" name="id" value="<%=id%>"/>
<input type="submit" value="고객 정보 변경" />
</form>

</td>
</tr>
</table>
<a href='custcontrol.jsp?command=list'>모든 고객 목록 보기</a>
</center>
</body>
</html>