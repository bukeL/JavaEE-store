<%@ page language="java"   contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>LYH的商城</title>
  <link rel="stylesheet" href="./css/bootstrap.css">
<style type="text/css">
body {
  padding-top: 3.5rem;
}

main {
  padding-top: 2rem;
}

.heading {
  margin-bottom: 2rem;
  /*padding-bottom: 9px;*/
  /*border-bottom: 1px solid #eee;*/
  font-weight: 300;
}

.table th,
.table td {
  vertical-align: middle;
}

.table td img {
  height: 60px;
}

</style>
</head>
<body>
  <nav class="navbar navbar-expand navbar-dark  fixed-top" style="background:#5bc0de">
    <a class="navbar-brand" href="#">LYH的商城</a>
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="index.jsp">返回商城首页</a>
      </li>
    </ul>
  </nav> 
  <main class="container">
    </div>

    <form action="loginResult.jsp" method="get" enctype="multipart/form-data" autocomplete="off"> 
      <div class="form-group">
        <label for="username">账号（6位数字）</label>
        <input type="text" class="form-control" id="username" name="username" >
      </div>
      
      <div class="form-group">
        <label for="password">密码</label>
        <input type="password" class="form-control" id="password" name="password">
      </div>
           
      <button class="btn btn-info btn-block">登录</button>
    </form>
  </main>
</body>
</html>
