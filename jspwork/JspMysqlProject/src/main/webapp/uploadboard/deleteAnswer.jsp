<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="uploadboard.UboardAnswerDto"/>
<jsp:useBean id="dao" class="uploadboard.UboardAnswerDao"/>
<jsp:setProperty property="*" name="dto"/>
<%
	String idx=request.getParameter("idx");

	dao.deleteAnswer(idx);
%>