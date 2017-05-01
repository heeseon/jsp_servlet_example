<%@page import="org.olc.dto.CustUserDto"%>
<%@page import="java.util.List"%>
<%@page import="org.olc.dao.ICustUser"%>
<%@page import="org.olc.dao.CustUserManager"%>
<%@ page contentType="text/html; charset=euc-kr"%>
<% request.setCharacterEncoding("euc-kr"); %>
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
String command = request.getParameter("command");

//2. DAO 생성하
ICustUser manager = new CustUserManager(); 

if(isNull(command)){ //3. 분기 
	%>
	<script type="text/javascript">
	alert('잘못된 요청을 하였습니다. ');
	location.href='index.jsp';
		
	</script>
	
	<% 
	return;
}else if(command.equalsIgnoreCase("list")){
	//5. dao에서 결과 받기 
	List<CustUserDto> lists = manager.getCustLists();
	//6. scope 에 담아 
	request.setAttribute("custs", lists);
	//7 흐름 제어  
	pageContext.forward("custuserlist.jsp");
	
}else if(command.equalsIgnoreCase("bfadd")){
	
	response.sendRedirect("custaddform.jsp");

}else if(command.equalsIgnoreCase("add")){
	//4
	String pid = request.getParameter("id");
	String pname = request.getParameter("name");
	String paddress = request.getParameter("address");
	//5 
	boolean ret = manager.addCustUser(new CustUserDto(pid, pname, paddress));
	//6 
	request.setAttribute("ret", ret);
	//7 흐름 제어  
	pageContext.forward("custadd.jsp");
	
}else if(command.equalsIgnoreCase("detail")){
	//4
	String id = request.getParameter("id");
	//5 
	CustUserDto cust = manager.getCustUser(id);
	//6 
	request.setAttribute("cust", cust);
	//7 흐름 제어  
	pageContext.forward("custuserdetail.jsp");
	
}else if(command.equalsIgnoreCase("delete")){
	//4
	String id = request.getParameter("id");
	//5 
	boolean ret = manager.deleteCustUser(id);
	//6 
	request.setAttribute("ret", ret);
	request.setAttribute("pid", id);
	//7 흐름 제어  
	pageContext.forward("custdel.jsp");
	
}else if(command.equalsIgnoreCase("bfupdate")){
	//4
	String id = request.getParameter("id");
	//5 
	CustUserDto cust = manager.getCustUser(id);
	//6 
	request.setAttribute("cust", cust);
	//7 흐름 제어  
	pageContext.forward("custuserupdate.jsp");
	
}else if(command.equalsIgnoreCase("update")){
	//4
	String pid = request.getParameter("id");
	String pname = request.getParameter("name");
	String paddress = request.getParameter("address");
	//5 
	boolean ret = manager.updateCustUser(new CustUserDto(pid, pname, paddress));
	//6 
	request.setAttribute("ret", ret);
	request.setAttribute("pid", pid);
	//7 흐름 제어  
	pageContext.forward("custupdate.jsp");
	
}else if(command.equalsIgnoreCase("muldel")){
	//4
	String[] ids = request.getParameterValues("delck");
	if(ids == null || ids.length == 0){
		request.setAttribute("ret", false);
		//7 흐름 제어  
		pageContext.forward("custmuldel.jsp");
	}else {
		//5 
		boolean ret = manager.muldelCustUser(ids);	
		//6 
		request.setAttribute("ret", ret);
		//7 흐름 제어  
		pageContext.forward("custmuldel.jsp");
	}
}else {
	response.sendRedirect("index.jsp");
}

%>
</body>
</html>