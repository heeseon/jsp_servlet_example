<%@page import="org.olc.dto.CustUserDto"%>
<%@page import="java.util.List"%>
<%@page import="org.olc.dao.ICustUser"%>
<%@page import="org.olc.dao.CustUserManager"%>
<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="euc-kr"/>
<%@ page errorPage="custerror.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>control</title>
<script type= "text/javascript">
function displaylog(msg){

alert(msg);

}
</script>
</head>
<%! 
public boolean isNull(String msg){
	return (msg == null || msg.trim().equalsIgnoreCase(""))?true:false;
}
%>
<body>
<%
//1. command 받기 

//2. DAO 생성하
ICustUser manager = new CustUserManager();  
%>

<c:set var="manager" value="CustUserManager" scope="request" />

<c:choose>
	<c:when test="${empty param.command}">
		<c:set var="errormsg" value="원하는 요청이 없습니다." scope="request" />
		<c:set var="errortype" value="커맨드 파라미터가 존재하지 않습니다." scope="request" />
		<c:set var="url" value="index.jsp" scope="request" />	
		<jsp:forward page="custerror.jsp"></jsp:forward>	 
	</c:when>
	<c:when test="${param.command eq 'list'}">
	<%
		//5. dao에서 결과 받기 
		List<CustUserDto> lists = manager.getCustLists();
		
		//6. scope 에 담아 
		request.setAttribute("custs", lists);
		
		//7 흐름 제어  
		pageContext.forward("custuserlist.jsp");
	%>
	</c:when>
	<c:when test="${param.command eq 'bfadd'}">
		<jsp:forward page="custaddform.jsp"></jsp:forward>
	</c:when>
	<c:when test="${param.command eq 'add'}">
	<%
		//4
		String pid = request.getParameter("id");
		String pname = request.getParameter("name");
		String paddress = request.getParameter("address");
		
		if(isNull(pid) || isNull(pname) || isNull(paddress)){
		
			request.setAttribute("errormsg", "파라미터에 공백문자가 있습니다. ");
			request.setAttribute("errortype", "커맨드 파라미터 값이 존재하지 않습니다. ");
			request.setAttribute("url", "custcontrol.jsp?command=bfadd");
			pageContext.forward("custerror.jsp");
		
		}else {
		
			//5 
			CustUserDto cust = new CustUserDto(pid, pname, paddress);
			CustUserDto custInfo = manager.getCustUser(pid);
	
			if(custInfo != null){
				request.setAttribute("errormsg", "이미 존재하는 고객 ID 입니다.");
				request.setAttribute("errortype", "고객을 추가하지 못했습니다.");
				request.setAttribute("url", "custcontrol.jsp?command=list");
				pageContext.forward("custerror.jsp");
			}else {
				boolean ret = manager.addCustUser(cust);
			
				if(ret){
					//6 
					request.setAttribute("ret", ret);
					
					//7 흐름 제어  
					pageContext.forward("custadd.jsp");
					
				} else {
					request.setAttribute("errormsg", "고객을 추가하는 중에 에러가 발생하였습니다.");
					request.setAttribute("errortype", "고객을 추가하지 못했습니다.");
					request.setAttribute("url", "custcontrol.jsp?command=list");
					pageContext.forward("custerror.jsp");
				}
			}
		}
	%>

	</c:when>
	<c:when test="${param.command eq 'detail'}">
	<%
		//4
		String id = request.getParameter("id");
		
		if(isNull(id)){
			request.setAttribute("errormsg", "파라미터에 공백문자가 있습니다. ");
			request.setAttribute("errortype", "커맨드 파라미터 값이 존재하지 않습니다. ");
			request.setAttribute("url", "index.jsp");
			pageContext.forward("custerror.jsp");
		
		}else {
			//5 
			CustUserDto cust = manager.getCustUser(id);
			
			if(cust == null){
				request.setAttribute("errormsg", "고객 정보 얻어오는 중에 에러가 발생하였습니다.");
				request.setAttribute("errortype", "고객 정보를 얻어오지 못했습니다.");
				request.setAttribute("url", "custcontrol.jsp?command=list");
				pageContext.forward("custerror.jsp");
			}else {
			
				//6 
				request.setAttribute("cust", cust);
				
				//7 흐름 제어  
				pageContext.forward("custuserdetail.jsp");
			
			}
		}
	%>

	</c:when>
	<c:when test="${param.command eq 'delete'}">
	<%
		//4
		String id = request.getParameter("id");
		
		if(isNull(id)){
			request.setAttribute("errormsg", "파라미터에 공백문자가 있습니다. ");
			request.setAttribute("errortype", "커맨드 파라미터 값이 존재하지 않습니다. ");
			request.setAttribute("url", "custcontrol.jsp?command=detail&id="+id);
			pageContext.forward("custerror.jsp");
		}else {
			//5 
			boolean ret = manager.deleteCustUser(id);
			
			if(ret){
				//6 
				request.setAttribute("ret", ret);
				request.setAttribute("pid", id);
				
				//7 흐름 제어  
				pageContext.forward("custdel.jsp");
			} else {
				request.setAttribute("errormsg", "고객을 삭제하는 가운데 문제가 발생했습니다.");
				request.setAttribute("errortype", "고객을 삭제하지 못했습니다.");
				request.setAttribute("url", "custcontrol.jsp?command=detail&id="+id);
				pageContext.forward("custerror.jsp");
			}
		}	
	%>

	</c:when>
	<c:when test="${param.command eq 'bfupdate'}">
	<%
		//4
		String id = request.getParameter("id");
		
		if(isNull(id)){
			request.setAttribute("errormsg", "파라미터에 공백문자가 있습니다. ");
			request.setAttribute("errortype", "커맨드 파라미터 값이 존재하지 않습니다. ");
			request.setAttribute("url", "custcontrol.jsp?command=list");
			pageContext.forward("custerror.jsp");
		
		}else {
			//5 
			CustUserDto cust = manager.getCustUser(id);
			if(cust == null){
				request.setAttribute("errormsg", "고객 정보 얻어오는 중에 에러가 발생하였습니다.");
				request.setAttribute("errortype", "고객 정보를 얻어오지 못했습니다.");
				request.setAttribute("url", "custcontrol.jsp?command=list");
				pageContext.forward("custerror.jsp");
			}
			else {
				//6 
				request.setAttribute("cust", cust);
				//7 흐름 제어  
				pageContext.forward("custuserupdate.jsp");
			}
		
		}
	%>
	</c:when>	
	<c:when test="${param.command eq 'update'}">
	<%
		//4
		String pid = request.getParameter("id");
		String pname = request.getParameter("name");
		String paddress = request.getParameter("address");
		
		if(isNull(pid) || isNull(pname) || isNull(paddress)){
			request.setAttribute("errormsg", "파라미터에 공백문자가 있습니다. ");
			request.setAttribute("errortype", "커맨드 파라미터 값이 존재하지 않습니다. ");
			request.setAttribute("url", "custcontrol.jsp?command=detail&id="+pid);
			pageContext.forward("custerror.jsp");
		}else {
			//5 
			boolean ret = manager.updateCustUser(new CustUserDto(pid, pname, paddress));
			
			if(ret){
				//6 
				request.setAttribute("ret", ret);
				request.setAttribute("pid", pid);
				//7 흐름 제어  
				pageContext.forward("custupdate.jsp");
			}
			else {
				request.setAttribute("errormsg", "고객 정보 변경하는 동안 에러가 발생했습니다.");
				request.setAttribute("errortype", "고객 정보를 변경하지 못했습니다.");
				request.setAttribute("url", "custcontrol.jsp?command=detail&id="+pid);
				pageContext.forward("custerror.jsp");
			}
		}
	%>
	</c:when>
	<c:when test="${param.command eq 'muldel'}">
	<%
		//4
		String[] ids = request.getParameterValues("delck");
		
		if(ids == null || ids.length == 0){
			request.setAttribute("errormsg", "한 개 이상을 선택하셔야 합니다.");
			request.setAttribute("errortype", "커맨드 파라미터 값이 존재하지 않습니다. ");
			request.setAttribute("url", "custcontrol.jsp?command=list");
			pageContext.forward("custerror.jsp");
		}else {
			//5 
			boolean ret = manager.muldelCustUser(ids);
			
			if(ret){
				//6 
				request.setAttribute("ret", ret);
				//7 흐름 제어  
				pageContext.forward("custmuldel.jsp");
			}else{
				request.setAttribute("errormsg", "고객을 삭제하는 가운데 문제가 발생했습니다.");
				request.setAttribute("errortype", "고객을 삭제하지 못했습니다.");
				request.setAttribute("url", "custcontrol.jsp?command=list");
				pageContext.forward("custerror.jsp");
			}
		}
	%>
	</c:when>
	<c:otherwise>
		<!-- response.sendRedirect("index.jsp"); -->
		<jsp:forward page="index.jsp"></jsp:forward>
	</c:otherwise>
</c:choose>
</body>
</html>