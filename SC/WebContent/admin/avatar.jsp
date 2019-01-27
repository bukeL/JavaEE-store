<%@ page language="java"   contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    import="java.sql.*"%>

    
    <%      
        String user=new String(request.getParameter("username"));
        Class.forName("com.mysql.jdbc.Driver");
        String url="jdbc:mysql://127.0.0.1:3306/shangcheng";
        String usename="root";
        String psw="123456";
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
			    	String avatarurl=rs.getString("avatar");
			    	out.println(avatarurl);
                    //response.sendRedirect("Home.jsp");
                } else{
                	 out.println("../assets/img/default.png"); 
                	
                }
                	
        }     
    %>