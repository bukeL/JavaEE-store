<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>

<%
if(session.getAttribute("user") == null){
	out.println("<script>window.location.href='login.jsp';</script>");
	return; //不return的话会继续执行if下面的语句;
} 
String user=session.getAttribute("user").toString();
//out.println(user);
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://127.0.0.1:3306/shangcheng";
String usename="root";
String psw="123456";
String num="";
String num1="";
String id="";
ResultSet rs1=null;
// out.println(user);//能接收到user

Connection conn=DriverManager.getConnection(url,usename,psw);
//out.println(user);
if(conn !=null){
    String sql="select count(1) as num from goods;";
    //out.println(sql);
    Statement stmt=conn.createStatement();
    ResultSet rs=stmt.executeQuery(sql);  
   // out.println(rs);
        if(rs.next()){
        	num=rs.getString("num");
	    	session.setAttribute("count",num);
            //response.sendRedirect("Home.jsp");
            //out.println(avatarurl);
        } 
        String sql1="select count(1) as num from orders";
        //out.println(sql);
        Statement stmt1=conn.createStatement();
        rs1=stmt1.executeQuery(sql1);  
        if(rs1.next()){
        	num1=rs1.getString("num");
	    	session.setAttribute("count1",num1);
            //response.sendRedirect("Home.jsp");
            //out.println(avatarurl);
        } 
            }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Admin view</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/bootstrap/css/bootstrap.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/font-awesome/css/font-awesome.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/nprogress/nprogress.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
  <script src="${pageContext.request.contextPath}/assets/vendors/nprogress/nprogress.js"></script>
</head>
<body>
  <script>NProgress.start()</script>

  <div class="main">
    <nav class="navbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="${pageContext.request.contextPath}/admin/logout.jsp"><i class="fa fa-sign-out"></i>退出</a></li>
      </ul>
    </nav>
    <div class="container-fluid">
      <div class="jumbotron text-center">
        <h1>LYH商城后台管理</h1>
        <p style="text-align:right;width:740px;">${user.username}</p>
      </div>
      <div class="row">
        <div class="col-md-4">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title">商城内容统计</h3>
            </div>
            <ul class="list-group">
              <li class="list-group-item">总共有<span style="font-size:20px">${count}</span>个商品</li>
              <li class="list-group-item">总共有<span style="font-size:20px">${count1}</span>订单</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
<%@ include file="sidebar.jsp"%>
  <script src="${pageContext.request.contextPath}/assets/vendors/jquery/jquery.js"></script>

    <script>	
			$(function(){
				$(".aside").css("display","none").fadeIn(1000)
			})
  </script>
    <script src="${pageContext.request.contextPath}/assets/vendors/bootstrap/js/bootstrap.js"></script>
  <script>NProgress.done()</script>
</body>
</html>