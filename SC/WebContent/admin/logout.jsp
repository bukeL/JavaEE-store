<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% session.invalidate();
out.println("<script>window.location.href='login.jsp';</script>");
%>>