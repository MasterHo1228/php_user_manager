<?php
/**
 * 基础模型类
 */
class model {
    //保存数据库对象
	protected $db;

	public function __construct(){
        // 初始化数据库
		$this->initDB();
	}

    /**
     * 实例化数据库操作类
     */
	private function initDB() {
		$this->db = MySQLPDO::getInstance($GLOBALS['config']['db']);
	}

    /**
     * 表单数据过滤器类
     * @param array $arr 待处理表单数据头标识
     * @param string $func 字符过滤方法
     */
	protected function filter($arr,$func){
        foreach($arr as $v){
            //指定默认值
            if(!isset($_POST[$v])){
                $_POST[$v] = '';
            }
            //调用函数处理
            $_POST[$v] = $func($_POST[$v]);
        }
    }
}
