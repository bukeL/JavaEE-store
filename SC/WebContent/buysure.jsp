<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
    
    <% 
    if(session.getAttribute("username") == null){
    	out.println("<script>alert('请先登录')</script>");
    	out.println("<script>window.location.href='login.jsp';</script>");
    	return; //不return的话会继续执行if下面的语句;
    }
	String id1=new String(request.getParameter("id"));  //商品id
	String id2=session.getAttribute("id").toString();    //用户id
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
	String name="";
	String username="";
	String address="";
	String phone="";
	ResultSet rs1=null;
	// out.println(user);//能接收到user

	Connection conn=DriverManager.getConnection(url,usename,psw);
	//out.println(user);
	if(conn !=null){

	   // out.println(rs);

	        String sql1="select * from goods  inner join users where goods.id='" + id1 + "' and users.id='" + id2 + "'";
	        //out.println(sql1);
	        Statement stmt1=conn.createStatement();
	        rs1=stmt1.executeQuery(sql1);  
	        if(rs1.next()){
	        	 goodsname=rs1.getString("goodsname");
	        	 introduce=rs1.getString("introduce");
		    	 originalprice=rs1.getString("originalprice");
		    	 currentprice=rs1.getString("currentprice");
		    	 address=rs1.getString("address");
		    	 phone=rs1.getString("phone");
		    	 
		    	 username=rs1.getString("username");
		    		
	        }
	            }

	        
	 
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>LYH的商城</title>
  <link rel="stylesheet" href="./css/bootstrap.css">
<style type="text/css">
body {
  padding-top: 3.5rem;
}

main {
  padding-top: 2rem;
}

.heading {
  margin-bottom: 2rem;
  /*padding-bottom: 9px;*/
  /*border-bottom: 1px solid #eee;*/
  font-weight: 300;
}

.table th,
.table td {
  vertical-align: middle;
}

.table td img {
  height: 60px;
}

</style>
</head>
<body>
  <nav class="navbar navbar-expand navbar-dark  fixed-top" style="background:#5bc0de">
    <a class="navbar-brand" href="#">LYH的商城</a>
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="index.jsp">返回商城首页</a>
      </li>
    </ul>
  </nav> 

    <main class="container">
    <div class="page-title">
        <h2 style="padding-left:15px">确认订单</h2>
      </div>
     <div class="container-fluid row">

 
           
      <div class="col-md-3"> 
      <div class="form-group">
        <label for="username">用户名</label>
        <input type="text" class="form-control" id="username" name="username" value="<%out.println(username);%>" readonly>
      </div>
            <div class="form-group">
        <label for="address">地址</label>
        <input type="text" class="form-control" id="address" name="address" value="<%out.println(address);%>" readonly>
      </div>
      <div class="form-group">
        <label for="phone">电话</label>
        <input type="text" class="form-control" id="phone" name="phone" value="<%out.println(phone);%>" readonly>
      </div>
      </div>  
      
      <div class="col-md-9">
      <form action="orderAdd.jsp" method="get" enctype="multipart/form-data">
        <input type="hidden" class="form-control" id="user_id" name="user_id" value="${id}" readonly>
          <div class="form-group">
        <label for="goodsname">商品名</label>
        <input type="text" class="form-control" id="goodsname" name="goodsname" value="<%out.println(goodsname);%>" readonly>
      </div>
       <div class="form-group">
        <label for="introduce">商品介绍</label>
        <input type="text" class="form-control" id="introduce" name="introduce" value="<%out.println(introduce);%>" readonly>
      </div>
                  <div class="form-group">
        <label for="originalprice">商品原价格</label>
        <input type="text" class="form-control" id="originalprice" name="originalprice" value="<%out.println(originalprice);%>" readonly>
      </div>
            <div class="form-group">
        <label for="currentprice">商品现价格</label>
        <input type="text" class="form-control" id="currentprice" name="currentprice" value="<%out.println(currentprice);%>" readonly>
      </div>
          <div class="form-group">
            <label for=""status"">所属状态</label>
            <select id=""status"" class="form-control" name="status">
              <option value="0">未发货</option>
            </select>
          </div>

      <button class="btn btn-info btn-block">下单</button>
    </form></div>
      
    
    </div>
    </main>
  </div>
</body>
</html>