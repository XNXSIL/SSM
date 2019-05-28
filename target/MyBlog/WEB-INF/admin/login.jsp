<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
%>
<html>
<head>
    <title>请登录</title>
    <script src="/static/js/jquery-3.1.1.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" rel="stylesheet"/>
    <link href="/static/bootstrap/css/bootstrap-theme.css" rel="stylesheet"/>
    <link href="/static/signin.css" rel="stylesheet"/>
</head>
<body>
<div class="container">

    <form class="form-signin" action="/dologin" method="post">
        <h2 class="form-signin-heading">请登录</h2>
        <div style="color: red">${error}</div>
        <label for="inputEmail" class="sr-only">请输入用户名</label>
        <input type="text" id="inputEmail" name="username" class="form-control" placeholder="用户名" required autofocus>
        <label for="inputPassword" class="sr-only">密码</label>
        <input type="password" id="inputPassword" name="password" class="form-control" placeholder="密码" required>
        <div class="checkbox">
            <label>
                <input type="checkbox" value="remember-me"> 记住我
            </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
    </form>

</div>
</body>
</html>
