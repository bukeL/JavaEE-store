<%@ page language="java"   contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Sign in &laquo; Admin</title>
  <link rel="stylesheet" href="../assets/vendors/bootstrap/css/bootstrap.css">
  <link rel="stylesheet" href="../assets/css/admin.css">
</head>
<body>
  <div class="login">
    <form class="login-wrap" method="post" id="myform"  action="${pageContext.request.contextPath}/adminLogin">
      <img class="avatar" src="../assets/img/default.png">
      <div class="form-group">
        <label for="name" class="sr-only">用户名</label>
        <input id="name" type="text" name="username" class="form-control" placeholder="请输入用户名" autofocus>
      </div>
      <div class="form-group">
        <label for="password" class="sr-only">密码 </label>
        <input id="password" type="password" name="password" class="form-control" placeholder="请输入密码">
      </div>
      <button class="btn btn-primary btn-block" id="submitbtn">登录</button>
    </form>
  </div>
  <script src="/shangcheng/assets/vendors/jquery/jquery.js"></script>
  <script>
    $(function ($) {
      // 1. 单独作用域
      // 2. 确保页面加载过后执行

      // 目标：在用户输入自己的邮箱过后，页面上展示这个邮箱对应的头像
      // 实现：
      // - 时机：邮箱文本框失去焦点，并且能够拿到文本框中填写的邮箱时
      // - 事情：获取这个文本框中填写的邮箱对应的头像地址，展示到上面的 img 元素上


      $('#name').on('blur', function () {
        var value = $(this).val()
        // 忽略掉文本框为空或者不是一个邮箱
        if (!value ) return

        // 用户输入了一个用户名
        // 获取这个邮箱对应的头像地址
        // 因为客户端的 JS 无法直接操作数据库，应该通过 JS 发送 AJAX 请求 告诉服务端的某个接口，
        // 让这个接口帮助客户端获取头像地址

        $.get('/shangcheng/admin/avatar.jsp', { username: value }, function (res) {
          // 希望 res => 这个邮箱对应的头像地址
          if (!res) return
          // 展示到上面的 img 元素上
          // $('.avatar').fadeOut().attr('src', res).fadeIn()
          $('.avatar').fadeOut(function () {
            // 等到 淡出完成
            $(this).on('load', function () {
              // 图片完全加载成功过后
              $(this).fadeIn()
            }).attr('src', res)
          })
        })
      })
    })

  </script>
</body>
</html>
