<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*,listener.CountUtils"
    %>
<% 
if(session.getAttribute("username") == null){
	out.println("<script>alert('请先登录')</script>");
	out.println("<script>window.location.href='login.jsp';</script>");
	return; //不return的话会继续执行if下面的语句;
}
		String id1=session.getAttribute("id").toString();    //用户id
		
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
		String goods_id="";
		ResultSet rs1=null;
		// out.println(user);//能接收到user

		Connection conn=DriverManager.getConnection(url,usename,psw);
		//out.println(user);
		if(conn !=null){

		   // out.println(rs);

		        String sql1="select * from shopcar  inner join users on shopcar.user_id = users.id inner join goods on shopcar.goods_id = goods.id where user_id='" + id1 + "'";
		        //out.println(sql);
		        Statement stmt1=conn.createStatement();
		        rs1=stmt1.executeQuery(sql1);  

		            }
	 
%>
    
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>电子商城</title>
  <link rel="stylesheet" href="assets/css/style.css">
  <link rel="stylesheet" href="assets/vendors/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" href="assets/vendors/bootstrap/css/bootstrap.css">
</head>
<body>
  <div class="wrapper">
    <div class="topnav">
      <ul>
  		<li><a href="detail.jsp?id=1"><i class="fa fa-glass"></i>家用电器</a></li>
        <li><a href="detail.jsp?id=2"><i class="fa fa-phone"></i>生活用品</a></li>
        <li><a href="detail.jsp?id=3"><i class="fa fa-fire"></i>科技产品</a></li>
        <li><a href="detail.jsp?id=4"><i class="fa fa-gift"></i>模型手办</a></li>
      </ul>
    </div>
    <div class="header">
      
      <h1  class="btn btn-info" style="width:200px;height:120px;text-align: center;font-size:30px;line-height: 120px"><a href="index.jsp">商城首页</a></h1>

      <ul class="nav">
  		<li><a href="detail.jsp?id=1"><i class="fa fa-glass"></i>家用电器</a></li>
        <li><a href="detail.jsp?id=2"><i class="fa fa-phone"></i>生活用品</a></li>
        <li><a href="detail.jsp?id=3"><i class="fa fa-fire"></i>科技产品</a></li>
        <li><a href="detail.jsp?id=4"><i class="fa fa-gift"></i>模型手办</a></li>
      </ul>
      <div class="search">
        <form>
          <input type="text" class="keys" placeholder="输入关键字">
          <input type="submit" class="btn btn-info" value="搜索">
        </form>
      </div>
      <div class="slink">
        <a href="admin/login.jsp">后台</a> | <a href="index.jsp">商城首页</a>
      </div>
    </div>
    <div class="aside" >
    <%if(session.getAttribute("username") == null){ %>
          <div class="widgets">
<a href="login.jsp" class="btn btn-info btn-md" style="margin-left:60px">登录</a>
             <a href="register.jsp" class="btn btn-info  btn-md" >注册</a>
      </div>
      <%}else{ %>
      <div class="widgets">
		<h2>欢迎你:${username}</h2>
		<a href="shopcar.jsp" class="btn btn-info  btn-md" >我的购物车</a>
		<a href="logout.jsp" class="btn btn-info  btn-md" >退出</a>	
      </div>
      <%} %>
      <div class="widgets">
        <h4>当前在线人数 :<%=CountUtils.getlogincount() %></h4>

      </div>

    </div>
    <div class="content" >
		<h3>购物车</h3>
      <table class="table table-striped table-bordered table-hover">
        <thead>
          <tr>
           <!--  <th class="text-center" width="40"><input type="checkbox"></th> -->
            <th>商品编号</th>
            <th>商品名称</th>
            <th>商品介绍</th>
            <th class="text-center">商品原价</th>
            <th class="text-center">商品现价</th>
            
            <th class="text-center" width="150px">操作</th>
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
			    	 goods_id=rs1.getString("goods_id");
			    	 %> 
          <tr>
            <!-- <td class="text-center"><input type="checkbox"></td> -->
            <td><%out.println(id); %></td>
            <td><%out.println(goodsname);%></td>
            <td><%out.println(introduce);%></td>
            <td class="text-center"><%out.println(originalprice);%></td>
            <td class="text-center"><%out.println(currentprice);%></td>

            <td class="text-center">
              <a href="shopcarDelete.jsp?id=<%out.println(id); %>" class="btn btn-default btn-xs">移出购物车</a>
              <a href="buysure.jsp?id=<%out.println(goods_id); %>" class="btn btn-info btn-xs">直接购买</a>
            </td>
          </tr>
           <%} %> 
        </tbody>
      </table>
    </div>
    <div class="footer">
    </div>
  </div>
  <script src="assets/vendors/jquery/jquery.js"></script>
  <script src="assets/vendors/swipe/swipe.js"></script>
  <script>
    //
    var swiper = Swipe(document.querySelector('.swipe'), {
      auto: 3000,
      transitionEnd: function (index) {
        // index++;

        $('.cursor span').eq(index).addClass('active').siblings('.active').removeClass('active');
      }
    });

    // 上/下一张
    $('.swipe .arrow').on('click', function () {
      var _this = $(this);

      if(_this.is('.prev')) {
        swiper.prev();
      } else if(_this.is('.next')) {
        swiper.next();
      }
    })
  </script>
</body>
</html>
