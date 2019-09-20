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
    <link href="${pageContext.request.contextPath}/static/index/style/readerinfo.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/static/index/style/banner.css" rel="stylesheet" type="text/css"/>
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <title>个人中心-机电图书管理系统</title>
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
    <div id="divBookTitle" style="margin-top: 20px;">— 个人中心 —</div>
    <div id="divinfo">
        <div id="ReadInfoMain">
            <h3>个人中心</h3>
            <div id="bookList">
                <div id="infoMain2">
                    <div id="infoMainTop"><span id="readername"></span><span id="spBig2">— </span></div>
                    <div id="infoMainbottom">
                        <div id="infoMainLeft">
                            <div>性别：<span id="sex"></span></div>
                            <div>联系电话：<span id="tel"></span></div>
                        </div>
                        <div id="infoMainRight">
                            <div>联系邮箱：<span id="email"></span></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="ReturnMain">
            <h3>待还书籍</h3>
            <div class="row" style="width: 900px;margin-right: auto;margin-left: auto;">
                <table class="table table-hover" id=rea_table>
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>姓名</th>
                        <th>书名</th>
                        <th>借出时间</th>
                        <th>归还时间</th>
                        <th>是否归还</th>
                        <th>操作</th>
                        <th>操作</th>

                    </tr>


                    </thead>
                    <tbody></tbody>
                </table>
            </div>

            <!-- paging info -->
            <div class="row">
                <div class="col-md-6" id="page_info_area">
                </div>
                <div class="col-md-6" id="page_nav_area" style="margin-left: 0px;margin-right: 0px;text-align: center;width: 100%">
                </div>
            </div>

        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            //初始化页面数据
            showInfo();
            showPage(1);
        });

        function showInfo() {
            $.ajax({
                url: "${pageContext.request.contextPath}/getLoginUser",
                type: "GET",
                success: function (result) {
                    //显示图书馆数据
                    $("#readername").append(result.data.info.readername);
                    $("#spBig2").append(result.data.info.readertype.typename);
                    $("#sex").append(result.data.info.sex);
                    $("#tel").append(result.data.info.tel);
                    $("#email").append(result.data.info.email);
                }
            });
        }

        function showPage(n) {
            $.ajax({
                url: "${pageContext.request.contextPath}/userBorrows",
                data: "pn=" + n,
                type: "GET",
                success: function (result) {
                    //显示读者数据
                    build_rea_table(result)
                    //显示分页信息
                    build_page_info(result)
                    //显示页面导航
                    build_page_nav(result)
                }
            });
        }

        function build_rea_table(result) {
            $("#rea_table tbody").empty();
            var borrows = result.data.page.list;
            $.each(borrows, function (borrowlist, item) {
                var idTd = $("<td></td>").append(item.id);
                var readernameTd = $("<td></td>").append(item.reader.readername);
                var booknameTd = $("<td></td>").append(item.book.bookname);
                var borrowtimeTd = $("<td></td>").append(getLocalTime(item.borrowtime));
                var returntimeTd = $("<td></td>").append(getLocalTime(item.returntime));
                var isreturnTd = $("<td></td>").append(item.isreturn==0?"未还":item.isreturn==1?"已还待确认":"已还");

                var editBtn = $("<button></button>").addClass("btn btn-success btn-sm edit-btn").append($("<span></span>").addClass("glyphicon glyphicon-log-out")).append("还书");
                editBtn.attr("edit-reaId", item.id);
                var editBtnTd = $("<td></td>").append(editBtn);

                var continueBtn = $("<button></button>").addClass("btn btn-primary btn-sm continue-btn").append($("<span></span>").addClass("glyphicon glyphicon-log-in")).append("续借");
                continueBtn.attr("continue-reaId", item.id);
                var continueBtnTd = $("<td></td>").append(continueBtn);

                $("<tr></tr>").append(idTd)
                    .append(readernameTd)
                    .append(booknameTd)
                    .append(borrowtimeTd)
                    .append(returntimeTd)
                    .append(isreturnTd)

                    .append(continueBtnTd)
                    .append(editBtnTd)
                    .appendTo("#rea_table")
            });
        }

        function build_page_info(result) {
            $("#page_info_area").empty();
            $("#page_info_area").append(
                "当前第" + result.data.page.pageNum + "页/总共"
                + result.data.page.pages + "页，记录总数为"
                + result.data.page.total);
            totalPage = result.data.page.total;
            currPage = result.data.page.pageNum;
        }

        function build_page_nav(result) {
            $("#page_nav_area").empty();
            var ul = $("<ul></ul>").addClass("pagination");

            var firstPageLi = $("<li></li>").append(
                $("<a></a>").append("首页").attr("href", "#"));
            var previousPageLi = $("<li></li>").append(
                $("<a></a>").append("&laquo;").attr("href", "#"));

            if (result.data.page.hasPreviousPage == false) {
                firstPageLi.addClass("disabled");
                previousPageLi.addClass("disabled");
            } else {
                firstPageLi.click(function () {
                    showPage(1);
                })
                previousPageLi.click(function () {
                    showPage(result.data.page.pageNum - 1);
                })
            }

            var nextPageLi = $("<li></li>").append(
                $("<a></a>").append("&raquo;").attr("href", "#"));
            var lastPageLi = $("<li></li>").append(
                $("<a></a>").append("末页").attr("href", "#"));

            if (result.data.page.hasNextPage == false) {
                nextPageLi.addClass("disabled");
                lastPageLi.addClass("disabled");
            } else {
                nextPageLi.click(function () {
                    showPage(result.data.page.pageNum + 1);
                })
                lastPageLi.click(function () {
                    showPage(result.data.page.pages);
                })
            }

            ul.append(firstPageLi).append(previousPageLi);

            $.each(result.data.page.navigatepageNums, function (readerlist, item) {
                var numLi = $("<li></li>").append(
                    $("<a></a>").append(item).attr("href", "#"));

                if (result.data.page.pageNum == item) {
                    numLi.addClass("active");
                }

                numLi.click(function () {
                    showPage(item);

                })

                ul.append(numLi);
            })

            ul.append(nextPageLi).append(lastPageLi);

            var navElement = $("<nav></nav>").append(ul).appendTo(
                "#page_nav_area");

        }

        //点击还书按钮
        $(document).on("click", ".edit-btn", function () {
            var reaName = $(this).parent().parent().find("td:eq(2)").text();
            if (confirm("确定要还[" + reaName + "]吗？")) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/modifyBorrow",
                    data : {id:$(this).attr("edit-reaId").toString(),isreturn:1},
                    type: "GET",
                    success: function (result) {
                        alert(result.msg);
                        showPage(currPage);
                    }
                });
            }

        });

        //点击续借按钮
        $(document).on("click", ".continue-btn", function () {
            var reaName = $(this).parent().parent().find("td:eq(2)").text();
            if (confirm("确定要续借[" + reaName + "]吗？")) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/continueBorrow",
                    data : {id:$(this).attr("continue-reaId").toString(),isreturn:1},
                    type: "GET",
                    success: function (result) {
                        alert(result.msg);
                        showPage(currPage);
                    }
                });
            }

        });

        function getLocalTime(nS) {
            var date = new Date(parseInt(nS));
            var Y = date.getFullYear() + '-';
            var M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
            var D = date.getDate() + ' ';
            var h = date.getHours() + ':';
            var m = date.getMinutes() + ':';
            var s = date.getSeconds();
            return Y+M+D;
        }


    </script>
</div>

<div id="divfoot">
    版权所有@浙江机电职业技术学院-网络1632王威何志枭程标组
</div>
</body>
</html>
