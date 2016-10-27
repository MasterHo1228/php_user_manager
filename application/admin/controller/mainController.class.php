<?php
/**
 * Created by IntelliJ IDEA.
 * User: MasterHo
 * Date: 2016/9/28
 * Time: 21:58
 */

/**
 * 后台主控制类
 * Class mainController
 */
class mainController extends platformController {

    /**
     * 加载主界面
     */
    public function mainAction(){
        $this->smt->display('main.tpl');
    }

    /**
     * 添加管理员
     */
    public function addAdminAction(){
        if(empty($_POST)){
            echo 'false';
        }
        //实例化main模型
        $mainModel = new mainModel();
        //调用insert方法
        $pass = $mainModel->insertNewAdmin();
        //判断是否执行成功
        if($pass){
            //成功时
            echo 'true';
        }else{
            //失败时
            echo 'false';
        }
    }

    /**
     * 添加班级
     */
    public function addClassAction(){
        if(empty($_POST)){
            return false;
        }
        //实例化main模型
        $mainModel = new mainModel();
        //调用insert方法
        $pass = $mainModel->insertNewClass();
        //判断是否执行成功
        if($pass){
            //成功时
            echo 'true';
        }else{
            //失败时
            echo 'false';
        }
    }

    /**
     * 添加课程
     * @return bool
     */
    public function addCourseAction(){
        if(empty($_POST)){
            return false;
        }
        //实例化main模型
        $mainModel = new mainModel();
        //调用insert方法
        $pass = $mainModel->insertNewCourse();
        //判断是否执行成功
        if($pass){
            //成功时
            echo 'true';
        }else{
            //失败时
            echo 'false';
        }
    }

    /**
     * 添加学生
     * @return bool
     */
    public function addStudentAction(){
        if(empty($_POST)){
            return false;
        }
        //实例化main模型
        $mainModel = new mainModel();
        //调用insert方法
        $pass = $mainModel->insertNewStudent();
        //判断是否执行成功
        if($pass){
            //成功时
            $this->jump('index.php?p=admin&c=iframe&a=studentList','学生信息录入成功');
        }else{
            //失败时
            $this->jump('index.php?p=admin&c=iframe&a=studentList','学生信息录入失败');
        }
    }

    /**
     * 录入成绩
     * @return bool
     */
    public function addScoreAction(){
        if(empty($_POST)){
            return false;
        }
        //实例化main模型
        $mainModel = new mainModel();
        //调用insert方法
        $pass = $mainModel->insertNewScore();
        //判断是否执行成功
        if($pass){
            //成功时
            $this->jump('index.php?p=admin&c=iframe&a=addScore','成绩录入成功');
        }else{
            //失败时
            $this->jump('index.php?p=admin&c=iframe&a=addScore','成绩录入失败');
        }
    }

    /**
     * 更新学生详细信息
     * @return bool
     */
    public function updateStudentInfoAction(){
        if(empty($_POST)){
            return false;
        }
        //实例化main模型
        $mainModel = new mainModel();
        //调用insert方法
        $pass = $mainModel->updateStudentInfo();
        //判断是否执行成功
        if($pass){
            //成功时
            $this->jump('index.php?p=admin&c=iframe&a=studentList','学生信息更新成功');
        }else{
            //失败时
            $this->jump('index.php?p=admin&c=iframe&a=studentList','学生信息更新失败');
        }
    }

    /**
     * 更新管理员信息
     * @return bool
     */
    public function updateAdminAction(){
        if(empty($_POST)){
            return false;
        }
        //实例化main模型
        $mainModel = new mainModel();
        //调用insert方法
        $pass = $mainModel->updateAdmin();
        //判断是否执行成功
        if($pass){
            //成功时
            $this->jump('index.php?p=admin&c=iframe&a=adminList','管理员账号更新成功');
        }else{
            //失败时
            $this->jump('index.php?p=admin&c=iframe&a=adminList','管理员账号更新失败');
        }
    }

    /**
     * 更新班级信息
     * @return bool
     */
    public function updateClassAction(){
        if(empty($_POST)){
            return false;
        }
        //实例化main模型
        $mainModel = new mainModel();
        //调用insert方法
        $pass = $mainModel->updateClass();
        //判断是否执行成功
        if($pass){
            //成功时
            $this->jump('index.php?p=admin&c=iframe&a=classList','班级信息更新成功');
        }else{
            //失败时
            $this->jump('index.php?p=admin&c=iframe&a=classList','班级信息更新失败');
        }
    }

    /**
     * 更新课程信息
     * @return bool
     */
    public function updateCourseAction(){
        if(empty($_POST)){
            return false;
        }
        //实例化main模型
        $mainModel = new mainModel();
        //调用insert方法
        $pass = $mainModel->updateCourse();
        //判断是否执行成功
        if($pass){
            //成功时
            $this->jump('index.php?p=admin&c=iframe&a=courseList','课程信息更新成功');
        }else{
            //失败时
            $this->jump('index.php?p=admin&c=iframe&a=courseList','课程信息更新失败');
        }
    }

    /**
     * 删除学生
     * @return bool
     */
    public function deleteStudentAction(){
        if (isset($_GET['stuID'])){
            $stuID = $_GET['stuID'];
            //实例化main模型
            $mainModel = new mainModel();
            $action = $mainModel->deleteStudent($stuID);
            if ($action){
                echo 'true';
            } else {
                echo 'false';
            }
        } else {
            return false;
        }
    }

    /**
     * 删除管理员
     * @return bool
     */
    public function deleteAdminAction(){
        if (isset($_GET['adminID'])){
            $adminID = $_GET['adminID'];
            //实例化main模型
            $mainModel = new mainModel();
            $action = $mainModel->deleteAdmin($adminID);
            if ($action){
                echo 'true';
            } else {
                echo 'false';
            }
        } else {
            return false;
        }
    }

    /**
     * 删除班级
     * @return bool
     */
    public function deleteClassAction(){
        if (isset($_GET['classID'])){
            $classID = $_GET['classID'];
            //实例化main模型
            $mainModel = new mainModel();
            $action = $mainModel->deleteClass($classID);
            if ($action){
                echo 'true';
            } else {
                echo 'false';
            }
        } else {
            return false;
        }
    }

    /**
     * 删除课程
     * @return bool
     */
    public function deleteCourseAction(){
        if (isset($_GET['courseID'])){
            $courseID = $_GET['courseID'];
            //实例化main模型
            $mainModel = new mainModel();
            $action = $mainModel->deleteCourse($courseID);
            if ($action){
                echo 'true';
            } else {
                echo 'false';
            }
        } else {
            return false;
        }
    }
}