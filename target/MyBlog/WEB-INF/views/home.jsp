<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/7
  Time: 19:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>home</title>

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
    <style>
        a{color: gray}

    </style>
</head>
    <body>
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
                                    <a href="/profile/${user.username}"><span class="label text-right">动态：${user.messages_num}</span></a>
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
        <div  style="min-width: 1200px;">
            <div id="myCarousel" class="carousel slide" style="margin-top: 30px;">
                <!-- 轮播（Carousel）指标 -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>
                <!-- 轮播（Carousel）项目 -->
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="/source/system_picture/teaching.jpg" width="100%" alt="First slide">
                        <div class="carousel-caption">S</div>
                    </div>
                    <div class="item">
                        <img src="/source/system_picture/ground.jpg" width="100%" alt="Second slide">
                        <div class="carousel-caption">Z</div>
                    </div>
                    <div class="item">
                        <img src="/source/system_picture/page1.jpg" width="100%" alt="Third slide">
                        <div class="carousel-caption">U</div>
                    </div>
                </div>
                <!-- 轮播（Carousel）导航 -->
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <div style="background: beige">
                <div class="container" style="margin-top: 10px;">
                    <div class="row">
                        <div class="col-md-10" style="margin-left: -40px">
                            <div class="panel panel-default">
                                <img src="/source/system_picture/text.png">
                                <div class="panel panel-default" style="margin-right: 20px;margin-left: 20px">
                                    <textarea class="form-control" rows="4" style="min-width: 90%;font-size:20px" id="Content" name="content" form="contentform"></textarea>
                                </div>
                                <div style="margin-left: 10px;margin-bottom: 10px" id="mycomment">
                                    <form action="/subcontent" method="post" id="contentform" enctype="multipart/form-data">
                                        <input type="file" style="display: none;" id="picture1" name="picture" onchange="showhead(this,1)">
                                        <input type="file" style="display: none;" id="picture2" name="picture" onchange="showhead(this,2)">
                                        <input type="file" style="display: none;" id="picture3" name="picture" onchange="showhead(this,3)">
                                        <input type="file" style="display: none;" id="picture4" name="picture" onchange="showhead(this,4)">
                                        <button class="btn-warning  pull-right" type="button" onclick="contentchick()" ><span class="text-warning " style="font-size: 20px">发布</span></button>
                                    </form>
                                    <a data-toggle="collapse" data-parent="#mycomment" href="#setpicture"  style="font-size: 25px;"><span class="glyphicon glyphicon-picture">图片</span></a>
                                </div>
                                <div id="setpicture" class="collapse " style="margin-left: 40px;margin-right: 30px; margin-bottom: 20px">
                                    <label for="picture1" style="width: 24%;">
                                        <img src="/source/system_picture/empty.png" class="picture" alt="picture" id="Lpicture1" onmouseover="pictureActive(1)" onmouseout="pictureEmpty(1)">
                                    </label>
                                    <label for="picture2" style="width: 24%;">
                                        <img src="/source/system_picture/empty.png" class="picture" alt="picture" id="Lpicture2" onmouseover="pictureActive(2)" onmouseout="pictureEmpty(2)">
                                    </label>
                                    <label for="picture3" style="width: 24%;">
                                        <img src="/source/system_picture/empty.png"  class="picture" alt="picture" id="Lpicture3" onmouseover="pictureActive(3)" onmouseout="pictureEmpty(3)">
                                    </label>
                                    <label for="picture4" style="width: 24%;">
                                        <img src="/source/system_picture/empty.png"  class="picture" alt="picture" onmouseover="pictureActive(4)" onmouseout="pictureEmpty(4)" id="Lpicture4">
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-10" id="messageDiv" style="margin-left: -40px">
                        </div>
                        <div class="col-md-2">

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
<script type="text/javascript">
    $(document).ready(function () {
        ajaxRequest();
    })
    function ajaxRequest() {
        $.ajax({
            url: "/getRecentMessage",
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
                "                                        <p class=\"lead\">"+ HtmlUtil.htmlEncodeByRegExp(obj['Content']) +"</p>\n" +
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
                    "                                               <p class=\"lead\">"+ HtmlUtil.htmlEncodeByRegExp(comment['Content']) +"</p>\n" +
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
                if(result != null)
                    setComment(result,commented);
            }
        })
    }

    function setComment(result,i) {
        $("#responseDiv_" + i).empty();
        $.each(result,function (index,comment) {
            $("#responseDiv_" + i).append(
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
    function  contentchick() {
        var content = document.getElementById("Content");
        var picture1 = document.getElementById("picture1");
        var picture2 = document.getElementById("picture2");
        var picture3 = document.getElementById("picture3");
        var picture4 = document.getElementById("picture4");
        var submit = document.getElementById("contentform");
        if(content.value == '' && picture1.value.length == 0 && picture2.value.length == 0 && picture3.value.length == 0 && picture4.value.length == 0 )
            alert("内容不能为空")
        else{
            console.log("asd");
            submit.submit();
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
    function pictureActive(index) {
        var picture = document.getElementById("Lpicture" +index);
        if(picture.src.indexOf("/source/system_picture/empty.png") != -1){
            picture.src = "/source/system_picture/empty-active.png";
        }
    }
    function pictureEmpty(index) {
        var picture = document.getElementById("Lpicture" +index);
        if(picture.src.indexOf('/source/system_picture/empty-active.png') != -1){
            picture.src = '/source/system_picture/empty.png';
        }
    }
    function showhead(obj,index) {
        var newPreview = document.getElementById('Lpicture'+index);
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
                    if(obj.files.item(0).type.indexOf("image/") == -1)
                        alert("要求图片格式为png,jpg,jpeg,bmp");
                    else
                        newPreview.src = window.URL.createObjectURL(obj.files.item(0));
                    return;
                }
                newPreview.src = obj.value;
                return;
            }
            //Chrome浏览器兼容
            else if(window.navigator.userAgent.indexOf("Chrome") >= 1 || window.navigator.userAgent.indexOf("Safari") >= 1){
                if(obj.files){
                    if(obj.files.item(0).type.indexOf("image/") == -1)
                        alert("要求图片格式为png,jpg,jpeg,bmp");
                    else
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
    var HtmlUtil = {
        /*1.用正则表达式实现html转码*/
        htmlEncodeByRegExp:function (str){
            var s = "";
            if(str.length == 0) return "";
            s = str.replace(/&/g,"&amp;");
            s = s.replace(/</g,"&lt;");
            s = s.replace(/>/g,"&gt;");
            s = s.replace(/ /g,"&nbsp;");
            s = s.replace(/\'/g,"&#39;");
            s = s.replace(/\"/g,"&quot;");
            return s;
        },
        /*2.用正则表达式实现html解码*/
        htmlDecodeByRegExp:function (str){
            var s = "";
            if(str.length == 0) return "";
            s = str.replace(/&amp;/g,"&");
            s = s.replace(/&lt;/g,"<");
            s = s.replace(/&gt;/g,">");
            s = s.replace(/&nbsp;/g," ");
            s = s.replace(/&#39;/g,"\'");
            s = s.replace(/&quot;/g,"\"");
            return s;
        }
    };
</script>

</html>
