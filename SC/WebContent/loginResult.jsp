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
		String username=new String(request.getParameter("username"));
		//out.println(goodsname);
		String password=new String(request.getParameter("password"));
        Class.forName("com.mysql.jdbc.Driver");
        String url="jdbc:mysql://127.0.0.1:3306/shangcheng";
        String usename="root";
        String psw="123456";
        Connection conn=DriverManager.getConnection(url,usename,psw);
        if(conn !=null){
            String sql="select * from users where username='"
                    + username + "' and password='" + password+ "'";
            Statement stmt=conn.createStatement();
            ResultSet rs=stmt.executeQuery(sql);            
                if(rs.next()){
                	String id=rs.getString("id");
                	session.setAttribute("username",username);
                	session.setAttribute("id",id);
                	out.println("<script language='javascript'>alert('登录成功！')</script>");
                      out.println("<script>window.location.href='index.jsp';</script>");
                    //response.sendRedirect("Home.jsp");
                }else{  
                     out.println("<script language='javascript'>alert('登录失败！ 用户名或密码错误')</script>");
                     out.println("<script language='javascript'>window.location.href='login.jsp'</script>");
                     
                   // response.sendRedirect("login.jsp");//密码不对返回到登陆                          
                }
                
        }
    
    %>
</body>
</html>
