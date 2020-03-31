<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1" import="cn.edu.hrbmu.ontogene.domain.*" %>

<%

	String term_id = IDNames.getIDByTerm(term_name);
	System.out.println("term_id"+term_id);
	out.println(term_id);
%>