/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : dilicompany

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-02-22 23:45:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `dili_admins`
-- ----------------------------
DROP TABLE IF EXISTS `dili_admins`;
CREATE TABLE `dili_admins` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` smallint(5) unsigned DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '1=正常，2=冻结',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `group` (`role`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dili_admins
-- ----------------------------
INSERT INTO `dili_admins` VALUES ('1', 'dilicompany ', '6a69f3310fc8ea955902b6a8898668ed579ce82d', '04ca8e3332', 'hello@dilicms.com', '1', '1');

-- ----------------------------
-- Table structure for `dili_attachments`
-- ----------------------------
DROP TABLE IF EXISTS `dili_attachments`;
CREATE TABLE `dili_attachments` (
  `aid` int(10) NOT NULL AUTO_INCREMENT,
  `uid` smallint(10) NOT NULL DEFAULT '0',
  `model` mediumint(10) DEFAULT '0',
  `from` tinyint(1) DEFAULT '0' COMMENT '0:content model,1:cate model',
  `content` int(10) DEFAULT '0',
  `name` varchar(30) DEFAULT NULL,
  `folder` varchar(15) DEFAULT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `image` tinyint(1) DEFAULT '0',
  `posttime` int(11) DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dili_attachments
-- ----------------------------

-- ----------------------------
-- Table structure for `dili_backend_settings`
-- ----------------------------
DROP TABLE IF EXISTS `dili_backend_settings`;
CREATE TABLE `dili_backend_settings` (
  `backend_theme` varchar(15) DEFAULT NULL,
  `backend_lang` varchar(10) DEFAULT NULL,
  `backend_root_access` tinyint(1) unsigned DEFAULT '1',
  `backend_access_point` varchar(20) DEFAULT 'admin',
  `backend_title` varchar(100) DEFAULT 'DiliCMS后台管理',
  `backend_logo` varchar(100) DEFAULT 'images/logo.gif',
  `plugin_dev_mode` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `backend_http_auth_on` tinyint(1) DEFAULT '0',
  `backend_http_auth_user` varchar(40) DEFAULT NULL,
  `backend_http_auth_password` varchar(40) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dili_backend_settings
-- ----------------------------
INSERT INTO `dili_backend_settings` VALUES ('default', 'zh-cn', '1', '', '重庆泓彬醇基有限公司', 'images/logo.gif', '0', '0', '', '');

-- ----------------------------
-- Table structure for `dili_cate_fields`
-- ----------------------------
DROP TABLE IF EXISTS `dili_cate_fields`;
CREATE TABLE `dili_cate_fields` (
  `id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `description` varchar(40) DEFAULT NULL,
  `model` smallint(10) unsigned DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `length` smallint(10) unsigned DEFAULT NULL,
  `values` tinytext,
  `width` smallint(10) DEFAULT NULL,
  `height` smallint(10) DEFAULT NULL,
  `rules` tinytext,
  `ruledescription` tinytext,
  `searchable` tinyint(1) unsigned DEFAULT NULL,
  `listable` tinyint(1) unsigned DEFAULT NULL,
  `order` int(5) unsigned DEFAULT NULL,
  `editable` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`model`),
  KEY `model` (`model`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dili_cate_fields
-- ----------------------------
INSERT INTO `dili_cate_fields` VALUES ('1', 'type_name', '分类名', '3', 'input', '50', '', '200', '20', 'required', '', '0', '1', '1', '1');

-- ----------------------------
-- Table structure for `dili_cate_models`
-- ----------------------------
DROP TABLE IF EXISTS `dili_cate_models`;
CREATE TABLE `dili_cate_models` (
  `id` mediumint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(40) NOT NULL,
  `perpage` varchar(2) NOT NULL,
  `level` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `hasattach` tinyint(1) NOT NULL DEFAULT '0',
  `built_in` tinyint(1) DEFAULT '0',
  `auto_update` tinyint(1) DEFAULT '0',
  `thumb_preferences` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dili_cate_models
-- ----------------------------
INSERT INTO `dili_cate_models` VALUES ('3', 'article_type', '文章分类', '20', '1', '0', '0', '0', null);

-- ----------------------------
-- Table structure for `dili_fieldtypes`
-- ----------------------------
DROP TABLE IF EXISTS `dili_fieldtypes`;
CREATE TABLE `dili_fieldtypes` (
  `k` varchar(20) NOT NULL,
  `v` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dili_fieldtypes
-- ----------------------------
INSERT INTO `dili_fieldtypes` VALUES ('int', '整形(INT)');
INSERT INTO `dili_fieldtypes` VALUES ('float', '浮点型(FLOAT)');
INSERT INTO `dili_fieldtypes` VALUES ('input', '单行文本框(VARCHAR)');
INSERT INTO `dili_fieldtypes` VALUES ('textarea', '文本区域(VARCHAR)');
INSERT INTO `dili_fieldtypes` VALUES ('select', '下拉菜单(VARCHAR)');
INSERT INTO `dili_fieldtypes` VALUES ('select_from_model', '下拉菜单(模型数据)(INT)');
INSERT INTO `dili_fieldtypes` VALUES ('linked_menu', '联动下拉菜单(VARCHAR)');
INSERT INTO `dili_fieldtypes` VALUES ('radio', '单选按钮(VARCHAR)');
INSERT INTO `dili_fieldtypes` VALUES ('radio_from_model', '单选按钮(模型数据)(INT)');
INSERT INTO `dili_fieldtypes` VALUES ('checkbox', '复选框(VARCHAR)');
INSERT INTO `dili_fieldtypes` VALUES ('checkbox_from_model', '复选框(模型数据)(VARCHAR)');
INSERT INTO `dili_fieldtypes` VALUES ('wysiwyg', '编辑器(TEXT)');
INSERT INTO `dili_fieldtypes` VALUES ('wysiwyg_basic', '编辑器(简)(TEXT)');
INSERT INTO `dili_fieldtypes` VALUES ('datetime', '日期时间(VARCHAR)');
INSERT INTO `dili_fieldtypes` VALUES ('content', '内容模型调用(INT)');

-- ----------------------------
-- Table structure for `dili_menus`
-- ----------------------------
DROP TABLE IF EXISTS `dili_menus`;
CREATE TABLE `dili_menus` (
  `menu_id` tinyint(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_name` varchar(20) NOT NULL,
  `method_name` varchar(30) NOT NULL,
  `menu_name` varchar(20) NOT NULL,
  `menu_level` tinyint(2) unsigned DEFAULT '0',
  `menu_parent` tinyint(10) unsigned DEFAULT '0',
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dili_menus
-- ----------------------------
INSERT INTO `dili_menus` VALUES ('1', 'system', 'home', '系统', '0', '0');
INSERT INTO `dili_menus` VALUES ('2', 'system', 'home', '后台首页', '1', '1');
INSERT INTO `dili_menus` VALUES ('3', 'system', 'home', '后台首页', '2', '2');
INSERT INTO `dili_menus` VALUES ('4', 'setting', 'site', '系统设置', '1', '1');
INSERT INTO `dili_menus` VALUES ('5', 'setting', 'site', '站点设置', '2', '4');
INSERT INTO `dili_menus` VALUES ('6', 'setting', 'backend', '后台设置', '2', '4');
INSERT INTO `dili_menus` VALUES ('7', 'system', 'password', '修改密码', '2', '4');
INSERT INTO `dili_menus` VALUES ('8', 'system', 'cache', '更新缓存', '2', '4');
INSERT INTO `dili_menus` VALUES ('9', 'model', 'view', '模型管理', '1', '1');
INSERT INTO `dili_menus` VALUES ('10', 'model', 'view', '内容模型管理', '2', '9');
INSERT INTO `dili_menus` VALUES ('11', 'category', 'view', '分类模型管理', '2', '9');
INSERT INTO `dili_menus` VALUES ('12', 'plugin', 'view', '扩展管理', '1', '1');
INSERT INTO `dili_menus` VALUES ('13', 'plugin', 'view', '插件管理', '2', '12');
INSERT INTO `dili_menus` VALUES ('14', 'role', 'view', '权限管理', '1', '1');
INSERT INTO `dili_menus` VALUES ('15', 'role', 'view', '用户组管理', '2', '14');
INSERT INTO `dili_menus` VALUES ('16', 'user', 'view', '用户管理', '2', '14');
INSERT INTO `dili_menus` VALUES ('17', 'content', 'view', '内容管理', '0', '0');
INSERT INTO `dili_menus` VALUES ('18', 'content', 'view', '内容管理', '1', '17');
INSERT INTO `dili_menus` VALUES ('19', 'category_content', 'view', '分类管理', '1', '17');
INSERT INTO `dili_menus` VALUES ('20', 'module', 'run', '插件', '0', '0');
INSERT INTO `dili_menus` VALUES ('21', 'database', 'index', '数据库管理', '1', '1');
INSERT INTO `dili_menus` VALUES ('22', 'database', 'index', '数据库备份', '2', '21');
INSERT INTO `dili_menus` VALUES ('23', 'database', 'recover', '数据库还原', '2', '21');
INSERT INTO `dili_menus` VALUES ('24', 'database', 'optimize', '数据库优化', '2', '21');

-- ----------------------------
-- Table structure for `dili_models`
-- ----------------------------
DROP TABLE IF EXISTS `dili_models`;
CREATE TABLE `dili_models` (
  `id` smallint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(50) NOT NULL,
  `perpage` varchar(2) NOT NULL DEFAULT '10',
  `hasattach` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `built_in` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `thumb_preferences` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dili_models
-- ----------------------------
INSERT INTO `dili_models` VALUES ('3', 'page_data', '页面内容配置', '5', '0', '0', null);
INSERT INTO `dili_models` VALUES ('2', 'article', '文章', '10', '1', '0', '{\"enabled\":[],\"default\":\"original\"}');
INSERT INTO `dili_models` VALUES ('4', 'cate_content', '一级栏目内容', '10', '0', '0', null);

-- ----------------------------
-- Table structure for `dili_model_fields`
-- ----------------------------
DROP TABLE IF EXISTS `dili_model_fields`;
CREATE TABLE `dili_model_fields` (
  `id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(40) NOT NULL,
  `model` smallint(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(20) DEFAULT NULL,
  `length` smallint(10) unsigned DEFAULT NULL,
  `values` tinytext NOT NULL,
  `width` smallint(10) unsigned NOT NULL,
  `height` smallint(10) unsigned NOT NULL,
  `rules` tinytext NOT NULL,
  `ruledescription` tinytext NOT NULL,
  `searchable` tinyint(1) unsigned NOT NULL,
  `listable` tinyint(1) unsigned NOT NULL,
  `order` int(5) unsigned DEFAULT NULL,
  `editable` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`model`),
  KEY `model` (`model`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dili_model_fields
-- ----------------------------
INSERT INTO `dili_model_fields` VALUES ('9', 'content', '内容', '3', 'wysiwyg', '0', '', '0', '0', '', '', '1', '0', '1', '1');
INSERT INTO `dili_model_fields` VALUES ('8', 'title', '标题', '3', 'input', '0', '', '0', '0', 'required', '', '1', '1', '0', '1');
INSERT INTO `dili_model_fields` VALUES ('3', 'title', '标题', '2', 'input', '0', '', '0', '0', 'required', '', '1', '1', '0', '1');
INSERT INTO `dili_model_fields` VALUES ('4', 'article', '内容', '2', 'wysiwyg', '0', '', '0', '0', 'required', '', '1', '1', '9', '1');
INSERT INTO `dili_model_fields` VALUES ('5', 'maker', '发布者', '2', 'input', '0', '', '0', '0', '', '', '1', '1', '0', '1');
INSERT INTO `dili_model_fields` VALUES ('7', 'type', '文章类别', '2', 'select_from_model', '0', 'article_type|type_name', '0', '0', 'required', '', '1', '1', '0', '1');
INSERT INTO `dili_model_fields` VALUES ('10', 'key', 'key_name', '3', 'input', '0', '', '0', '0', 'required', '', '0', '1', '0', '1');
INSERT INTO `dili_model_fields` VALUES ('11', 'key', 'key_name', '4', 'input', '0', '', '0', '0', 'required', '', '1', '1', '0', '1');
INSERT INTO `dili_model_fields` VALUES ('12', 'title', '标题', '4', 'input', '0', '', '0', '0', 'required', '', '1', '1', '0', '1');
INSERT INTO `dili_model_fields` VALUES ('13', 'content', '内容', '4', 'wysiwyg', '0', '', '0', '0', '', '', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for `dili_plugins`
-- ----------------------------
DROP TABLE IF EXISTS `dili_plugins`;
CREATE TABLE `dili_plugins` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `version` varchar(5) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `author` varchar(20) NOT NULL,
  `link` varchar(100) NOT NULL,
  `copyrights` varchar(100) NOT NULL,
  `access` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dili_plugins
-- ----------------------------

-- ----------------------------
-- Table structure for `dili_rights`
-- ----------------------------
DROP TABLE IF EXISTS `dili_rights`;
CREATE TABLE `dili_rights` (
  `right_id` tinyint(10) unsigned NOT NULL AUTO_INCREMENT,
  `right_name` varchar(30) DEFAULT NULL,
  `right_class` varchar(30) DEFAULT NULL,
  `right_method` varchar(30) DEFAULT NULL,
  `right_detail` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`right_id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dili_rights
-- ----------------------------
INSERT INTO `dili_rights` VALUES ('1', '密码修改', 'system', 'password', null);
INSERT INTO `dili_rights` VALUES ('2', '更新缓存', 'system', 'cache', null);
INSERT INTO `dili_rights` VALUES ('3', ' 站点设置', 'setting', 'site', null);
INSERT INTO `dili_rights` VALUES ('4', '后台设置', 'setting', 'backend', null);
INSERT INTO `dili_rights` VALUES ('5', '插件管理[列表]', 'plugin', 'view', null);
INSERT INTO `dili_rights` VALUES ('6', '添加插件', 'plugin', 'add', null);
INSERT INTO `dili_rights` VALUES ('7', '修改插件', 'plugin', 'edit', null);
INSERT INTO `dili_rights` VALUES ('8', '卸载插件', 'plugin', 'del', null);
INSERT INTO `dili_rights` VALUES ('9', '导出插件', 'plugin', 'export', null);
INSERT INTO `dili_rights` VALUES ('10', '导入插件', 'plugin', 'import', null);
INSERT INTO `dili_rights` VALUES ('11', '激活插件', 'plugin', 'active', null);
INSERT INTO `dili_rights` VALUES ('12', '禁用插件', 'plugin', 'deactive', null);
INSERT INTO `dili_rights` VALUES ('13', '运行插件', 'module', 'run', null);
INSERT INTO `dili_rights` VALUES ('14', '内容模型管理[列表]', 'model', 'view', null);
INSERT INTO `dili_rights` VALUES ('15', '添加内容模型', 'model', 'add', null);
INSERT INTO `dili_rights` VALUES ('16', '修改内容模型', 'model', 'edit', null);
INSERT INTO `dili_rights` VALUES ('17', '删除内容模型', 'model', 'del', null);
INSERT INTO `dili_rights` VALUES ('18', '内容模型字段管理[列表]', 'model', 'fields', null);
INSERT INTO `dili_rights` VALUES ('19', '添加内容模型字段', 'model', 'add_filed', null);
INSERT INTO `dili_rights` VALUES ('20', '修改内容模型字段', 'model', 'edit_field', null);
INSERT INTO `dili_rights` VALUES ('21', '删除内容模型字段', 'model', 'del_field', null);
INSERT INTO `dili_rights` VALUES ('22', '分类模型管理[列表]', 'category', 'view', null);
INSERT INTO `dili_rights` VALUES ('23', '添加分类模型', 'category', 'add', null);
INSERT INTO `dili_rights` VALUES ('24', '修改分类模型', 'category', 'edit', null);
INSERT INTO `dili_rights` VALUES ('25', '删除分类模型', 'category', 'del', null);
INSERT INTO `dili_rights` VALUES ('26', '分类模型字段管理[列表]', 'category', 'fields', null);
INSERT INTO `dili_rights` VALUES ('27', '添加分类模型字段', 'category', 'add_filed', null);
INSERT INTO `dili_rights` VALUES ('28', '修改分类模型字段', 'category', 'edit_field', null);
INSERT INTO `dili_rights` VALUES ('29', '删除分类模型字段', 'category', 'del_field', null);
INSERT INTO `dili_rights` VALUES ('30', '内容管理[列表]', 'content', 'view', null);
INSERT INTO `dili_rights` VALUES ('31', '添加内容[表单]', 'content', 'form', 'add');
INSERT INTO `dili_rights` VALUES ('32', '修改内容[表单]', 'content', 'form', 'edit');
INSERT INTO `dili_rights` VALUES ('33', '添加内容[动作]', 'content', 'save', 'add');
INSERT INTO `dili_rights` VALUES ('34', '修改内容[动作]', 'content', 'save', 'edit');
INSERT INTO `dili_rights` VALUES ('35', '删除内容', 'content', 'del', null);
INSERT INTO `dili_rights` VALUES ('36', '分类管理[列表]', 'category_content', 'view', null);
INSERT INTO `dili_rights` VALUES ('37', '添加分类[表单]', 'category_content', 'form', 'add');
INSERT INTO `dili_rights` VALUES ('38', '修改分类[表单]', 'category_content', 'form', 'edit');
INSERT INTO `dili_rights` VALUES ('39', '添加分类[动作]', 'category_content', 'save', 'add');
INSERT INTO `dili_rights` VALUES ('40', '修改分类[动作]', 'category_content', 'save', 'edit');
INSERT INTO `dili_rights` VALUES ('41', '删除分类', 'category_content', 'del', null);
INSERT INTO `dili_rights` VALUES ('42', '用户组管理[列表]', 'role', 'view', null);
INSERT INTO `dili_rights` VALUES ('43', '添加用户组', 'role', 'add', null);
INSERT INTO `dili_rights` VALUES ('44', '修改用户组', 'role', 'edit', null);
INSERT INTO `dili_rights` VALUES ('45', '删除用户组', 'role', 'del', null);
INSERT INTO `dili_rights` VALUES ('46', '用户管理[列表]', 'user', 'view', null);
INSERT INTO `dili_rights` VALUES ('47', '添加用户', 'user', 'add', null);
INSERT INTO `dili_rights` VALUES ('48', '修改用户', 'user', 'edit', null);
INSERT INTO `dili_rights` VALUES ('49', '删除用户', 'user', 'del', null);
INSERT INTO `dili_rights` VALUES ('50', '数据库备份', 'database', 'index', null);
INSERT INTO `dili_rights` VALUES ('51', '数据库还原', 'database', 'recover', null);
INSERT INTO `dili_rights` VALUES ('52', '数据库优化', 'database', 'optimize', null);

-- ----------------------------
-- Table structure for `dili_roles`
-- ----------------------------
DROP TABLE IF EXISTS `dili_roles`;
CREATE TABLE `dili_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `rights` varchar(255) NOT NULL,
  `models` varchar(255) NOT NULL,
  `category_models` varchar(255) NOT NULL,
  `plugins` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dili_roles
-- ----------------------------
INSERT INTO `dili_roles` VALUES ('1', 'root', '', '', '', '');

-- ----------------------------
-- Table structure for `dili_sessions`
-- ----------------------------
DROP TABLE IF EXISTS `dili_sessions`;
CREATE TABLE `dili_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dili_sessions
-- ----------------------------
INSERT INTO `dili_sessions` VALUES ('8b0b9408ade95c72f3fc15abd417cf77', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36', '1424615294', 'a:4:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";s:10:\"model_type\";s:5:\"model\";s:5:\"model\";s:9:\"page_data\";}');
INSERT INTO `dili_sessions` VALUES ('ba0c4a403faad6ca28900ebd939cc079', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36', '1424612539', '');

-- ----------------------------
-- Table structure for `dili_site_settings`
-- ----------------------------
DROP TABLE IF EXISTS `dili_site_settings`;
CREATE TABLE `dili_site_settings` (
  `site_name` varchar(50) DEFAULT NULL,
  `site_domain` varchar(50) DEFAULT NULL,
  `site_logo` varchar(50) DEFAULT NULL,
  `site_icp` varchar(50) DEFAULT NULL,
  `site_terms` text,
  `site_stats` varchar(200) DEFAULT NULL,
  `site_footer` varchar(500) DEFAULT NULL,
  `site_status` tinyint(1) DEFAULT '1',
  `site_close_reason` varchar(200) DEFAULT NULL,
  `site_keyword` varchar(200) DEFAULT NULL,
  `site_description` varchar(200) DEFAULT NULL,
  `site_theme` varchar(20) DEFAULT NULL,
  `attachment_url` varchar(50) DEFAULT NULL,
  `attachment_dir` varchar(20) DEFAULT NULL,
  `attachment_type` varchar(50) DEFAULT NULL,
  `attachment_maxupload` varchar(20) DEFAULT NULL,
  `thumbs_preferences` varchar(500) DEFAULT '[]'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dili_site_settings
-- ----------------------------
INSERT INTO `dili_site_settings` VALUES ('重庆泓彬醇基有限公司', 'http://www.dilicms.com/', 'images/logo.gif', '', '', '', '', '1', '网站开发建设中......', '重庆泓彬醇基有限公司', '甲醇燃料  新能源   重庆', 'default', '', 'attachments', '*.jpg;*.gif;*.png;*.doc', '2097152', '[]');

-- ----------------------------
-- Table structure for `dili_throttles`
-- ----------------------------
DROP TABLE IF EXISTS `dili_throttles`;
CREATE TABLE `dili_throttles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dili_throttles
-- ----------------------------

-- ----------------------------
-- Table structure for `dili_u_c_article_type`
-- ----------------------------
DROP TABLE IF EXISTS `dili_u_c_article_type`;
CREATE TABLE `dili_u_c_article_type` (
  `classid` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(5) unsigned NOT NULL DEFAULT '0',
  `level` int(2) unsigned NOT NULL DEFAULT '1',
  `path` varchar(50) DEFAULT '',
  `type_name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`classid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dili_u_c_article_type
-- ----------------------------
INSERT INTO `dili_u_c_article_type` VALUES ('1', '0', '1', '{0}', '新闻中心');
INSERT INTO `dili_u_c_article_type` VALUES ('2', '0', '1', '{0}', '产品中心');
INSERT INTO `dili_u_c_article_type` VALUES ('3', '0', '1', '{0}', '经典案列');

-- ----------------------------
-- Table structure for `dili_u_m_article`
-- ----------------------------
DROP TABLE IF EXISTS `dili_u_m_article`;
CREATE TABLE `dili_u_m_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `create_user` tinyint(10) unsigned NOT NULL DEFAULT '0',
  `update_user` tinyint(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `article` text NOT NULL,
  `maker` varchar(100) NOT NULL DEFAULT '',
  `type` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dili_u_m_article
-- ----------------------------
INSERT INTO `dili_u_m_article` VALUES ('1', '1424073882', '1424073882', '1', '1', '投资甲醇燃料的五大优势', 'haoahoaohaoah', '', '1');
INSERT INTO `dili_u_m_article` VALUES ('2', '1424073907', '1424073907', '1', '1', '亚洲新能源大会召开', 'sdfdsfdsfasdgafgasgds', '', '1');
INSERT INTO `dili_u_m_article` VALUES ('3', '1424073929', '1424073929', '1', '1', '热烈祝贺我司美股上市', 'dfdsfsafdsfdsf', '', '1');
INSERT INTO `dili_u_m_article` VALUES ('4', '1424073950', '1424073950', '1', '1', '互联网营销的成功', 'dsfdsfsdfsdf', '', '1');
INSERT INTO `dili_u_m_article` VALUES ('5', '1424073972', '1424595855', '1', '1', '2015年第一季度公司销售业绩', 'fdsafasdgbat', '', '1');

-- ----------------------------
-- Table structure for `dili_u_m_cate_content`
-- ----------------------------
DROP TABLE IF EXISTS `dili_u_m_cate_content`;
CREATE TABLE `dili_u_m_cate_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `create_user` tinyint(10) unsigned NOT NULL DEFAULT '0',
  `update_user` tinyint(10) unsigned NOT NULL DEFAULT '0',
  `key` varchar(100) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dili_u_m_cate_content
-- ----------------------------
INSERT INTO `dili_u_m_cate_content` VALUES ('1', '1424596733', '1424612569', '1', '1', 'intro', '关于我们', '<p style=\"font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;\">\r\n	<strong>重庆泓彬醇基有限公司 &nbsp;</strong>成立于2013年5月，坐落于重庆市万盛区中心广场，主要从事节能环保事业，是集研发、生产和销售于一体的综合性企业。在能源日渐匮乏和大气污染日趋严重的今天，节能环保将是未来世界大主题，我们的目标：做中国的节能燃料领导者。\r\n</p>\r\n<p style=\"font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;\">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 公司主营产品：“甘氏节能”醇基节能燃料、节能灶具、节能控制器等。 公司研制开发的醇基节能燃料及灶具，适用于酒店、餐厅、家用、夜排档等。这种新型燃料燃烧充分，无烟无味，无残液残渣，火力猛，温度高，比液化气、柴油节省30%左右！燃料呈液态，在常压下灌装使用，消除了液化气罐的高压易爆炸的安全隐患，燃烧无烟无残留使得整个厨房环境更干净卫生。<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 公司产品通过了国家标准，我们还建立了比国家标准更高、要求更严格的行业标准。另外，我们还取得了储存液态燃料的装置的专利证书、“甘氏节能”商标和危化品经营许可证。<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 我司产品节能环保高效的优势得到众多客户的认可，现在成都地区我们已经拥有500多家餐馆、酒店、食堂的客户，月供燃料200余吨。公司还在福州、西昌、兰州、攀枝花、阿坝等地区有加盟商，规模正在不断扩大。\r\n</p>\r\n<p style=\"font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;\">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 公司强大的技术力量团队将为您提供及时、完善、周到的服务。我们承诺：将在接到您电话通知的24小时内送油上门。如果有任何问题，我们将在接到您通知后48小时内上门解决处理，特殊紧急情况须更快上门服务。售后服务专线：400-666-3729。\r\n</p>\r\n<p style=\"font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;\">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 我们的宗旨：诚信，创新，利益双赢。\r\n</p>');
INSERT INTO `dili_u_m_cate_content` VALUES ('2', '1424596859', '1424596859', '1', '1', 'join', '招商加盟', '<strong>重庆泓彬醇基有限公司</strong><span style=\"color:#505050;font-family:Verdana;line-height:24px;background-color:#FFFFFF;\">拥有成熟的技术，可以为您提供更高效的产品。仅仅重庆地区我们就自主开拓了500多家客户，包括大家熟悉的“祖母炖品”、“田园印象”、“厨品楼”、“东海渔港”、“张大胡子片片鱼”、“内江风味菜”、“世外桃源”、“乡村菜馆”、“春回大地”、“钱苑食府”、“自贡好吃客”、“贵州芋儿鸡”等等。每位客户对我公司产品评价都高于同行其他商家。如果您有意向加盟我公司，我们可以带您去实地参观考察，让您能够亲身体验我们的产品，并亲手操作，为您熟悉我们的产品提供更便捷的方式。</span><br />\r\n<span style=\"color:#505050;font-family:Verdana;line-height:24px;background-color:#FFFFFF;\">加盟我公司您无须承担任何风险，总公司会为您提供相关产品以及配货，并参与经营，您只需负责当地销售，送油，调试以及售后服务等工作。公司强大的生产与销售以及完善的售后一条龙服务给您的代理和销售带来强有力地支持！</span><br />\r\n<span style=\"color:#505050;font-family:Verdana;line-height:24px;background-color:#FFFFFF;\">加盟条件：</span><br />\r\n<span style=\"color:#505050;font-family:Verdana;line-height:24px;background-color:#FFFFFF;\">1，&nbsp;有自主销售能力</span><br />\r\n<span style=\"color:#505050;font-family:Verdana;line-height:24px;background-color:#FFFFFF;\">2，&nbsp;要懂得保护公司品牌，维护品牌利益</span><br />\r\n<span style=\"color:#505050;font-family:Verdana;line-height:24px;background-color:#FFFFFF;\">3，&nbsp;良好的销售渠道</span><br />\r\n<span style=\"color:#505050;font-family:Verdana;line-height:24px;background-color:#FFFFFF;\">加盟流程：</span><br />\r\n<span style=\"color:#505050;font-family:Verdana;line-height:24px;background-color:#FFFFFF;\">1，&nbsp;首先需报名参与公司培训，了解公司产品</span><br />\r\n<span style=\"color:#505050;font-family:Verdana;line-height:24px;background-color:#FFFFFF;\">2，&nbsp;有意向加盟者可与我们的工作人员联系，详谈加盟的各项事情。无论您有何疑问，我们都将尽心为您详细解答</span><br />\r\n<span style=\"color:#505050;font-family:Verdana;line-height:24px;background-color:#FFFFFF;\">3，&nbsp;满意者可与公司签订加盟协议，正式加盟我们公司</span>');
INSERT INTO `dili_u_m_cate_content` VALUES ('3', '1424597137', '1424597137', '1', '1', 'contact', '联系我们', '<strong>重庆泓彬醇基有限公司<br />\r\n</strong><span style=\"color:#505050;font-family:Verdana;font-size:14px;line-height:28px;\">联系人&nbsp;&nbsp; ：毛先生</span><br />\r\n<span style=\"color:#505050;font-family:Verdana;font-size:14px;line-height:28px;\">联系手机：13368088888</span><br />\r\n<span style=\"color:#505050;font-family:Verdana;font-size:14px;line-height:28px;\">服务热线：400-666-3729/023-66133292</span><br />\r\n<span style=\"color:#505050;font-family:Verdana;font-size:14px;line-height:28px;\">企业邮箱：</span><a href=\"mailto:ycjn2014@163.com\">ycjn2014@163.com</a><br />\r\n<p>\r\n	<span style=\"color:#505050;font-family:Verdana;font-size:14px;line-height:28px;\">公司地址：重庆市万盛区中心广场</span>\r\n</p>\r\n<p>\r\n	<span style=\"color:#505050;font-family:Verdana;font-size:14px;line-height:28px;\">乘车路线：南平长途汽车站高速大巴到万盛车站</span>\r\n</p>\r\n<p>\r\n	<span style=\"color:#505050;font-family:Verdana;font-size:14px;line-height:28px;\">驾车路线：高速</span>\r\n</p>');

-- ----------------------------
-- Table structure for `dili_u_m_page_data`
-- ----------------------------
DROP TABLE IF EXISTS `dili_u_m_page_data`;
CREATE TABLE `dili_u_m_page_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `create_user` tinyint(10) unsigned NOT NULL DEFAULT '0',
  `update_user` tinyint(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `key` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dili_u_m_page_data
-- ----------------------------
INSERT INTO `dili_u_m_page_data` VALUES ('1', '1424076273', '1424077177', '1', '1', '公司简介', '<p style=\"font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;\">\r\n	<span>&nbsp;<strong>重庆泓彬醇基有限公司 &nbsp;</strong>成立于2013年5月，<span>坐落于重庆市万盛区中心广场</span>，<span>主要从事节能环保事业，是集研发、生产和销售于一体的综合性企业。在能源日渐匮乏和大气污染日趋严重的今天，节能环保将是未来世界大主题，我们的目标：做中国的节能燃料领导者。</span></span> \r\n</p>\r\n<p style=\"font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;\">\r\n	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 公司主营产品：“甘氏节能”醇基节能燃料、节能灶具、节能控制器等。 公司研制开发的醇基节能燃料及灶具，适用于酒店、餐厅、家用、夜排档等。这种新型燃料燃烧充分，无烟无味，无残液残渣，火力猛，温度高，比液化气、柴油节省30%左右！燃料呈液态，在常压下灌装使用，消除了液化气罐的高压易爆炸的安全隐患，燃烧无烟无残留使得整个厨房环境更干净卫生。<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 公司产品通过了国家标准，我们还建立了比国家标准更高、要求更严格的行业标准。另外，我们还取得了储存液态燃料的装置的专利证书、“甘氏节能”商标和危化品经营许可证。<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 我司产品节能环保高效的优势得到众多客户的认可，现在成都地区我们已经拥有500多家餐馆、酒店、食堂的客户，月供燃料200余吨。公司还在福州、西昌、兰州、攀枝花、阿坝等地区有加盟商，规模正在不断扩大。</span> \r\n</p>\r\n<p style=\"font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;\">\r\n	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 公司强大的技术力量团队将为您提供及时、完善、周到的服务。我们承诺：将在接到您电话通知的24小时内送油上门。如果有任何问题，我们将在接到您通知后48小时内上门解决处理，特殊紧急情况须更快上门服务。售后服务专线：400-666-3729。<br />\r\n</span> \r\n</p>\r\n<p style=\"font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;\">\r\n	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 我们的宗旨：诚信，创新，利益双赢。</span> \r\n</p>', 'company_des');
INSERT INTO `dili_u_m_page_data` VALUES ('2', '1424077372', '1424615295', '1', '1', '联系我们', '<strong>重庆泓彬醇基有限公司<br />\r\n</strong><span style=\"color:#505050;font-family:Verdana;font-size:14px;line-height:28px;\">联系人&nbsp;&nbsp; ：毛先生</span><br />\r\n<span style=\"color:#505050;font-family:Verdana;font-size:14px;line-height:28px;\">联系手机：133 6832 3998</span><br />\r\n<span style=\"color:#505050;font-family:Verdana;font-size:14px;line-height:28px;\">服务热线：023-48308085</span><br />\r\n<span style=\"color:#505050;font-family:Verdana;font-size:14px;line-height:28px;\">企业邮箱：maoxigui@foxmail.com</span><br />\r\n<span style=\"color:#505050;font-family:Verdana;font-size:14px;line-height:28px;\">公司地址：重庆市万盛经济技术开发区煤化园区</span>', 'contact_us');

-- ----------------------------
-- Table structure for `dili_validations`
-- ----------------------------
DROP TABLE IF EXISTS `dili_validations`;
CREATE TABLE `dili_validations` (
  `k` varchar(20) DEFAULT NULL,
  `v` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dili_validations
-- ----------------------------
INSERT INTO `dili_validations` VALUES ('required', '必填');
INSERT INTO `dili_validations` VALUES ('valid_email', 'E-mail格式');
