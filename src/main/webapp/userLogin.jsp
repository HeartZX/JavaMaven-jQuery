<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf8"/>
    <title>用户登录</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <link href="${pageContext.request.contextPath}/static/denglu/css/global.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/static/denglu/css/user.css" rel="stylesheet" type="text/css"/>
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <!-- <script type="text/javascript" src="${pageContext.request.contextPath}/static/denglu/js/jquery.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/denglu/js/common.js" ></script> -->

    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/denglu/css/reset.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/denglu/css/common.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/denglu/css/font-awesome.min.css"/>
    <script src="${pageContext.request.contextPath}/static/denglu/js/util.js" language="javascript"></script>
    <script type="application/javascript">
        $(document).ready(function () {
            //点击登录事件
            $("#loginSubmit").click(loginSubmit);
            //回车触发事件
            $(document).keyup(function (event) {
                if (event.keyCode == 13) {
                    $("#loginSubmit").click();
                }
            });

        });
        loginSubmit :function loginSubmit() {
            var $userName = $("#account_name");
            var $password = $("#password");
            if ($userName.val() == "" || $.trim($userName.val()).length == 0) {
                alert("用户名不能为空！");
            } else if ($password.val() == "" || $.trim($password.val()).length == 0) {
                alert("密码不能为空！");
            } else {
                $.ajax({
                    url: "${pageContext.request.contextPath}/userLogin",
                    type: "POST",
                    data: {
                        readername: $userName.val(),
                        remark: $password.val()
                    },
                    success: function (result) {
                        if (result.code == 101) {
                            alert("登录成功");
                            //获取上个页面地址，如果为空，登录成功跳转到首页，否则跳回上个页面
                            var prevLink = document.referrer;
                            if($.trim(prevLink)==''){
                                window.location.href = "index.jsp";
                            }else {
                                location.href = prevLink;
                            }
                        } else {
                            alert("用户名或密码错误！");
                        }
                    }
                });
            }
        }
    </script>
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
                        > 女
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
                            <input type="password" class="form-control " name="remark"
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

<div class="page">
    <div class="header">

    </div>
    <div class="body">
        <div class="part main-part">
            <div class="mod login-mod">
                <form name="loginform" id="loginform" action="" method="post" onsubmit="return frmvalidator();">
                    <h2>用户登录</h2>
                    <div class="fi">
                        <label class="tit">用户名</label>
                        <input type="text" name="account_name" id="account_name" class="ipt-t ipt-sample" value=""/>
                    </div>
                    <div class="fi">
                        <label class="tit">密　码</label>
                        <input type="password" class="ipt-t" name="password" id="password"/>
                    </div>
                    <div class="fi fi-notit">

                    </div>
                    <div class="fi fi-notit">
                        <input type="button" class="ipt-b" id="loginSubmit" value="登　录"/>
                        <input type="button" class="ipt-b" id="rea_add_modal_btn" value="注  册"/>
                    </div>
                    <div class="goto" style="padding-left: 100px;">
                        <a href="admin.jsp" target="_blank">进入管理员登录页面</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    /*var oTxt = document.getElementById("divText");
    var max = oTxt.getElementsByTagName("p").length;
    var i=1;
    setInterval("fnChangeText()",5000);
    function fnChangeText(){
        i=i<max?i+1:1;
        oTxt.className = "mod text-mod text-mod-"+i;
    }*/
</script>

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

<!--Adv Begin -->
<%--<p align="center">
    <script src="http://www.96kb.com/script/adv/728x90.js" type="text/javascript"></script>
</p>
<!--Adv End -->

<!--Count Begin -->
<div style="display:none;">
    <script src="http://www.96kb.com/script/count.js" language="JavaScript" charset="utf8"></script>
</div>--%>
<!--Count End -->

</body>
</html>
