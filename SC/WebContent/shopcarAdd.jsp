
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
String user_id=session.getAttribute("id").toString();    //用户id
		String goods_id=new String(request.getParameter("id"));  //商品id

    Class.forName("com.mysql.jdbc.Driver");
    String url="jdbc:mysql://127.0.0.1:3306/shangcheng";
    String usename="root";
    String psw="123456";
    Connection conn=DriverManager.getConnection(url,usename,psw);
    if(conn !=null){

        Statement stmt=conn.createStatement();        
            
            	PreparedStatement tmt = conn.prepareStatement("Insert into shopcar(user_id,goods_id) values('" + user_id + "','" + goods_id + "')");
            	int rst = tmt.executeUpdate();
            	if (rst != 0){
            		
            		out.println("<script language='javascript'>alert('加入购物车成功！');window.location.href='index.jsp';</script>");
            		}else{
            			out.println("<script language='javascript'>alert('加入购物车失败！');window.location.href='register.jsp';</script>");
            			}        
                         
    } 
    %>
</body>
</html>
