<!--Created by MasterHo on 2016.10.25 via IntelliJ IDEA.-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>添加管理员账号</title>

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
    <h3 class="page-header">管理员账号配置</h3>
    <form action="index.php?p=admin&c=main&a=updateAdmin" method="post">
        {{nocache}}
        <input type="hidden" name="adminID" value="{{$adminInfo['ID']}}">
        <div class="form-group">
            <label>用户名</label>
            <input class="form-control" type="text" name="usrName" placeholder="输入用户名" value="{{$adminInfo['Name']}}">
        </div>
        <div class="form-group">
            <label>密码</label>
            <input class="form-control" type="password" name="usrPasswd" placeholder="输入密码">
        </div>
        <div class="form-group">
            <label>用户身份</label>
            <select class="form-control" name="usrRole">
                {{if $adminInfo['User_role'] == 'Admin'}}
                <option value="Admin" selected>管理员</option>
                <option value="Teacher">教师</option>
                {{elseif $adminInfo['User_role'] == 'Teacher'}}
                <option value="Admin">管理员</option>
                <option value="Teacher" selected>教师</option>
                {{else}}
                <option value="Admin">管理员</option>
                <option value="Teacher">教师</option>
                {{/if}}
            </select>
        </div>
        {{/nocache}}
        <button type="submit" class="btn btn-primary">提交更改</button>
    </form>
</div>
</body>
<!-- jQuery -->
<script src="./public/js/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="./public/js/bootstrap.min.js"></script>
</html>