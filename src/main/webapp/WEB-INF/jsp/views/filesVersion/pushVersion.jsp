<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
        <div class="page-content container-fluid">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">

                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title">推送新版本</h3>
                        </div>
                        <div class="panel-body container-fluid">
                            <%--@elvariable id="files" type=""--%>
                            <form:form id="Form" modelAttribute="files" action="/myFiles/pushFilesVersion" method="post" enctype="multipart/form-data" autocomplete="off">
                                <input type="hidden" value="${data.id}" name="id">
                                <div class="form-group form-material floating">
                                    <input type="text" class="form-control" name="name" id="name" value="${data.name}">
                                    <label class="floating-label">文件名称</label>
                                </div>
                                <div class="form-group form-material floating">
                                    <input type="text" class="form-control" name="content" id="content" value="${data.content}">
                                    <label class="floating-label">文件描述</label>
                                </div>
                                <div class="form-group form-material floating">
                                    <input type="text" class="form-control" name="remark" id="remark" value="${data.remark}">
                                    <label class="floating-label">文件备注</label>
                                </div>
                                <div class="form-group">
                                    <label for="file">文件</label>
                                    <input type="file" name="file" id="file">
                                </div>
                                <div class="form-group form-material">
                                    <button type="button" class="btn btn-block btn-primary" id="uploadFiles">上传文件</button>
                                </div>
                            </form:form>
                        </div>
                    </div>

                </div>
                <div class="col-md-3"></div>
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
</body>

</html>
<script>
    $(function () {
        $("#uploadFiles").click(function () {
            if ($("#name").val() === ''){
                $("#tips").text("文件名称不能为空")
                $("#exampleModalDanger").modal("show")
                return;
            }
            if ($("#content").val() === ''){
                $("#tips").text("文件描述不能为空")
                $("#exampleModalDanger").modal("show")
                return;
            }
            if ($("#files").val() === ''){
                $("#tips").text("文件不能为空")
                $("#exampleModalDanger").modal("show")
                return;
            }

            $("#Form").submit();
        })

    })
</script>