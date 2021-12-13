<%--
  Created by IntelliJ IDEA.
  User: 马玉怀
  Date: 2021/8/13
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%
    String basepath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>新华书店主页</title>
    <link rel="stylesheet" type="text/css" href="static/layui-v2.6.8/layui/css/layui.css">
    <script type="text/javascript" src="static/layui-v2.6.8/layui/layui.js"></script>
    <link rel="icon" href="<%=basepath%>/static/favicon.ico">
    <style type="text/css">
        html,body{
            background-color: #FAFAFA;
        }
        #rightnav{
            width: 200px;
            height: 271px;
            position: absolute;
            left: 377px;
            top: 170px;
            background-color: aqua;
        }
        .items{
            width: 1153px;
            height: 500px;
            margin: auto;
            margin-top: 10px;
            background-color: white;
            border-radius: 5px;

        }
        .item{
            width: 900px;
            height: 480px;
            background-color:white;
            border-radius: 3px;
            float: right;
            margin-top: 10px;
            overflow: auto;


        }
        .bookitem{
            width: 200px;
            height: 220px;
            margin: 5px;
            margin-left: 17px;
            float: left;
            /* background-color: #FAFAFA; */
        }
        #searchinput{
            position: absolute;
            left: 665px;
            top: 25px;
        }
        #searchbtn{
            position: absolute;
            left: 750px;
            top: 10px;

        }
        .bookimg{
            width: 80px;
            height: 100px;
            margin-left: 32px;
        }
        #searchdiv{
            width: 900px;
            height: 50px;
            margin: auto;
            background-color: white;
        }
        .booking label{
            display: block;
        }
        h2{
            margin-left: 400px;
            margin-top: 13px;
        }
        ::-webkit-scrollbar{
            width: 3px;
            height: 3px;

        }
        ::-webkit-scrollbar-track{
            border-radius: 3px;
        }
        ::-webkit-scrollbar-thumb{
            border-radius: 5px;
            background-color: rgba(250, 246, 246,0.8);
        }
        ::-webkit-scrollbar-thumb:hover{

            background-color: rgb(216, 211, 210);
        }
        #logindiv{
            width: 400px;
            height: 450px;
            /* background-color: azure; */
            margin: auto;
            text-align: center;
            position: relative;
            display: none;
        }
        .input{
            width: 220px;
            height: 30px;
            outline: none;
            margin-top: 10px;
            margin-left: 20px;
            border: none;
        }

        .img{
            position: absolute;
            left: 12px;
            top: 15px;
            height: 20px;
            width: 20px;
        }

        #h2div{
            width: 400px;
            height: 40px;

        }
        #span1{
            position: absolute;
            left: 60px;
            top: 145px;
        }
        #span2{
            position: absolute;
            left: 278px;
            top: 145px;
        }
        #submitbtn{
            width: 280px;
            height: 40px;
            margin-top: 60px;
            background-color: #1E9FFF;
            border-radius: 5px;
            border: none;
            font-size: 15px;

        }
        #searchtext{

            position: absolute;
            top: 20px;
            left: 750px;
            width: 400px;
            height: 35px;
            outline: none;
            box-shadow: none;
            border: 1px solid #FF5722;
        }
        #searchbutton{
            position: absolute;
            top: 19px;
            left: 1102px;
            width: 50px;
            height: 36px;
            border: 1px solid #FF5722;
            background-color:#FF5722 ;
            color: white;
        }
    </style>
</head>
<body>
<ul class="layui-nav">
    <li class="layui-nav-item" >
        <h3>欢迎来到玉购商城</h3>
    </li>
    <li class="layui-nav-item" style="float: right;" >
        <a href="<%=basepath%>adminlogin">后台登录</a>
    <li class="layui-nav-item" style="float: right;" >
        <a href="<%=basepath%>/cart">购物车&nbsp;<i class="layui-icon">&#xe698;</i>
            <c:if test="${not empty sessionScope.cart.items}">
                <span class="layui-badge">${sessionScope.cart.totalCount}</span>
            </c:if>
        </a>
    </li>
    <li class="layui-nav-item" style="float: right;">
        <c:if test="${empty sessionScope.userinfo}">
            <a  href="" id="login">登录</a>
        </c:if>
        <c:if test="${not empty sessionScope.userinfo}">
        <a href=""><img src="${sessionScope.userinfo.headimg}" class="layui-nav-img">我</a>
        <dl class="layui-nav-child">
            <dd><a href="javascript:;">修改信息</a></dd>
            <dd><a href="javascript:;">我的订单</a></dd>
            <dd><a href="javascript:;">安全管理</a></dd>
            <dd><a href="<%=basepath%>loginout">退出登录</a></dd>
        </dl>
        </c:if>
    </li>
</ul>
<!-- 顶部搜索栏 -->
<%--<div style="width: 960px;height: 80px;margin: auto;background-color: white;position: relative;" id="search-content">--%>
<%--    <form action="<%=basepath%>/queryBookByName" method="post">--%>
<%--        <input type="text" name="bookname" style="width: 180px;height: 30px;margin-top: 25px;margin-left: 700px;" >--%>
<%--        <input type="submit" value="搜索" style="width: 45px; height: 34px;border: none;background-color: #009688;">--%>
<%--    </form>--%>
<%--</div>--%>
<div style="width: 1153px;height: 80px;margin: auto;margin-top: 20px; position: relative;" id="search-content">
    <img src="static/img/书城.png" alt="" style="width: 220px; height: 80px;">
    <form action="<%=basepath%>/queryBookByName" method="POST">
        <input type="text" name="bookname" id="searchtext"  placeholder="数学之美">
        <input type="submit" value="搜索" id="searchbutton">
    </form>
</div>

<div class="layui-carousel" id="test" style="margin-left:580px; margin-top: 10px;">
    <div carousel-item>
        <div><img src="static/img/轮播1.jpg" alt=""></div>
        <div><img src="static/img/轮播2.jpg" alt=""></div>
        <div><img src="static/img/轮播3.jpg" alt=""></div>
        <div><img src="static/img/轮播4.jpg" alt=""></div>
    </div>
</div>

<div id="rightnav" >

</div>


<%-- 登录弹出层--%>
<div  id="logindiv"  >

    <div style="width: 280px;height: 50px;border: solid 1px #c2c2c2;margin: auto;margin-top: 80px;line-height: 50px;position: relative;">
        <img src="static/img/账号.png"  class="img">
        <input type="text" name="username" class="input" placeholder="账号" id="user">
    </div>
    <div  style="width: 280px;height: 50px;border: solid 1px #c2c2c2;margin: auto;margin-top: 30px;line-height: 50px;position: relative;">
        <img src="static/img/密 码.png"  class="img">
        <input type="password" class="input" name="password" placeholder="密码" id="pass">
    </div>
    <span id="span1">
               <a href="">忘记密码</a>
           </span>
    <span id="span2">
               <a href="<%=basepath%>/toregister">免费注册</a>
           </span>
    <!-- <input type="submit" value="登陆" id="submitbtn"> -->
    <button id="submitbtn">登录</button>

    <span style="color: #c2c2c2;display: block;margin-top: 15px;margin-bottom: 10px;">or</span>
    <img src="static/img/微信.png" alt="" style="width: 33px;height: 33px;">&nbsp;&nbsp;
    <img src="static/img/QQ.png" alt="" style="width: 33px;height: 33px;">&nbsp;
    <img src="static/img/B站.png" alt="" style="width: 39px;height: 39px;">
</div>

<!-- 新品 -->
<h2><img src="static/img/新品.png" alt="" style="width: 35px;height: 35px;">新书发布 </h2>
<div class="items">
    <div style="width: 250px;height:480px ;float: left;">
        <img src="static/img/right1.png" alt="" style="width: 250px;height: 480px;">
    </div>
    <div class="item">
        <c:forEach items="${newBook}" var="book">
        <div class="bookitem">
            <a href="<%=basepath%>/buybook?bookid=${book.id}&type=${book.type}" style="margin-left: 35px;">
                <img src="${book.imgpath}" alt="" style="height:150px;width: 120px;margin-top: 10px;">
                <span style="display: block;margin-left: 60px;">${book.name}</span>
                <span style="display: block;color: red;margin-left: 60px;">￥${book.price}</span>
            </a>
        </div>
        </c:forEach>
    </div>
</div>
<!-- 热销 -->
<h2><img src="static/img/热销.png" alt="" style="width: 35px;height: 35px;">热销图书</h2>
<div class="items">
    <div style="width: 250px;height:480px ;float: left;">
        <img src="static/img/right2.png" alt="" style="width: 250px;height: 480px;">
    </div>
    <div class="item">
        <c:forEach items="${hotBook}" var="book">
        <div class="bookitem">
            <a href="<%=basepath%>/buybook?bookid=${book.id}&type=${book.type}" style="margin-left: 35px;">
                <img src="${book.imgpath}" alt="" style="height:150px;width: 120px;margin-top: 10px;">
                <span style="display: block;margin-left: 60px;">${book.name}</span>
                <span style="display: block;color: red;margin-left: 60px;">￥${book.price}</span>
            </a>
        </div>
        </c:forEach>
    </div>
</div>
<!-- 折扣 -->
<h2><img src="static/img/折扣.png" alt="" style="width: 35px;height: 35px;">折扣专区</h2>
<div class="items">
    <div style="width: 250px;height:480px ;float: left;">
        <img src="static/img/right3.png" alt="" style="width: 250px;height: 480px;">
    </div>
    <div class="item">
        <c:forEach items="${discountBook}" var="book">
        <div class="bookitem">
            <a href="<%=basepath%>/buybook?bookid=${book.id}&type=${book.type}" style="margin-left: 35px;">
                <img src="${book.imgpath}" alt="" style="height:150px;width: 120px;margin-top: 10px;">
                <span style="display: block;margin-left: 60px;">${book.name}</span>
                <span style="display: block;color: red;margin-left: 60px;">￥${book.price}</span>
            </a>
        </div>
        </c:forEach>
    </div>
</div>


<div style="width: 100%;height: 200px;background-color: #393D49;margin-top: 10px;">

</div>


<script>
    layui.use(['element','carousel','layer','jquery'], function(){
        var element = layui.element;
        var carousel=layui.carousel;
        var layer=layui.layer;
        var $=layui.jquery;
        carousel.render({
            elem:'#test',
            width:'50%',//设置容器宽度
            height:'270px',
            arrow:'always',//始终显示箭头
            anim:'fade',//切换动画方式
            interval:'2000'//动画自动切换时间
             });

        //阻止默认跳转
        $("#login").bind('click',function(){
            layer.open({
                type:1,//设置类型，默认为0
                title: ['用户登录', 'font-size:18px;margin-left:180px;'],
                content:$("#logindiv"),
                area:['450px','540px'],//设置提示框的大小
                closeBtn:2  ,//设置右上角关闭按钮的风格
                offset:'c',//设置提示框的位置，默认是垂直水平居中（不设置）
                //页面弹出后的回调
                success: function(layero, index){
                    //当登录按钮被点击时
                    $("#submitbtn").click(function(){
                        var username=$("#user").val();
                        var password=$("#pass").val();
                        var map={
                             username:username,
                             password:password
                            };
                         var mapstr=JSON.stringify(map);
                           tologin(mapstr,index,username);
                    });
                }

            });
            return false;
        });
        function tologin(mapstr,index,username){
            $.ajax({
                type: 'post',
                url: "<%=basepath%>/login",
                contentType:'application/json',
                data:mapstr,
                success: function (suc) {
                    console.log(suc);
                    if (suc.loginstate == 200) {
                        layer.close(index);
                        window.location.reload();
                        layer.msg('登录成功', {
                            icon: 1,
                            time: 2000,
                            anim: 1,
                            offset: ['280px', '850px']
                        });
                         sendEmail(username);
                    } else {
                        layer.msg('账号或者密码错误请重试', {
                            icon: 2,
                            time: 4000,
                            anim: 1,
                            offset: ['280px', '850px']
                        });
                    }

                }
            });
        }

        function sendEmail(username){
              $.ajax({
                  type: 'post',
                  url: "<%=basepath%>/sendEmail",
                  data:{'username':username}
              });

        }




    });

</script>
</body>
</html>
