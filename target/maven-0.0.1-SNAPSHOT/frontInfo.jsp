<%@ page import="org.springframework.web.context.request.SessionScope" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf8"/>
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js"></script>
    <script src="${pageContext.request.contextPath}/static/index/js/wySilder.min.js"></script>
    <link href="${pageContext.request.contextPath}/static/index/style/index.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/static/index/style/book.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/static/index/style/info.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/static/index/style/banner.css" rel="stylesheet" type="text/css"/>
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <title>图书馆详情-机电图书管理系统</title>
</head>
<body>

<%--网页主体--%>
<div id="divTop">
    <div id="divTopMain">
        <div id="divLogo"><img src="${pageContext.request.contextPath}/static/index/images/logo.png" id="imgLogo"></div>
        <div id="divTitle">机电图书管理系统</div>
        <div id="divLink">
            <ul id="ulLink">
                <li><a href="index.jsp">首页</a></li>
                <li><a href="frontbookList.jsp">图书列表</a></li>
                <li><a href="frontInfo.jsp">图书馆信息</a></li>
                <li><a href="feedback.jsp">留言反馈</a></li>
            </ul>
        </div>
        <div id="divUser">
            <c:choose>
                <c:when test="${sessionScope.readerInfo != null}">
                    <a class="aUser" href="userInfo.jsp">${sessionScope.readerInfo.readername}:个人中心</a>
                    <a class="aUserOut" href="${pageContext.request.contextPath}/userOut">退出</a>
                </c:when>
                <c:otherwise>
                    <a class="aUser" href="userLogin.jsp">登录/注册</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
<div id="divPage">
    <div id="divBookTitle" style="margin-top: 20px;">— 图书馆信息 —</div>
    <div id="divBook2">
        <div id="bookMain">
            <h3>图书馆信息</h3>
            <div id="bookList">
                <img src="static/index/images/info.png" width="1000" height="270">
                <div id="infoMain">
                    <div id="infoMainTop"><span id="spMasterName"></span><span id="spBig2">— 图书馆长</span></div>
                    <div id="infoMainbottom">
                        <div id="infoMainLeft">
                            <div>图书馆名称：<span id="spLibraryName"></span></div>
                            <div>联系邮箱：<span id="spContactEmail"></span></div>
                            <div>联系电话：<span id="spContactPhone"></span></div>
                        </div>
                        <div id="infoMainRight">
                            <div>建立时间：<span id="spBulidTime"></span></div>
                            <div>地址：<span id="spContactAddress"></span></div>
                            <div>网址：<span id="spContactWeb"></span></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            //初始化页面数据
            showInfo();
        });

        function showInfo() {
            $.ajax({
                url: "${pageContext.request.contextPath}/getInfo",
                type: "GET",
                success: function (result) {
                    //显示图书馆数据
                    $("#spMasterName").append(result.data.info.masterName);
                    $("#spLibraryName").append(result.data.info.libraryName);
                    $("#spBulidTime").append(result.data.info.bulidTime);
                    $("#spContactEmail").append(result.data.info.contactEmail);
                    $("#spContactAddress").append(result.data.info.contactAddress);
                    $("#spContactPhone").append(result.data.info.contactPhone);
                    $("#spContactWeb").append(result.data.info.contactWeb);
                }
            });
        }
    </script>
</div>

<div id="divfoot">
    版权所有@浙江机电职业技术学院-网络1632王威何志枭程标组
</div>
</body>
</html>
