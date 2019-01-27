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
	String goodsname="";
	String introduce="";
	String originalprice="";
	String currentprice="";
	String id="";
	String username1="";
	String status="";
	ResultSet rs1=null;
	// out.println(user);//能接收到user

	Connection conn=DriverManager.getConnection(url,usename,psw);
	//out.println(user);
	if(conn !=null){
	    String sql="select * from users where username='"
	            + user + "';";
	    //out.println(sql);
	    Statement stmt=conn.createStatement();
	    ResultSet rs=stmt.executeQuery(sql);  
	   // out.println(rs);
	        if(rs.next()){
	        	String username=rs.getString("username");
	        	String password=rs.getString("password");
		    	String avatarurl=rs.getString("avatar");
		    	session.setAttribute("username",username);
		    	session.setAttribute("password",password);
		    	session.setAttribute("avatarurl",avatarurl);
	            //response.sendRedirect("Home.jsp");
	            //out.println(avatarurl);
	        } 
	        String sql1="select * from orders inner join users on orders.user_id = users.id";
	        //out.println(sql);
	        Statement stmt1=conn.createStatement();
	        rs1=stmt1.executeQuery(sql1);  
	} 
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Posts &laquo; Admin</title>
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
        <h1>所有订单</h1>
      </div>
      <!-- 有错误信息时展示 -->
      <!-- <div class="alert alert-danger">
        <strong>错误！</strong>发生XXX错误
      </div> -->
      <div class="page-action">
        <!-- show when multiple checked -->
      </div>
      <table class="table table-striped table-bordered table-hover">
        <thead>
          <tr>
            <th width="80px">订单编号</th>
            <th width="80px">用户名</th>
            <th width="80px">商品名称</th>
            <th width="80px">商品介绍</th>
            <th width="80px">发货状态</th>
            <th class="text-center" width="120px">商品原价</th>
            <th class="text-center" width="120px">商品现价</th>    
            <th class="text-center" width="100">操作</th>
          </tr>
        </thead>
        <tbody>
          <!-- 通过while来判断是否还有数据,有就接着取,知道结束 -->
         <%while(rs1.next()){
        	         id=rs1.getString("id");
			    	 goodsname=rs1.getString("goodsname");
			    	 introduce=rs1.getString("introduce");
			    	 originalprice=rs1.getString("originalprice");
			    	 currentprice=rs1.getString("currentprice");
			    	 username1=rs1.getString("username");
			    	 status=rs1.getString("status");
			    	 %> 
          <tr>
            <td><%out.println(id); %></td>
            <td><%out.println(username1); %></td>
            <td><%out.println(goodsname);%></td>
            <td><%out.println(introduce);%></td>
             <td ><%if(status.equals("1")){out.println("已发货");}else{out.println("未发货");} %></td>  
            <td class="text-center"><%out.println(originalprice);%></td>
            <td class="text-center"><%out.println(currentprice);%></td>
            <td class="text-center">
              <a href="#" class="btn btn-default btn-xs">查看订单</a>
              <%if(status.equals("0")){ %>
              <a href="confirm.jsp?id=<%out.println(id);%>" class="btn btn-success btn-xs">确认发货</a>
              <%}%>
            </td>
          </tr>
           <%} %> 
        </tbody>
      </table>
    </div>
  </div>
<%@ include file="sidebar.jsp"%>
  <script src="../assets/vendors/jquery/jquery.js"></script>
  <script src="../assets/vendors/bootstrap/js/bootstrap.js"></script>
  <script>NProgress.done()</script>
</body>
</html>
