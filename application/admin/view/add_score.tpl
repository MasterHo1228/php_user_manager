<!--Created by MasterHo on 2016.10.25 via IntelliJ IDEA.-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>成绩录入</title>

    <!-- Bootstrap Core CSS -->
    <link href="./public/css/bootstrap.min.css" rel="stylesheet">

    <link href="./public/css/bootstrap-datetimepicker.css" rel="stylesheet"/>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">
    <h3 class="page-header">成绩录入</h3>
    <form action="index.php?p=admin&c=main&a=addScore" method="post" class="form-horizontal">
        <div class="form-group">
            <label>学生姓名</label>
            <input class="form-control" type="text" name="stuName" placeholder="输入学生姓名">
        </div>
        <div class="form-group">
            <label>所属班级</label>
            <select class="form-control" name="stuClass">
                {{nocache}}
                {{foreach $classList as $v}}
                <option value="{{$v['ID']}}">{{$v['Name']}}</option>
                {{/foreach}}
                {{/nocache}}
            </select>
        </div>
        <div class="form-group">
            <label>课程</label>
            <select class="form-control" name="stuCourse">
                {{nocache}}
                {{foreach $courseList as $v}}
                <option value="{{$v['ID']}}">{{$v['Name']}}</option>
                {{/foreach}}
                {{/nocache}}
            </select>
        </div>
        <div class="form-group">
            <label>成绩</label>
            <input class="form-control" type="number" name="stuScore" placeholder="输入成绩">
        </div>
        <div class="form-group">
            <label>学年</label>
            <div class='input-group date' id='datetimepicker1'>
                <input type='text' class="form-control" id="schoolYear" name="schoolYear"/>
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>
        <div class="form-group">
            <label>学期</label>
            <select class="form-control" name="semester">
                <option value="1">1</option>
                <option value="2">2</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">提交</button>
    </form>
</div>
</body>
<!-- jQuery -->
<script src="./public/js/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="./public/js/bootstrap.min.js"></script>

<script src="./public/js/moment.js"></script>
<script src="./public/js/bootstrap-datetimepicker.min.js"></script>

<script>
    $(function () {
        $('#schoolYear').datetimepicker({
            locale: 'zh-cn',
            format: 'YYYY'
        });
    })
</script>
</html>