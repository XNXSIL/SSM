<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/11
  Time: 23:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>user</title>
    <link rel="stylesheet" href="/static/css/amazeui.min.css">

    <link href="/static/bootstrap/css/bootstrap.css" rel="stylesheet"/>
    <link href="/static/bootstrap/css/bootstrap-theme.css" rel="stylesheet"/>
    <script src="/static/js/jquery-3.1.1.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>

    <script src="https://cdn.bootcss.com/holder/2.9.6/holder.min.js"></script>

    <script src="/static/js/amazeui.min.js"></script>
    <script src="/static/js/handlebars.min.js"></script>

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<body style="background: beige">
    <nav class="nav navbar-default navbar-fixed-top" role="navigation">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2">
                    <img src="/source/system_picture/xnxsil_logo.png" height="45px" alt="logo">
                </div>
                <div class="col-md-10">
                    <div class="row">
                        <div class="col-md-6">
                            <form class="navbar-form navbar-left" role="search">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="请输入查询内容">
                                </div>
                                <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
                            </form>
                        </div>
                        <div class="col-md-5 ">
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="/home"><span class="glyphicon glyphicon-home">首页</span></a></li>
                                <li><a href="/profile/${user.username}"><span class="glyphicon glyphicon-user">${user.username}</span></a></li>
                                <li><a href="/register">注册</a></li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <span class="glyphicon glyphicon-cog"></span>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="/index/${user.username}">账户设置</a></li>
                                        <li><a href="/help">帮助中心</a></li>
                                        <li><a href="/logout">退出登录</a></li>
                                    </ul>
                                </li>
                                <li><a href="#doc-oc-demo1" data-am-offcanvas><span class="glyphicon glyphicon-align-justify"></span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>
    <div id="doc-oc-demo1" class="am-offcanvas" style="margin-top: 20px">
        <div class="am-offcanvas-bar">
            <div class="am-offcanvas-content">
                <div  style="margin-bottom: 50px;">
                    <img src="/getpicture/${user.head_protrait}" width="100px" height="100px" class="img-circle center-block">
                    <div style="margin-top: 20px;">
                        <h3 class="text-center  font-weight-bold">${user.username}</h3>
                        <div>
                            <h3 class="text-center">
                                <a href="#"><span class="label text-left">粉丝: ${user.fans_num}</span></a>
                                <span class="label text-center"> | </span>
                                <a href="#"><span class="label text-right">动态：${user.messages_num}</span></a>
                            </h3>
                        </div>
                    </div>
                </div>
                <ul class="nav sidebar-nav">
                    <li><a href="#"><span class="glyphicon glyphicon-home" style=" font-size: 20px">  首页</span></a></li>
                    <li><a href="#"><span class="glyphicon glyphicon-briefcase" style=" font-size: 20px">  市场</span></a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="page-header">
            <h2>我的信息</h2>
        </div>
        <div class="panel panel-info">
            <div class="panel-body">
                <div class="row">
                    <img id="protrait" class="center-block" src="/getpicture/${user.head_protrait}" width="200px" height="200px" alt="header">
                </div>
                <div class="row" style="margin-bottom: 10px">
                    <div class="text-center">
                        <h3><span class="text-info">${user.username}</span></h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-1">
                        <span class="text-center">修改头像 </span>
                    </div>
                    <div class="col-md-offset-1">
                        <form action="/uploadhead" method="post" enctype="multipart/form-data">
                            <input type="file" style="width: 200px; margin-bottom: 20px" name="head" id="head" onchange="showhead(this)">
                            <span class="text-warning"><input type="submit" value="保存"></span>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">姓名</h3>
            </div>
            <div class="panel-body">
                ${user.real_name}
                <a id="real_name_c" href="javascript:void(0)" class="pull-right" onclick="show('real_name')">修改</a>
                <div class="panel panel-success" id="real_name_div" style="display: none; margin-top: 20px">
                    <div class="panel-body">
                        <span>更改姓名: </span><br>
                        <form action="/changeUserReal_name" method="post">
                            <input type="text" style="width: 400px" name="real_name"/><br><br>
                            <input type="hidden" name="username" value="${user.username}">
                            <span class="text-warning"><input type="submit" value="保存"></span>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">电话号码</h3>
            </div>
            <div class="panel-body">
                ${user.phone}
                <a id="phone_c" href="javascript:void(0)" class="pull-right" onclick="show('phone')">修改</a>
                <div class="panel panel-success" id="phone_div" style="display: none; margin-top: 20px">
                    <div class="panel-body">
                        <span>更改电话: </span><br>
                        <form action="/changeUserPhone" method="post">
                            <input type="text" style="width: 400px" name="phone"/><br><br>
                            <input type="hidden" name="username" value="${user.username}">
                            <span class="text-warning"><input type="submit" value="保存"></span>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">个性签名</h3>
            </div>
            <div class="panel-body">
                ${user.personal_tag}
                <a id="personal_tag_c" href="javascript:void(0)" class="pull-right" onclick="show('personal_tag')">修改</a>
                <div class="panel panel-success" id="personal_tag_div" style="display: none; margin-top: 20px">
                    <div class="panel-body">
                        <span>更改个性签名: </span><br>
                        <form action="/changeUserPersonal_tag" method="post">
                            <input type="text" style="width: 400px" name="personal_tag"/><br><br>
                            <input type="hidden" name="username" value="${user.username}">
                            <span class="text-warning"><input type="submit" value="保存"></span>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">所在学院</h3>
            </div>
            <div class="panel-body">
                ${user.institute}
                <a id="institute_c" href="javascript:void(0)" class="pull-right" onclick="show('institute')">修改</a>
                <div class="panel panel-success" id="institute_div" style="display: none; margin-top: 20px">
                    <div class="panel-body">
                        <span>更改学院: </span><br>
                        <form action="/changeUserInstitute" method="post">
                            <input type="text" style="width: 400px" name="institute"/><br><br>
                            <input type="hidden" name="username" value="${user.username}">
                            <span class="text-warning"><input type="submit" value="保存"></span>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
</body>

<script>
    function showhead(obj) {
        var newPreview = document.getElementById('protrait');
        if (obj) {
            //ie浏览器兼容
            if (window.navigator.userAgent.indexOf("MSIE") >= 1) {
                obj.select();
                newPreview.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);";

                var path = document.selection.createRange().text;
                var flag = judgeImgSuffix(path);
                if(flag){
                    newPreview.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = document.selection.createRange().text;
                }else{
                    alert("要求图片格式为png,jpg,jpeg,bmp");
                }

                return;
            }
            //firefox浏览器兼容
            else if (window.navigator.userAgent.indexOf("Firefox") >= 1) {
                if (obj.files) {
                    newPreview.src = window.URL.createObjectURL(obj.files.item(0));
                    return;
                }
                newPreview.src = obj.value;
                return;
            }
            //Chrome浏览器兼容
            else if(window.navigator.userAgent.indexOf("Chrome") >= 1 || window.navigator.userAgent.indexOf("Safari") >= 1){
                if(obj.files){
                    newPreview.src = window.webkitURL.createObjectURL(obj.files.item(0));
                    return;
                }
                newPreview.src = obj.value;
                return;
            }
            newPreview.src = obj.value;
            return;
        }
    }

    function judgeImgSuffix(path){
        var index = path.lastIndexOf('.');
        var suffix = "";
        if(index > 0){
            suffix = path.substring(index+1);
        }
        if("png"==suffix || "jpg"==suffix || "jpeg"==suffix || "bmp"==suffix || "PNG"==suffix || "JPG"==suffix || "JPEG"==suffix || "BMP"==suffix){
            return true;
        }else{
            return false;
        }

    }
    
    function  show(name) {
        var div = document.getElementById(name + '_div');
        var text = document.getElementById(name + '_c');
        if(div.style.display == 'none'){
            div.style.display = 'block';
            text.innerText = '收起';
        }else{
            div.style.display = 'none';
            text.innerText = '修改';
        }
    }
</script>
</html>
