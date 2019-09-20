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
    <link href="${pageContext.request.contextPath}/static/index/style/feedback.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/static/index/style/banner.css" rel="stylesheet" type="text/css"/>
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <title>留言反馈-机电图书管理系统</title>
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
    <div id="divBookTitle" style="margin-top: 20px;">— 留言反馈 —</div>
    <div id="divBook2">
        <div id="bookMain">
            <h3>留言反馈</h3>
            <div id="infoList">
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group" style="display: none;">
                            <div class="col-sm-10">
                                <input type="text" class="form-control " name="id"
                                       id="id_update_input"> <span
                                    class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label">反馈标题:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control " name="fbTitle"
                                       id="fbTitle_update_input" placeholder="反馈标题"> <span
                                    class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label">反馈内容:</label>
                            <div class="col-sm-10">
                                <textarea class="form-control " name="fbText"
                                          id="fbText_update_input" placeholder="反馈内容" rows="20"></textarea> <span
                                    class="help-block"></span>
                            </div>
                        </div>

                    </form>
                </div>
                <div id="submit-footer">
                    <button type="button" class="btn btn-primary" id="rea_update_btn"> 提 交 </button>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        //点击确认借阅按钮
        $("#rea_update_btn").click(
            function () {
                <c:choose>
                <c:when test="${sessionScope.readerInfo == null}">
                    alert("请先登录");
                    window.location.href = "userLogin.jsp";
                </c:when>
                <c:otherwise>
                    if($("#fbTitle_update_input").val().trim()==""){
                        alert("请输入反馈标题");
                    }else if($("#fbText_update_input").val().trim()==""){
                        alert("请输入反馈内容");
                    }else{
                        $.ajax({
                            url: "${pageContext.request.contextPath}/saveFeedBack",
                            type : "POST",
                            data: $("#infoList form").serialize(),
                            success: function (result) {
                                if(result.code==101){
                                    alert("反馈成功，我们的工作人员会细心查阅！");
                                    $("#fbTitle_update_input").val("");
                                    $("#fbText_update_input").val("");
                                }else{
                                    alert(result.msg);
                                }
                            }
                        });
                    }
                </c:otherwise>
                </c:choose>
            });
    </script>
</div>

<div id="divfoot">
    版权所有@浙江机电职业技术学院-网络1632王威何志枭程标组
</div>
</body>
</html>
