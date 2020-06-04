<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>

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
    <!--菜单-->
    <link href="/static/libs/metismenu-master/metisMenu.min.css" rel="stylesheet" />
    <!--web icons 图标库-->
    <link href="/static/css/web-icons-master/css/web-icons.css" rel="stylesheet" />
    <!--样式-->
    <link href="/static/css/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="/static/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/static/css/core.css" rel="stylesheet" />
    <link href="/static/css/site.css" rel="stylesheet" />
    <!--选项卡-->
    <link href="/static/libs/hzyBootStrapTabs/index.css" rel="stylesheet" />
    <!--主页面-->
    <link href="/static/css/hzyAdminUI.css" rel="stylesheet" />
</head>

<body>

    <div class="hzy-container animation-fade" id="hzy-container">
        <header class="hzy-header-skin-blue">
            <div class="hzy-header-left">
                <ul>
                    <!--fas fa-indent-->
                    <li class="hzy-headerhover" onclick="hzyAdminUI.menu.toggle();"><a href="javascript:void(0)"><i
                                class="fas fa-outdent"></i></a></li>
                    <li class="hzy-headerhover hzy-logo"><a>文件管理系统</a></li>
                </ul>
            </div>
            <div class="hzy-header-right d-none d-lg-block">
                <ul>
                    <li class="hzy-headerhover" onclick="hzyBootStrapTabs.loadCurrentPage()"><a href="javascript:;">
                        <i class="fas fa-redo"></i></a></li>
                    <li class="hzy-headerhover" onclick="$('#examplePositionSidebar').modal()"><a href="javascript:;">
                        <i class="fas fa-layer-group"></i></a></li>
                    <!--fa fa-compress-->
                    <li class="hzy-headerhover"><a href="javascript:;"
                            onclick="hzyAdminUI.fullScreen.handleFullScreen(this)"><i class="fas fa-expand"></i></a>
                    </li>
                    <li class="hzy-headerhover"><a href="javascript:void(0)" id="logout">
                        <span>${sessionScope.user["name"]}    </span><i
                                class="fas fa-sign-out-alt"></i></a></li>
                </ul>
            </div>
            <div class="hzy-header-right d-lg-none">
                <ul>
                    <li class="hzy-headerhover"><a href="javascript:void(0)"><i class="fas fa-sign-out-alt"></i></a>
                    </li>
                </ul>
            </div>
        </header>
        <main>
            <!--menu 菜单-->
            <nav class="hzy-menu sidebar-nav sidebar-nav-max">
                <ul class="metismenu" id="hzyAdminMenu">
                    <li class="mm-active">
                        <a class="has-arrow" href='javascript:;' aria-expanded="true">
                            <i class="fas fa-tachometer-alt"></i><span>个人管理</span>
                        </a>
                        <ul class="mm-collapse mm-show">
                            <c:if test="${sessionScope.role == 1}">
                                <li hzy-id="个人资料" hzy-title="个人资料" hzy-href="/user/getMyInfo">
                                    <a href="javascript:;">
                                        <i class=""></i><span>个人资料</span>
                                    </a>
                                </li>
                            </c:if>
                            <li hzy-id="修改密码" hzy-title="修改密码" hzy-href="/user/updatePasswordView" >
                                <a href="javascript:;">
                                    <i class=""></i><span>修改密码</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a class="has-arrow" href="javascript:;" aria-expanded="false">
                            <i class="fas fa-fw fa-desktop"></i><span>工作空间</span>
                        </a>
                        <ul class="mm-collapse">
                            <li hzy-id="上传新文件" hzy-title="上传新文件" hzy-href="/myFiles/uploadFilesView">
                                <a href="javascript:;"><i class=""></i><span>上传新文件</span></a>
                            </li>
                        </ul>
                        <ul class="mm-collapse">
                            <li hzy-id="个人文件" hzy-title="个人文件" hzy-href="/myFiles/myFilesListView">
                                <a href="javascript:;"><i class=""></i><span>个人文件</span></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a class="has-arrow" href="javascript:;" aria-expanded="false">
                            <i class="fas fa-fw fa-desktop"></i><span>公共文件</span>
                        </a>
                        <ul class="mm-collapse">
                            <li hzy-id="文件列表" hzy-title="文件列表" hzy-href="/commonFiles/commonFilesListView">
                                <a href="javascript:;"><i class=""></i><span>文件列表</span></a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <section class="hzy-main-right" id="hzyAdminTabs"></section>
        </main>
    </div>

    <!--皮肤模态框-->
    <div class="modal fade" id="examplePositionSidebar" aria-hidden="true" aria-labelledby="examplePositionSidebar"
        role="dialog" tabindex="-1">
        <div class="modal-dialog modal-sidebar modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title">皮肤设置</h3>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label >顶部颜色：</label>
                            <div class="row">
                                <ul class="list-unstyled list-inline" style="text-align: left;">
                                    <li class="pr-5 pl-5 inline-block">
                                        <div class="index-skin hzy-header-skin-white"
                                            onclick="hzyAdminUI.header.setSkin('hzy-header-skin-white')"></div>
                                    </li>
                                    <li class="pr-5 pl-5 inline-block">
                                        <div class="index-skin hzy-header-skin-blue"
                                            onclick="hzyAdminUI.header.setSkin('hzy-header-skin-blue')"></div>
                                    </li>
                                    <li class="pr-5 pl-5 inline-block">
                                        <div class="index-skin hzy-header-skin-dark"
                                            onclick="hzyAdminUI.header.setSkin('hzy-header-skin-dark')"></div>
                                    </li>
                                    <li class="pr-5 pl-5 inline-block">
                                        <div class="index-skin hzy-header-skin-primary"
                                            onclick="hzyAdminUI.header.setSkin('hzy-header-skin-primary')"></div>
                                    </li>
                                    <li class="pr-5 pl-5 inline-block">
                                        <div class="index-skin hzy-header-skin-cyan"
                                            onclick="hzyAdminUI.header.setSkin('hzy-header-skin-cyan')"></div>
                                    </li>
                                    <li class="pr-5 pl-5 inline-block">
                                        <div class="index-skin hzy-header-skin-green"
                                            onclick="hzyAdminUI.header.setSkin('hzy-header-skin-green')"></div>
                                    </li>
                                    <li class="pr-5 pl-5 inline-block">
                                        <div class="index-skin hzy-header-skin-indigo"
                                            onclick="hzyAdminUI.header.setSkin('hzy-header-skin-indigo')"></div>
                                    </li>
                                    <li class="pr-5 pl-5 inline-block">
                                        <div class="index-skin hzy-header-skin-grey"
                                            onclick="hzyAdminUI.header.setSkin('hzy-header-skin-grey')"></div>
                                    </li>
                                    <li class="pr-5 pl-5 inline-block">
                                        <div class="index-skin hzy-header-skin-pink"
                                            onclick="hzyAdminUI.header.setSkin('hzy-header-skin-pink')"></div>
                                    </li>
                                    <li class="pr-5 pl-5 inline-block">
                                        <div class="index-skin hzy-header-skin-purple"
                                            onclick="hzyAdminUI.header.setSkin('hzy-header-skin-purple')"></div>
                                    </li>
                                    <li class="pr-5 pl-5 inline-block">
                                        <div class="index-skin hzy-header-skin-red"
                                            onclick="hzyAdminUI.header.setSkin('hzy-header-skin-red')"></div>
                                    </li>
                                    <li class="pr-5 pl-5 inline-block">
                                        <div class="index-skin hzy-header-skin-teal"
                                            onclick="hzyAdminUI.header.setSkin('hzy-header-skin-teal')"></div>
                                    </li>
                                    <li class="pr-5 pl-5 inline-block">
                                        <div class="index-skin hzy-header-skin-orange"
                                            onclick="hzyAdminUI.header.setSkin('hzy-header-skin-orange')"></div>
                                    </li>
                                </ul>
                            </div>

                        </div>
                        <div class="form-group">
                            <!--   <label for="exampleInputEmail1">左侧菜单颜色：</label>-->
                            <label >左侧菜单颜色：</label>
                            <div class="row">
                                <div class="col-sm-12 hzy-skin hzy-skin-default"
                                    onclick="hzyAdminUI.menu.setSkin(hzyAdminUI.menu.mSkin.default)"></div>
                                <div class="col-sm-12 hzy-skin hzy-skin-white"
                                    onclick="hzyAdminUI.menu.setSkin(hzyAdminUI.menu.mSkin.white)"></div>
                            </div>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--脚本-->
    <script src="/static/libs/jquery/jquery-3.2.1.min.js"></script>
    <script src="/static/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!--metisMenu 菜单-->
    <script src="/static/libs/metismenu-master/metisMenu.min.js"></script>
    <!--选项卡-->
    <script src="/static/libs/hzyBootStrapTabs/index.js"></script>
    <!--主页面-->
    <script src="/static/js/hzyAdminUI.js"></script>
    <script type="text/javascript">
        hzyAdminUI.init();
        //初始化多标签页框架
        hzyBootStrapTabs.init("#hzyAdminTabs", [{
            id: 'home',
            title: '首页',
            href: '/home',
            active: true,
            isClose: false
        }], function (obj) {
            hzyAdminUI.menu.active(obj.id);
        });

        $("#logout").click(function () {
            hzyBootStrapTabs.removeAllTab();
            document.location.href = "<%=basePath%>logout";
        })
    </script>
</body>

</html>