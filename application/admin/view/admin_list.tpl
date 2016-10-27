<!DOCTYPE html>
<html lang="zh">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>管理员账号列表</title>

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
            管理员账号列表
        </div>
        <!-- /.panel-heading -->
        <div class="panel-body">
            <a class="btn btn-primary btn-block" id="btnAddAdmin">添加管理员账号</a>
            <br/>
            <table width="100%" class="table table-striped table-bordered table-hover" id="adminList">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>用户名</th>
                    <th>身份</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                {{nocache}}
                {{foreach $adminList as $v}}
                <tr>
                    <td>
                        {{if $v['Name'] !== 'admin'}}
                        {{$v['ID']}}
                        {{/if}}
                    </td>
                    <td>{{$v['Name']}}</td>
                    <td class="center">
                        {{if $v['User_role'] == 'God'}}
                        万物之源
                        {{elseif $v['User_role'] == 'Admin'}}
                        管理员
                        {{elseif $v['User_role'] == 'Teacher'}}
                        教师
                        {{/if}}
                    </td>
                    <td class="center">
                        {{if $v['Name'] !== 'admin'}}
                        <a class="btn btn-primary btn-xs"
                           href="index.php?p=admin&c=iframe&a=adminInfo&adminID={{$v['ID']}}">编辑</a>
                        &nbsp;&nbsp;
                        <button class="btn btn-danger btn-xs btnAdminDelete" value="{{$v['ID']}}">删除</button>
                        {{/if}}
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
    <div class="modal fade" id="addAdminWindow" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">添加管理员账号</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>用户名</label>
                        <input class="form-control" type="text" id="usrName" name="usrName" placeholder="输入用户名">
                    </div>
                    <div class="form-group">
                        <label>密码</label>
                        <input class="form-control" type="password" id="usrPasswd" name="usrPasswd" placeholder="输入密码">
                    </div>
                    <div class="form-group">
                        <label>用户身份</label>
                        <select class="form-control" id="usrRole" name="usrRole">
                            <option value="Admin">管理员</option>
                            <option value="Teacher">教师</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-success" id="btnToAddAdmin">确定</button>
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
                <div class="modal-body">确定要删除该账号吗？</div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-danger" id="btnConfirmDelAdm">确定</button>
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
        var delAdmID = "";//待确认删除的管理员的ID

        $('#adminList').DataTable({
            responsive: true
        });

        $("#btnAddAdmin").click(function () {
            $("#addAdminWindow").modal({
                backdrop: false
            });
        });
        $("#btnToAddAdmin").click(function () {
            $("#addAdminWindow").modal('hide');
            var usrName = $("#usrName").val();
            var usrPasswd = $("#usrPasswd").val();
            var usrRole = $("#usrRole").val();
            if (usrName != "" && usrPasswd!="" && usrRole!="") {
                alert('start!');
                $.ajax({
                    url: "index.php?p=admin&c=main&a=addAdmin",
                    type:'post',
                    data:{
                        usrName:usrName,
                        usrPasswd:usrPasswd,
                        usrRole:usrRole
                    },
                    success: function (data) {
                        alert('got it!');
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

        $(".btnAdminDelete").click(function () {
            delAdmID = $(this).attr('value');
            $("#alertDelete").modal({
                backdrop: false
            });
        });
        $("#btnConfirmDelAdm").click(function () {
            $("#alertDelete").modal('hide');
            if (delAdmID != "") {
                $.ajax({
                    url: "index.php?p=admin&c=main&a=deleteAdmin",
                    data:{adminID:delAdmID},
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
