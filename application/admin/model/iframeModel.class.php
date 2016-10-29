<?php
/**
 * Created by IntelliJ IDEA.
 * User: MasterHo
 * Date: 2016.10.26
 * Time: 19:45
 */


/**
 * iframe独立模型类
 * Class iframeModel
 */
class iframeModel extends model{
    /**
     * 获取对应登录账号上次登录系统的记录信息
     * @return bool
     */
    public function getLastLoginData(){
        if (isset($_SESSION['admin_id'])){
            $adminID = $_SESSION['admin_id'];
            $sql = "SELECT LastLoginTime,LastLoginIP FROM AdminUserLoginLog WHERE AdminID=:adminID ORDER BY LastLoginTime DESC LIMIT 1,1 ;";
            $data = $this->db->fetchAll($sql,array(':adminID'=>$adminID));
            return $data;
        } else {
            return false;
        }
    }

    /**
     * 获取所有班级的简略信息
     * @return bool
     */
    public function getSimpleClassList(){
        $sql = "SELECT ID,Name FROM Class ;";
        $data = $this->db->fetchAll($sql);
        return $data;
    }

    /**
     * 获取对应班级的信息
     * @param int $classID 班级编号
     * @return mixed $data 班级数据
     */
    public function getCurrentClassList($classID){
        $sql = "SELECT ID,Name,Grade,Max_students FROM Class WHERE ID=:classID ;";
        $data = $this->db->fetchRow($sql,array(':classID'=>$classID));
        return $data;
    }

    /**
     * 获取完整的班级数据表
     * @return mixed $data 班级数据
     */
    public function getFullClassList(){
        $sql = "SELECT ID,Name,Grade,Max_students FROM Class ;";
        $data = $this->db->fetchAll($sql);
        return $data;
    }

    /**
     * 获取简略课程数据
     * @return mixed $data 课程数据
     */
    public function getSimpleCourseList(){
        $sql = "SELECT ID,Name FROM Course ;";
        $data = $this->db->fetchAll($sql);
        return $data;
    }

    /**
     * 获取详细课程数据
     * @return mixed $data 课程数据
     */
    public function getCourseList(){
        $sql = "SELECT ID,Name,Credit FROM Course ;";
        $data = $this->db->fetchAll($sql);
        return $data;
    }

    /**
     * 获取对应课程的数据
     * @param int $courseID 课程编号
     * @return bool
     */
    public function getCourseInfo($courseID){
        if (isset($courseID)){
            $sql = "SELECT ID,Name,Credit FROM Course WHERE ID=:courseID;";
            $data = $this->db->fetchRow($sql,array(':courseID'=>$courseID));
            return $data;
        } else {
            return false;
        }
    }

    /**
     * 获取成绩数据
     * @return mixed $data 成绩数据
     */
    public function getScoreList(){
        $sql = "SELECT Student_ID,StudentName,ClassName,CourseName,Score,School_year,Semester FROM viewStudentScore ;";
        $data = $this->db->fetchAll($sql);
        return $data;
    }

    /**
     * 学生列表页 获取学生简略数据
     * @return mixed
     */
    public function getStudentIndexList(){
        $sql = "SELECT ID,StudentName,Gender,ClassName FROM viewStudentInfos ;";
        $data = $this->db->fetchAll($sql);
        return $data;
    }

    /**
     * 获取对应学生所有的信息
     * @param int $studentID 学号
     * @return bool
     */
    public function getStudentAllInfo($studentID){
        if (isset($studentID)){
            $sql = "SELECT ID,StudentName,Gender,Age,DateOfBirth,BirthPlace,Nationality,ClassName,Home_addr,Politic,ID_Number,Job,Major FROM viewStudentInfos WHERE ID=:studentID;";
            $data = $this->db->fetchRow($sql,array(':studentID'=>$studentID));
            return $data;
        } else {
            return false;
        }
    }

    /**
     * 获取管理员基本信息数据
     * @return mixed $data 管理员基本信息数据
     */
    public function getAdminList(){
        $sql = "SELECT ID,Name,User_role FROM AdminUser ;";
        $data = $this->db->fetchAll($sql);
        return $data;
    }

    /**
     * 获取对应管理员的详细信息
     * @param int $adminID 管理员ID
     * @return bool
     */
    public function getAdminInfo($adminID){
        if (isset($adminID)){
            $sql = "SELECT ID,Name,User_role FROM AdminUser WHERE ID=:adminID;";
            $data = $this->db->fetchRow($sql,array(':adminID'=>$adminID));
            return $data;
        } else {
            return false;
        }
    }
}