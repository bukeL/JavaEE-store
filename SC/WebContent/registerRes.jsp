
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
<%      if(request.getParameter("username")==""||
request.getParameter("password")==""||
request.getParameter("address")==""||
request.getParameter("phone")==""){
	out.println("<script language='javascript'>alert('不能为空！');window.location.href='register.jsp';</script>");
	return;
}
	String username=new String(request.getParameter("username"));
	//out.println(goodsname);
	String password=new String(request.getParameter("password"));
    //out.println(introduce);
    String address=new String(request.getParameter("address"));
    //out.println(originalprice);
    String phone=new String(request.getParameter("phone"));
    //out.println(currentprice); 

    Class.forName("com.mysql.jdbc.Driver");
    String url="jdbc:mysql://127.0.0.1:3306/shangcheng";
    String usename="root";
    String psw="123456";
    Connection conn=DriverManager.getConnection(url,usename,psw);
    if(conn !=null){
    	String sql="select * from users where username = '" + username + "'";
/*             String sql="select * from users where username='"
                + user + "' and password='" + pass+ "'"; */
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery(sql);            
            if(rs.next()){
           
                  out.println("<script>alert('该用户已存在,注册失败');window.location.href='register.jsp';</script>");
            }else{
            	PreparedStatement tmt = conn.prepareStatement("Insert into users(username,password,address,phone) values('" + username + "','" + password + "','" + address + "','" + phone + "')");
            	int rst = tmt.executeUpdate();
            	if (rst != 0){
            		session.setAttribute("username",username);
            		out.println("<script language='javascript'>alert('注册成功！');window.location.href='index.jsp';</script>");
            		}else{
            			out.println("<script language='javascript'>alert('注册失败！');window.location.href='register.jsp';</script>");
            			}        
            }             
    } 
    %>
</body>
</html>
