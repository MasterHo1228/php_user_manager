<?php
/**
 * Created by IntelliJ IDEA.
 * User: MasterHo
 * Date: 2016/9/28
 * Time: 20:14
 */

/**
 * 平台控制类
 * Class platformController
 */
class platformController{
    public function __construct()
    {
        $this->checkLogin();

        $this->smt = new Smarty; //自动加载Smarty
        //必要的配置
        $this->smt->setTemplateDir('./application/admin/view/');//模板目录
        $this->smt->setCompileDir('./application/admin/runtime/view_c/');//模板缓存目录
        //配置分界标识符
        $this->smt->left_delimiter = '{{';
        $this->smt->right_delimiter = '}}';

        //检查账号权限
        $permission = $this->checkAdminPermission();
        $this->smt->assign('permission', $permission);
    }

    /**
     * 根据登录状态跳转相应页面
     */
    private function checkLogin(){
        if (CONTROLLER=='admin' && ACTION=='login'){//action为login不需要进行验证
            return;
        }
        session_start();
        if (!isset($_SESSION['admin'])){//若未登录则自动跳转到登录界面
            $this->jump('index.php?p=admin&c=admin&a=login');
        }
    }

    /**
     * 检查登陆账号的所有权限级别
     * @return string 返回账号的权限等级
     */
    private function checkAdminPermission(){
        if (isset($_SESSION['admin_role'])){
            return $_SESSION['admin_role'];
        } else {
            return 'Default';
        }
    }

    /**
     * 跳转页面
     * @param string $url 需要跳转的链接
     * @param string $msg 跳转相应链接前需要回显的信息 默认为空
     * @param int $time 跳转等待的时间 默认为2秒
     */
    protected function jump($url,$msg='',$time=2){
        if ($msg==''){//没有提示信息
            header("Location: $url");
        } else {//有提示信息
            $this->smt->assign('msg', $msg);
            $this->smt->assign('time', $time);
            $this->smt->assign('url', $url);
            $this->smt->display('jump.tpl');
        }
        die;//终止运行
    }
}