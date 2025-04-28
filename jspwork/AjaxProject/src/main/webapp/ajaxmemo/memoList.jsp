<%@page import="ajaxmemo.MemoDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.List"%>
<%@page import="ajaxmemo.MemoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
MemoDao dao = new MemoDao();

//전체목록 가져오기
List<MemoDto> list = dao.getAllMemos();


JSONArray arr = new JSONArray();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

//arr에 size만 내보내기

for (MemoDto a : list) {
	JSONObject ob = new JSONObject();
	ob.put("num", a.getNum());
	ob.put("writer", a.getWriter());
	ob.put("content", a.getContent());
	ob.put("emot", a.getEmot());
	ob.put("writeday", sdf.format(a.getWriteday()));

	//arr에 추가
	arr.add(ob);
}
%>
<%=arr.toString()%>

