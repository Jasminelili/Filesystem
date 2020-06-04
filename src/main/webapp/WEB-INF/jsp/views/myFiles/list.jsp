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
            <h1 class="page-title">个人文件列表</h1>
        </div>
        <div class="page-content">
            <div class="panel">
                <div class="panel-body container-fluid">
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
                                                <th>文件</th>
                                                <th>是否公开</th>
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
                                                    <td>
                                                        <button type="button" class="btn btn-primary btn-sm ladda-button" data-style="expand-left" data-plugin="ladda">
                                                            <span class="ladda-label download-files" fid="${vs.id}">下载文件</span>
                                                            <span class="ladda-spinner"></span></button>
                                                    </td>
                                                    <td>
                                                        <c:if test="${vs.status == 0}">未公开</c:if>
                                                        <c:if test="${vs.status == 1}">已公开</c:if>
                                                    </td>
                                                    <td><fmt:formatDate value="${vs.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                                    <td><fmt:formatDate value="${vs.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                                    <td>
                                                        <button type="button" class="btn btn-success btn-sm ladda-button" data-style="expand-left" data-plugin="ladda">
                                                            <span class="ladda-label go-version" fid="${vs.id}">查看版本</span>
                                                            <span class="ladda-spinner"></span></button>
                                                        <c:if test="${vs.status == 0}">
                                                        <button type="button" class="btn btn-info btn-sm ladda-button" data-style="expand-left" data-plugin="ladda">
                                                            <span class="ladda-label status-files" fstatus="1" fid="${vs.id}">公开文件</span>
                                                            <span class="ladda-spinner"></span></button>
                                                        </c:if>
                                                        <c:if test="${vs.status == 1}">
                                                            <button type="button" class="btn btn-warning btn-sm ladda-button" data-style="expand-left" data-plugin="ladda">
                                                                <span class="ladda-label status-files" fstatus="0" fid="${vs.id}">关闭文件</span>
                                                                <span class="ladda-spinner"></span></button>
                                                        </c:if>
                                                        <button type="button" class="btn btn-primary btn-sm ladda-button" data-style="expand-left" data-plugin="ladda">
                                                            <span class="ladda-label push-version" fid="${vs.id}">更新版本</span>
                                                            <span class="ladda-spinner"></span></button>
                                                        <button type="button" class="btn btn-danger btn-sm ladda-button" data-style="expand-left" data-plugin="ladda">
                                                            <span class="ladda-label delete-files" fid="${vs.id}">删除</span>
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
        $(".delete-files").click(function () {
            var url = "<%=basePath%>files/deleteFiles.do?id="+$(this).attr('fid');
            $.get(url,function(data){
                document.location.reload();
            });
        })
        $(".status-files").click(function () {
            var url = "<%=basePath%>files/changeFilesStatus.do?id="+$(this).attr('fid')+"&status="+$(this).attr('fstatus');
            $.get(url,function(data){
                document.location.reload();
            });
        })
        $(".go-version").click(function () {
            document.location.href = "<%=basePath%>filesVersion/ListView.do?fid="+$(this).attr('fid');
        })
        $(".push-version").click(function () {
            document.location.href = "<%=basePath%>filesVersion/pushVersionView.do?fid="+$(this).attr('fid');
        })
        $(".download-files").click(function () {
            document.location.href = "<%=basePath%>files/downloadFiles.do?fid="+$(this).attr('fid');
        })
    })
</script>
</body>

</html>