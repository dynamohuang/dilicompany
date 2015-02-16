/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : dilicompany

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-02-16 10:57:36
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
INSERT INTO `dili_admins` VALUES ('1', 'dilicompany ', 'f3f1c17b6e88ad313df1e996f85ada43a5a3b987', 'f7f2acd52b', 'hello@dilicms.com', '1', '1');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dili_cate_fields
-- ----------------------------

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dili_cate_models
-- ----------------------------
INSERT INTO `dili_cate_models` VALUES ('1', 'common', '通用页面内容', '5', '1', '0', '0', '0', null);

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dili_models
-- ----------------------------
INSERT INTO `dili_models` VALUES ('1', 'page_data', '页面片', '5', '0', '0', null);
INSERT INTO `dili_models` VALUES ('2', 'article', '文章', '10', '1', '0', '{\"enabled\":[],\"default\":\"original\"}');

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dili_model_fields
-- ----------------------------
INSERT INTO `dili_model_fields` VALUES ('1', 'titie', '标题', '1', 'input', '0', '', '0', '0', '', '', '1', '1', '0', '1');
INSERT INTO `dili_model_fields` VALUES ('2', 'content', '内容', '1', 'wysiwyg', '0', '', '0', '0', '', '', '1', '0', '0', '1');
INSERT INTO `dili_model_fields` VALUES ('3', 'title', '标题', '2', 'input', '0', '', '0', '0', 'required', '', '1', '1', '0', '1');
INSERT INTO `dili_model_fields` VALUES ('4', 'article', '内容', '2', 'wysiwyg', '0', '', '0', '0', 'required', '', '1', '1', '9', '1');
INSERT INTO `dili_model_fields` VALUES ('5', 'maker', '发布者', '2', 'input', '0', '', '0', '0', '', '', '1', '1', '0', '1');
INSERT INTO `dili_model_fields` VALUES ('6', 'publish_time', '发布时间', '2', 'datetime', '0', '', '0', '0', '', '', '1', '1', '0', '1');

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
INSERT INTO `dili_sessions` VALUES ('47864c3e3d8925ad1dcb5ffd086cd276', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36', '1424055378', 'a:4:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";s:10:\"model_type\";s:5:\"model\";s:5:\"model\";s:7:\"article\";}');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dili_throttles
-- ----------------------------

-- ----------------------------
-- Table structure for `dili_u_c_common`
-- ----------------------------
DROP TABLE IF EXISTS `dili_u_c_common`;
CREATE TABLE `dili_u_c_common` (
  `classid` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(5) unsigned NOT NULL DEFAULT '0',
  `level` int(2) unsigned NOT NULL DEFAULT '1',
  `path` varchar(50) DEFAULT '',
  PRIMARY KEY (`classid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dili_u_c_common
-- ----------------------------

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
  `publish_time` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dili_u_m_article
-- ----------------------------

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
  `titie` varchar(100) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dili_u_m_page_data
-- ----------------------------

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
