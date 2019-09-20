<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf8"/>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <title>管理员登录</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js"></script>
    <link href="${pageContext.request.contextPath}/static/denglu/css/global.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/static/denglu/css/admin.css" rel="stylesheet" type="text/css"/>
    <script src="${pageContext.request.contextPath}/static/denglu/js/util.js" language="javascript"></script>


</head>
<body>
<div class="page">
    <div class="header">
        <span style='display:none;'>管理员登录</span>
        </h1>
    </div>
    <div class="body">
        <div class="part main-part">
            <div class="mod login-mod">
                <form name="loginform" action="" method="post" onsubmit="return frmvalidator();" id="loginform">
                    <h2>管理员登录</h2>
                    <div class="fi">
                        <label class="tit">用户名</label>
                        <input type="text" name="account_name" id="account_name" class="ipt-t ipt-sample" value=""/>
                    </div>
                    <div class="fi">
                        <label class="tit">密　码</label>
                        <input type="password" class="ipt-t" name="password" id="password"/>
                    </div>
                    <div class="fi fi-notit">
                        <input id="loginSubmit" type="button" class="ipt-b" value="登　录"/>
                        <div style="display: block;clear: both;">
                            <table class="err">
                                <tr>
                                    <td id="msgpid" style="display: none;">用户名或密码错误</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="goto">
                        <a href="userLogin.jsp" id="user_login_a" target="_blank">进入用户登录页面</a>
                    </div>
                </form>
            </div>
            <!--Adv Begin -->
            <%--<p align="center">
                <script src="http://www.96kb.com/script/adv/728x90.js" type="text/javascript"></script>
            </p>
            <!--Adv End -->

            <!--Count Begin -->
            <div style="display:none;">
                <script src="http://www.96kb.com/script/count.js" language="JavaScript" charset="utf8"></script>
            </div>
            <!--Count End -->--%>
        </div>
    </div>
    <script type="application/javascript">
        //点击登录事件
        $("#loginSubmit").click(loginSubmit);
        //回车触发事件
        $(document).keyup(function (event) {
            if (event.keyCode == 13) {
                $("#loginSubmit").click();
            }
        });

        loginSubmit : function loginSubmit() {
            var $userName = $("#account_name");
            var $password = $("#password");
            if ($userName.val() == "" || $.trim($userName.val()).length == 0) {
                alert("用户名不能为空！");
            } else if ($password.val() == "" || $.trim($password.val()).length == 0) {
                alert("密码不能为空！");
            } else {
                $.ajax({
                    url: "${pageContext.request.contextPath}/admin/login",
                    type: "POST",
                    data: {
                        adUsername: $userName.val(),
                        adPass: $password.val()
                    },
                    success: function (result) {
                        if (result.code == 101) {
                            alert("登录成功");
                            window.location.href = "index_houtai.jsp";
                        } else {
                            $("#msgpid").css("display", "");
                        }
                    }
                });
            }
        }
    </script>
</div>
</body>
</html>
