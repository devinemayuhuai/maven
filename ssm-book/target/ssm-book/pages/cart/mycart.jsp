<%--
  Created by IntelliJ IDEA.
  User: 马玉怀
  Date: 2021/8/18
  Time: 17:10
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
    <title>注册页面</title>
    <link rel="stylesheet" type="text/css" href="static/layui-v2.6.8/layui/css/layui.css">
    <script type="text/javascript" src="static/layui-v2.6.8/layui/layui.js"></script>
</head>
<style type="text/css">
    #tologin{
        width: 100%;
        height: 40px;
        background-color: #c2c2c2;

    }
    #img{
        margin-left: 550px;
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
        top: 20px;
        left: 1102px;
        width: 50px;
        height: 37px;
        border: 1px solid #FF5722;
        background-color:#FF5722 ;
        color: white;
    }
    #headcontent{
        width: 1050px;
        height: 40px;
        background-color: #e2e2e2;
        margin: auto;
        margin-top: 30px;
        border-radius: 3px;

    }
    #bodycontent{
        width: 1050px;
        height: 500px;
        margin: auto;
        border: solid 1px #c2c2c2;
        margin-top: 10px;
    }
    #footcontent{
        width: 1050px;
        height: 70px;
        background-color: #e2e2e2;
        margin: auto;
        margin-top: 15px;
        position: relative;
    }
    .item{
        width: 1050px;
        height: 100px;
        border: solid 1px #c2c2c2;
        border-top: none;
        border-left: none;
        border-right: none;
        position: relative;
    }
    .item:hover{
        background-color: antiquewhite;
    }
    .count{
        width: 480px;
        height: 40px;
        position: absolute;
        left: 603px;
        top: 39px;
    }
    .a1{
        display:inline-block;
        width: 20px;
        height: 20px;
        border: #c2c2c2 1px solid;
        box-shadow: none;
        text-align: center;
        line-height: 20px;


    }
    .a2{
        display:inline-block;
        width: 20px;
        height: 20px;
        border: #c2c2c2 1px solid;
        box-shadow: none;
        text-align: center;
        line-height: 20px;
        margin-left: -5px;

    }
    .inputcount{
        width: 30px;
        height: 22px;
        box-shadow: none;
        border: #c2c2c2 1px solid;
        margin-left: -5px;
        text-align: center;
    }
    #submit{
        width: 115px;
        height:70px ;
        position: absolute;
        left: 935px;
        background-color: #FF5722;
        border: none;
        font-size: 16px;
        color: white;
    }
    #recommend{
        width: 1050px;
        height: 500px;
        margin: auto;
        margin-top: 30px;
        border: #c2c2c2 solid 1px;
    }
    #selectall{
        width: 18px;
        height: 18px;
        position: absolute;
        left:30px;
        top: 28px;
    }
    .select{
        width: 15px;
        height: 15px;
        display: inline-block;
        position: absolute;
        left:30px;
        top: 45px;
    }
</style>
<body>
<div id="tologin">
    <c:if test="${empty sessionScope.userinfo}">
        <a href="<%=basepath%>" style="line-height: 40px;margin-left: 200px;">已有账号？ <span style="color: #1E9FFF;"> 去登录</span></a>
    </c:if>
    <c:if test="${not empty sessionScope}">
        <span style="line-height: 40px;margin-left: 100px;">欢迎光临!&emsp;${sessionScope.userinfo.username} 新华伴你畅游书海</span>
        <a href="<%=basepath%>loginout" style="color: #1E9FFF;margin-left: 10px;line-height: 40px">退出登录</a>
    </c:if>
    <a href="" style="margin-left: 1200px;line-height: 40px"> <img src="static/img/个人中心.png" style="width: 14px;height: 14px;"> 个人中心</a>&nbsp;|
    <a href="" style="line-height: 40px">我的订单</a>|
    <a href="<%=basepath%>/" style="color: #1E9FFF;line-height: 40px">主页</a>
</div>
<%--<div style="margin-top: 20px;">--%>
<%--    <div id="img" >--%>
<%--        <img src="static/img/书城.png" alt="">--%>
<%--    </div>--%>
<%--</div>--%>
<%--<%=basepath%>--%>
<div style="width: 1153px;height: 80px;margin: auto;margin-top: 20px; position: relative;" id="search-content">
    <img src="static/img/书城.png" alt="" style="width: 220px; height: 80px;">
    <form action="searchbook" method="POST">
        <input type="text" name="bookname" id="searchtext"  placeholder="数学之美">
        <input type="submit" value="搜索" id="searchbutton">
    </form>
</div>

<div id="headcontent">
    <span style="line-height: 40px;margin-left: 120px;">商品信息</span>
    <span style="line-height: 40px;margin-left: 260px;">价格（元）</span>
    <span style="line-height: 40px;margin-left: 110px;">数量</span>
    <span style="line-height: 40px;margin-left: 140px;">小计（元）</span>
    <span style="line-height: 40px;margin-left: 80px;">操作</span>
</div>
<div id="bodycontent">
   <c:if test="${not empty sessionScope.userinfo}">
        <c:if test="${not empty sessionScope.cart.items}">
            <c:forEach items="${sessionScope.cart.items}" var="entry">
                <div class="item">
                    <input type="checkbox" name="checkbox" class="select">
                    <div style="width: 85px;height: 85px; border: solid 1px #c2c2c2; display: inline-block; position: absolute;left: 100px;top: 8px;">
                        <img src="${entry.value.imgpath}" style="width: 65px;height:75px ;margin-left: 11px;margin-top: 5px;">
                    </div>
                    <span style="position: absolute;left: 220px;top: 39px;">${entry.value.name}</span>
                    <span class="price" style="position: absolute;left: 450px;top: 39px;color: red;">${entry.value.price}</span>
                    <div class="count">
                        <a href="<%=basepath%>reduceItem?id=${entry.value.id}" class="a1">-</a>
                        <input type="text" name="count" class="inputcount" disabled value="${entry.value.count}">
                        <a href="<%=basepath%>addItem2?id=${entry.value.id}" class="a2">+</a>
                    </div>
                    <span style="margin-top: 50px;position: absolute;left: 809px;top: -11px;color: red;">${entry.value.totalPrice}</span>
                    <span style="display: none">${entry.value.id}</span>
                    <a href="<%=basepath%>deleteItem?id=${entry.value.id}"  style="position: absolute; left: 950px;top: 39px;">删除</a>
                </div>
            </c:forEach>
       </c:if>
       <c:if test="${empty sessionScope.cart.items}">
           <div style="margin-left: 400px;margin-top: 150px;">
               <img src="static/img/购物车空.png" style="width: 220px;height:220px ;">
               <h3>您购物车中还没有商品&emsp;<a href="<%=basepath%>" style="color: #1E9FFF;">去购买</a></h3>
           </div>
       </c:if>
   </c:if>
    <c:if test="${ empty sessionScope.userinfo}">
            <div style="margin-left: 430px;margin-top: 150px;">
                <img src="static/img/未登录.png" style="width: 220px;height:200px ;">
                <h3>您还没有登录&emsp;<a href="<%=basepath%>" style="color: #1E9FFF;">去登录</a></h3>
            </div>
    </c:if>
</div>
<c:if test="${not empty sessionScope.cart.items}">
        <div id="footcontent">
            <input type="checkbox"  id="selectall">
            <span style="position: absolute;left: 53px;top: 27px;">全选</span>
            <c:if test="${not empty sessionScope.cart.items}" >
            <a href="<%=basepath%>clearAll" style="position: absolute;left: 95px;top: 27px;">清空购物车</a>
            </c:if>
            <span  style="position: absolute;left: 600px;top: 28px;">
                已选<span class="checkedcount" style="color: red;">0</span>
                件商品
            </span>
            <span style="position: absolute;left: 720px;top: 20px;">
                    合计(不含运费)￥
                     <span id="totalprice" style="color: red;font-size: 16px">0</span>
                     <p>已节省：￥0.00</p>
                </span>
            <button id="submit">去结算</button>
        </div>
</c:if>
<!-- 推荐 -->
<div id="recommend">

</div>
<!-- 底部栏 -->
<div style="width: 100%;height: 200px;background-color: #393D49;margin-top: 10px;">

</div>

<script>
    layui.use(['form','laydate','upload','jquery'],function(){
        var form=layui.form;
        var laydate=layui.laydate;
        var upload=layui.upload;
        var $=layui.jquery;

        laydate.render({
            elem:'#birth ',
            type:'date',//type属性可以提供多种选择器，year,month,date,time,datetime
            format:'yyyy-MM-dd',//自定义时间格式
            theme:'molv',//自定义主题，theme的可选值有：default（默认简约）、molv（墨绿背景）、#颜色值（自定义颜色背景）、grid（格子主题）
            calendar:true,//是否显示公历节日，国际版en不显示

        });

        //为全选按钮绑定单击事件
        $("#selectall").click(function(){
            var state=$("#selectall").prop("checked");
            alert(state);
            if(state==true){
                $(".select").attr("checked",true);
                // var len=$("input:checkbox:checked").length
                $(".checkedcount").text(${sessionScope.cart.totalCount});
                $("#totalprice").text(${sessionScope.cart.totalPrice});
            }
            if(state==false){
                $(".select").attr("checked",false);
                $(".checkedcount").text("0");
                $("#totalprice").text("0");
            }

        });
        //查看多选框选中的个数
          var totalprice=0;
         $(".select").click(function (){
             // var state=$(".select").prop("checked");
             var state=$(this).prop("checked");
             alert(state);
             if (state==true) {
                 var len = $("input:checkbox:checked").length
                 $(".checkedcount").text(len);
                 var price = $(this).parent().find('span').eq(2).text();
                 totalprice = totalprice + parseInt(price);
                 $("#totalprice").text(totalprice);
             }
             if (state==false){
                 var len = $("input:checkbox:checked").length
                 $(".checkedcount").text(len);
                 var price = $(this).parent().find('span').eq(2).text();
                 totalprice = totalprice - parseInt(price);
                 $("#totalprice").text(totalprice);
             }
         });

    });
</script>
</body>
</html>