<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
    <div class="page page-tables">
        <div class="page-header">
            <h1 class="page-title">公共文件资源</h1>
        </div>
        <div class="page-content">

            <div class="panel">

                <div class="panel-body container-fluid">
                    <div class="row row-lg">

                        <div class="col-lg-3">
                            <form action="/commonFiles/commonFilesListView">
                                <div class="example-wrap">
                                    <input type="text" class="form-control round" value="${keyword}" name="keyword" placeholder="输入关键字搜索" autocomplete="off">
                                </div>
                        </div>
                                <div class="col-lg-2">
                                    <button type="submit" class="btn btn-block btn-primary">搜索</button>
                                </div>

                            </form>

                    </div>
                    <div class="row row-lg">
                        <div class="col-lg-12">
                            <div class="example-wrap">
                                <div class="example table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>文件名称</th>
                                                <th>文件描述</th>
                                                <th>文件备注</th>
                                                <th>文件上传者</th>
                                                <th>创建时间</th>
                                                <th>更新时间</th>
                                                <th>操作</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${list}" var="vs">
                                                <tr>
                                                    <td>${vs.name}</td>
                                                    <td>${vs.content}</td>
                                                    <td>${vs.remark}</td>
                                                    <td>${vs.username}</td>
                                                    <td><fmt:formatDate value="${vs.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                                    <td><fmt:formatDate value="${vs.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                                    <td>
                                                        <button type="button" class="btn btn-success btn-sm ladda-button" data-style="expand-left" data-plugin="ladda">
                                                            <span class="ladda-label download-files" fid="${vs.id}">下载</span>
                                                            <span class="ladda-spinner"></span></button>
                                                    </td>
                                                </tr>
                                            </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <!--脚本-->
    <script src="/static/libs/jquery/jquery-3.2.1.min.js"></script>
    <script src="/static/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script>
    $(function () {
        $(".download-files").click(function () {
            document.location.href = "<%=basePath%>files/downloadFiles.do?fid="+$(this).attr('fid');
        })
    })
</script>
</body>

</html>