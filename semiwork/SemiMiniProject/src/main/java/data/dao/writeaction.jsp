<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="data.dao.boardDao"/>
<jsp:useBean id="dto" class="data.dto.boardDto"/>

<%
// 폼에서 전달된 파라미터들의 null 체크 및 기본값 설정
String num = request.getParameter("num");
String regroup = request.getParameter("regroup");
String restep = request.getParameter("restep");
String relevel = request.getParameter("relevel");

// null이거나 빈 문자열인 경우 "0"으로 설정
if(num == null || num.trim().isEmpty()) {
    dto.setNum("0");
} else {
    dto.setNum(num);
}

if(regroup == null || regroup.trim().isEmpty()) {
    dto.setRegroup(0);
} else {
    dto.setRegroup(Integer.parseInt(regroup));
}

if(restep == null || restep.trim().isEmpty()) {
    dto.setRestep(0);
} else {
    dto.setRestep(Integer.parseInt(restep));
}

if(relevel == null || relevel.trim().isEmpty()) {
    dto.setRelevel(0);
} else {
    dto.setRelevel(Integer.parseInt(relevel));
}
%>

<!-- 나머지 속성들 설정 -->
<jsp:setProperty property="writer" name="dto"/>
<jsp:setProperty property="subject" name="dto"/>
<jsp:setProperty property="content" name="dto"/>
<jsp:setProperty property="pass" name="dto"/>

<%
//insert 처리
dao.insertReboard(dto);

//목록으로 이동
response.sendRedirect("list.jsp");
%> 