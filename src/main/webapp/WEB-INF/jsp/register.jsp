<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN" style="overflow: hidden;">

<head>
    <meta charset="UTF-8">
    <!-- 避免IE使用兼容模式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <!-- 移动设备 viewport -->
    <meta name="viewport"
        content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no,minimal-ui">
    <!-- 360浏览器默认使用Webkit内核 -->
    <meta name="renderer" content="webkit">
    <!-- 禁止搜索引擎抓取 -->
    <meta name="robots" content="nofollow">
    <!-- 禁止百度SiteAPP转码 -->
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <!-- Chrome浏览器添加桌面快捷方式（安卓） -->
    <meta name="mobile-web-app-capable" content="yes">
    <!-- Safari浏览器添加到主屏幕（IOS） -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="">
    <!--[if lt IE 9]>
          <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
          <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    <title>文件管理系统</title>
    <link rel="shortcut icon" href="favicon.ico">
    <!--样式-->
    <link href="static/css/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="../../static/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../static/css/core.css" rel="stylesheet" />
    <link href="../../static/css/site.css" rel="stylesheet" />
    <!--主页面-->
    <link href="../../static/css/hzyAdminUI.css" rel="stylesheet" />

    <style type="text/css">
        #hzy-login {
            background: #f0f2f5 url(../../static/images/login-bg.svg) no-repeat 50%;
        }
    </style>
</head>

<body>

    <div id="hzy-login">
        <!-- <div class="login-modal">
        </div> -->
        <div class="container-fluid">
            <div class="row">
                <div class="login-panel shadow-lg" style="height: 60rem">
                    <h1 class="text-center">文件管理系统</h1>

                    <div class="container-fluid">

                        <div class="pt-20">
                            <form id="Form" action="/register" method="post">
                            <div class="form-group form-material">
                                <label class="col-form-label" for="username">帐户名</label>
                                <input type="text" value="${user.username}" class="form-control" id="username" name="username" placeholder="请输入帐户名" autocomplete="off">
                            </div>

                            <div class="form-group form-material">
                                <label class="col-form-label" for="password">密码</label>
                                <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码" autocomplete="off">
                            </div>

                            <div class="form-group form-material">
                                <label class="col-form-label" for="repassword">重新输入密码</label>
                                <input type="password" class="form-control" id="repassword" name="repassword" placeholder="请再次输入密码" autocomplete="off">
                            </div>
                            <div class="form-group form-material">
                                <label class="col-form-label" for="name">姓名</label>
                                <input type="text" value="${user.name}" class="form-control" id="name" name="name" placeholder="请输入姓名" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label" for="sex">性别</label>
                                <select class="form-control" id="sex" name="sex">
                                    <option value="男" <c:if test="${user.sex =='男'}">selected</c:if>>男</option>
                                    <option value="女" <c:if test="${user.sex =='女'}">selected</c:if>>女</option>
                                </select>
                            </div>
                            <div class="form-group form-material">
                                <label class="col-form-label" for="mobile">电话</label>
                                <input type="text" value="${user.mobile}" class="form-control" id="mobile" name="mobile" placeholder="请输入电话" autocomplete="off">
                            </div>
                            <div  id="msg" class="text-danger" <c:if test="${msg} == ''"> style="display: none;"</c:if>>${msg}</div>
                            <a class="btn btn-block btn-primary btn-lg mt-20" id="register" href='javascript:;'>注册</a>
                            <h3>已账号？快去<a class="text-danger" href="/">登录</a>吧</h3>
                            </form>
                        </div>

                    </div>


                </div>
            </div>
        </div>
    </div>
    <!--js-->
    <script src="../../static/libs/jquery/jquery-3.2.1.min.js"></script>
    <script src="../../static/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script>
    $(function () {

        $("#register").click(function () {
            if ($("#username").val() === ''){
                $("#msg").text("用户名不能为空")
                $("#msg").show();
                return;
            }
            if ($("#password").val() === ''){
                $("#msg").text("密码不能为空")
                $("#msg").show();
                return;
            }
            if ($("#repassword").val() === ''){
                $("#msg").text("重复密码不能为空")
                $("#msg").show();
                return;
            }
            if ($("#name").val() === ''){
                $("#msg").text("姓名不能为空")
                $("#msg").show();
                return;
            }
            if ($("#specialty").val() === ''){
                $("#msg").text("特长不能为空")
                $("#msg").show();
                return;
            }
            if ($("#mobile").val() === ''){
                $("#msg").text("电话不能为空")
                $("#msg").show();
                return;
            }
            if ($("#password").val() !== $("#repassword").val()){
                $("#msg").text("两次密码不一致")
                $("#msg").show();
                return;
            }
            $("#Form").submit();
        })

    })
</script>
</body>

</html>