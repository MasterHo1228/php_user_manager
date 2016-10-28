<!DOCTYPE html>
<html lang="zh">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>班级列表</title>

    <!-- Bootstrap Core CSS -->
    <link href="./public/css/bootstrap.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="./public/css/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="./public/css/dataTables.responsive.css" rel="stylesheet">

    <link href="./public/css/bootstrap-datetimepicker.css" rel="stylesheet"/>

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

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
            班级列表
        </div>
        <!-- /.panel-heading -->
        <div class="panel-body">
            <!--<a class="btn btn-primary btn-block" href="index.php?p=admin&c=iframe&a=addClass">添加班级</a>-->
            <a class="btn btn-primary btn-block" id="btnAddClass">添加班级</a>
            <br/>
            <table width="100%" class="table table-striped table-bordered table-hover" id="classList">
                <thead>
                <tr>
                    <th>班级ID</th>
                    <th>班级名称</th>
                    <th>所属年级</th>
                    <th>最大人数</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                {{nocache}}
                {{foreach $classList as $v}}
                <tr>
                    <td>{{$v['ID']}}</td>
                    <td>{{$v['Name']}}</td>
                    <td class="center">{{$v['Grade']}}</td>
                    <td class="center">{{$v['Max_students']}}</td>
                    <td class="center">
                        <a class="btn btn-primary btn-xs"
                           href="index.php?p=admin&c=iframe&a=classInfo&classID={{$v['ID']}}">编辑</a>
                        &nbsp;&nbsp;
                        <button class="btn btn-danger btn-xs btnClassDelete" value="{{$v['ID']}}">删除</button>
                    </td>
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
    <!-- Bootstrap Modal -->
    <div class="modal fade" id="addClassWindow" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel0">添加班级</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>班级名称</label>
                        <input class="form-control" type="text" id="className" placeholder="输入班级名称">
                    </div>
                    <div class="form-group">
                        <label>所属年级</label>
                        <input class="form-control" type="number" id="classGrade" placeholder="输入班级">
                    </div>
                    <div class="form-group">
                        <label>最大人数</label>
                        <input class="form-control" type="number" id="classMaxCount" placeholder="输入最大人数">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-success" id="btnToAddClass">确定</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <!-- Bootstrap Modal -->
    <div class="modal fade" id="alertDelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">提示</h4>
                </div>
                <div class="modal-body">确定要删除该班级吗？</div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-danger" id="btnConfirmDelCls">确定</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <div class="modal fade" id="alertHint" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel1">提示</h4>
                </div>
                <div class="modal-body" id="alertHintContent"></div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="btnReload">确定</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
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
        var delClsID = "";//待确认删除的班级的ID
        $('#classList').DataTable({
            responsive: true,
            sPaginationType : "full_numbers",
            oLanguage : {
                sLengthMenu: "每页显示 _MENU_ 条记录",
                sInfo: "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
                sInfoEmpty: "没有数据",
                sInfoFiltered: "(从 _MAX_ 条数据中检索)",
                sZeroRecords: "没有检索到数据",
                sSearch: "名称:",
                oPaginate: {
                    sFirst: "首页",
                    sPrevious: "前一页",
                    sNext: "后一页",
                    sLast: "尾页"
                }
            }
        });

        $("#btnAddClass").click(function () {
            $("#addClassWindow").modal({
                backdrop: false
            });
        });

        $("#btnToAddClass").click(function () {
            var className = $("#className").val();
            var classGrade = $("#classGrade").val();
            var classMaxCount = $("#classMaxCount").val();
            if (className != "" && classGrade != "" && classMaxCount != "") {
                $.ajax({
                    url: "index.php?p=admin&c=main&a=addClass",
                    type: 'post',
                    data: {
                        className: className,
                        classGrade: classGrade,
                        classMaxCount: classMaxCount
                    },
                    success: function (data) {
                        $("#btnAddClass").modal('hide');
                        if (data == 'true') {
                            $("#alertHintContent").empty().append("添加成功！");
                            $("#alertHint").modal({
                                backdrop: false
                            });
                        } else if (data == 'false') {
                            $("#alertHintContent").empty().append("添加失败！");
                            $("#alertHint").modal({
                                backdrop: false
                            });
                        }
                    }
                })
            }
        });

        $(".btnClassDelete").click(function () {
            delClsID = $(this).attr('value');
            $("#alertDelete").modal({
                backdrop: false
            });
        });
        $("#btnConfirmDelCls").click(function () {
            $("#alertDelete").modal('hide');
            if (delClsID != "") {
                $.ajax({
                    url: "index.php?p=admin&c=main&a=deleteClass",
                    data:{classID:delClsID},
                    success: function (data) {
                        if (data == 'true') {
                            $("#alertHintContent").empty().append("删除成功！");
                            $("#alertHint").modal({
                                backdrop: false
                            });
                        } else if (data == 'false') {
                            $("#alertHintContent").empty().append("删除失败！");
                            $("#alertHint").modal({
                                backdrop: false
                            });
                        }
                    }
                })
            }
        });
        $("#btnReload").click(function () {
            location.reload();
        })
    });
</script>
</body>

</html>
