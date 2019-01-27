
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
<%      
if(session.getAttribute("username") == null){
	out.println("<script>alert('请先登录')</script>");
	out.println("<script>window.location.href='login.jsp';</script>");
	return; //不return的话会继续执行if下面的语句;
}
if(request.getParameter("user_id")==""||request.getParameter("goodsname")==""||
request.getParameter("currentprice")==""||
request.getParameter("introduce")==""||
request.getParameter("originalprice")==""||
request.getParameter("status")==""){
	out.println("<script language='javascript'>alert('不能为空！');window.location.href='postadd.jsp';</script>");
	return;
}
	String user_id=new String(request.getParameter("user_id"));
	String goodsname=new String(request.getParameter("goodsname"));
	//out.println(goodsname);
	String introduce=new String(request.getParameter("introduce"));
    //out.println(introduce);
    String originalprice=new String(request.getParameter("originalprice"));
    //out.println(originalprice);
    String currentprice=new String(request.getParameter("currentprice"));
    String status=new String(request.getParameter("status"));
    //out.println(currentprice); 

    Class.forName("com.mysql.jdbc.Driver");
    String url="jdbc:mysql://127.0.0.1:3306/shangcheng";
    String usename="root";
    String psw="123456";
    Connection conn=DriverManager.getConnection(url,usename,psw);
    if(conn !=null){

        Statement stmt=conn.createStatement();        
            
            	PreparedStatement tmt = conn.prepareStatement("Insert into orders(user_id,goodsname,introduce,originalprice,currentprice,status) values('" + user_id + "','" + goodsname + "','" + introduce + "','" + originalprice + "','" + currentprice + "','" + status + "')");
            	int rst = tmt.executeUpdate();
            	if (rst != 0){
            		
            		out.println("<script language='javascript'>alert('下单成功！');window.location.href='index.jsp';</script>");
            		}else{
            			out.println("<script language='javascript'>alert('下单失败！');window.location.href='register.jsp';</script>");
            			}        
                         
    } 
    %>
</body>
</html>
