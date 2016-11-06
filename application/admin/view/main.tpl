<!DOCTYPE html>
<html lang="zh">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>学生管理系统</title>

    <!-- Bootstrap Core CSS -->
    <link href="./public/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="./public/css/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="./public/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="./public/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <style type="text/css">
        iframe#mainIframe{
            width:100%;
            margin:0 0 1em;
            border:0;
        }
    </style>

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.php?p=admin&c=main&a=main">学生管理系统</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        {{nocache}}
                        <i class="fa fa-user fa-fw"></i> {{$smarty.session.admin_user}} <i class="fa fa-caret-down"></i>
                        {{/nocache}}
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> 用户信息</a>
                        </li>
                        {{if $permission eq 'God'}}
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> 系统设置</a>
                        </li>
                        {{/if}}
                        <li class="divider"></li>
                        <li><a href="index.php?p=admin&c=admin&a=logout"><i class="fa fa-sign-out fa-fw"></i> 登出</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a class="active" href="index.php?p=admin&c=iframe&a=welcome" target="mainIframe">欢迎</a>
                        </li>
                        <li>
                            <a href="index.php?p=admin&c=iframe&a=classList" target="mainIframe"><i class="fa fa-ellipsis-v fa-fw"></i> 班级管理</a>
                        </li>
                        <li>
                            <a href="index.php?p=admin&c=iframe&a=courseList" target="mainIframe"><i class="fa fa-calendar fa-fw"></i> 课程管理</a>
                        </li>

                        <li>
                            <a href="#"><i class="fa fa-group fa-fw"></i> 学生管理 <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="index.php?p=admin&c=iframe&a=studentList" target="mainIframe"> 学生信息管理</a>
                                </li>
                                <li>
                                    <a href="#"> 学生成绩管理 <span class="fa arrow"></span></a>
                                    <ul class="nav nav-third-level">
                                        <li>
                                            <a href="index.php?p=admin&c=iframe&a=addScore" target="mainIframe"> 成绩录入</a>
                                            <a href="index.php?p=admin&c=iframe&a=scoreList" target="mainIframe"> 成绩查询</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>

                        <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> 系统维护 <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                {{if $permission eq 'God'}}
                                <li>
                                    <a href="index.php?p=admin&c=iframe&a=adminList" target="mainIframe"> 管理员账号管理</a>
                                </li>
                                {{/if}}
                            </ul>
                        </li>

                        <li>
                            <a href="#"><i class="fa fa-question fa-fw"></i> 帮助信息<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="index.php?p=admin&c=iframe&a=about" target="mainIframe"> 关于</a>
                                </li>
                            </ul>
                        </li>

                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <!-- Page Content -->
        <div id="page-wrapper">
            <iframe id="mainIframe" name="mainIframe" src="index.php?p=admin&c=iframe&a=welcome" width="100%" onload="this.height=mainIframe.document.body.scrollHeight" frameborder="0"></iframe>
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
</body>
<!-- jQuery -->
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="./public/js/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="./public/js/sb-admin-2.min.js"></script>
</html>
