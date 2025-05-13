<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="dao" class="uploadboard.UboardAnswerDao"/>
<jsp:useBean id="dto" class="uploadboard.UboardAnswerDto"/>

<!-- dto와 같은 모든것 -->
<jsp:setProperty property="*" name="dto"/>
<%
	dao.updateAnswer(dto);
%>