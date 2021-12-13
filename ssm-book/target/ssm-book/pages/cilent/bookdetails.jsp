<%--
  Created by IntelliJ IDEA.
  User: 马玉怀
  Date: 2021/8/14
  Time: 20:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String basepath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="static/layui-v2.6.8/layui/css/layui.css">
    <script type="text/javascript" src="static/layui-v2.6.8/layui/layui.js"></script>
<%--    <script type="text/javascript" src="static/js/jquery-3.6.0.js"></script>--%>
    <style type="text/css">
        /* html,body{
           background-color: #FAFAFA;
       } */
        #searchcontent{
            width: 960px;
            height: 80px;
            margin: auto;
            margin-top: 60px;
            background-color: white;
            position: relative;

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
        #screen{
            width:960px;
            height: 40px;
            margin: auto;
            margin-top: 20px;
            background-color: rgba(65, 67, 73, 0.1);
            border-radius: 3px;
        }
        #searchresult{
            margin: auto;
            margin-top: 5px;
            width: 960px;
            height: 700px;
            /* background-color: red; */


        }
        .resultitem{
            width: 180px;
            height: 200px;

            margin-left: 48px;
            margin-top: 10px;

            float: left;
            background-color:white;
        }
        .resultitem:hover{
            -webkit-box-shadow:#ccc 0px 10px 10px;
            -moz-box-shadow:#ccc 0px 10px 10px;
            box-shadow: #ccc 0px 10px 10px;;
        }
        #screenbtn{
            width: 50px;
            height: 28px;
            margin-left: 1px;
            margin-top: -30px;
            background-color:aliceblue;
            border: none;

        }
        #imgshow{
            width: 360px;
            height: 400px;
            float: left;
            margin-top: 100px;
            margin-left: 30px;
            /* background-color: blue; */
        }
        #bookshow{
            width: 500px;
            height: 400px;
            float: right;
            margin-right: 30px;
            margin-top: 100px;
            background-color:white;

        }
        #booknamediv{
            width: 480px;
            height: 40px;
            margin-top: 10px;
            margin-left: 10px;
            /* background-color: #959eb9; */


        }
        #bookauthordiv{
            width: 480px;
            height: 40px;
            margin-top: 5px;
            margin-left: 10px;
            /* background-color: aqua; */
        }
        #bookpricediv{
            width: 480px;
            height: 110px;
            margin-top: 10px;
            margin-left: 10px;
            background-color: rgba(65, 67, 73, 0.1);
            border-radius: 3px;
        }
        #saleandstock{
            width: 480px;
            height: 40px;
            margin-top: 5px;
            margin-left: 10px;
            /* background-color: aqua; */
        }
        #backgroundimg{
            width: 480px;
            height: 30px;
            /* background-color: #393D49; */
            background-image: linear-gradient(to right,purple,orange);
        }
        #bookconuntdiv{
            width: 480px;
            height: 40px;
            margin-top: 10px;
            margin-left: 10px;
            /* background-color: aqua;  */
        }
        #button1{
            width: 180px;
            height: 40px;
            margin-left: 55px;
            margin-top: 20px;
            color: white;
            font-size: 15px;
            background-color: #5FB878;
            border: none;
            border-radius: 3px;

        }
        #button1:hover{
            background-color: #439e5d;
        }
        #button2{
            width: 180px;
            height: 40px;
            margin-top: 20px;
            color: white;
            font-size: 15px;
            margin-left: 20px;
            background-color: red;
            border: none;
            border-radius: 3px;
        }
        #button2:hover{
            background-color: rgb(202, 105, 105);
        }
        #a1{
            display:inline-block;
            width: 20px;
            height: 20px;
            border: #c2c2c2 1px solid;
            box-shadow: none;
            text-align: center;
            line-height: 20px;


        }
        #a2{
            display:inline-block;
            width: 20px;
            height: 20px;
            border: #c2c2c2 1px solid;
            box-shadow: none;
            text-align: center;
            line-height: 20px;
            margin-left: -5px;

        }
        #inputcount{
            width: 30px;
            height: 22px;
            box-shadow: none;
            border: #c2c2c2 1px solid;
            margin-left: -5px;
            text-align: center;
        }
        #recommend{
            width: 960px;
            height: 430px;
            margin: auto;
            border: solid 1px #c2c2c2;
            border-left: none;
            border-right: none;
            border-bottom: none;
            overflow: hidden;
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
        <a href="">后台登录</a>
    <li class="layui-nav-item" style="float: right;" >
        <a href="<%=basepath%>/cart">购物车&nbsp;<i class="layui-icon">&#xe698;</i>
            <c:if test="${not empty sessionScope.cart.items}">
                <span class="layui-badge">${sessionScope.cart.totalCount}</span>
            </c:if>
        </a>
    </li>
    <li class="layui-nav-item" style="float: right;">
        <c:if test="${empty sessionScope.userinfo}">
            <a  href="<%=basepath%>" id="login">登录</a>
        </c:if>
        <c:if test="${not empty sessionScope.userinfo}">
            <a href=""><img src="${sessionScope.userinfo.headimg}" class="layui-nav-img">我</a>
            <dl class="layui-nav-child">
                <dd><a href="javascript:;">修改信息</a></dd>
                <dd><a href="javascript:;">我的订单</a></dd>
                <dd><a href="javascript:;">安全管理</a></dd>
                <dd><a href="javascript:;">退出登录</a></dd>
            </dl>
        </c:if>
    </li>
</ul>
<div id="navimg">
    <img src="static/img/导航图.png" alt="" style="width: 100%;height: 65px;">
</div>
<!-- 顶部搜索栏 -->
<!-- 顶部搜索栏 -->
<div style="width: 1153px;height: 80px;margin: auto;margin-top: 40px; position: relative;" id="search-content">
    <img src="static/img/书城.png" alt="" style="width: 220px; height: 80px;">
    <form action="<%=basepath%>/queryBookByName" method="POST">
        <input type="text" name="bookname" id="searchtext"  placeholder="数学之美">
        <input type="submit" value="搜索" id="searchbutton">
    </form>
</div>



<div id="screen">
          <span style="line-height: 40px;">
              <a href="<%=basepath%>/">主页&nbsp;></a>
              <a href="<%=basepath%>/queryBookByName?booktype=${bookinfo.type}">${bookinfo.type}&nbsp;></a>
              <a href="<%=basepath%>/queryBookByName?bookname=${bookinfo.name}">${bookinfo.name}</a>
          </span>
</div>
<div id="searchresult">
    <div id="imgshow">
        <img src="${bookinfo.imgpath}" alt="" style="width: 300px;height: 400px;margin-left: 20px;">
    </div>
    <div id="bookshow">
        <div id="booknamediv"><span style="font-size: 16px;line-height: 40px;">${bookinfo.name}</span></div>
        <div id="bookauthordiv">
                       <span style="line-height: 40px;color: #01AAED;font-max-size: 12px">
                        ${bookinfo.press}<span style="color: #393D49;">&nbsp;编&nbsp;</span> ${bookinfo.author}<span style="color: #393D49;">&nbsp;著</span>
                       </span>
        </div>
        <div id="bookpricediv">
            <div id="backgroundimg">
                <c:if test="${bookinfo.state==1}">
                <span style="margin-left: 25px;line-height: 30px;color: white;">热销</span>
                </c:if>
                <c:if test="${bookinfo.state==2}">
                    <span style="margin-left: 25px;line-height: 30px;color: white;">新品</span>
                </c:if>
                <c:if test="${bookinfo.state==0}">
                    <span style="margin-left: 25px;line-height: 30px;color: white;">折扣</span>
                </c:if>

            </div>
            <div style="margin-top: 30px;margin-left: 40px; font-size: 15px;">活动价
                <b style="color: red;font-size: 16px;">￥${bookinfo.price}</b>&emsp;<span style="text-decoration: line-through;font-size: 13px;">￥68.21</span>


            </div>

        </div>
        <div id="saleandstock">
            <span style="line-height: 40px;margin-left: 5px;color: #c2c2c2;">销量：${bookinfo.sales}</span><span style="line-height: 40px;margin-left: 10px;color: #c2c2c2;">库存：${bookinfo.stock}</span>
        </div>
        <div id="bookconuntdiv">
            <span style="margin-left: 25px;line-height: 40px;color: #c2c2c2;">数量</span>
            <a href="" id="a1">-</a>
            <input type="text" name="count" id="inputcount" value="1">
            <a href="" id="a2">+</a>
        </div>
        <button id="button1">加入购物车</button>
        <button id="button2">立即购买</button>

    </div>
    <!-- 推荐 -->
</div>
<h2 style="margin-left: 470px;"><img src="static/img/推荐.png" style="width: 70px;height: 45px;" ></h2>
<div id="recommend" >
    <c:forEach items="${recbook}" var="book">
    <div class="resultitem">
        <a href="<%=basepath%>/buybook?bookid=${book.id}&type=${book.type}" style="margin-left: 35px;">
            <img src="${book.imgpath}" alt="" style="height:150px;width: 120px;margin-top: 10px;">
            <span style="display: block;margin-left: 60px;">${book.name}</span>
            <span style="display: block;color: red;margin-left: 60px;">￥${book.price}</span>
        </a>
    </div>
    </c:forEach>
</div>
<!-- 底部栏 -->
<div style="width: 100%;height: 200px;background-color: #393D49;margin-top: 10px;">

</div>



<script>
    layui.use(['element','form','laypage','jquery','layer'], function(){
        var element = layui.element;
        var carousel=layui.carousel;
        var form=layui.form;
        var laypage=layui.laypage;
        var $=layui.jquery;
        var layer=layui.layer;

        $("#button1").click(function (){
            var bookid=${bookinfo.id};
            var count=$("#inputcount").val();
            $.ajax({
                type:'post',
                url:"<%=basepath%>/additem",
                data:{'bookId':bookid,'count':count},
                success:function (suc){

                    if (suc.state=="success"){
                        layer.msg('添加成功', {
                            icon: 1,
                            time: 4000,
                            offset: ['320px', '900px']
                        });
                        window.location.reload();
                    }else {
                        layer.msg('请先登录', {
                            icon: 2,
                            time: 4000,
                            anim: 1,
                            offset: ['320px', '900px']
                        });
                    }

                       <%--location.href=" <%=basepath%>/buybook?bookid=${book.id}&type=${book.type}";--%>

                }
            });
        });




       });




</script>
</body>
</html>
