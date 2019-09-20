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
    <link href="${pageContext.request.contextPath}/static/index/style/banner.css" rel="stylesheet" type="text/css"/>
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <title>图书列表-机电图书管理系统</title>
</head>
<body>
<!-- 借阅 -->
<div class="modal fade" id="reaUpdateModal" tabindex="-1" role="dialog"
     aria-labelledby="reaModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="reaModalLabel">借阅图书</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">书名:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control " name="bookid"
                                   id="bookid_update_input" style="display: none;">
                            <input type="text" class="form-control " readonly="readonly" name="bookname"
                                   id="bookName_update_input" placeholder="书名"> <span
                                class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">作者:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control " name="author" readonly="readonly"
                                   id="author_update_input" placeholder="作者"> <span
                                class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">价格:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control " name="price" readonly="readonly"
                                   id="price_update_input" placeholder="价格"> <span
                                class="help-block"></span>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">库存:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control " name="borrowsum" readonly="readonly"
                                   id="borrowsum_update_input" placeholder="库存"> <span
                                class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">出版社:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control " name="concern" readonly="readonly"
                                   id="concern_update_input" placeholder="出版社"> <span
                                class="help-block"></span>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">图书类型:</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="typeid" id="select1" disabled="disabled">
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">书架类型:</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="caseid" id="select2" disabled="disabled">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="rea_update_btn">确认借阅</button>
            </div>
        </div>
    </div>
</div>

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
    <div id="divBookTitle" style="margin-top: 20px;">— 图书列表 —</div>
    <div id="divBook2">
        <div id="bookMain">
            <h3>图书列表</h3>
            <div id="bookList">
                <div id="divSelect">
                    <form class="form-inline">
                        <div class="form-group">
                            <label for="select3">筛选图书：</label>
                            <select class="form-control" name="typeid" id="select3">
                                <option value="-1">— 全部 —</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" id="selTest" placeholder="输入关键字搜索">
                        </div>
                        <button type="button" class="btn btn-default" id="btnSelect">搜索</button>
                    </form>
                </div>
                <div class="row">
                    <table class="table table-hover" id=rea_table>
                        <thead>
                        <tr>
                            <th>图书编号</th>
                            <th>书名</th>
                            <th>作者</th>
                            <th>价格</th>
                            <th>可借数量</th>
                            <th>出版社</th>
                            <th>书本类型</th>
                            <th>可借天数</th>
                            <th>书架类型</th>
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
                    <div class="col-md-6" id="page_nav_area"
                         style="top: 10px;width: 500px;text-align: center;width: 100%">

                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            //初始化搜索框的选项
            getBooktypes("#select3");
            //初始化页面数据
            initPage(1);
        });

        //获取URL中参数的方法
        function GetQueryString(name)
        {
            var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if(r!=null)return  unescape(r[2]); return null;
        }

        //搜索按钮事件
        $("#btnSelect").click(function () {
            showPage(1);
        });

        

        function showPage(n) {
            var bookType=null;
            var selTest=null;
            if($("#select3").val() != -1){
                bookType=$("#select3").val();
            }
            if($("#selTest").val().trim() != ""){
                selTest=$("#selTest").val();
            }
            $.ajax({
                url: "${pageContext.request.contextPath}/getBookList",
                data: {
                    pn:n,
                    typeid:bookType,
                    bookname:selTest
                },
                type: "GET",
                success: function (result) {
                    //显示图书数据
                    build_rea_table(result)
                    //显示分页信息
                    build_page_info(result)
                    //显示页面导航
                    build_page_nav(result)
                }
            });
        }

        function initPage(n) {
            var bookType=null;
            var selTest=null;
            var typeid = GetQueryString("typeid");
            if(typeid != null){
                bookType=typeid;
            }
            $.ajax({
                url: "${pageContext.request.contextPath}/getBookList",
                data: {
                    pn:n,
                    typeid:bookType
                },
                type: "GET",
                success: function (result) {
                    //显示图书数据
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
            var books = result.data.page.list;
            $
                .each(
                    books,
                    function (booklist, item) {
                        var bookidTd = $("<td></td>").append(item.bookid);
                        var booknameTd = $("<td></td>").append(
                            item.bookname);
                        var authorTd = $("<td></td>").append(item.author);
                        var priceTd = $("<td></td>").append(item.price);
                        var borrowsumTd = $("<td></td>").append(
                            item.borrowsum);
                        var concernTd = $("<td></td>").append(item.concern);
                        var typenameTd = $("<td></td>").append(
                            item.booktype.typename);
                        var borrowdayTd = $("<td></td>").append(
                            item.booktype.borrowday);
                        var casenameTd = $("<td></td>").append(
                            item.bookcase.casename);
                        var editBtn = $("<button></button>").addClass(
                            "btn btn-primary btn-xs edit-btn").append(
                            $("<span></span>").addClass(
                                "glyphicon glyphicon-log-in"))
                            .append(" 借阅");
                        editBtn.attr("borrow-booId", item.bookid);
                        var editBtnTd = $("<td></td>").append(editBtn);
                        $("<tr></tr>").append(bookidTd)
                            .append(booknameTd).append(authorTd)
                            .append(priceTd).append(borrowsumTd)
                            .append(concernTd).append(typenameTd)
                            .append(borrowdayTd).append(casenameTd).append(editBtnTd)
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

            $.each(result.data.page.navigatepageNums, function (adminlist, item) {
                var numLi = $("<li></li>").append(
                    $("<a></a>").append(item).attr("href", "#"));

                if (result.data.page.pageNum == item) {
                    numLi.addClass("active");
                }

                numLi.click(function () {
                    showPage(item);

                });

                ul.append(numLi);
            });

            ul.append(nextPageLi).append(lastPageLi);

            var navElement = $("<nav></nav>").append(ul).appendTo(
                "#page_nav_area");

        }

        function getBooktypes(ele) {
            $.ajax({
                url: "${pageContext.request.contextPath}/booktypes",
                type: "GET",
                success: function (result) {
                    $(ele).empty();
                    if(ele=="#select3"){
                        var optionElement = $("<option></option>").append(
                            "— 全部 —").attr("value", -1);

                        optionElement.appendTo(ele);
                    }
                    $.each(result.data.booktypes, function () {
                        var optionElement = $("<option></option>").append(
                            this.typename).attr("value", this.typeid);

                        optionElement.appendTo(ele);
                    });
                    var typeid = GetQueryString("typeid");
                    if(typeid != null){
                        $(ele).val(typeid);
                    }
                }
            });
        }

        function getBookcases(ele) {
            $.ajax({
                url: "${pageContext.request.contextPath}/bookcases",
                type: "GET",
                success: function (result) {
                    $(ele).empty();
                    $.each(result.data.bookcases, function () {
                        var optionElement = $("<option></option>").append(
                            this.casename).attr("value", this.caseid);

                        optionElement.appendTo(ele);
                    });
                }
            });
        }

        //点击借阅按钮
        $(document).on("click", ".edit-btn", function () {
            //1.获取所有类型
            getBooktypes("#reaUpdateModal #select1");
            getBookcases("#reaUpdateModal #select2");

            //2.获取读者信息
            getBook($(this).attr("borrow-booId"));
            $("#rea_update_btn").attr("borrow-booId", $(this).attr("borrow-booId"));
            //3.获取模态框
            $('#reaUpdateModal').modal({
                backdrop: 'static'
            })
        });

        //点击确认借阅按钮
        $("#rea_update_btn").click(
            function () {
                <c:choose>
                <c:when test="${sessionScope.readerInfo == null}">
                    alert("请先登录");
                    window.location.href = "userLogin.jsp";
                </c:when>
                <c:otherwise>
                    $.ajax({
                        url: "${pageContext.request.contextPath}/borrow",
                        type : "POST",
                        data: $("#reaUpdateModal form").serialize(),
                        success: function (result) {
                            if(result.code==101){
                                alert("借阅成功，可前往个人中心查看借阅信息")
                                $("#reaUpdateModal").modal('hide');
                            }else{
                                alert(result.msg);
                            }
                        }
                    });
                </c:otherwise>
                </c:choose>
            });


        //还原表单状态的方法
        function reset_form(ele) {
            //清除表单数据
            $(ele)[0].reset();
            //清除校验状态
            $(ele).find("*").removeClass("has-error has-success");
            //清除提示信息
            $(ele).find(".help-block").text("");

        }

        function getBook(id) {
            $.ajax({
                url: "${pageContext.request.contextPath}/boo/" + id,
                type: "GET",
                success: function (result) {
                    if (result.code = 101) {
                        var book = result.data.book;
                        $("#bookid_update_input").val(book.bookid);
                        $("#bookName_update_input").val(book.bookname);
                        $("#author_update_input").val(book.author);
                        $("#price_update_input").val(book.price);
                        $("#borrowsum_update_input").val(book.borrowsum);
                        $("#concern_update_input").val(book.concern);
                        $("#reaUpdateModal #select1").val(book.typeid);
                        $("#reaUpdateModal #select2").val(book.caseid);
                    }

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
