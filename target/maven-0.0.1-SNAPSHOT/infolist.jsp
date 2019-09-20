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
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js"></script>
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css"
          rel="stylesheet">

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
                <h4 class="modal-title" id="reaModalLabel">修改图书馆信息</h4>
            </div>
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
                        <label for="name" class="col-sm-2 control-label">图书馆名称:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control " name="libraryName"
                                   id="libraryName_update_input" placeholder="图书馆名称"> <span
                                class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">馆长名称:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control " name="masterName"
                                   id="masterName_update_input" placeholder="馆长名称"> <span
                                class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">建立时间:</label>
                        <div class="col-sm-10">
                            <div class="input-group date form_datetime col-md-5" data-date="1979-09-16T05:25:07Z"
                                 data-date-format="yyyy-mm-dd" data-link-field="dtp_input1">
                                <input class="form-control" name="bulidTime" id="bulidTime_update_input" size="16"
                                       type="text" value="" placeholder="建立时间" readonly>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                                <span class="help-block"></span>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">联系邮箱:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control " name="contactEmail"
                                   id="contactEmail_update_input" placeholder="联系邮箱"> <span
                                class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">地址:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control " name="contactAddress"
                                   id="contactAddress_update_input" placeholder="地址"> <span
                                class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">联系电话:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control " name="contactPhone"
                                   id="contactPhone_update_input" placeholder="联系电话"> <span
                                class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">网址:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control " name="contactWeb"
                                   id="contactWeb_update_input" placeholder="网址"> <span
                                class="help-block"></span>
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
            <h2>显示图书馆的信息</h2>
        </div>
    </div>
    <!-- reader data -->
    <div class="row">
        <table class="table table-hover" id=inf_table>
            <thead>
            <tr>
                <th>ID</th>
                <th>图书馆名称</th>
                <th>馆长</th>
                <th>建立时间</th>
                <th>邮箱</th>
                <th>地址</th>
                <th>电话</th>
                <th>网址</th>
                <th>编辑</th>
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

        $('.form_datetime').datetimepicker({
            format: 'yyyy-mm-dd',
            minView: 'month',
            weekStart: 0, //一周从哪一天开始
            todayBtn: 1, //
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            forceParse: 0,
            showMeridian: 1
        });

    });

    function showPage(n) {

        $.ajax({
            url: "${pageContext.request.contextPath}/infos",
            data: "pn=" + n,
            type: "GET",
            success: function (result) {
                //显示读者数据
                build_inf_table(result)
                //显示分页信息
                build_page_info(result)
                //显示页面导航
                build_page_nav(result)
            }
        });
    }

    function build_inf_table(result) {
        $("#inf_table tbody").empty();
        var infos = result.data.page.list;
        $.each(infos, function (infolist, item) {
            var idTd = $("<td></td>").append(item.id);
            var libraryNameTd = $("<td></td>").append(item.libraryName);
            var masterNameTd = $("<td></td>").append(item.masterName);
            var bulidTimeTd = $("<td></td>").append(item.bulidTime);
            var contactEmailTd = $("<td></td>").append(item.contactEmail);
            var contactAddressTd = $("<td></td>").append(item.contactAddress);
            var contactPhoneTd = $("<td></td>").append(item.contactPhone);
            var contactWebTd = $("<td></td>").append(item.contactWeb);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit-btn").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            editBtn.attr("edit-reaId", item.id);
            var editBtnTd = $("<td></td>").append(editBtn);

            $("<tr></tr>").append(idTd)
                .append(libraryNameTd)
                .append(masterNameTd)
                .append(bulidTimeTd)
                .append(contactEmailTd)
                .append(contactAddressTd)
                .append(contactPhoneTd)
                .append(contactWebTd)
                .append(editBtnTd)
                .appendTo("#inf_table")
        });
    }

    function build_page_info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append("当前第" + result.data.page.pageNum + "页/总共" + result.data.page.pages + "页，总数为" + result.data.page.total);
    }

    function build_page_nav(result) {

    }

    //点击编辑按钮
    $(document).on("click", ".edit-btn", function () {
        //1.获取图书馆信息
        getInfo($(this).attr("edit-reaId"));
        $("#rea_update_btn").attr("edit-reaId", $(this).attr("edit-reaId"));
        //2.获取模态框
        $('#reaUpdateModal').modal({
            backdrop: 'static'
        })
    });

    //修改按钮点击事件
    $("#rea_update_btn").click(
        function () {
            $.ajax({
                url: "${pageContext.request.contextPath}/modifyInfo",
                type: "GET",
                data: $("#reaUpdateModal form").serialize(),
                success: function (result) {
                    $("#reaUpdateModal").modal('hide');
                    showPage(1);
                }
            });
        });

    function getInfo(id) {
        $.ajax({
            url: "${pageContext.request.contextPath}/getInfoById",
            data: {id: id},
            type: "GET",
            success: function (result) {
                if (result.code = 101) {
                    var info = result.data.info;
                    $("#id_update_input").val(info.id);
                    $("#libraryName_update_input").val(info.libraryName);
                    $("#masterName_update_input").val(info.masterName);
                    $("#bulidTime_update_input").val(info.bulidTime);
                    $("#contactEmail_update_input").val(info.contactEmail);
                    $("#contactAddress_update_input").val(info.contactAddress);
                    $("#contactPhone_update_input").val(info.contactPhone);
                    $("#contactWeb_update_input").val(info.contactWeb);
                }

            }
        });
    }

    function getLocalTime(nS) {
        var date = new Date(parseInt(nS));
        var Y = date.getFullYear() + '-';
        var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
        var D = date.getDate() + ' ';
        var h = date.getHours() + ':';
        var m = date.getMinutes() + ':';
        var s = date.getSeconds();
        return Y + M + D;
    }

</script>

</body>
</html>