<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	request.setCharacterEncoding("utf-8");
	%>
<jsp:useBean id="dto" class="data.dto.smartDto"/>
<jsp:useBean id="dao" class="data.dao.smartDao"/>
<jsp:setProperty property="*" name="dto"/>

<%
	dao.insertSmartboard(dto);
	response.sendRedirect("../index.jsp?main=smart/content.jsp?num="+dao.getMaxNum());
%>