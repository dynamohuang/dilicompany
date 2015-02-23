/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : dilicompany

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-02-23 18:14:31
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
INSERT INTO `dili_model_fields` VALUES ('4', 'article', '内容', '2', 'wysiwyg', '0', '', '0', '0', 'required', '', '1', '0', '9', '1');
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
INSERT INTO `dili_sessions` VALUES ('decf1d2b6f253d1a8c002d44ead1e82b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36', '1424685367', 'a:4:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";s:10:\"model_type\";s:5:\"model\";s:5:\"model\";s:7:\"article\";}');
INSERT INTO `dili_sessions` VALUES ('ede19942d98f815d214ac6cdcb92eac7', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36', '1424673200', 'a:4:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";s:10:\"model_type\";s:5:\"model\";s:5:\"model\";s:12:\"cate_content\";}');

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
INSERT INTO `dili_site_settings` VALUES ('重庆泓彬醇基燃料有限公司', 'http://www.hongbinchunji.com', 'images/logo.jpg', '', '', '', '', '1', '网站开发建设中......', '醇基燃料  新能源   重庆', '重庆泓彬醇基燃料有限公司官网', 'default', '', 'attachments', '*.jpg;*.gif;*.png;*.doc', '2097152', '[]');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dili_u_m_article
-- ----------------------------
INSERT INTO `dili_u_m_article` VALUES ('1', '1424073882', '1424672198', '1', '1', '醇基燃料招商', '<span style=\"background-color:#FFFFFF;\"> \r\n<p style=\"text-align:center;\">\r\n	<span>&nbsp;&nbsp;<span style=\"color:#666666;\">&nbsp;</span><span style=\"color:#666666;font-size:16px;\">&nbsp;</span><strong><span style=\"color:#666666;font-size:16px;\">醇基燃料招商</span></strong></span> \r\n</p>\r\n<p>\r\n	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-family:FangSong_GB2312;\">&nbsp;</span><span style=\"font-family:FangSong_GB2312;color:#000000;\">醇基燃料油主要应用于各大中小城市的宾馆、酒店、单位食堂、柴油锅炉等使用柴油燃料的灶具和燃烧器，该技术工艺简单，小规模生产不需用电，大规模生产只需燃料罐、成品罐、油泵、阀门、管线等简单设施，固定资金投入小，上手快，见效快，是快速致富的好项目。有意者可以到我公司现场观摹，也可以考察我市在各酒店的使用效果。生产方法简单，无经验者学会只需一小时。化工原料全国各地石化行业都有售，添加剂我公司对购买技术方常年供应。&nbsp;&nbsp;</span></span> \r\n</p>\r\n<span style=\"font-family:FangSong_GB2312;color:#000000;\">&nbsp;&nbsp;&nbsp; 醇基燃料就是以醇类（如甲醇、乙醇、丁醇等）物质为主体配置，按特定工艺配方，经化学勾兑合成的一种高清洁生物质液体燃料。它清洁卫生，保护环境。该燃料含氧量高，燃烧充分，无烟尘、无积垢、不黑锅底，无残液残渣，燃烧后的废气排放比石油液化气低80%以上，是名副其实的清洁燃料。<br />\r\n</span></span><span style=\"background-color:#FFFFFF;\"><span style=\"font-family:FangSong_GB2312;color:#000000;\">&nbsp;&nbsp;&nbsp;&nbsp;醇基燃料的热值高、价格低廉，热值可高达7000大卡，可替代液化气用于千家万户，或替代柴油，液化气用作酒店、宾馆、单位食堂的锅炉燃料，或用作其它工业燃料。</span><br />\r\n<span style=\"font-family:FangSong_GB2312;color:#000000;\"> &nbsp;&nbsp;&nbsp;&nbsp;日前，国际局势紧张，能源争端频发，导致国际原油价格急剧上涨。能源紧缺，直接影响到城乡居民的生活，乃至国家的经济发展。开发廉价、清洁的替代能源已迫在眉睫！我公司开发的新型醇基燃料应运而生，其廉价、清洁、安全、原料资源丰富等优势，将大大缓解民用燃料供应的紧张局势，市场前景广阔。</span></span>', '', '1');
INSERT INTO `dili_u_m_article` VALUES ('2', '1424073907', '1424671846', '1', '1', '甲醇汽车发展空间巨大', '<p style=\"text-align:center;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;background-color:#FFFFFF;\">\r\n	&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;甲醇汽车发展空间巨大</strong>\r\n</p>\r\n<p style=\"text-align:center;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;background-color:#FFFFFF;\">\r\n	<strong><br />\r\n</strong>\r\n</p>\r\n<p style=\"font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;background-color:#FFFFFF;\">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;能源和环境是世界经济和社会发展面临的两大主要问题。如何有效的解决由于全球经济迅猛发展带来的能源危机和环境污染，不但是全世界关注的课题，也是我国实施长期可持续发展的主要屏障。为了解决能源问题，我国在石油替代燃料方面做了大量工作，取得了一定成效如：推广应用天然气、石油液化气、甲醇、乙醇汽车等，使车用燃料向多元化方向发展。但是，从我国缺油、富煤的能源结构特点看，作为替代燃料，甲醇的发展前景广阔，其中尤其是<a class=\"keyWord\" href=\"http://www.jdf28.com/\" target=\"_blank\"><strong></strong></a><strong><a class=\"keyWord\" href=\"http://www.jdf28.com/\" target=\"_blank\"><strong>甲醇汽车</strong></a></strong>发展空间巨大再此公司为您分享一些甲醇汽车相关信息。据公司工作人员了解汽车产业化的试点工作近日有了最新进展：工信部有关负责人表示，将在沪、晋、陕三地开展甲醇汽车试点。这是继工信部指定上海华普、奇瑞、一汽靖烨为高比例甲醇汽油车生产企业，并在面三个地点启动M85和M100甲醇汽油试点后，明确提出开展高比例甲醇汽车相关标准体系研究的试点工作。&nbsp;\r\n</p>\r\n<p style=\"font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;background-color:#FFFFFF;\">\r\n	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 上述工信部负责人表示，三地试点将按“限定地域、限定燃料、限定用车”的原则推进，争取2~3年后，完成对高比例甲醇汽车可靠性、经济性、安全性和环保性等评价工作，建立甲醇汽车相关标准体系，提出高比例甲醇汽车相关配套基础设施改造和管理规范的产业政策建议。</span>\r\n</p>\r\n<p style=\"font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;background-color:#FFFFFF;\">\r\n	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 公司工作人员获悉，上海市相关企业已就工信部文件召开了“在用车改装甲醇燃料的尾气排放测试”的会议。一位与会人士向记者透露，这次工信部下发相关生产企业的文件中，关于高比例甲醇汽车的技术条件已明确出炉，涉及甲醇柴油组合燃烧和甲醇汽油组合燃烧两块的技术指标。此前工信部推广高比例甲醇汽车工作的进展不大，并非技术问题，而是出于国家能源战略的考虑。试点原则中，燃料将以高比例M85（加入85%甲醇调配）和M100（纯甲醇燃料）两大类型为主。</span>\r\n</p>\r\n<p style=\"font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;background-color:#FFFFFF;\">\r\n	<span>&nbsp;&nbsp; &nbsp; 此外，试点工作将按“限定用车”原则推广，有业内人士向记者解读：一是要符合公告技术条件的车辆，二是限定试点车的数量。就上海地区来看，试点极有可能是从出租车改装开始，并逐渐扩大到整车生产。</span>\r\n</p>\r\n<p style=\"font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;background-color:#FFFFFF;\">\r\n	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;张有国认为，甲醇是清洁替代能源，但更重要的是甲醇走煤基生产路线，有原料优势，一些煤制甲醇项目甚至可回收73%的二氧化碳排放。实验数据显示，出租车如果使用M100燃料，油费可从0.9元/公里降到0.66元/公里，降幅逾三成，1升汽油价格相当于1.7升甲醇，后者的经济优势明显，且综合排放致癌物是汽柴油的15%。现阶段国内柴油供给比汽油更紧缺，替代技术难度更大，且排放问题更难解决，而甲醇燃料能解决柴油的排放问题，“替代柴油比替代汽油更具有现实意义”。</span>\r\n</p>\r\n<p style=\"font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;background-color:#FFFFFF;\">\r\n	<span>&nbsp;&nbsp;&nbsp;&nbsp; 目前包括成都、山西、陕西、贵州、河北等在内的省份已开展M15甲醇汽油的推广和汽车改装工作，其中山西依托一汽靖烨汽车厂，改装和生产甲醇汽车约5万辆，规模居全国前列，超过了上海等省市的出租车总量。这意味着，随着时代的发展甲醇汽车发展空间巨大。</span>\r\n</p>', '', '1');
INSERT INTO `dili_u_m_article` VALUES ('4', '1424073950', '1424672362', '1', '1', '投资醇基燃料的七大优势', '<p style=\"text-align:center;\">\r\n	<span>投资醇基燃料的七大优势<br />\r\n</span> \r\n</p>\r\n<p>\r\n	<span>投资醇基燃料七大优势：</span> \r\n</p>\r\n<span>&nbsp;&nbsp;1、依据国家标准生产和使用环保型醇基液体燃料——现在全国大中城市饭店、食堂用的餐饮灶、民用取暖锅炉、茶炉、工业炉窑等大多数都以燃烧石油资源为代价,而且燃料成本价很高。既污染环境又是资源上的巨大浪费。人们迫切希望有一种低价、安全、方便的新型燃料及燃烧器问世。它能减少石油资源浪费，改善不合理的资源配置，保护环境，可保证推行国民经济可持续发展的战略方针。为此，我公司组织有关专业技术人员经多年研究，反复试验，攻克种种技术难关，成功地研制出了这种新型环保醇基液体燃料及配套燃烧器，并申请多项专利。它的问世，受到各方专家的重视和好评，被称之为“绿色能源”，填补了我国醇基液体燃料应用领域内的一项空白。国家技术监督局于1997年12月发布了“gb１６６６３—１９９７&nbsp;醇基燃料国家标准”，为生产和使用环保型醇基液体燃料提供了法律依据。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\r\n&nbsp;&nbsp;2、醇基燃料应用广泛——甲醇燃料以甲醇为主要原料，配以氧化剂、增热剂、稳定剂。燃烧时火焰稳定，火力猛、环保、节能、无毒、无烟、符合国家环保标准，热值比柴油稍低、高于液化气,比柴油省20%左右,比液化气省25%-30%,广泛应用于宾馆、饭店、机关、部队、学校及餐饮业，是宾馆、饭店、机关、部队、学校及餐饮业的替代燃料。是国家认证的环保优质液体燃料。其特点是：高效节能、经济安全、无毒、无烟、无尘、不留残液、清洁卫生，同时，不受季节和气候的影响，是代替液化气和柴油的首选燃料。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\r\n&nbsp;&nbsp;3、经济效益分析——最近几年石油价格波动很大，涨价后回落的可能性不多，国际原油价格2007年底已经突破100美金一桶,这是世界石油的价格趋势。醇基燃料消耗成本低于煤气15-20%，低于国标柴油10-20%。根据我们的测试结果，使用醇基液体燃料与柴油、液化气的费用比较，至少每吨节省300-1000元不等。对用锅炉、工业窑炉的用户来讲，一年节省下来的会是一个很可观的数字。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\r\n&nbsp;&nbsp;4、保护厨师健康——环保醇基燃料是一种可再生能源，燃烧时无烟、无味、无污染、无残渣、不黑锅、清洁卫生，其燃烧时产生的一氧化碳低于柴油和液化气，最大限度保护了厨师们的身体健康。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\r\n&nbsp;&nbsp;5、经济实用——使用该液体燃料不仅燃烧成本低，而且餐饮业原柴油灶只需改装醇基专用炉头即可。改装学习由我司负责，不需客户出资学习技术。&nbsp;&nbsp;&nbsp;<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> \r\n<p>\r\n	<br />\r\n</p>\r\n<div align=\"left\" style=\"font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;background-color:#FFFFFF;\">\r\n	<span>&nbsp; 6、燃烧稳定——该燃料配用的各型号灶具都采用高差和专用小油泵方式供料，燃料在开口的燃烧器内燃烧，绝不会因燃烧器内压力过大而造成危险。燃料燃烧稳定，火焰高度可达30－45厘米，且火焰大小可调，使用方便。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> \r\n</div>\r\n<div align=\"left\" style=\"font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;background-color:#FFFFFF;\">\r\n	<span>&nbsp; 7、安全可靠——柴油燃烧时有油烟，泄漏着火不能用水扑灭。液化石油气冬季有残液，泄漏不容易发现，着火不易扑灭并且会产生有毒气体。醇基燃料为透明液体，无毒、无味、无压力、零下四十度不结冰，四季无需更换。泄露容易发现，用水即可稀释，着火时用水浇即灭，该燃料属水容性液体，安全可靠。意外泄露的环保油也能自然风干，不会像柴油或液化气那样污染环境，造成安全隐患。</span> \r\n</div>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '', '1');
INSERT INTO `dili_u_m_article` VALUES ('5', '1424073972', '1424671661', '1', '1', '醇基燃料现状', '<p align=\"center\" style=\"font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;background-color:#FFFFFF;\">\r\n	<span>醇基燃料现状</span>\r\n</p>\r\n<p style=\"font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;background-color:#FFFFFF;\">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;<span>&nbsp;醇基液体燃料是一种无毒、无残液、无烟尘、无有害废气、无积垢，既安全又经济的清洁燃料，属可再生的生物能源，是国家正式认定的标准能源之一。作为众所周知的清洁燃料，醇基燃料近年来发展较快。1997年，国家计委交通能源司、国家农业部环保能源司、国家经贸委资源综合利用司等国家有关部门联合发文（环能管）【1997】30号文要求各地推广利用。尤其在2005年后，由于原油价格急剧上涨，醇基燃料作为新型生物能源，以其低成本的显著优势，获得了世界各国的广泛关注和支持，产能大规模提高，技术发展十分迅速。</span>\r\n</p>\r\n<p style=\"font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;background-color:#FFFFFF;\">\r\n	<span>目前，醇基燃料主要应用于三大领域：</span>\r\n</p>\r\n<p style=\"font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;background-color:#FFFFFF;\">\r\n	<span>1.车用燃料即醇基汽油、醇基柴油。</span>\r\n</p>\r\n<p style=\"font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;background-color:#FFFFFF;\">\r\n	<span>2.醇基燃料电池。</span>\r\n</p>\r\n<p style=\"font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;background-color:#FFFFFF;\">\r\n	<span>3.民用烧火燃料。</span>\r\n</p>\r\n<p style=\"font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;background-color:#FFFFFF;\">\r\n	<span>&nbsp;&nbsp;&nbsp; 如今，不论是作为车用燃料，还是民用燃料，醇基液体燃料均以其较低的使用成本、环保卫生的使用性能，受到广大消费者的衷心喜爱，成为世界各国公认的替代民用石油产品类燃料的最佳选择，被誉为二十一世纪最具有发展前景的新型绿色低碳能源之一。我公司开发的高能醇基燃气，是在市场已有醇基液体燃料技术基础上研发而成的新型民用烧火燃料。该产品以市场非常常见的低价化工副产品甲醇为主要原料，加入我公司化工、能源专家潜心研制开发的高效促燃稳定剂及其他辅料，经特殊理化反应合成，属高效清洁型燃料。虽然该燃料常温时为液体，但其燃烧时在灶头经高效气化燃烧，所以称为“高能醇基燃气”，燃烧前的原液即为“高能醇基油”。</span>\r\n</p>\r\n<p style=\"font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;background-color:#FFFFFF;\">\r\n	<span>&nbsp;&nbsp;&nbsp; 甲醇是有毒的，能做民用燃料吗？实际上所有的燃料，包括柴油、汽油都是不能饮用的，都有一定的毒性。直接饮用甲醇会中毒，但是甲醇燃烧的生成物是二氧化碳和水，是无毒的，这一点也是国家推行使用醇基燃料的原因之一。就毒性危害而言，现在广泛使用的天然气、液化石油气，其危害性都远超于醇基燃料。因此，以甲醇为主要原料生产的生物醇油，是完全可以做民用燃料的。</span>\r\n</p>', '', '1');
INSERT INTO `dili_u_m_article` VALUES ('6', '1424671464', '1424671464', '1', '1', '入式燃气灶和红外线节能灶哪个更好', '<div class=\"tit clearfix\" style=\"margin:0px 0px 10px;padding:0px 0px 10px;font-size:15px;color:#666666;font-weight:bold;text-align:center;font-family:\'Lucida Grande\', Helvetica, Arial, sans-serif;background-color:#FFFFFF;\">\r\n	入式燃气灶和红外线节能灶哪个更好\r\n</div>\r\n<div class=\"content clearfix\" style=\"margin:0px auto;padding:0px;color:#666666;font-family:\'Lucida Grande\', Helvetica, Arial, sans-serif;background-color:#FFFFFF;\">\r\n	<p>\r\n		第1条：&nbsp;选择燃气灶\r\n	</p>\r\n	<p>\r\n		&nbsp;&nbsp;&nbsp; 我国城市燃气主要分为三大类：人工煤气、天然气和液化石油气，家用燃气灶按照适用气源不同也分为相应的三大类，消费者在选购之前必须清楚自己所居住地区究竟使用哪一种燃气，根据自己实际使用的气源条件选择相应的产品。&nbsp;选购燃气灶产品时可以通过观察产品包装和外观来大致辨别产品质量，优质燃气灶外观应美观大方，燃气灶的整体结构应稳定可靠，灶面要光滑平整，无明显翘曲，零部件的安装要牢固，不能有松脱现象。&nbsp;另外，燃气灶的开关旋钮、喷嘴及点火装置的安装位置必须准确无误，通气点火时，每次都应使燃气点燃起火，点火后4秒内火焰应燃遍全部火孔门。火焰燃烧时应均匀稳定呈青蓝色，无黄火、红火现象。\r\n	</p>\r\n	<p>\r\n		第2条：&nbsp;台式”“嵌入”有讲究\r\n	</p>\r\n	<p>\r\n		&nbsp;&nbsp;&nbsp; 很多家庭还会为选择台式还是嵌入式的燃气灶为难，其实，两者各有优劣。&nbsp;台式灶具的优势在点火器，点火强劲、声音清脆的点火器能保证灶具点火的成功率和使用寿命。另外，台式灶具的炉头和分火器也是需要仔细挑选的，经过防锈处理的炉头以及锻压铜的分火器，能保证燃烧的效率和较长的使用寿命。&nbsp;嵌入式灶具的熄火保护装置是当今最先进的离子感应式，它能在0．l秒内感应热量的存在和消失，起到意外熄火自动断气的作用。嵌入式灶具能使厨房看起来更美观，目前市场上嵌入式家用燃气灶主要有不锈钢和玻璃两大类，不锈钢材料结实且耐碰撞，但长期使用后表面光泽性会差一些；玻璃材料比较美观，耐腐蚀和耐磨，但若安装和使用不当会导致爆裂现象的发生，消费者应根据自己的爱好选购不同材料的产品。\r\n	</p>\r\n	<p>\r\n		第3条：&nbsp;燃气灶安全最重要\r\n	</p>\r\n	<p>\r\n		&nbsp;&nbsp;&nbsp; 燃气灶不是一般性商品，其安全性不可忽视。专家指出，劣质产品往往假冒名牌，以假乱真，消费者在选购燃气灶时，一定要仔细鉴别。凡印有名牌产品商标但没有厂名、厂址的必是假货。而没有燃气管理部门出具的检测报告，或检测报告与产品铭牌标识不符的一定是劣质产品。&nbsp;购买了合格产品还要注意合理安全使用，用户在日常使用过程中要定期检查燃气导管的连接是否稳固，燃气导管自身是否有老化和漏气现象。用户还可以根据说明书的提示适时调节位于产品底部的风门，这样能够有效地保证燃气充分燃烧产生很少的一氧化碳有害气体。\r\n	</p>\r\n	<p>\r\n		第4条：&nbsp;选购燃气灶，要点有四条：\r\n	</p>\r\n	<p>\r\n		&nbsp;&nbsp;&nbsp; 1．不同的燃气应选用不同的灶具。购买前要清楚自己家里使用的是哪种燃气，目前上海地区的燃气种类有人工煤气、天然气、液化气及液化气混合气等。&nbsp;\r\n	</p>\r\n	<p>\r\n		&nbsp;&nbsp;&nbsp; 2．查看生产许可证标志。标有生产许可证标志的产品都经过了质检机构的严格检验，售后服务也有保障，购买这类产品就比较放心。一般假冒伪劣产品工艺低劣，制作粗糙，仔细辨认是可以辨识的。&nbsp;\r\n	</p>\r\n	<p>\r\n		&nbsp;&nbsp;&nbsp; 3．要带安全保护装置。目前，上海已规定家用燃气灶必须带熄火保护装置，建议仍在使用不带熄火保护功能燃气灶的用户尽早更新灶具。&nbsp;\r\n	</p>\r\n	<p>\r\n		&nbsp;&nbsp;&nbsp; 4．妥善保存资料凭证。购买时一定要开发票，并妥善保存，一旦发现质量问题，可以凭发票、保修卡等找生产企业维修或更换，或到有关部门投诉解决。购买燃气灶后，必须仔细阅读说明书，正确安装使用。\r\n	</p>\r\n	<p>\r\n		第5条：&nbsp;怎样正确选购燃气灶\r\n	</p>\r\n	<p>\r\n		&nbsp;&nbsp;&nbsp; 燃气灶是生活必需用品，使用次数多，要耐用，因此，必须选购名牌产品，不要贪便宜而购买假冒伪劣产品。任何一种产品都不能保证不要维修，所以必须选购售后服务有保障的产品。燃气灶的炉火一定要纯蓝，炒菜才能快又香，另外点火一定要百发百中。天气潮湿地区要防锈，因此要选择带不锈钢面板和喷锌处理炉头座的燃气炉。要想料理家务更轻松，可选购带有定时装置和不粘油面板的燃气灶；要想使用更安全，可选购带有意外熄火保护装置的燃气灶；要想炒菜更快更火爆，可选购超强火力燃气炉；购买时，请注意燃气灶上标明的燃气种类是否与您使用的气种一致。\r\n	</p>\r\n	<p>\r\n		第6条：&nbsp;怎样正确安装燃气灶\r\n	</p>\r\n	<p>\r\n		&nbsp;&nbsp;&nbsp; 装好燃气灶胶脚及螺丝。清理干净灶具进气口，再将胶管套入接头至槽状处，用管夹夹紧胶管并连接好气源接口，胶管必须用燃气专用胶管，最好不要超过3米，更不能从灶具底下穿过或弯折压扁。燃气灶应安放在空气流通的地方，灶具的侧面及背面应离易燃物0.5米以上，灶面与悬挂物之间应有1米以上距离；放好炉盘和炉头盖，脉冲点火燃气灶应安装一节大号电池，这时灶具就可以使用了\r\n	</p>\r\n	<p>\r\n		第7条：&nbsp;怎样正确使用燃气灶\r\n	</p>\r\n	<p>\r\n		&nbsp;&nbsp;&nbsp; 在密封室内长时间使用时，把门窗打开以流通空气，以防一氧化碳中毒。发生漏气，须停止使用，关闭燃气总开关，打开门窗，流通空气，此时不可点火或开启电器用具，以免火花引燃气体而发生爆炸。灶具使用中或刚使用后，除旋钮以外部位，切勿用手触摸，以免烫伤；使用后，必须将旋钮转至\"关\"的位置，再将燃气总开关关闭。检查有无煮溢物落在炉头上，如有应及时清洗，以保证炉具正常燃烧。脉冲点火燃气灶当点火花变弱或放电速度变慢时，表明要更换电池。不要用坚硬、尖锐物体擦划不锈钢或不沾油面板表面。\r\n	</p>\r\n	<p>\r\n		第8条：&nbsp;进风方式\r\n	</p>\r\n	<p>\r\n		&nbsp;&nbsp;&nbsp; 目前市场上燃气灶的进风方式主要有上进风、下进风和侧进风三种。&nbsp;下进风型：这种灶具是照抄进口灶具而来，为符合国人猛火爆炒的烹调习惯而增大了热负荷及燃烧器，国外这种产品是要求橱柜开孔，或依靠较大的橱柜缝隙来补充燃烧所需的二次空气，同时用于泄漏燃气点火时不可避免　的排出，且小热负荷设计。而国内用户很少知道将橱柜开孔，因而造成燃烧不充分，黄焰、一氧化碳浓度高，且一旦燃气泄漏量较大，就可能造成点火爆燃，导致玻璃面板爆裂。&nbsp;上进风型：这种灶具改进了第一种灶具的缺点，将炉头抬高超过台面，希望从炉头与承液盘的缝隙进入空气。但燃烧时该部位已形成了高温区，冷空气受热膨胀上升，不能由此进入炉头，于是二次空气仍然得不到有效补充，根本上也解决不了黄焰及一氧化碳浓度偏高的问题。这种结构设计，热负荷也不能设计过大大于３．０６千瓦时黄焰很厉害　，热效率较低，不太符合国人对猛火的需求，且高高的炉头使灶具的美观大打折扣，但能降低玻璃面板爆裂率。&nbsp;侧进风型：这种灶具在面板相对低温区安上一个进风器，当燃烧使壳体内的空气减少形成负压时，冷空气会顺着进风器的入口被吸入壳体，不但提供了充足的一次空气和燃烧时所需的二次空气，解决了黄焰的问题，一氧化碳浓度也大大降低，而且泄漏的燃气也可以从这个进气口排出去，即使燃气泄漏出现点火爆燃，气流也可以从进风器尽快地排放出去，迅速降低内压，避免了玻璃面板爆裂。同时，冷空气通过进风器进入炉体，也极大地降低了台面玻璃的温度。该种灶具热负荷可达３．８千瓦。&nbsp;目前市面上嵌入式玻璃面板灶具大多为前两种形式，如果产品质量不过关或安装不当，较易出现燃烧不充分、黄焰、壳体及面板温度高、火力不猛、玻璃面板爆炸等现象。因而消费者一定要选购名牌产品，安装时切记在橱柜上打孔以确保气流畅通。\r\n	</p>\r\n	<p>\r\n		第9条：&nbsp;点火方式\r\n	</p>\r\n	<p>\r\n		&nbsp;&nbsp;&nbsp; 现在燃气灶流行的点火方式有电子脉冲点火和压电陶瓷点火两种。电子脉冲点火消费者一般都很熟悉，就是一般煤气灶上采用的点火装置，扭到某个位置就点着火了，非常简单方便，但这种方式需要换电池。&nbsp;压电陶瓷点火是新技术，最大优点是不需要电池。不过点火的成功率与环境湿度有关，湿度大时不易点着。此外，点火的时候需要按住开关才能打着火，没有电子脉冲点火那么快。\r\n	</p>\r\n	<p>\r\n		第10条：&nbsp;熄火保护方式\r\n	</p>\r\n	<p>\r\n		&nbsp;&nbsp;&nbsp; 为了安全需要，燃气灶的熄火保护装置是非常必须的，相关国家标准对此也有强制性规定。目前市场上常用的熄火保护方式有三种：热敏式、热电式和光电式。&nbsp;热敏式：又称双金属片式。双金属片是由两种不同膨胀系数的金属制合而成，在温度的作用下，膨胀系数大的金属一面会向膨胀系数小的金属一面弯曲，当失去温度时，原已膨胀弯曲的金属又会慢慢恢复到原来的状态，因此双金属片又称为记忆合金。将双金属片用作安全保护装置的传感器，正是利用了双金属片在温度作用下膨胀弯曲的特性。&nbsp;双金属片保护装置的优点是结构简单、成本低。缺点是安装困难，对双金属片的安装位置及旋塞阀和燃气阀的配合都有很高的要求，且热惰性大，开阀及闭阀的时间较长，使用寿命短。&nbsp;热电式：该装置也是利用了燃气燃烧时产生的热能。热电式熄火安全保护装置由热电偶和电磁阀两部分所组成，热电偶是由两种不同的合金材料组合而成。不同的合金材料在温度的作用下会产生不同的热电势，热电偶正是利用不同合金材料在温度的作用下产生的热电势不同制造而成，它利用了不同合金材料的电热差值。&nbsp;热电式安全保护装置结构简单、安装方便、成本低，目前已得到广泛应用。但此种保护装置以热电偶作为热传感器，缺点是热惰性大、反应速度慢，使人感到操作不方便，且使用寿命短，旋塞阀与电磁阀的配合安装精度要求较高。&nbsp;光电式：也称离子感应式。该装置是利用燃气在燃烧时火焰带有离子并具有单向导电特性。这种安全保护方式最早被应用在燃气热水器上，并已由早期的直流感应发展到现在的交流感应，使可靠性得到了大幅度的提高，应用在灶具上还只有三四年的历史。&nbsp;采用离子感应方式的安全保护装置，具有结构简洁、安装方便、灵敏度高、响应速度快、无热情性、可靠性高、功能多、寿命长及成本低等优点。随着消费者对燃气灶使用中安全问题的关注和重视，可以肯定，这是一种很有前途的安全保护装置。如果在此基础上再增加燃气泄漏报警功能、风机联动功能，必将为今后安全燃气灶的发展开创一个新时代。\r\n	</p>\r\n	<p>\r\n		第11条：&nbsp;家用燃气灶选购谨记三部曲\r\n	</p>\r\n	<p>\r\n		&nbsp;&nbsp;&nbsp; 首先，在选购之前必须清楚自己所居住地区究竟使用哪一种燃气。我国城市燃气主要分为三大类：人工煤气、天然气和液化石油气。家用燃气灶产品按照使用气源不同也分为相应的三大类。&nbsp;　　其次，根据家庭的需求来确定安装台式还是嵌入式灶具。目前市场上的嵌入式家用燃气灶最大的区别在于灶面板材料变化比较大，主要有不锈钢和玻璃两大类，还有部分产品选择搪瓷等材料。各种材料都有各自的优缺点。不锈钢材料结实且耐碰撞，但长期使用后表面光泽性会差一些。玻璃材料比较美观耐腐蚀和耐磨，但其耐热性能不如不锈钢材料好。若安装和使用不当还会导致爆裂现象的发生。消费者可以根据自己的爱好选购不同材料的产品。　　另外，要根据自己的生活习惯选购不同热负荷值的家用燃气灶。如果通常的餐饮习惯适合于使用火力比较猛（设计热负荷大）的燃气灶，根据实际使用效果来看，消费者应选择单个炉头设计热负荷在3500W至4000W范围内的产品。　　第三，在选购燃气灶产品时可以通过观察产品包装和外观来大致辨别产品质量。通常情况下优质燃气灶产品其外包装材料结实、说明书与合格证等附件齐全、印刷内容清晰，产品整体结构稳固且分量较重、板材较厚、加工精良、边角处光滑无毛刺。　　最后，需要提醒的是，根据现行有效的国家标准要求，嵌入式家用燃气灶必须有熄火保护安全装置，消费者在购买时一定要注意这一点。\r\n	</p>\r\n</div>', '', '1');

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
INSERT INTO `dili_u_m_cate_content` VALUES ('1', '1424596733', '1424673421', '1', '1', 'intro', '关于我们', '<p style=\"font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;\">\r\n	<p style=\"font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;\">\r\n		&nbsp;<span style=\"line-height:1.5;\"><strong>重庆泓彬醇基燃料有限公司&nbsp;</strong></span><span style=\"line-height:1.5;\">成立于2013年，位于重庆市万盛经济技术开发区煤电化园区，注册资本为2,000.00（万元）,注册号：500110000269576，</span><span style=\"line-height:1.5;\">现处于迅速发展状态,主要经营化工品仓储（不含化学危险品），燃器具及配件销售，机械加工，五金、建材销售。;醇基燃料生产销售、危化品运输（筹建）。&nbsp;</span>\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;\">\r\n		<span style=\"line-height:1.5;\"><span style=\"font-family:Verdana;line-height:24px;background-color:#FFFFFF;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;公司研制开发的醇基节能燃料及灶具，适用于酒店、餐厅、家用、夜排档等。这种新型燃料燃烧充分，无烟无味，无残液残渣，火力猛，温度高，比液化气、柴油节省30%左右！燃料呈液态，在常压下灌装使用，消除了液化气罐的高压易爆炸的安全隐患，燃烧无烟无残留使得整个厨房环境更干净卫生。</span></span>\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;\">\r\n		<span style=\"font-family:Verdana;line-height:24px;background-color:#FFFFFF;\">&nbsp;&nbsp;&nbsp;&nbsp;公司产品通过了国家标准，我们还建立了比国家标准更高、要求更严格的行业标准。另外，我们还取得了储存液态燃料的装置的专利证书和危化品经营许可证。</span>\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;\">\r\n		<span style=\"line-height:1.5;\"><span style=\"font-family:Verdana;line-height:24px;background-color:#FFFFFF;\">&nbsp; &nbsp; &nbsp; &nbsp;我司产品节能环保高效的优势得到众多客户的认可，现在重庆地区我们已经拥有500多家餐馆、酒店、食堂的客户，月供燃料200余吨。公司还在太原、綦江、合川、万州、南川等地区有加盟商，规模正在不断扩大。</span><br />\r\n<span style=\"font-family:Verdana;line-height:24px;background-color:#FFFFFF;\">&nbsp; &nbsp; &nbsp; &nbsp;公司强大的技术力量团队将为您提供及时、完善、周到的服务。我们承诺：将在接到您电话通知的24小时内送油上门。如果有任何问题，我们将在接到您通知后48小时内上门解决处理，特殊紧急情况须更快上门服务。售后服务专线：<span style=\"line-height:28px;\">023-48308085。</span></span></span><span style=\"line-height:1.5;\">欢迎新老客户联系,共谋发展！</span>\r\n	</p>\r\n</p>');
INSERT INTO `dili_u_m_cate_content` VALUES ('2', '1424596859', '1424663771', '1', '1', 'join', '招商加盟', '<strong>重庆泓彬醇基燃料有限公司</strong><span style=\"color:#505050;font-family:Verdana;line-height:24px;background-color:#FFFFFF;\">拥有成熟的技术，可以为您提供更高效的产品。仅仅重庆地区我们就自主开拓了500多家客户，包括大家熟悉的“祖母炖品”、“田园印象”、“厨品楼”、“东海渔港”、“张大胡子片片鱼”、“内江风味菜”、“世外桃源”、“乡村菜馆”、“春回大地”、“钱苑食府”、“自贡好吃客”、“贵州芋儿鸡”等等。每位客户对我公司产品评价都高于同行其他商家。如果您有意向加盟我公司，我们可以带您去实地参观考察，让您能够亲身体验我们的产品，并亲手操作，为您熟悉我们的产品提供更便捷的方式。</span><br />\r\n<span style=\"color:#505050;font-family:Verdana;line-height:24px;background-color:#FFFFFF;\">加盟我公司您无须承担任何风险，总公司会为您提供相关产品以及配货，并参与经营，您只需负责当地销售，送油，调试以及售后服务等工作。公司强大的生产与销售以及完善的售后一条龙服务给您的代理和销售带来强有力地支持！</span><br />\r\n<span style=\"color:#505050;font-family:Verdana;line-height:24px;background-color:#FFFFFF;\">加盟条件：</span><br />\r\n<span style=\"color:#505050;font-family:Verdana;line-height:24px;background-color:#FFFFFF;\">1，&nbsp;有自主销售能力</span><br />\r\n<span style=\"color:#505050;font-family:Verdana;line-height:24px;background-color:#FFFFFF;\">2，&nbsp;要懂得保护公司品牌，维护品牌利益</span><br />\r\n<span style=\"color:#505050;font-family:Verdana;line-height:24px;background-color:#FFFFFF;\">3，&nbsp;良好的销售渠道</span><br />\r\n<span style=\"color:#505050;font-family:Verdana;line-height:24px;background-color:#FFFFFF;\">加盟流程：</span><br />\r\n<span style=\"color:#505050;font-family:Verdana;line-height:24px;background-color:#FFFFFF;\">1，&nbsp;首先需报名参与公司培训，了解公司产品</span><br />\r\n<span style=\"color:#505050;font-family:Verdana;line-height:24px;background-color:#FFFFFF;\">2，&nbsp;有意向加盟者可与我们的工作人员联系，详谈加盟的各项事情。无论您有何疑问，我们都将尽心为您详细解答</span><br />\r\n<span style=\"color:#505050;font-family:Verdana;line-height:24px;background-color:#FFFFFF;\">3，&nbsp;满意者可与公司签订加盟协议，正式加盟我们公司</span>');
INSERT INTO `dili_u_m_cate_content` VALUES ('3', '1424597137', '1424662499', '1', '1', 'contact', '联系我们', '<strong>重庆泓彬醇基燃料有限公司<br />\r\n</strong><span style=\"color:#505050;font-family:Verdana;font-size:14px;line-height:28px;\">联系人&nbsp;&nbsp; ：毛先生</span><br />\r\n<span style=\"color:#505050;font-family:Verdana;font-size:14px;line-height:28px;\">联系手机：13368088888</span><br />\r\n<span style=\"color:#505050;font-family:Verdana;font-size:14px;line-height:28px;\">服务热线：023-48308085</span><br />\r\n<span style=\"color:#505050;font-family:Verdana;font-size:14px;line-height:28px;\">企业邮箱：maoxigui@foxmail.com</span><br />\r\n<p>\r\n	<span style=\"color:#505050;font-family:Verdana;font-size:14px;line-height:28px;\">公司地址：<span style=\"color:#505050;font-family:Verdana;font-size:14px;line-height:28px;\">重庆市万盛经济技术开发区煤化园区</span></span> \r\n</p>\r\n<p>\r\n	<iframe src=\"http://www.dilicompany.com/admin/templates/default/js/kindeditor/plugins/baidumap/index.html?center=106.786539%2C28.841179&zoom=17&width=558&height=360&markers=106.786539%2C28.841179&markerStyles=l%2CA\" frameborder=\"0\" style=\"width:560px;height:362px;\">\r\n	</iframe>\r\n</p>');

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
INSERT INTO `dili_u_m_page_data` VALUES ('1', '1424076273', '1424673346', '1', '1', '公司简介', '<p style=\"font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;\">\r\n	<span>&nbsp;</span><span style=\"line-height:1.5;\"><strong>重庆泓彬醇基燃料有限公司&nbsp;</strong></span><span style=\"line-height:1.5;\">成立于2013年，位于重庆市万盛经济技术开发区煤电化园区，注册资本为2,000.00（万元）,注册号：500110000269576，</span><span style=\"line-height:1.5;\">现处于迅速发展状态,主要经营化工品仓储（不含化学危险品），燃器具及配件销售，机械加工，五金、建材销售。;醇基燃料生产销售、危化品运输（筹建）。&nbsp;</span> \r\n</p>\r\n<p style=\"font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;\">\r\n	<span style=\"line-height:1.5;\"><span style=\"color:#505050;font-family:Verdana;line-height:24px;background-color:#FFFFFF;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;公司研制开发的醇基节能燃料及灶具，适用于酒店、餐厅、家用、夜排档等。这种新型燃料燃烧充分，无烟无味，无残液残渣，火力猛，温度高，比液化气、柴油节省30%左右！燃料呈液态，在常压下灌装使用，消除了液化气罐的高压易爆炸的安全隐患，燃烧无烟无残留使得整个厨房环境更干净卫生。</span></span>\r\n</p>\r\n<p style=\"font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;\">\r\n	<span style=\"font-family:Verdana;line-height:24px;background-color:#FFFFFF;\">&nbsp;&nbsp;&nbsp;&nbsp;公司产品通过了国家标准，我们还建立了比国家标准更高、要求更严格的行业标准。另外，我们还取得了储存液态燃料的装置的专利证书和危化品经营许可证。</span>\r\n</p>\r\n<p style=\"font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;\">\r\n	<span style=\"line-height:1.5;\"> <span style=\"color:#505050;font-family:Verdana;line-height:24px;background-color:#FFFFFF;\">&nbsp; &nbsp; &nbsp; &nbsp;我司产品节能环保高效的优势得到众多客户的认可，现在重庆地区我们已经拥有500多家餐馆、酒店、食堂的客户，月供燃料200余吨。公司还在太原、綦江、合川、万州、南川等地区有加盟商，规模正在不断扩大。</span><br />\r\n<span style=\"color:#505050;font-family:Verdana;line-height:24px;background-color:#FFFFFF;\">&nbsp; &nbsp; &nbsp; &nbsp;公司强大的技术力量团队将为您提供及时、完善、周到的服务。我们承诺：将在接到您电话通知的24小时内送油上门。如果有任何问题，我们将在接到您通知后48小时内上门解决处理，特殊紧急情况须更快上门服务。售后服务专线：<span style=\"color:#505050;font-family:Verdana;font-size:14px;line-height:28px;\">023-48308085。</span></span></span><span style=\"line-height:1.5;\">欢迎新老客户联系,共谋发展！</span> \r\n</p>\r\n<p style=\"font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;\">\r\n	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 我们的宗旨：诚信，创新，利益双赢。</span> \r\n</p>', 'company_des');
INSERT INTO `dili_u_m_page_data` VALUES ('2', '1424077372', '1424663381', '1', '1', '联系我们', '<strong>重庆泓彬醇基燃料有限公司<br />\r\n</strong><span style=\"color:#505050;font-family:Verdana;font-size:14px;line-height:28px;\">联系人&nbsp;&nbsp; ：毛先生</span><br />\r\n<span style=\"color:#505050;font-family:Verdana;font-size:14px;line-height:28px;\">联系手机：133 6832 3998</span><br />\r\n<span style=\"color:#505050;font-family:Verdana;font-size:14px;line-height:28px;\">服务热线：023-48308085</span><br />\r\n<span style=\"color:#505050;font-family:Verdana;font-size:14px;line-height:28px;\">企业邮箱：maoxigui@foxmail.com</span><br />\r\n<span style=\"color:#505050;font-family:Verdana;font-size:14px;line-height:28px;\">公司地址：重庆市万盛经济技术开发区煤化园区</span>', 'contact_us');

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
