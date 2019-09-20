<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Insert title here</title>

</head>
<body>
<!-- 借阅详情 -->
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
                        <label for="name" class="col-sm-2 control-label">借阅时间:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control " name="borrowtime" readonly="readonly"
                                   id="borrowtime_update_input" placeholder="借阅时间"> <span
                                class="help-block"></span>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">应还时间:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control " name="returntime" readonly="readonly"
                                   id="returntime_update_input" placeholder="应还时间"> <span
                                class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">还书状态:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control " name="isreturn" readonly="readonly"
                                   id="isreturn_update_input" placeholder="还书状态"> <span
                                class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">借书人:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control " name="readername" readonly="readonly"
                                   id="readername_update_input" placeholder="借书人"> <span
                                class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">联系方式:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control " name="tel" readonly="readonly"
                                   id="tel_update_input" placeholder="联系方式"> <span
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
                <button type="button" class="btn btn-primary" id="rea_update_btn">确认还书</button>
                <button type="button" class="btn btn-danger" id="rea_reject_btn">驳回还书</button>
            </div>
        </div>
    </div>
</div>


<div class="container">

    <!-- title -->
    <div class="row">
        <div>
            <h2>显示所有借阅信息</h2>
        </div>
    </div>
    <!-- reader data -->
    <div class="row">
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

            </tr>


            </thead>
            <tbody></tbody>
        </table>
    </div>

    <!-- paging info -->
    <div class="row">
        <div class="col-md-6" id="page_info_area">
        </div>
        <div class="col-md-6" id="page_nav_area">

        </div>


    </div>


</div>

<script type="text/javascript">
    $(function () {
        showPage(1);


    });

    function showPage(n) {
        $.ajax({
            url: "${pageContext.request.contextPath}/borrows",
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

    //点击查看详情按钮
    $(document).on("click", ".edit-btn", function () {
        getBooktypes("#reaUpdateModal #select1");
        getBookcases("#reaUpdateModal #select2");
        //1.获取管理员信息
        getBorrow($(this).attr("edit-reaId"));
        $("#rea_update_btn").attr("edit-reaId", $(this).attr("edit-reaId"));
        $("#rea_reject_btn").attr("edit-reaId", $(this).attr("edit-reaId"));
        //2.获取模态框
        $('#reaUpdateModal').modal({
            backdrop: 'static'
        })
    });

    //确认还书按钮点击事件
    $("#rea_update_btn").click(
        function () {
            $.ajax({
                url: "${pageContext.request.contextPath}/modifyBorrow",
                type: "GET",
                data: {
                    id:$(this).attr("edit-reaId"),
                    isreturn:2
                },
                success: function (result) {
                    alert("操作成功");
                    $("#reaUpdateModal").modal('hide');
                    showPage(currPage);
                }
            });
        });

    //驳回还书按钮点击事件
    $("#rea_reject_btn").click(
        function () {
            $.ajax({
                url: "${pageContext.request.contextPath}/modifyBorrow",
                type: "GET",
                data: {
                    id:$(this).attr("edit-reaId"),
                    isreturn:0
                },
                success: function (result) {
                    alert("操作成功");
                    $("#reaUpdateModal").modal('hide');
                    showPage(currPage);
                }
            });
        });

    function getBorrow(id) {
        $.ajax({
            url: "${pageContext.request.contextPath}/getBorrowInfo",
            data:{id:id},
            type: "GET",
            success: function (result) {
                if (result.code = 101) {
                    var borrow = result.data.borrowInfo;
                    $("#bookid_update_input").val(borrow.book.bookid);
                    $("#bookName_update_input").val(borrow.book.bookname);
                    $("#author_update_input").val(borrow.book.author);
                    $("#borrowtime_update_input").val(getLocalTime(borrow.borrowtime));
                    $("#returntime_update_input").val(getLocalTime(borrow.returntime));
                    $("#isreturn_update_input").val(borrow.isreturn==0?"未还":borrow.isreturn==1?"已还待确认":"已还");
                    $("#readername_update_input").val(borrow.reader.readername);
                    $("#tel_update_input").val(borrow.reader.tel);
                    $("#reaUpdateModal #select1").val(borrow.book.typeid);
                    $("#reaUpdateModal #select2").val(borrow.book.caseid);
                    if(borrow.isreturn == 1){
                        $("#rea_update_btn").css("display","");
                        $("#rea_reject_btn").css("display","");
                    }else{
                        $("#rea_update_btn").css("display","none");
                        $("#rea_reject_btn").css("display","none");
                    }
                }
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

            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit-btn").append($("<span></span>").addClass("glyphicon glyphicon-search")).append("查看详情");
            editBtn.attr("edit-reaId", item.id);
            var editBtnTd = $("<td></td>").append(editBtn);

            $("<tr></tr>").append(idTd)
                .append(readernameTd)
                .append(booknameTd)
                .append(borrowtimeTd)
                .append(returntimeTd)
                .append(isreturnTd)

                .append(editBtnTd)
                .appendTo("#rea_table")
        });
    }

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

</body>
</html>