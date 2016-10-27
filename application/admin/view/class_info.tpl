<!--Created by MasterHo on 2016.10.25 via IntelliJ IDEA.-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>编辑班级</title>

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
    <h3 class="page-header">编辑班级</h3>
    <form action="index.php?p=admin&c=main&a=updateClass" method="post">
        {{nocache}}
        <input type="hidden" name="classID" value="{{$classInfo['ID']}}">
        <div class="form-group">
            <label>班级名称</label>
            <input class="form-control" type="text" name="className" placeholder="输入班级名称"
                   value="{{$classInfo['Name']}}">
        </div>
        <div class="form-group">
            <label>所属年级</label>
            <input class="form-control" type="number" name="classGrade" placeholder="输入班级"
                   value="{{$classInfo['Grade']}}">
        </div>
        <div class="form-group">
            <label>最大人数</label>
            <input class="form-control" type="number" name="classMaxCount" placeholder="输入最大人数"
                   value="{{$classInfo['Max_students']}}">
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