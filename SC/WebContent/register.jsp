<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
     <div class="container-fluid">
      <div class="page-title">
        <h1>用户注册</h1>
      </div>
      <!-- 有错误信息时展示 -->
      <!-- <div class="alert alert-danger">
        <strong>错误！</strong>发生XXX错误
      </div> -->
    <form action="registerRes.jsp" method="get" enctype="multipart/form-data">
      <div class="form-group">
        <label for="username">用户名</label>
        <input type="text" class="form-control" id="username" name="username">
      </div>
            <div class="form-group">
        <label for="password">密码</label>
        <input type="password" class="form-control" id="password" name="password">
      </div>
      <div class="form-group">
        <label for="address">地址</label>
        <input type="text" class="form-control" id="address" name="address">
      </div>
            <div class="form-group">
        <label for="phone">电话</label>
        <input type="text" class="form-control" id="phone" name="phone">
      </div>
      <button class="btn btn-info btn-block">注册</button>
    </form>
    </div>
    </main>
  </div>
</body>
</html>