<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
<%
if(session.getAttribute("user") == null){
	out.println("<script>window.location.href='login.jsp';</script>");
	return; //不return的话会继续执行if下面的语句;
}
	String id=request.getParameter("id");
	String goodsname="";
	String introduce="";
	String originalprice="";
	String currentprice="";
	//out.println(user);
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://127.0.0.1:3306/shangcheng";
	String usename="root";
	String psw="123456";
	String num="";
	// out.println(user);//能接收到user

	Connection conn=DriverManager.getConnection(url,usename,psw);
	//out.println(user);
	if(conn !=null){
		String sql="select * from goods where id='"
	            + id + "';";
	    //out.println(sql);
	    Statement stmt=conn.createStatement();
	    ResultSet rs=stmt.executeQuery(sql);  
	    if(rs.next()){
	    	 goodsname=rs.getString("goodsname");
	    	 introduce=rs.getString("introduce");
	    	 originalprice=rs.getString("originalprice");
	    	 currentprice=rs.getString("currentprice");
	}
	    }
	%>
	
	<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <title>Add new post &laquo; Admin</title>
  <link rel="stylesheet" href="../assets/vendors/bootstrap/css/bootstrap.css">
  <link rel="stylesheet" href="../assets/vendors/font-awesome/css/font-awesome.css">
  <link rel="stylesheet" href="../assets/vendors/nprogress/nprogress.css">
  <link rel="stylesheet" href="../assets/css/admin.css">
  <script src="../assets/vendors/nprogress/nprogress.js"></script>
</head>
<body>
  <script>NProgress.start()</script>

  <div class="main">
    <nav class="navbar">

      <ul class="nav navbar-nav navbar-right">
        <li><a href="logout.jsp"><i class="fa fa-sign-out"></i>退出</a></li>
      </ul>
    </nav>
    <div class="container-fluid">
      <div class="page-title">
        <h1>编辑商品</h1>
      </div>
      <!-- 有错误信息时展示 -->
      <!-- <div class="alert alert-danger">
        <strong>错误！</strong>发生XXX错误
      </div> -->
    <form action="editaddResult.jsp" method="get" enctype="multipart/form-data">
          <div class="form-group">
        <label for="id">商品编号</label>
        <input type="text" class="form-control" id="id" name="id" value="<%out.println(id);%>">
      </div>
      <div class="form-group">
        <label for="goodsname">商品名</label>
        <input type="text" class="form-control" id="goodsname" name="goodsname" value="<%out.println(goodsname);%>">
      </div>
            <div class="form-group">
        <label for="introduce">商品介绍</label>
        <input type="text" class="form-control" id="introduce" name="introduce" value="<%out.println(introduce);%>">
      </div>
      <div class="form-group">
        <label for="originalprice">商品原价格</label>
        <input type="text" class="form-control" id="originalprice" name="originalprice" value="<%out.println(originalprice);%>">
      </div>
            <div class="form-group">
        <label for="currentprice">商品现价格</label>
        <input type="text" class="form-control" id="currentprice" name="currentprice" value="<%out.println(currentprice);%>">
      </div>
      <button class="btn btn-primary btn-block">提交保存</button>
    </form>
    </div>
  </div>

<%@ include file="sidebar.jsp"%>

  <script src="../assets/vendors/jquery/jquery.js"></script>
  <script src="../assets/vendors/bootstrap/js/bootstrap.js"></script>
  <script>NProgress.done()</script>
</body>
</html>