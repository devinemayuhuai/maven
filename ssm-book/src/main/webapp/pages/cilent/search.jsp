<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 马玉怀
  Date: 2021/8/13
  Time: 22:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <style type="text/css">
        html,body{
            background-color: #FAFAFA;
        }
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
            width:896px;
            height: 50px;
            margin: auto;
            margin-top: 30px;
            background-color: white;
        }
        #searchresult{
            margin: auto;
            margin-top: 5px;
            width: 960px;
            height: 800px;



        }
        .resultitem{
            width: 200px;
            height: 220px;

            margin-left: 32px;
            margin-top: 15px;

            float: left;
            background-color:white;
            border-radius: 3px;
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
<div id="navimg">
    <img src="static/img/导航图.png" alt="" style="width: 100%;height: 65px;">
</div>
<!-- 顶部搜索栏 -->
<%--<div style="width: 960px;height: 80px;margin: auto;background-color: white;position: relative;" id="search-content">--%>
<%--    <form action="<%=basepath%>/queryBookByName" method="post">--%>
<%--        <input type="text" name="bookname" style="width: 180px;height: 30px;margin-top: 25px;margin-left: 700px;" >--%>
<%--        <input type="submit" value="搜索" style="width: 45px; height: 34px;border: none;background-color: #009688;">--%>
<%--    </form>--%>
<%--</div>--%>
<div style="width: 1153px;height: 80px;margin: auto;margin-top: 40px; position: relative;" id="search-content">
    <img src="static/img/书城.png" alt="" style="width: 220px; height: 80px;">
    <form action="<%=basepath%>/queryBookByName" method="POST">
        <input type="text" name="bookname" id="searchtext"  placeholder="数学之美">
        <input type="submit" value="搜索" id="searchbutton">
    </form>
</div>

<div id="screen">
    <form action="<%=basepath%>/queryBookByPrice" class=""  method="post">
        <c:if test="${not empty bookname}">
            <input type="hidden" name="bookname" value="${bookname}">
        </c:if>
        <c:if test="${not empty booktype}">
            <input type="hidden" name="booktype" value="${booktype}">
        </c:if>
        <input type="text"  name="min" value="${minprice}" placeholder="￥最低价" style="margin-top: 10px;margin-left: 10px; height: 25px;width: 100px;" >&nbsp;-
        <input type="text" name="max" value="${maxprice}" placeholder="￥最高价" style="margin-top: 10px;height: 25px;width: 100px;">
        <input type="submit" value="筛选" id="screenbtn">
    </form>
</div>
<div id="searchresult">
    <c:forEach items="${bookitem}" var="book">
    <div class="resultitem">
        <a href="<%=basepath%>/buybook?bookid=${book.id}&type=${book.type}" style="margin-left: 35px;">
            <img src="${book.imgpath}" alt="" style="height:150px;width: 120px;margin-top: 10px;">
            <span style="display: block;margin-left: 60px;">${book.name}</span>
            <span style="display: block;color: red;margin-left: 60px;">￥${book.price}</span>
        </a>
    </div>
    </c:forEach>

</div>
<div id="pagediv" style="margin-left: 900px;">

</div>
<!-- 底部栏 -->
<div style="width: 100%;height: 200px;background-color: #393D49;margin-top: 10px;">

</div>


<script>
    layui.use(['element','form','laypage','jquery'], function(){
        var element = layui.element;
        var carousel=layui.carousel;
        var form=layui.form;
        var laypage=layui.laypage;
        var $=layui.jquery;
        laypage.render({
            elem:'pagediv',//注意这里的id不用加#
            count:${pagetotal},//总的数据条数，必须的，一般从服务器获取
            limit:12,//每页显示的条数
            groups:5,//连续出现的页码个数
            curr:${curr},//设置当前页的页码
            jump:function(obj,first){//点击切换分页以后的回调obj对象中保存了当前分页的所有信息
                if (!first){
                var page=obj.curr;
                console.log(page);
                var limit=obj.limit;
                    <c:if test="${not empty bookname}">
                        location.href="<%=basepath%>/queryBookByName?page="+page+"&limit="+limit+"&bookname=${bookname}";
                    </c:if>
                    <c:if test="${not empty booktype}">
                        location.href="<%=basepath%>/queryBookByName?page="+page+"&limit="+limit+"&type=${booktype}";
                    </c:if>

                  }
            }

        });

    });


</script>
</body>
</html>