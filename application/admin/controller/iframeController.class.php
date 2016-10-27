<?php
/**
 * Created by IntelliJ IDEA.
 * User: MasterHo
 * Date: 2016.10.25
 * Time: 18:56
 */

/**
 * iframe独立控制类
 * Class iframeController
 */
class iframeController extends platformController {

    /**
     * 加载登录欢迎页
     */
    public function welcomeAction(){
        //实例化iframe独立模型类
        $iframeModel = new iframeModel();
        //获取上次登录记录数据
        $data = $iframeModel->getLastLoginData();

        //传输数据到模板页
        @$this->smt->assign('loginTime', $data[0]['LastLoginTime']);
        @$this->smt->assign('loginIpAddr', $data[0]['LastLoginIP']);
        $this->smt->display('welcome.tpl');
    }

    /**
     * 加载成绩录入页
     */
    public function addScoreAction(){
        //实例化iframe独立模型类
        $iframeModel = new iframeModel();

        //获取班级简略数据
        $classData = $iframeModel->getSimpleClassList();
        //获取课程简略数据
        $courseData = $iframeModel->getSimpleCourseList();
        //传输数据到模板页
        $this->smt->assign('classList', $classData);
        $this->smt->assign('courseList', $courseData);
        $this->smt->display('add_score.tpl');
    }

    /**
     * 加载班级列表页
     */
    public function classListAction(){
        //实例化iframe独立模型类
        $iframeModel = new iframeModel();

        //获取班级完整数据
        $data = $iframeModel->getFullClassList();
        //传输数据到模板页
        $this->smt->assign('classList', $data);
        $this->smt->display('class_list.tpl');
    }

    /**
     * 加载班级详细数据页
     * @return bool
     */
    public function classInfoAction(){
        if (isset($_GET['classID'])){//有带班级ID get值的才开始获取数据
            //实例化iframe独立模型类
            $iframeModel = new iframeModel();

            //获取当前班级的信息
            $data = $iframeModel->getCurrentClassList($_GET['classID']);
            //传输数据到模板页
            $this->smt->assign('classInfo', $data);
            $this->smt->display('class_info.tpl');
        } else {
            return false;
        }
    }

    /**
     * 加载课程列表页
     */
    public function courseListAction(){
        //实例化iframe独立模型类
        $iframeModel = new iframeModel();

        //获取课程信息
        $data = $iframeModel->getCourseList();
        //传输数据到模板页
        $this->smt->assign('courseList', $data);
        $this->smt->display('course_list.tpl');
    }

    /**
     * 加载课程详细信息页
     * @return bool
     */
    public function courseInfoAction(){
        if (isset($_GET['courseID'])){//有带课程ID get值的才开始获取数据
            //实例化iframe独立模型类
            $iframeModel = new iframeModel();

            //获取课程详细信息
            $data = $iframeModel->getCourseInfo($_GET['courseID']);
            //传输数据到模板页
            $this->smt->assign('courseInfo', $data);
            $this->smt->display('course_info.tpl');
        } else {
            return false;
        }
    }

    /**
     * 加载添加学生页
     */
    public function addStudentAction(){
        //实例化iframe独立模型类
        $iframeModel = new iframeModel();

        //获取班级简略信息
        $data = $iframeModel->getSimpleClassList();
        //传输数据到模板页
        $this->smt->assign('classList', $data);
        $this->smt->display('add_student.tpl');
    }

    /**
     * 加载学生列表页
     */
    public function studentListAction(){
        //实例化iframe独立模型类
        $iframeModel = new iframeModel();
        //获取学生简略信息
        $data = $iframeModel->getStudentIndexList();
        //传输数据到模板页
        $this->smt->assign('studentList', $data);
        $this->smt->display('student_list.tpl');
    }

    /**
     * 加载学生详细信息页
     */
    public function studentInfoAction(){
        if (isset($_GET['stuID'])){//有带学生ID get值的才开始获取数据
            //实例化iframe独立模型类
            $iframeModel = new iframeModel();

            //获取对应学生详细信息
            $data = $iframeModel->getStudentAllInfo($_GET['stuID']);
            //获取班级简略信息
            $classList = $iframeModel->getSimpleClassList();
            //传输数据到模板页
            $this->smt->assign('studentInfo', $data);
            $this->smt->assign('classList', $classList);
            $this->smt->display('student_info.tpl');
        }
    }

    /**
     * 加载管理员列表页
     */
    public function adminListAction(){
        //实例化iframe独立模型类
        $iframeModel = new iframeModel();

        //获取管理员账号基本信息
        $data = $iframeModel->getAdminList();
        //传输数据到模板页
        $this->smt->assign('adminList', $data);
        $this->smt->display('admin_list.tpl');
    }

    /**
     * 加载管理员详细信息页
     */
    public function adminInfoAction(){
        if (isset($_GET['adminID'])){//有带管理员ID get值的才开始获取数据
            //实例化iframe独立模型类
            $iframeModel = new iframeModel();

            //获取对应管理员账号详细信息
            $data = $iframeModel->getAdminInfo($_GET['adminID']);
            //传输数据到模板页
            $this->smt->assign('adminInfo', $data);
            $this->smt->display('admin_info.tpl');
        }
    }

    /**
     * 加载成绩列表页
     */
    public function scoreListAction(){
        //实例化iframe独立模型类
        $iframeModel = new iframeModel();

        //获取所有成绩的数据
        $data = $iframeModel->getScoreList();
        //传输数据到模板页
        $this->smt->assign('scoreList', $data);
        $this->smt->display('score_list.tpl');
    }

    /**
     * 加载About静态页
     * （你或许懂得~~）
     */
    public function aboutAction(){
        require './application/admin/view/about.html';
    }
}