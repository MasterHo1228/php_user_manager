<!DOCTYPE html>
<html lang="zh">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>成绩列表</title>

    <!-- Bootstrap Core CSS -->
    <link href="./public/css/bootstrap.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="./public/css/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="./public/css/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <!--<link href="../dist/css/sb-admin-2.css" rel="stylesheet">-->

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            成绩列表
        </div>
        <!-- /.panel-heading -->
        <div class="panel-body">
            <br/>
            <table width="100%" class="table table-striped table-bordered table-hover" id="scoreList">
                <thead>
                <tr>
                    <th>学号</th>
                    <th>学生姓名</th>
                    <th>班级</th>
                    <th>课程名称</th>
                    <th>成绩</th>
                    <th>学年</th>
                    <th>学期</th>
                </tr>
                </thead>
                <tbody>
                {{nocache}}
                {{foreach $scoreList as $v}}
                <tr>
                    <td class="center">{{$v['Student_ID']}}</td>
                    <td class="center">{{$v['StudentName']}}</td>
                    <td class="center">{{$v['ClassName']}}</td>
                    <td class="center">{{$v['CourseName']}}</td>
                    <td class="center">{{$v['Score']}}</td>
                    <td class="center">{{$v['School_year']}}</td>
                    <td class="center">{{$v['Semester']}}</td>
                </tr>
                {{/foreach}}
                {{/nocache}}
                </tbody>
            </table>
            <!-- /.table-responsive -->
        </div>
        <!-- /.panel-body -->
    </div>
    <!-- /.panel -->
</div>
<!-- /.container -->

<!-- jQuery -->
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<script src="./public/js/jquery.dataTables.min.js"></script>
<script src="./public/js/dataTables.bootstrap.min.js"></script>
<script src="./public/js/dataTables.responsive.js"></script>

<script>
    $(function () {
        $('#scoreList').DataTable({
            responsive: true,
            sPaginationType : "full_numbers",
            oLanguage : {
                sLengthMenu: "每页显示 _MENU_ 条记录",
                sInfo: "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
                sInfoEmpty: "没有数据",
                sInfoFiltered: "(从 _MAX_ 条数据中检索)",
                sZeroRecords: "没有检索到数据",
                sSearch: "搜索:",
                oPaginate: {
                    sFirst: "首页",
                    sPrevious: "前一页",
                    sNext: "后一页",
                    sLast: "尾页"
                }
            }
        });
    });
</script>
</body>

</html>
