<!--Created by MasterHo on 2016.10.25 via IntelliJ IDEA.-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>学生信息编辑</title>

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
    <h3 class="page-header">学生信息编辑</h3>
    <form action="index.php?p=admin&c=main&a=updateStudentInfo" method="post" role="form" id="studentInfos">
        <input type="hidden" name="stuID" value="{{$studentInfo['ID']}}">
        <div class="row">
            {{nocache}}
            <div class="col-xs-6">
                <div class="form-group">
                    <label>姓名</label>
                    <input class="form-control" type="text" name="stuName" placeholder="输入学生姓名"
                           value="{{$studentInfo['StudentName']}}">
                </div>
                <div class="form-group">
                    <label>年龄</label>
                    <input class="form-control" type="number" name="stuAge" placeholder="输入学生年龄"
                           value="{{$studentInfo['Age']}}">
                </div>
                <div class="form-group">
                    <label>性别</label>
                    <select class="form-control" name="stuGender">
                        {{if $studentInfo['Gender'] eq 'male'}}
                        <option value="male" selected>男</option>
                        <option value="female">女</option>
                        {{elseif $studentInfo['Gender'] eq 'female'}}
                        <option value="male">男</option>
                        <option value="female" selected>女</option>
                        {{/if}}
                    </select>
                </div>
                <div class="form-group">
                    <label>民族</label>
                    <input class="form-control" type="text" name="stuNationality"
                           value="{{$studentInfo['Nationality']}}">
                </div>
                <div class="form-group">
                    <label>政治面貌</label>
                    <input class="form-control" type="text" name="stuPolitic" value="{{$studentInfo['Politic']}}">
                </div>
                <div class="form-group">
                    <label>职位</label>
                    <input class="form-control" type="text" name="stuJob" value="{{$studentInfo['Job']}}">
                </div>
            </div>
            <div class="col-xs-6">
                <div class="form-group">
                    <label>出生日期</label>
                    <div class='input-group date' id='datetimepicker1'>
                        <input type='text' class="form-control" id="stuDateOfBirth" name="stuDateOfBirth"
                               value="{{$studentInfo['DateOfBirth']}}"/>
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>
                <div class="form-group">
                    <label>籍贯</label>
                    <input class="form-control" type="text" name="stuBirthPlace" value="{{$studentInfo['BirthPlace']}}">
                </div>
                <div class="form-group">
                    <label>家庭地址</label>
                    <input class="form-control" type="text" name="stuHomeAddr" value="{{$studentInfo['Home_addr']}}">
                </div>
                <div class="form-group">
                    <label>班级</label>
                    <select class="form-control" name="stuClass">
                        {{foreach $classList as $v}}
                        {{if $v['Name'] eq $studentInfo['ClassName']}}
                        <option value="{{$v['ID']}}" selected>{{$v['Name']}}</option>
                        {{else}}
                        <option value="{{$v['ID']}}">{{$v['Name']}}</option>
                        {{/if}}
                        {{/foreach}}
                    </select>
                </div>
                <div class="form-group">
                    <label>身份证号码</label>
                    <input class="form-control" type="text" name="stuIDNum" value="{{$studentInfo['ID_Number']}}">
                </div>
                <div class="form-group">
                    <label>所学专业</label>
                    <input class="form-control" type="text" name="stuMajor" value="{{$studentInfo['Major']}}">
                </div>
            </div>
            {{/nocache}}
        </div>
        <div class="row">
            <button type="submit" class="btn btn-primary" id="btnUpdateInfo" disabled>提交更改</button>
            <button type="button" class="btn btn-warning" id="btnBack">返回</button>
        </div>
    </form>
    <!-- Bootstrap Modal -->
    <div class="modal fade" id="backHint" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">提示</h4>
                </div>
                <div class="modal-body">确定要不更新数据返回吗？</div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="btnConfirmBack">确定</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
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

        $(".form-control").change(function () {
            $("#btnUpdateInfo").removeAttr("disabled");
            $("#studentInfos").data("changed", true);
        });

        $("#btnBack").click(function () {
            if ($("#studentInfos").data("changed")) {
                $("#backHint").modal("show");
            } else {
                history.back();
            }
        });
        $("#btnConfirmBack").click(function () {
            history.back();
        })
    });
</script>
</html>