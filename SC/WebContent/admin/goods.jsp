<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<% 
if(session.getAttribute("user") == null){
	out.println("<script>window.location.href='login.jsp';</script>");
	return; //不return的话会继续执行if下面的语句;
}
	String user=session.getAttribute("user").toString();
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
	ResultSet rs1=null;
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
	        	String username=rs.getString("username");
	        	String password=rs.getString("password");
		    	String avatarurl=rs.getString("avatar");
		    	session.setAttribute("username",username);
		    	session.setAttribute("password",password);
		    	session.setAttribute("avatarurl",avatarurl);
	            //response.sendRedirect("Home.jsp");
	            //out.println(avatarurl);
	        } 
	        String sql1="select * from goods";
	        //out.println(sql);
	        Statement stmt1=conn.createStatement();
	        rs1=stmt1.executeQuery(sql1);  
	       // out.println(rs);
	            /* if(rs1.next()){
	            	out.println(rs1);
	            	 id=rs1.getString("id");
			    	 goodsname=rs1.getString("goodsname");
			    	 introduce=rs1.getString("introduce");
			    	 originalprice=rs1.getString("originalprice");
			    	 currentprice=rs1.getString("currentprice"); */
			    	//out.println(goodsname);
	                //response.sendRedirect("Home.jsp");
	            }
/* 	             while(rs1.next()){
	            	 goodsname=rs1.getString("goodsname");
			    	 introduce=rs1.getString("introduce");
			    	 originalprice=rs1.getString("originalprice");
			    	 currentprice=rs1.getString("currentprice");
	                }    
	    }*/
	        
	 
%>
    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Posts &laquo; Admin</title>
  <link rel="stylesheet" href="../assets/vendors/bootstrap/css/bootstrap.css">
  <link rel="stylesheet" href="../assets/vendors/font-awesome/css/font-awesome.css">
  <link rel="stylesheet" href="../assets/vendors/nprogress/nprogress.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-table.css"/>
  <link rel="stylesheet" href="../assets/css/admin.css">
      <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-table.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-table-zh-CN.js"></script>
  <script src="../assets/vendors/nprogress/nprogress.js"></script>
</head>
<body>
  <script>NProgress.start()</script>

  <div class="main">
    <nav class="navbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="logout.jsp"><i class="fa fa-sign-out"></i>退出</a></li>
      </ul>
    </nav>
    <div class="container-fluid">
      <div class="page-title">
        <h1>所有商品</h1>
      </div>
 <div >

	<button class="btn btn-primary" id="delete">删除</button>
	<table id="tb_users"></table>
  </div>
      
    </div>
    
  </div>
  
<%@ include file="./sidebar.jsp"%>
<script>
//bootstrap_table部分
$(function () {
    //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();
    //2.初始化Button的点击事件
    var oButtonInit = new ButtonInit();
    oButtonInit.Init();
});


var TableInit = function () {
    var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        $('#tb_users').bootstrapTable({
            url: '${pageContext.request.contextPath}/goodsSearch',         //请求后台的URL（*）
            method: 'get',                      //请求方式（*）
            toolbar: '#toolbar',                //工具按钮用哪个容器
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: false,                     //是否启用排序
            sortOrder: "asc",                   //排序方式
            queryParams: oTableInit.queryParams,//传递参数（*）
            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
            pageNumber:1,                       //初始化加载第一页，默认第一页
            pageSize: 10,                       //每页的记录行数（*）
            pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
            search: false,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
            strictSearch: true,
            showColumns: false,                  //是否显示所有的列
            showRefresh: false,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: true,                //是否启用点击选中行
            height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
            showToggle:false,                    //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表
            columns: [{
                checkbox: true
            }, {
                field: 'id',
                title: '商品id'
            }, {
                field: 'goodsname',
                title: '商品名'
            }, {
                field: 'introduce',
                title: '商品介绍'
            }, {
                field: 'originalprice',
                title: '商品原价'
            }, {
                field: 'currentprice',
                title: '商品现价'
            }, ]
        });
    };

    //得到查询的参数
    oTableInit.queryParams = function (params) {
        var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            limit: params.limit,   //页面大小
            offset: params.offset/params.limit+1,  //页码
            // departmentname: $("#txt_search_departmentname").val(),
            //statu: $("#txt_search_statu").val()
        };
        return temp;
    };
    return oTableInit;
};
var ButtonInit = function () {
    var oInit = new Object();
    var postdata = {};
    oInit.Init = function () {
        //初始化页面上面的按钮事件
    };
    return oInit;
};
$("#delete").click(function () {
    var obj=$("#tb_users").find("[type=checkbox]:checked");
	   if(obj.length==0){
		 alert("请先选择删除项目");  
	  }else{
		   if(window.confirm("确认删除吗")){
			   //row 代表选中的行
      	  var row = $("#tb_users").bootstrapTable('getSelections', function (row) {
      			return row;
					});
			  //新建一个数组用来存储id
			  var idarray=[];
			  for(var i=0;i<row.length;i++){
				  idarray.push(row[i].id);
			  }
			  console.log(idarray);
			  //ajax异步删除
			  $.ajax({  
			         type: "GET",   //提交的方法 post/get
			         url:"${pageContext.request.contextPath}/goodsDelete?ids="+idarray, //提交的地址  
			         //data:$('#myform').serialize(),// 序列化表单值   提交到后台的数据
			         dataType:"text",  // 后台返回的数据  json text  String  
			         async: false,     //false-表示同步  true--表示异步
			         error: function(request) {  //失败的话
			              alert("Connection error");  
			         },  
			         success: function(data) {  //成功
			            if(data=="success"){
			         	   alert("删除成功");
			         	   //注册成功后调到登录界面
			         	   window.location.href="${pageContext.request.contextPath}/admin/goods.jsp";
			            }else{
			         	  alert("删除失败");
			         	  window.location.href="${pageContext.request.contextPath}/admin/goods.jsp";
			            }  
			         }  
			      }); 
		   }
	  }
})
</script>

  <script>NProgress.done()</script>
</body>
</html>
