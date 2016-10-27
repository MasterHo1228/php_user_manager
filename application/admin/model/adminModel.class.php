<?php
/**
 * Created by IntelliJ IDEA.
 * User: MasterHo
 * Date: 2016/9/28
 * Time: 20:45
 */

/**
 * 后台管理模型类
 * Class adminModel
 */
class adminModel extends model {
    /**
     * 验证登录
     * @return bool
     */
    public function checkByLogin(){
        //过滤字符
        $this->filter(array('usrName','usrPasswd'),'trim');
        //接收输入字符
        $username = $_POST['usrName'];
        $password = $_POST['usrPasswd'];

        $sql = 'SELECT `ID`,`User_role`,`Password`,`salt` FROM `adminuser` WHERE `Name`=:username ;';
        $data = $this->db->fetchRow($sql,array(':username'=>$username));
        if (!$data){
            return false;
        } else {
            if (md5($password.$data['salt']) == $data['Password']){
                session_start();
                $_SESSION['admin_user'] = $_POST['usrName'];
                $_SESSION['admin_id'] = $data['ID'];
                $_SESSION['admin_role'] = $data['User_role'];
                $this->markLoginLog($data['ID']);
                return true;
            } else {
                return false;
            }
        }
    }

    /**
     * 记录后台系统登录记录
     * @param string $AdminID 管理员ID
     * @return bool
     */
    private function markLoginLog($AdminID){
        if (isset($_SESSION['admin_id'])){//登录验证通过时，若session有记录用户名，则立刻记录登录记录到数据库中
            $data['AdminID'] = $AdminID;

            date_default_timezone_set('PRC');//设定为北京时间（修复记录时间相差8小时）
            $data['LastLoginTime'] = date('Y-m-d H:i:s');

            $data['LastLoginIP'] = $_SERVER['REMOTE_ADDR'];
            //拼接SQL语句
            $sql = "insert into AdminUserLoginLog set ";
            foreach($data as $k=>$v){
                $sql .= "`$k`='$v',";
            }
            $sql = rtrim($sql,','); //去掉最右边的逗号
            //执行SQL并返回
            return $this->db->query($sql);
        } else {
            return false;
        }
    }
}