
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
<%      if(request.getParameter("goodsname")==""||
request.getParameter("introduce")==""||
request.getParameter("originalprice")==""||
request.getParameter("currentprice")==""){
	out.println("<script language='javascript'>alert('不能为空！');window.location.href='goodsadd.jsp';</script>");
	return;
}
	String goodsname=new String(request.getParameter("goodsname"));
	//out.println(goodsname);
	String introduce=new String(request.getParameter("introduce"));
    //out.println(introduce);
    String originalprice=new String(request.getParameter("originalprice"));
    //out.println(originalprice);
    String currentprice=new String(request.getParameter("currentprice"));
    String category=new String(request.getParameter("category"));
    //out.println(currentprice); 

    Class.forName("com.mysql.jdbc.Driver");
    String url="jdbc:mysql://127.0.0.1:3306/shangcheng";
    String usename="root";
    String psw="123456";
    Connection conn=DriverManager.getConnection(url,usename,psw);
    if(conn !=null){
    	String sql="select * from goods where goodsname = '" + goodsname + "'";
/*             String sql="select * from users where username='"
                + user + "' and password='" + pass+ "'"; */
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery(sql);            
            if(rs.next()){
                  out.println("<script>alert('该商品已存在,添加失败');window.location.href='postadd.jsp';</script>");
            }else{
            	PreparedStatement tmt = conn.prepareStatement("Insert into goods(goodsname,introduce,originalprice,currentprice,categories_id) values('" + goodsname + "','" + introduce + "','" + originalprice + "','" + currentprice + "','" + category + "')");
            	int rst = tmt.executeUpdate();
            	if (rst != 0){
            		out.println("<script language='javascript'>alert('商品添加成功！');window.location.href='goods.jsp';</script>");
            		}else{
            			out.println("<script language='javascript'>alert('商品添加失败！');window.location.href='goodsadd.jsp';</script>");
            			}        
            }             
    } 
    %>
</body>
</html>
