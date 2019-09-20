<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script
            src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js"></script>
    <script
            src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link
            href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
            rel="stylesheet">
    <title>Insert title here</title>
</head>
<body>
<!-- 添加 -->
<div class="modal fade" id="reaAddModal" tabindex="-1" role="dialog"
     aria-labelledby="reaModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="reaModalLabel">添加图书信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">书名:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control " name="bookname"
                                   id="bookName_add_input" placeholder="书名"> <span
                                class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">作者:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control " name="author"
                                   id="author_add_input" placeholder="作者"> <span
                                class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">价格:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control " name="price"
                                   id="price_add_input" placeholder="价格"> <span
                                class="help-block"></span>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">可借数量:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control " name="borrowsum"
                                   id="borrowsum_add_input" placeholder="可借数量"> <span
                                class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">出版社:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control " name="concern"
                                   id="concern_add_input" placeholder="出版社"> <span
                                class="help-block"></span>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">图书类型:</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="typeid" id="select1">
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">书架类型:</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="caseid" id="select2">
                            </select>
                        </div>
                    </div>


                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="rea_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>


<!-- 修改 -->
<div class="modal fade" id="reaUpdateModal" tabindex="-1" role="dialog"
     aria-labelledby="reaModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="reaModalLabel">添加图书信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">书名:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control " name="bookname"
                                   id="bookName_update_input" placeholder="书名"> <span
                                class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">作者:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control " name="author"
                                   id="author_update_input" placeholder="作者"> <span
                                class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">价格:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control " name="price"
                                   id="price_update_input" placeholder="价格"> <span
                                class="help-block"></span>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">可借数量:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control " name="borrowsum"
                                   id="borrowsum_update_input" placeholder="可借数量"> <span
                                class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">出版社:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control " name="concern"
                                   id="concern_update_input" placeholder="出版社"> <span
                                class="help-block"></span>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">图书类型:</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="typeid" id="select1">
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">书架类型:</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="caseid" id="select2">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="rea_update_btn">修改</button>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <!-- title -->
    <div class="row">
        <div>
            <h2>显示所有书本信息</h2>
        </div>
    </div>

    <!-- insert delete button -->
    <div class="row">
        <div class="col-md-4 col-md-offset-10">


            <button type="button" class="btn btn-primary" id="rea_add_modal_btn">
                <span class="glyphicon glyphicon-pencil"></span> 新增
            </button>

            <button type="button" class="btn btn-danger" id="rea_del_modal_btn">
                <span class="	glyphicon glyphicon-trash"></span> 删除
            </button>

        </div>
    </div>
    <!-- reader data -->
    <div class="row">
        <table class="table table-hover" id=rea_table>
            <thead>
            <tr>
                <th><input type="checkbox" id="check_All"></th>
                <th>图书编号</th>
                <th>书名</th>
                <th>作者</th>
                <th>价格</th>
                <th>可借数量</th>
                <th>出版社</th>
                <th>书本类型</th>
                <th>可借天数</th>
                <th>书架类型</th>

                <th>编辑</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>

    <!-- paging info -->
    <div class="row">
        <div class="col-md-6" id="page_info_area"></div>
        <div class="col-md-6" id="page_nav_area"></div>
    </div>


</div>
</body>
<script type="text/javascript">
    $(function () {
        showPage(1);

    });

    function showPage(n) {
        $.ajax({
            url: "${pageContext.request.contextPath}/books",
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
        var books = result.data.page.list;
        $
            .each(
                books,
                function (booklist, item) {
                    var checkBoxTd = $("<td><input type='checkbox' class='check_item'></td>");
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
                            "glyphicon glyphicon-pencil"))
                        .append("编辑");
                    editBtn.attr("edit-booId", item.bookid);
                    var deleteBtn = $("<button></button>").addClass(
                        "btn btn-danger btn-xs delete-btn").append(
                        $("<span></span>").addClass(
                            "glyphicon glyphicon-trash"))
                        .append("删除");
                    deleteBtn.attr("delete-booId", item.bookid);
                    var editBtnTd = $("<td></td>").append(editBtn);
                    var deleteBtnTd = $("<td></td>").append(deleteBtn);

                    $("<tr></tr>").append(checkBoxTd).append(bookidTd)
                        .append(booknameTd).append(authorTd)
                        .append(priceTd).append(borrowsumTd)
                        .append(concernTd).append(typenameTd)
                        .append(borrowdayTd).append(casenameTd)
                        .append(editBtnTd).append(deleteBtnTd)
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

            });

            ul.append(numLi);
        });

        ul.append(nextPageLi).append(lastPageLi);

        var navElement = $("<nav></nav>").append(ul).appendTo("#page_nav_area");

    }

    //还原表单状态的方法
    function reset_form(ele) {
        //清除表单数据
        $(ele)[0].reset();
        //清除校验状态
        $(ele).find("*").removeClass("has-error has-success");
        //清除提示信息
        $(ele).find(".help-block").text("");

    }

    $("#rea_add_modal_btn").click(function () {

        getBooktypes("#reaAddModal #select1");
        getBookcases("#reaAddModal #select2");

        //2.显示模态框
        $('#reaAddModal').modal({
            backdrop: 'static'
        })
    });

    function getBooktypes(ele) {
        $.ajax({
            url: "${pageContext.request.contextPath}/booktypes",
            type: "GET",
            success: function (result) {
                $(ele).empty();
                $.each(result.data.booktypes, function () {
                    var optionElement = $("<option></option>").append(
                        this.typename).attr("value", this.typeid);

                    optionElement.appendTo(ele);
                });
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

    function getBook(id) {
        $.ajax({
            url: "${pageContext.request.contextPath}/boo/" + id,
            type: "GET",
            success: function (result) {
                if (result.code = 101) {
                    var book = result.data.book;
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

    $("#rea_save_btn").click(function () {
        //alert($("#reaAddModal form").serialize());

        $.ajax({
            url: "${pageContext.request.contextPath}/boo",
            type: "POST",
            data: $("#reaAddModal form").serialize(),
            success: function (result) {
                $("#reaAddModal").modal('hide');
                showPage(totalPage);

            }
        });

    });
    //点击编辑按钮
    $(document).on("click", ".edit-btn", function () {
        //1.获取所有类型
        getBooktypes("#reaUpdateModal #select1");
        getBookcases("#reaUpdateModal #select2");

        //2.获取读者信息
        getBook($(this).attr("edit-booId"));
        $("#rea_update_btn").attr("edit-booId", $(this).attr("edit-booId"));
        //3.获取模态框
        $('#reaUpdateModal').modal({
            backdrop: 'static'
        })
    });
    $("#rea_update_btn").click(
        function () {

            //1.对提交的数据进行规则调验
            //if (!validate_update_form()) {
            //	return false;
            //		}

            //2.发送AJAX请求，保存学生数据
            //alert($("#worAddModal form").serialize());
            $.ajax({
                url: "${pageContext.request.contextPath}/boo/"
                + $(this).attr("edit-booid"),
                /* type : "POST",
                data : $("#worAddModal form").serialize()+"&_method=PUT", */
                type: "PUT",
                data: $("#reaUpdateModal form").serialize(),
                success: function (result) {
                    //alert("sadasd")

                    $("#reaUpdateModal").modal('hide');
                    showPage(currPage);

                }
            });
        });
    //点击删除按钮
    $(document)
        .on(
            "click",
            ".delete-btn",
            function () {
                var booName = $(this).parent().parent()
                    .find("td:eq(1)").text();
                //alert(stuName);
                if (confirm("确定要删除[" + booName + "]吗？")) {
                    //2.发送AJAX请求，删除数据
                    $.ajax({
                        url: "${pageContext.request.contextPath}/boo/"
                        + $(this).attr("delete-booId"),
                        type: "DELETE",
                        success: function (result) {
                            alert(result.msg);
                            showPage(currPage);
                        }

                    });
                }

            });

    //批量删除
    $("#rea_del_modal_btn").click(function () {
        var booNames = "";
        var booIds = "";
        $.each($(".check_item:checked"), function () {
            booNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
            booIds += $(this).parents("tr").find("td:eq(1)").text() + ",";
        })
        booNames = booNames.substring(0, booNames.length - 1);
        booIds = booIds.substring(0, booIds.length - 1);

        //alert(worNames);
        //alert(worIds);
        if (confirm("确定要删除[" + booNames + "]吗？")) {
            //2.发送AJAX请求，删除学生数据
            $.ajax({
                url: "${pageContext.request.contextPath}/boo/" + booIds,
                type: "DELETE",
                success: function (result) {
                    alert(result.msg);
                    showPage(currPage);
                }

            });
        }

    });
</script>

</html>