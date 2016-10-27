<!--Created by MasterHo on 2016.10.25 via IntelliJ IDEA.-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>编辑课程</title>

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
    <h3 class="page-header">编辑课程信息</h3>
    <form action="index.php?p=admin&c=main&a=updateCourse" method="post">
        {{nocache}}
        <input type="hidden" name="courseID" value="{{$courseInfo['ID']}}">
        <div class="form-group">
            <label>课程名称</label>
            <input class="form-control" type="text" name="courseName" placeholder="输入课程名称"
                   value="{{$courseInfo['Name']}}">
        </div>
        <div class="form-group">
            <label>学分</label>
            <input class="form-control" type="number" name="courseCredit" placeholder="输入学分"
                   value="{{$courseInfo['Credit']}}">
        </div>
        <button type="submit" class="btn btn-primary">更新</button>
        {{/nocache}}
    </form>
</div>
</body>
<!-- jQuery -->
<script src="./public/js/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="./public/js/bootstrap.min.js"></script>
</html>