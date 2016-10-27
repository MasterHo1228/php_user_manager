<!DOCTYPE html>
<html lang="zh">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>欢迎 - 学生管理系统</title>

    <!-- Bootstrap Core CSS -->
    <link href="./public/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            {{nocache}}
            <h1 class="page-header">Welcome!
                <small>{{$smarty.session.admin_user}}</small>
            </h1>
            {{if !$loginTime && !$loginIpAddr}}
            <p>您是第一次登入系统~</p>
            {{else}}
            <p>上次登录时间:{{$loginTime}}</p>
            <p>上次登录的IP地址:{{$loginIpAddr}}</p>
            {{/if}}
            {{/nocache}}
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
</div>
<!-- /.container -->

<!-- Bootstrap Core JavaScript -->
<script src="./public/js/bootstrap.min.js"></script>

</body>

</html>
