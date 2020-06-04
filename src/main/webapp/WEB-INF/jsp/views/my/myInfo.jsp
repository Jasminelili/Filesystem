<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>HzyAdminUI</title>
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
    <link href="/static/css/web-icons-master/css/web-icons.css" rel="stylesheet" />
    <!--样式-->
    <link href="/static/css/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="/static/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/static/css/core.css" rel="stylesheet" />
    <link href="/static/css/site.css" rel="stylesheet" />
</head>

<body>
    <div class="page page-forms">
        <div class="page-header">
            <h1 class="page-title">个人管理</h1>
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a>首页</a>
                </li>
                <li class="breadcrumb-item">
                    <!-- 去掉标签行为-->
                    <a href="javascript:;">个人资料</a>
                </li>
            </ol>
        </div>
        <div class="page-content container-fluid">
            <div class="row">
                <div class="col-md-6">
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title">个人信息</h3>
                        </div>
                        <div class="panel-body container-fluid">
                            <form id="Form" action="/user/updateMyInfo" method="post" autocomplete="off">
                                <div class="form-group form-material">
                                    <label class="col-form-label" for="username">用户名</label>
                                    <input type="text" class="form-control" id="username" value="${user.username}" readonly style="cursor: no-drop" placeholder="用户名">
                                </div>
                                <div class="form-group form-material">
                                    <label class="col-form-label" for="name">姓名</label>
                                    <input type="text" class="form-control" id="name" value="${user.name}" name="name"
                                        placeholder="名称">
                                </div>
                                <div class="form-group form-material">
                                    <label class="col-form-label" for="sex">性别</label>
                                    <select class="form-control" id="sex" name="sex">
                                        <option value="男" <c:if test="${user.sex =='男'}">selected</c:if>>男</option>
                                        <option value="女" <c:if test="${user.sex =='女'}">selected</c:if>>女</option>
                                    </select>
                                </div>
                                <div class="form-group form-material">
                                    <label class="col-form-label" for="mobile">手机号码</label>
                                    <input type="text" class="form-control" id="mobile" value="${user.mobile}" name="mobile"
                                           placeholder="手机号码">
                                </div>
                                <div class="form-group form-material">
                                    <button type="button" class="btn btn-block btn-primary" id="updateInfo">修改</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade modal-danger" id="exampleModalDanger" aria-hidden="true" aria-labelledby="exampleModalDanger"
         role="dialog" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="关闭">
                        <span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title">提醒</h4>
                </div>
                <div class="modal-body">
                    <p id="tips"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消
                    </button>
                </div>
            </div>
        </div>
    </div>
    <!--脚本-->
    <script src="/static/libs/jquery/jquery-3.2.1.min.js"></script>
    <script src="/static/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script>
    $(function () {
        $("#updateInfo").click(function () {
            console.log(111);
            if ($("#name").val() === ''){
                $("#tips").text("姓名不能为空")
                $("#exampleModalDanger").modal("show")
                return;
            }
            if ($("#specialty").val() === ''){
                $("#tips").text("特长不能为空")
                $("#exampleModalDanger").modal("show")
                return;
            }
            if ($("#mobile").val() === ''){
                $("#tips").text("电话不能为空")
                $("#exampleModalDanger").modal("show")
                return;
            }

            $("#Form").submit();
        })

    })
</script>
</body>

</html>