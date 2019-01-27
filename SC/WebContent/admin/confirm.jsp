<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
<%
if(session.getAttribute("user") == null){
	out.println("<script>window.location.href='login.jsp';</script>");
	return; //不return的话会继续执行if下面的语句;没登录不能执行操作;
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
            	PreparedStatement tmt = conn.prepareStatement("update orders set status='1' where id='"
        	            + id + "';");
            	int rst = tmt.executeUpdate();
            	if (rst != 0){
            		out.println("<script language='javascript'>alert('商品已确认发货！');window.location.href='order.jsp';</script>");
            		}else{
            			out.println("<script language='javascript'>alert('发货失败！');window.location.href='order.jsp';</script>");
            			}        
            }             
     
	%>