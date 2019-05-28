<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/19
  Time: 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>profile</title>
    <link rel="stylesheet" href="/static/css/amazeui.min.css">


    <link href="/static/bootstrap/css/bootstrap.css" rel="stylesheet"/>
    <link href="/static/bootstrap/css/bootstrap-theme.css" rel="stylesheet"/>
    <link href="/static/css/xnxsil.css" rel="stylesheet"/>
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
    <div id="doc-oc-demo1" class="am-offcanvas">
        <div class="am-offcanvas-bar">
            <div class="am-offcanvas-content">
                <div  style="margin-bottom: 50px;">
                    <img src="/getpicture/${user.head_protrait}" width="100px" height="100px" class="img-circle center-block">
                    <div style="margin-top: 20px;">
                        <h3 class="text-center  font-weight-bold">${user.username}</h3>
                        <div>
                            <h3 class="text-center">
                                <a href="/myfans/${user.username}"><span class="label text-left">粉丝: ${user.fans_num}</span></a>
                                <span class="label text-center"> | </span>
                                <a href="#"><span class="label text-right">动态：${user.messages_num}</span></a>
                            </h3>
                        </div>
                    </div>
                </div>
                <ul class="nav sidebar-nav">
                    <li><a href="/home"><span class="glyphicon glyphicon-home" style=" font-size: 20px">  首页</span></a></li>
                    <li><a href="/market"><span class="glyphicon glyphicon-briefcase" style=" font-size: 20px">  市场</span></a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="container" style="margin-top: 100px">
        <div class="col-md-11">
            <div style="margin-bottom: -150px">
                <img src="/getpicture/${user.head_protrait}" class="img-circle center-block " width="140px" height="140px">
                <h2 class="text-center" style="color: white">${user.username}</h2>
            </div>
            <div style="background: url(/source/system_picture/page2.jpg);background-size:100% 100%;background-repeat: no-repeat;height: 350px; display: flex;align-items: flex-end;">
                <div style="width: 100%;font-size: 25px;background-color: white;height: 40px">
                    <a href="javascript: void(0) "  id="mymessage" state="yes" onclick="getMyMessage()"><span class="glyphicon g glyphicon-edit text-center" style="width: 48%;color: gray" >我的动态</span></a>
                    <span style="padding-right: 0.25%;padding-right: 0.25%">|</span>
                    <a href="javascript:void(0)" id="mygood" state="no" onclick="getMyGood()" ><span class="glyphicon glyphicon-briefcase text-center" style="width: 48%;color: gray" >我的市场</span></a>
                </div>
            </div>
            <div class="row" id="messageDiv" style="margin-top: 30px">

            </div>
        </div>


    </div>
</body>
<script>
    function getMyGood() {
        if($("#mygood").attr("state") == "yes")
            return;
        $("#mygood").attr("state","yes");
        $("#mymessage").attr("state","no");
        $("#messageDiv").empty();
    }
    $(document).ready(function () {
        ajaxRequest();
    })
    function getMyMessage() {
        if($("#mymessage").attr("state") == 'yes')
            return;
        $("#mymessage").attr("state","yes");
        $("#mygood").attr("state","yes");
        $("#messageDiv").empty();
        ajaxRequest();
    }
    function ajaxRequest() {
        $.ajax({
            url: "/getMyMessage",
            type: "POST",
            dataType: "json",
            success: function (result) {
                addMessage(result);
            }
        })
    }

    function addMessage(result) {
        $.each(result,function (index,obj) {
            $("#messageDiv").append(
                "<div class=\"panel panel-default\" id=\"messageDiv_"+ obj['Id'] +"\" style=\"margin-top: 20px\">\n" +
                "                                <div class=\"panel-body\" id=\"message_"+ obj['Id'] +"\" style=\"padding-bottom: 0px\">\n" +
                "                                    <img src=\"/getpicture/"+ obj['Username'] +".jpg\" height=\"70px\" id=\"message_head_"+ obj['Id'] +"\" width=\"70px\" alt=\"head\" class=\"img-circle pull-left\">\n" +
                "                                    <h3 style=\"margin-top: 0px;margin-bottom: 16px\" id=\"message_name_"+ obj['Id'] +"\">&nbsp"+ obj['Username'] +"</h3>\n" +
                "                                    <h5>&nbsp"+ obj['Date'] +"</h5>\n" +
                "                                    <div class=\"panel\" style=\"margin-left: 70px;padding-bottom: 10px\">\n" +
                "                                        <p class=\"lead\">"+ obj['Content'] +"</p>\n" +
                "                                        <div style=\"min-width: 600px\">\n" +
                "                                            <div id=\"pictureDiv_"+ obj['Id'] +"\"style=\"margin-left: 10px\">\n" +
                "                                            </div>\n" +
                "                                        </div>\n" +
                "                                    </div>\n" +
                "                                </div>\n" +
                "                                <div class=\"line\"></div>\n" +
                "\n" +
                "                                <div id=\"utilbar\">\n" +
                "                                    <a href=\"javascript: void(0) \"  onclick=\"store("+ obj['Id'] +")\"><span class=\"glyphicon glyphicon-star-empty text-center store\" id=\"store_"+ obj['Id'] +"\">收藏</span></a>\n" +
                "                                    <span style=\"padding-right: 0.25%;padding-right: 0.25%\">|</span>\n" +
                "                                    <a href=\"javascript:void(0)\" onclick=\"commentDiv("+ obj['Id'] +")\"><span class=\"glyphicon glyphicon-edit text-center comment\">评论</span></a>\n" +
                "                                    <span style=\"padding-right: 0.25%;padding-right: 0.25%\">|</span>\n" +
                "                                    <a href=\"javascript:void(0)\" onclick=\"good("+ obj['Id'] +")\" ><span class=\"glyphicon glyphicon-heart-empty text-center good\" id=\"good_"+ obj['Id'] +"\" >赞</span></a>\n" +
                "\n" +
                "                                </div>\n" +
                "                                <div class=\"content panel\" style=\"display: none;\" id=\"commentDiv_"+ obj['Id'] +"\">\n" +
                "                                    <div class=\"panel-body\">\n" +
                "                                        <div style=\"margin-bottom: 8px\">\n"+
                "                                           <img src=\"/getpicture/${user.head_protrait}\" width=\"7%\" height=\"52px\">\n" +
                "                                           <input class=\"input-lg contentinput\" id=\"comment_"+ obj['Id'] +"\" placeholder=\"请输入内容\">\n" +
                "                                           <span class=\"text-warning\" style=\"font-size: 20px\"><button  class=\"btn-warning\" onclick='commentSubmit("+ obj['Id'] +")'>评论</button></span>\n" +
                "                                        </div>\n"+
                "                                        <div class=\"line\"></div>\n" +
                "                                        <div id=\"responseDiv_"+ obj['Id'] +"\" style=\"margin-top: 16px;\">\n" +
                "                                        </div>\n"+
                "                                    </div>\n" +
                "\n" +
                "                                </div>\n" +
                "                            </div>"

            );
            $.each(obj['Pictures'],function (index,picture) {
                $("#pictureDiv_" + obj['Id']).append(
                    "                                                <img src=\"/getsource/"+ picture +"\"  height=\"165\" width=\"24%\"  alt=\"picture\">\n"
                )
            })
            $.each(obj['Comments'],function (index,comment) {
                $("#responseDiv_" + obj['Id']).append(
                    "                                        <div style=\"margin-top: 8px;\">\n"+
                    "                                           <img src=\"/getpicture/"+ comment['Username'] +".jpg\" width=\"7%\" height=\"52px\"' class=\"pull-left\">\n" +
                    "                                           <h3 style=\"margin-top: 0px;margin-bottom: 2px\"\">&nbsp"+ comment['Username'] +"<span class=\"pull-right small\">"+ comment['Date'] +"</span></h3>\n" +
                    "                                           <div class=\"panel\" style=\"margin-left: 70px;padding-bottom: 0px;margin-bottom: 0px;background-color: #f2f2f5\">\n" +
                    "                                               <p class=\"lead\">"+ comment['Content'] +"</p>\n" +
                    "                                           </div>\n" +
                    "                                        </div>\n" +
                    "                                        <div class=\"line\"></div>\n"
                )
            })
            isStore(obj['Id']);
            isGood(obj['Id']);
        })

    }


    function commentDiv(index) {
        var commentDiv = document.getElementById("commentDiv_" + index);
        if(commentDiv.style.display == 'none'){
            commentDiv.style.display = 'block';
        }
        else{
            commentDiv.style.display = 'none';
        }
    }

    function ajaxCommentSubmit(commentor,content,commented) {
        var parms = {Username:commentor, Content:content, Id:commented};
        $.ajax({
            url: "/subcomment",
            type: "post",
            dataType: "json",
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(parms),
            success: function (result) {

            }
        })
    }


    function commentSubmit(index) {
        var comment = document.getElementById("comment_" + index);
        if(comment.value == ''){
            comment.placeholder = '内容不能为空!';
        }else{
            var commentDiv = document.getElementById("commentDiv_" + index);
            ajaxCommentSubmit('${user.username}',comment.value,index);
            comment.value = '';
            commentDiv.style.display = 'none';
        }
    }

    function ajaxStore(commentor,commented) {
        var parms = {Username:commentor, Id:commented};
        $.ajax({
            url: "/substore",
            type: "post",
            dataType: "json",
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(parms),
            success: function (result) {

            }
        })
    }
    function ajaxCancelStore(commentor,commented) {
        var parms = {Username:commentor, Id:commented};
        $.ajax({
            url: "/cancelstore",
            type: "post",
            dataType: "json",
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(parms),
            success: function (result) {

            }
        })
    }
    function store(index) {
        var store  =  document.getElementById("store_" + index);
        if(store.innerText == '收藏'){
            store.classList.remove('glyphicon-star-empty');
            store.classList.add('glyphicon-star');
            store.innerText = '已收藏';
            ajaxStore('${user.username}',index);
        }else{
            store.classList.remove('glyphicon-star');
            store.classList.add('glyphicon-star-empty');
            store.innerText = '收藏';
            ajaxCancelStore('${user.username}',index);
        }
    }
    function ajaxGood(commentor,commented) {
        var parms = {Username:commentor, Id:commented};
        $.ajax({
            url: "/subgood",
            type: "post",
            dataType: "json",
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(parms),
            success: function (result) {

            }
        })
    }
    function ajaxCancelGood(commentor,commented) {
        var parms = {Username:commentor, Id:commented};
        $.ajax({
            url: "/cancelgood",
            type: "post",
            dataType: "json",
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(parms),
            success: function (result) {

            }
        })
    }
    function good(index) {
        var good = document.getElementById("good_"+index);
        if(good.innerText == '赞'){
            good.classList.remove('glyphicon-heart-empty');
            good.classList.add('glyphicon-heart');
            good.innerText = '已赞';
            ajaxGood('${user.username}',index);
        }else{
            good.classList.remove('glyphicon-heart');
            good.classList.add('glyphicon-heart-empty');
            good.innerText = '赞';
            ajaxCancelGood('${user.username}',index);
        }
    }
    function isStore(index) {
        $.ajax({
            url: "/isstore/" + index,
            type: "post",
            error: function () {
                console.log("error");
            },
            success: function (data) {
                if(data == "success"){
                    var store = document.getElementById("store_" + index);
                    store.classList.remove('glyphicon-star-empty');
                    store.classList.add('glyphicon-star');
                    store.innerText = '已收藏';
                }
            }
        })
    }
    function isGood(index) {
        $.ajax({
            url: "/isgood/" + index,
            type: "post",
            error: function () {
                console.log("error");
            },
            success: function (data) {
                if(data == "success"){
                    var store = document.getElementById("good_" + index);
                    store.classList.remove('glyphicon-heart-empty');
                    store.classList.add('glyphicon-heart');
                    store.innerText = '已赞';
                }
            }
        })
    }
</script>
</html>
