<?php
return array(
	//数据库配置
	'db' => array(
		//需要根据自身环境修改此处配置
		'user' => 'root',
		'pass' => '',
		'dbname' => 'dbUserManager',
	),
	//整体项目
	'app' => array(
		'default_platform' => 'admin',//默认平台
	),
	//后台配置
	'admin' => array(
		'default_controller' => 'admin',//默认控制器
		'default_action' => 'login',//默认方法
	)
);
