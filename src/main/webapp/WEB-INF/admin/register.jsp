<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/18
  Time: 21:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <script src="/static/js/jquery-3.1.1.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" rel="stylesheet"/>
    <link href="/static/bootstrap/css/bootstrap-theme.css" rel="stylesheet"/>
    <link href="/static/signin.css" rel="stylesheet"/>
</head>
<body>
<div class="container">

    <form class="form-signin" action="/doregister" method="post">
        <h2 class="form-signin-heading">请注册</h2>
        <div style="color: red">${error}</div>
        <label for="inputEmail" class="sr-only">请输入用户名</label>
        <input type="text" id="inputEmail" name="username" class="form-control" placeholder="用户名" required autofocus>
        <label for="inputPassword" class="sr-only">密码</label>
        <input type="password" id="inputPassword"  name="password1" class="form-control" placeholder="密码" required>
        <label for="inputPassword" class="sr-only">重复密码</label>
        <input type="password" id="rePassword"  name="password2" class="form-control" placeholder="重复密码" required>
        <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
    </form>

</div>
</body>
</html>
