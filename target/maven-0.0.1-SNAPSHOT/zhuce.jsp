<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <!-- <script type="text/javascript" src="${pageContext.request.contextPath}/static/denglu/js/jquery.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/denglu/js/common.js" ></script> -->

    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/denglu/css/reset.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/denglu/css/common.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/denglu/css/font-awesome.min.css"/>
    <title>Insert title here</title>
</head>


<body>

<!-- 注册 -->
<div class="modal fade" id="reaAddModal" tabindex="-1" role="dialog" aria-labelledby="reaModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="reaModalLabel">注册你的信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">姓名:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control " name="readername"
                                   id="reaName_add_input" placeholder="姓名"> <span
                                class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别:</label>
                        <div class="col-sm-10">
                            <label class="checkbox-inline"> <input type="radio"
                                                                   name="sex" id="sex1_add_input" value="男"
                                                                   checked="checked"> 男
                            </label> <label class="checkbox-inline"> <input type="radio"
                                                                            name="sex" id="sex2_add_input" value="女"
                                                                            checked="checked"> 女
                        </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">邮箱:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control " name="email"
                                   id="email_add_input" placeholder="email@zime.edu.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">电话:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control " name="tel"
                                   id="tel_add_input" placeholder="13577887788,0571-87772629">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">密码:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control " name="remark"
                                   id="remark_add_input" placeholder="XXX-XXX-XXX"> <span
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
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="rea_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>


<div class="wrap login_wrap">
    <div class="content">
        <div class="logo"></div>
        <div class="login_box">

            <div class="login_form">
                <div class="login_title">
                    登录
                </div>
                <form action="#" method="post">

                    <div class="form_text_ipt">
                        <input name="username" type="text" placeholder="手机号/邮箱">
                    </div>
                    <div class="ececk_warning"><span>手机号/邮箱不能为空</span></div>
                    <div class="form_text_ipt">
                        <input name="password" type="password" placeholder="密码">
                    </div>
                    <div class="ececk_warning"><span>密码不能为空</span></div>
                    <div class="form_check_ipt">
                        <div class="right check_right">
                            <a href="#">忘记密码</a>
                        </div>
                    </div>
                    <div class="form_btn">
                        <button type="button" onclick="javascript:window.location.href='#'">登录</button>
                    </div>
                    <div class="form_reg_btn" style="padding-bottom: 20px;">
                        <span>还没有帐号？</span>
                        <%--<button type="button" class="btn btn-primary" id="rea_add_modal_btn">
                            <span aria-hidden="true"></span>
                            马上 注册
                        </button>--%>
                        <a href="javaScript:void(0)" id="rea_add_modal_btn">马上注册</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div style="text-align:center;">
</div>


</body>


<script type="text/javascript">
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

    //点击注册按钮
    $("#rea_add_modal_btn").click(function () {

        getReadertypes("#reaAddModal select");
        //2.显示模态框
        $('#reaAddModal').modal({
            backdrop: 'static'
        })
    });

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


</script>


</html>