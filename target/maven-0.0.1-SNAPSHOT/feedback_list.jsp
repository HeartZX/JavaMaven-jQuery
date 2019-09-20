<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Title</title>
</head>
<body>


<!-- 编辑 -->
<div class="modal fade" id="reaUpdateModal" tabindex="-1" role="dialog"
     aria-labelledby="reaModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="reaModalLabel">反馈详情</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">

                    <div class="panel panel-default">
                        <div class="panel-heading" id="fbTitle"></div>
                        <div class="panel-body" id="fbText">
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<div class="container" style="width: 800px;">

    <!-- title -->
    <div class="row">
        <div>
            <h2>显示留言反馈信息</h2>
        </div>
    </div>

    <!-- insert delete button -->
    <div class="row">
        <div class="col-md-4 col-md-offset-10" style="width: 250px;">

            <button type="button" class="btn btn-danger" id="rea_del_modal_btn">
                <span class="	glyphicon glyphicon-trash" aria-hidden="true"></span>
                批量删除
            </button>

        </div>
    </div>
    <!-- reader data -->
    <div class="row">
        <table class="table table-hover" id=rea_table>
            <thead>
            <tr>
                <th><input type="checkbox" id="check_All"></th>
                <th>反馈编号</th>
                <th>用户名</th>
                <th>标题</th>
                <th width="200">内容</th>
                <th>反馈时间</th>
                <th>编辑</th>
                <th>删除</th>
            </tr>

            </thead>
            <tbody></tbody>
        </table>
    </div>

    <!-- paging info -->
    <div class="row">
        <div class="col-md-6" id="page_info_area">
        </div>
        <div class="col-md-6" id="page_nav_area" style="top: 10px;width: 500px;text-align: center;">

        </div>


    </div>


</div>

<script type="text/javascript">
    $(function () {
        showPage(1);
    });

    function showPage(n) {
        $.ajax({
            url: "${pageContext.request.contextPath}/getAllFeedback",
            data: "pn=" + n,
            type: "GET",
            success: function (result) {
                //显示反馈数据
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
        var admins = result.data.page.list;
        $.each(admins, function (adminlist, item) {
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'></td>");
            var idTd = $("<td></td>").append(item.id);
            var adUsernameTd = $("<td></td>").append(item.reader.readername);
            var fbTitle = $("<td></td>").append(item.fbTitle);
            var tempText = item.fbText;
            if(item.fbText.length>10){
                tempText=tempText.substr(0,10)+"……";
            }
            var fbText = $("<td></td>").append(tempText);
            var fbTime = $("<td></td>").append(getLocalTime(item.fbTime));
            var editBtn = $("<button></button>")
                .addClass(
                    "btn btn-primary btn-xs edit-btn")
                .append(
                    $("<span></span>")
                        .addClass(
                            "glyphicon glyphicon-search"))
                .append("查看详情");
            editBtn.attr("edit-reaId", item.id);
            var deleteBtn = $("<button></button>")
                .addClass(
                    "btn btn-danger btn-xs delete-btn")
                .append(
                    $("<span></span>")
                        .addClass(
                            "glyphicon glyphicon-trash"))
                .append("删除");
            deleteBtn.attr("delete-reaId", item.id);
            var editBtnTd = $("<td width='60'></td>").append(editBtn);
            var deleteBtnTd = $("<td width='60'></td>").append(deleteBtn);

            $("<tr></tr>")
                .append(checkBoxTd)
                .append(idTd)
                .append(adUsernameTd)
                .append(fbTitle)
                .append(fbText)
                .append(fbTime)
                .append(editBtnTd)
                .append(deleteBtnTd)
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

    //还原表单状态的方法
    function reset_form(ele) {
        //清除表单数据
        $(ele)[0].reset();
        //清除校验状态
        $(ele).find("*").removeClass("has-error has-success");
        //清除提示信息
        $(ele).find(".help-block").text("");

    }

    function getFeedback(id) {
        $.ajax({
            url: "${pageContext.request.contextPath}/getFeedbackInfo",
            data: {id:id},
            type: "GET",
            success: function (result) {
                if (result.code = 101) {
                    var feedbackInfo = result.data.feedbackInfo;
                    $("#fbTitle").html(feedbackInfo.fbTitle);
                    $("#fbText").html(feedbackInfo.fbText);
                }

            }
        });
    }


    //点击编辑按钮
    $(document).on("click", ".edit-btn", function () {
        //1.获取管理员信息
        getFeedback($(this).attr("edit-reaId"));
        $("#rea_update_btn").attr("edit-reaId", $(this).attr("edit-reaId"));
        //2.获取模态框
        $('#reaUpdateModal').modal({
            backdrop: 'static'
        })
    });

    //点击删除按钮
    $(document).on("click", ".delete-btn", function () {
        var reaName = $(this).parent().parent().find("td:eq(3)").text();
        //alert(stuName);
        if (confirm("确定要删除[" + reaName + "]吗？")) {
            //2.发送AJAX请求，删除员工数据
            $.ajax({
                url: "${pageContext.request.contextPath}/removeFeedback",
                data : {ids:$(this).attr("delete-reaId").toString()},
                type: "GET",
                success: function (result) {
                    alert(result.msg);
                    showPage(currPage);
                }
            });
        }

    });


    $("#check_All").click(function () {
        //alert($(this).prop("checked"));
        $(".check_item").prop("checked", $(this).prop("checked"));
    });

    $(document).on("click", ".check_item", function () {
        var flag = $(".check_item:checked").length == $(".check_item").length;
        $("#check_All").prop("checked", flag);
    });

    //批量删除
    $("#rea_del_modal_btn").click(function () {
        var reaNames = "";
        var reaIds = "";
        $.each($(".check_item:checked"), function () {
            reaNames += $(this).parents("tr").find("td:eq(3)").text() + ",";
            reaIds += $(this).parents("tr").find("td:eq(1)").text() + ",";
        })
        reaNames = reaNames.substring(0, reaNames.length - 1);
        reaIds = reaIds.substring(0, reaIds.length - 1);

        if (confirm("确定要删除[" + reaNames + "]吗？")) {
            $.ajax({
                url: "${pageContext.request.contextPath}/removeFeedback",
                data : {ids:reaIds},
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
</body>
</html>
