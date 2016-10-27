<!--Created by MasterHo on 2016.10.25 via IntelliJ IDEA.-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>学生信息录入</title>

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
    <h3 class="page-header">学生信息录入</h3>
    <form action="index.php?p=admin&c=main&a=addStudent" method="post" role="form">
        <div class="row">
            <div class="col-xs-6">
                <div class="form-group">
                    <label>姓名</label>
                    <input class="form-control" type="text" name="stuName" placeholder="输入学生姓名">
                </div>
                <div class="form-group">
                    <label>年龄</label>
                    <input class="form-control" type="number" name="stuAge" placeholder="输入学生年龄">
                </div>
                <div class="form-group">
                    <label>性别</label>
                    <select class="form-control" name="stuGender">
                        <option value="male" selected>男</option>
                        <option value="female">女</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>民族</label>
                    <input class="form-control" type="text" name="stuNationality">
                </div>
                <div class="form-group">
                    <label>政治面貌</label>
                    <input class="form-control" type="text" name="stuPolitic">
                </div>
                <div class="form-group">
                    <label>职位</label>
                    <input class="form-control" type="text" name="stuJob">
                </div>
            </div>
            <div class="col-xs-6">

                <div class="form-group">
                    <label>出生日期</label>
                    <div class='input-group date' id='datetimepicker1'>
                        <input type='text' class="form-control" id="stuDateOfBirth" name="stuDateOfBirth"/>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                    </span>
                    </div>
                </div>
                <div class="form-group">
                    <label>籍贯</label>
                    <input class="form-control" type="text" name="stuBirthPlace">
                </div>
                <div class="form-group">
                    <label>家庭地址</label>
                    <input class="form-control" type="text" name="stuHomeAddr">
                </div>
                <div class="form-group">
                    <label>班级</label>
                    <select class="form-control" name="stuClass">
                        {{nocache}}
                        {{foreach $classList as $v}}
                        <option value="{{$v['ID']}}">{{$v['Name']}}</option>
                        {{/foreach}}
                        {{/nocache}}
                    </select>
                </div>
                <div class="form-group">
                    <label>身份证号码</label>
                    <input class="form-control" type="text" name="stuIDNum">
                </div>
                <div class="form-group">
                    <label>所学专业</label>
                    <input class="form-control" type="text" name="stuMajor">
                </div>
            </div>
        </div>
        <div class="row">
            <button type="submit" class="btn btn-primary">添加</button>
            <button type="reset" class="btn btn-warning">重置</button>
        </div>
    </form>
</div>
</body>
<!-- jQuery -->
<script src="./public/js/jquery.min.js"></script>

<script src="./public/js/moment.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="./public/js/bootstrap.min.js"></script>
<script src="./public/js/bootstrap-datetimepicker.min.js"></script>

<script type="text/javascript">
    $(function () {
        $('#stuDateOfBirth').datetimepicker({
            locale: 'zh-cn',
            format: 'YYYY-MM-DD'
        });
    });
</script>

</html>