<!-- //这是一个公共界面;抽象出来调用 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
    
<div class="aside" >
    <div class="profile">
      <img class="avatar" src="/SC/images/avatar.jpg">
      <h3 class="name">${user.username} </h3>
    </div>
    <ul class="nav">
      <li class="active">
        <a href="${pageContext.request.contextPath}/admin/index.jsp"><i class="fa fa-dashboard"></i>管理首页</a>
      </li>
 		<%
    	String current_page = this.getClass().getSimpleName().replaceAll("_", "."); 
    	//当前页面文件名
        String[] str={"goods.jsp","goodsadd.jsp"};
        %>
        <%
        Boolean a=false;
        for (int i = 0; i < str.length; i++) {
        	if(current_page.equals(str[i])) {
        		 a=true;
        		}
        		}
        %>
      <%--   <%Boolean a=true;%> --%>
       <li <%if(a){out.println("class='active'"); }else{out.println("");}%>> 
       
        <a href="#menu-posts"  data-toggle="collapse" 
          <% if(a){out.println(""); }else{out.println("class='collapsed'");}%>>
        <i class="fa fa-thumb-tack"></i>商品<i class="fa fa-angle-right"></i>
        </a>
        <ul id="menu-posts" class="collapse
         <%out.println(current_page);out.println(a);if(a){out.println("in"); }else{out.println("");}%>">
          <li <%if(current_page.equals("goods.jsp")){out.println("class='active'"); }else{out.println("");}%>>
          <a href="${pageContext.request.contextPath}/admin/goods.jsp">所有商品</a></li>
          <li <%if(current_page.equals("goodsadd.jsp")){out.println("class='active'"); }else{out.println("");}%>>
          <a href="${pageContext.request.contextPath}/admin/goodsadd.jsp">添加商品</a></li>
        </ul>
      </li>
          <li<%if(current_page.equals("order.jsp")){out.println(" class='active'"); }else{out.println("");}%> ><a href="${pageContext.request.contextPath}/admin/order.jsp">所有订单</a></li>

    </ul>
  </div>
  
