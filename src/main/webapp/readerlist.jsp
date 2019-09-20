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
                <h4 class="modal-title" id="reaModalLabel">修改读者信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">姓名:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control " name="readername"
                                   id="reaName_update_input" placeholder="姓名"> <span
                                class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别:</label>
                        <div class="col-sm-10">
                            <label class="checkbox-inline"> <input type="radio"
                                                                   name="sex" id="sex1_update_input" value="男"
                                                                   checked="checked"> 男
                            </label> <label class="checkbox-inline"> <input type="radio"
                                                                            name="sex" id="sex2_update_input" value="女"
                                                                            checked="checked"> 女
                        </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">邮箱账号:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control " name="email"
                                   id="email_update_input" placeholder="email@zime.edu.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">电话:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control " name="tel"
                                   id="tel_update_input" placeholder="13577887788,0571-87772629">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">密码:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control " name="remark"
                                   id="remark_update_input" placeholder="XXX-XXX-XXX"> <span
                                class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">类型:</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="readerTypeid">
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
            <h2>显示所有读者信息</h2>
        </div>
    </div>

    <!-- insert delete button -->
    <div class="row">
        <div class="col-md-4 col-md-offset-10">


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
                <th>读者编号</th>
                <th>读者姓名</th>
                <th>性别</th>
                <th>电话</th>
                <th>邮箱</th>
                <th>密码</th>
                <th>类型</th>
                <th>可借数量</th>
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
            url: "${pageContext.request.contextPath}/readers",
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
        var readers = result.data.page.list;
        $.each(readers, function (readerlist, item) {
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'></td>");
            var idTd = $("<td></td>").append(item.id);
            var readernameTd = $("<td></td>").append(item.readername);
            var sexTd = $("<td></td>").append(item.sex);
            var telTd = $("<td></td>").append(item.tel);
            var emailTd = $("<td></td>").append(item.email);
            var remarkTd = $("<td></td>").append(item.remark);
            var typenameTd = $("<td></td>").append(item.readertype.typename);
            var numTd = $("<td></td>").append(item.readertype.num);
            var editBtn = $("<button></button>")
                .addClass(
                    "btn btn-primary btn-xs edit-btn")
                .append(
                    $("<span></span>")
                        .addClass(
                            "glyphicon glyphicon-pencil"))
                .append("编辑");
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
            var editBtnTd = $("<td></td>").append(editBtn);
            var deleteBtnTd = $("<td></td>").append(
                deleteBtn);

            $("<tr></tr>")
                .append(checkBoxTd)
                .append(idTd)
                .append(readernameTd)
                .append(sexTd)
                .append(telTd)
                .append(emailTd)
                .append(remarkTd)
                .append(typenameTd)
                .append(numTd)
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

    function getReader(id) {
        $.ajax({
            url: "${pageContext.request.contextPath}/rea/" + id,
            type: "GET",
            success: function (result) {
                if (result.code = 101) {
                    var reader = result.data.reader;
                    $("#reaName_update_input").val(reader.readername);
                    $("#email_update_input").val(reader.email);
                    $("#tel_update_input").val(reader.tel);
                    $("#remark_update_input").val(reader.remark);
                    $("#reaUpdateModal input[name=sex]").val([reader.sex]);
                    $("#reaUpdateModal select").val([reader.readerTypeid]);
                }

            }
        });
    }

    function getReadertypes(ele) {
        $.ajax({
            url: "${pageContext.request.contextPath}/readertypes",
            type: "GET",
            success: function (result) {
                $(ele).empty();
                $.each(result.data.readertypes, function () {
                    var optionElement = $("<option></option>").append(
                        this.typename).attr("value", this.readerTypeid);

                    optionElement.appendTo(ele);
                });
            }
        });
    }


    //点击编辑按钮
    $(document).on("click", ".edit-btn", function () {
        //1.获取所有类型
        getReadertypes("#reaUpdateModal select");
        //2.获取读者信息
        getReader($(this).attr("edit-reaId"));
        $("#rea_update_btn").attr("edit-reaId", $(this).attr("edit-reaId"));
        //3.获取模态框
        $('#reaUpdateModal').modal({
            backdrop: 'static'
        })
    });


    //点击删除按钮
    $(document).on("click", ".delete-btn", function () {
        var reaName = $(this).parent().parent().find("td:eq(1)").text();
        //alert(stuName);
        if (confirm("确定要删除[" + reaName + "]吗？")) {
            //2.发送AJAX请求，删除员工数据
            $.ajax({
                url: "${pageContext.request.contextPath}/rea/" + $(this).attr("delete-reaId"),
                type: "DELETE",
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
        //alert($(".check_item").length);
        //alert($(".check_item:checked").length);
        var flag = $(".check_item:checked").length == $(".check_item").length;
        $("#check_All").prop("checked", flag);
    });

    //批量删除
    $("#rea_del_modal_btn").click(function () {
        var reaNames = "";
        var reaIds = "";
        $.each($(".check_item:checked"), function () {
            reaNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
            reaIds += $(this).parents("tr").find("td:eq(1)").text() + ",";
        })
        reaNames = reaNames.substring(0, reaNames.length - 1);
        reaIds = reaIds.substring(0, reaIds.length - 1);

        //alert(worNames);
        //alert(worIds);
        if (confirm("确定要删除[" + reaNames + "]吗？")) {
            //2.发送AJAX请求，删除学生数据
            $.ajax({
                url: "${pageContext.request.contextPath}/rea/" + reaIds,
                type: "DELETE",
                success: function (result) {
                    alert(result.msg);
                    showPage(currPage);
                }

            });
        }

    });

    $("#rea_save_btn").click(function () {
        //alert($("#reaAddModal form").serialize());

        $.ajax({
            url: "${pageContext.request.contextPath}/rea",
            type: "POST",
            data: $("#reaAddModal form").serialize(),
            success: function (result) {
                $("#reaAddModal").modal('hide');
                showPage(totalPage);

            }
        });

    });

    //修改按钮点击事件
    $("#rea_update_btn").click(
        function () {

            //1.对提交的数据进行规则调验
            //if (!validate_update_form()) {
            //	return false;
            //	}

            //2.发送AJAX请求，保存学生数据
            //alert($("#worAddModal form").serialize());
            $.ajax({
                url: "${pageContext.request.contextPath}/rea/"
                + $(this).attr("edit-reaid"),
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
</script>


</body>
</html>