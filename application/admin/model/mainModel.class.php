<?php
/**
 * Created by IntelliJ IDEA.
 * User: MasterHo
 * Date: 2016/9/28
 * Time: 22:03
 */

/**
 * 后台主模型类
 * Class mainModel
 */
class mainModel extends model {
    /**
     * 添加管理员账号
     * @return mixed
     */
    public function insertNewAdmin(){
        if (isset($_POST)){
            //输入过滤
            $this->filter(array('usrName','usrPasswd','usrRole'),'trim');

            //接收输入数据
            $data['Name'] = $_POST['usrName'];
            $data['User_role'] = $_POST['usrRole'];
            //随机生成4位字符串掩码
            $data['salt'] = $this->genRandomString(4);
            $data['Password'] = $_POST['usrPasswd'].$data['salt'];

            //写入数据
            return $this->InsertData('AdminUser',$data);
        } else {
            return false;
        }
    }

    /**
     * 更新管理员信息
     * @return bool
     */
    public function updateAdmin(){
        if (isset($_POST['adminID'])){
            //输入过滤
            $this->filter(array('usrName','usrPasswd','usrRole'),'trim');

            //接收输入数据
            $data['Name'] = $_POST['usrName'];
            $data['User_role'] = $_POST['usrRole'];
            //随机生成4位字符串掩码
            if (isset($_POST['usrPasswd']) && $_POST['usrPasswd']!="") {//若前台有修改密码，才接受post中密码的数据并处理
                $data['salt'] = $this->genRandomString(4);
                $data['Password'] = $_POST['usrPasswd'] . $data['salt'];
            }

            //往管理员表中插入数据
            //此处的sql代码需要特殊验证，故不用api~
            //拼接SQL语句
            $sql = "update AdminUser set ";
            foreach($data as $k=>$v){
                if ($k == 'Password'){
                    $sql .= "`$k`=MD5('$v'),";
                    continue;
                } else {
                    $sql .= "`$k`='$v',";
                }
            }
            $sql = rtrim($sql,','); //去掉最右边的逗号
            $sql .= "where ID={$_POST['adminID']}";
            //执行SQL并返回
            return $this->db->query($sql);
        } else {
            return false;
        }
    }

    /**
     * 添加班级
     * @return mixed
     */
    public function insertNewClass(){
        //输入过滤
        $this->filter(array('className','classGrade','classMaxCount'),'trim');

        //接收输入数据
        $data['Name'] = $_POST['className'];
        $data['Grade'] = $_POST['classGrade'];
        $data['Max_students'] = $_POST['classMaxCount'];

        //写入数据
        return $this->InsertData('Class',$data);
    }

    /**
     * 添加新课程
     * @return mixed
     */
    public function insertNewCourse(){
        //输入过滤
        $this->filter(array('courseName','courseCredit'),'trim');

        //接收输入数据
        $data['Name'] = $_POST['courseName'];
        $data['Credit'] = $_POST['courseCredit'];

        //写入数据
        return $this->InsertData('Course',$data);
    }

    /**
     * 录入学生成绩
     * @return bool
     */
    public function insertNewScore(){
        //输入过滤
        $this->filter(array('stuName','stuClass','stuCourse','stuScore','schoolYear','semester'),'trim');
        if (isset($_POST['stuName']) && isset($_POST['stuClass'])){
            //接收输入数据
            $chk_data['Name'] = $_POST['stuName'];
            $chk_data['Class_ID'] = $_POST['stuClass'];

            $chk_sql = "SELECT `ID` FROM `Student` WHERE `Name`='".$chk_data['Name']."' AND `Class_ID`={$chk_data['Class_ID']};";
            $data = $this->db->fetchRow($chk_sql);
            if ($data){
                $ins_data['Course_ID'] = $_POST['stuCourse'];
                $ins_data['Student_ID'] = $data['ID'];
                $ins_data['Score'] = $_POST['stuScore'];
                $ins_data['Semester'] = $_POST['semester'];
                $ins_data['School_year'] = $_POST['schoolYear'];

                //写入数据
                return $this->InsertData('Student_score',$ins_data);
            } else {
                echo '学生不存在！';
                return false;
            }
        } else {
            echo '输入姓名或班级';
            return false;
        }
    }

    /**
     * 更新班级信息
     * @return bool
     */
    public function updateClass(){
        if (isset($_POST['classID'])){
            //输入过滤
            $this->filter(array('className','classGrade','classMaxCount'),'trim');

            //接收输入数据
            $data['Name'] = $_POST['className'];
            $data['Grade'] = $_POST['classGrade'];
            $data['Max_students'] = $_POST['classMaxCount'];

            //更新数据
            return $this->UpdateData('Class',$data,'ID',$_POST['classID']);
        } else {
            return false;
        }
    }

    /**
     * 更新课程信息
     * @return bool
     */
    public function updateCourse(){
        if (isset($_POST['courseID'])){
            //输入过滤
            $this->filter(array('courseName','courseCredit'),'trim');

            //接收输入数据
            $data['Name'] = $_POST['courseName'];
            $data['Credit'] = $_POST['courseCredit'];

            //更新数据
            return $this->UpdateData('Course',$data,'ID',$_POST['courseID']);
        } else {
            return false;
        }
    }

    /**
     * 添加学生
     * @return mixed
     */
    public function insertNewStudent(){
        if (isset($_POST)){
            //输入过滤
            $this->filter(array('stuName','stuAge','stuNationality','stuPolitic','stuJob','stuGender','stuDateOfBirth','stuBirthPlace','stuHomeAddr','stuClass','stuIDNum','stuMajor'),'trim');

            //接收输入数据
            $data['Name'] = $_POST['stuName'];
            $data['Age'] = $_POST['stuAge'];
            $data['Nationality'] = $_POST['stuNationality'];
            $data['Politic'] = $_POST['stuPolitic'];
            $data['Job'] = $_POST['stuJob'];
            $data['Gender'] = $_POST['stuGender'];
            $data['DateOfBirth'] = $_POST['stuDateOfBirth'];
            $data['BirthPlace'] = $_POST['stuBirthPlace'];
            $data['Home_addr'] = $_POST['stuHomeAddr'];
            $data['Class_ID'] = $_POST['stuClass'];
            $data['ID_Number'] = $_POST['stuIDNum'];
            $data['Major'] = $_POST['stuMajor'];

            //写入数据
            return $this->InsertData('Student',$data);
        } else {
            return false;
        }
    }

    /**
     * 更新学生信息
     * @return bool
     */
    public function updateStudentInfo(){
        if (isset($_POST['stuID'])){
            //输入过滤
            $this->filter(array('stuName','stuAge','stuNationality','stuPolitic','stuJob','stuGender','stuDateOfBirth','stuBirthPlace','stuHomeAddr','stuClass','stuIDNum','stuMajor'),'trim');

            //接收输入数据
            $data['Name'] = $_POST['stuName'];
            $data['Age'] = $_POST['stuAge'];
            $data['Nationality'] = $_POST['stuNationality'];
            $data['Politic'] = $_POST['stuPolitic'];
            $data['Job'] = $_POST['stuJob'];
            $data['Gender'] = $_POST['stuGender'];
            $data['DateOfBirth'] = $_POST['stuDateOfBirth'];
            $data['BirthPlace'] = $_POST['stuBirthPlace'];
            $data['Home_addr'] = $_POST['stuHomeAddr'];
            $data['Class_ID'] = $_POST['stuClass'];
            $data['ID_Number'] = $_POST['stuIDNum'];
            $data['Major'] = $_POST['stuMajor'];

            //更新数据
            return $this->UpdateData('Student',$data,'ID',$_POST['stuID']);
        } else {
            return false;
        }
    }

    /**
     * 删除对应学生
     * @param int $studentID 学号
     * @return bool
     */
    public function deleteStudent($studentID){
        if (isset($studentID)){
            //删除数据
            return $this->DeleteData('Student','ID',$studentID);
        } else {
            return false;
        }
    }

    /**
     * 删除对应管理员
     * @param int $adminID 管理员ID
     * @return bool
     */
    public function deleteAdmin($adminID){
        if (isset($adminID)){
            $check_data = $this->db->fetchRow("SELECT `Name` FROM AdminUser WHERE ID={$adminID}");
            if ($check_data['Name'] == 'admin'){//防止admin账号被删除
                return false;
            } else {
                //删除数据
                return $this->DeleteData('AdminUser','ID',$adminID);
            }
        } else {
            return false;
        }
    }

    /**
     * 删除课程
     * @param int $classID 课程编号
     * @return bool
     */
    public function deleteClass($classID){
        if (isset($classID)){
            //删除数据
            return $this->DeleteData('Class','ID',$classID);
        } else {
            return false;
        }
    }

    /**
     * 删除课程
     * @param int $courseID 课程编号
     * @return bool
     */
    public function deleteCourse($courseID){
        if (isset($courseID)){
            //删除数据
            return $this->DeleteData('Course','ID',$courseID);
        } else {
            return false;
        }
    }

    /**
     * 往数据表中插入数据
     * @param string $tableName 表名
     * @param array $data 插入表的数据
     * @return bool
     */
    private function InsertData($tableName,$data){
        if (isset($tableName) && isset($data)){
            //拼接SQL语句
            $sql = "insert into {$tableName} set ";
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

    /**
     * 根据关键字段名及值，更新数据表中的数据
     * @param string $tableName 表名
     * @param array $data 要更新的数据
     * @param string $colName 关键字段名
     * @param mixed $key 关键值
     * @return bool
     */
    private function UpdateData($tableName,$data,$colName,$key){
        if (isset($tableName) && isset($data) && isset($colName) && isset($key)){
            //拼接SQL语句
            $sql = "update {$tableName} set ";
            foreach($data as $k=>$v){
                $sql .= "`$k`='$v',";
            }
            $sql = rtrim($sql,','); //去掉最右边的逗号
            $sql .="where {$colName}={$key}";
            //执行SQL并返回
            return $this->db->query($sql);
        } else {
            return false;
        }
    }

    /**
     * 根据所提供的字段名及对应值，删除数据表中对应的数据
     * @param string $tableName 表名
     * @param string $colName 关键字段名
     * @param mixed $key 关键值
     * @return bool
     */
    private function DeleteData($tableName,$colName,$key){
        if (isset($tableName) && isset($colName) && isset($key)){
            $sql = "DELETE FROM {$tableName} WHERE {$colName}={$key}";
            return $this->db->query($sql);
        } else {
            return false;
        }
    }

    /**
     * 生成随机字符串，此处作生成加密掩码用。
     * @param int $len 生成字符串的长度
     * @return string $output 随机的字符串
     */
    private function genRandomString($len) {
        //字符表
        $chars = array(
            "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",
            "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
            "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G",
            "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R",
            "S", "T", "U", "V", "W", "X", "Y", "Z", "0", "1", "2",
            "3", "4", "5", "6", "7", "8", "9"
        );
        $charsLen = count($chars) - 1;
        shuffle($chars); // 将数组打乱

        $output = "";
        for ($i=0; $i<$len; $i++) {
            $output .= $chars[mt_rand(0, $charsLen)];
        }
        return $output;
    }
}