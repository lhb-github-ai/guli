/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 80018
Source Host           : localhost:3306
Source Database       : guli

Target Server Type    : MYSQL
Target Server Version : 80018
File Encoding         : 65001

Date: 2020-08-14 12:10:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for acl_permission
-- ----------------------------
DROP TABLE IF EXISTS `acl_permission`;
CREATE TABLE `acl_permission` (
  `id` char(19) NOT NULL DEFAULT '' COMMENT '编号',
  `pid` char(19) NOT NULL DEFAULT '' COMMENT '所属上级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '名称',
  `type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '类型(1:菜单,2:按钮)',
  `permission_value` varchar(50) DEFAULT NULL COMMENT '权限值',
  `path` varchar(100) DEFAULT NULL COMMENT '访问路径',
  `component` varchar(100) DEFAULT NULL COMMENT '组件路径',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态(0:禁止,1:正常)',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='权限';

-- ----------------------------
-- Records of acl_permission
-- ----------------------------
INSERT INTO `acl_permission` VALUES ('1', '0', '全部数据', '0', null, null, null, null, null, '0', '2019-11-15 17:13:06', '2019-11-15 17:13:06');
INSERT INTO `acl_permission` VALUES ('1195268474480156673', '1', '权限管理', '1', null, '/acl', 'Layout', null, null, '0', '2019-11-15 17:13:06', '2019-11-18 13:54:25');
INSERT INTO `acl_permission` VALUES ('1195268616021139457', '1195268474480156673', '用户管理', '1', null, 'user/list', '/acl/user/list', null, null, '0', '2019-11-15 17:13:40', '2019-11-18 13:53:12');
INSERT INTO `acl_permission` VALUES ('1195268788138598401', '1195268474480156673', '角色管理', '1', null, 'role/list', '/acl/role/list', null, null, '0', '2019-11-15 17:14:21', '2019-11-15 17:14:21');
INSERT INTO `acl_permission` VALUES ('1195268893830864898', '1195268474480156673', '菜单管理', '1', null, 'menu/list', '/acl/menu/list', null, null, '0', '2019-11-15 17:14:46', '2019-11-15 17:14:46');
INSERT INTO `acl_permission` VALUES ('1195269143060602882', '1195268616021139457', '查看', '2', 'user.list', '', '', null, null, '0', '2019-11-15 17:15:45', '2019-11-17 21:57:16');
INSERT INTO `acl_permission` VALUES ('1195269295926206466', '1195268616021139457', '添加', '2', 'user.add', 'user/add', '/acl/user/form', null, null, '0', '2019-11-15 17:16:22', '2019-11-15 17:16:22');
INSERT INTO `acl_permission` VALUES ('1195269473479483394', '1195268616021139457', '修改', '2', 'user.update', 'user/update/:id', '/acl/user/form', null, null, '0', '2019-11-15 17:17:04', '2019-11-15 17:17:04');
INSERT INTO `acl_permission` VALUES ('1195269547269873666', '1195268616021139457', '删除', '2', 'user.remove', '', '', null, null, '0', '2019-11-15 17:17:22', '2019-11-15 17:17:22');
INSERT INTO `acl_permission` VALUES ('1195269821262782465', '1195268788138598401', '修改', '2', 'role.update', 'role/update/:id', '/acl/role/form', null, null, '0', '2019-11-15 17:18:27', '2019-11-15 17:19:53');
INSERT INTO `acl_permission` VALUES ('1195269903542444034', '1195268788138598401', '查看', '2', 'role.list', '', '', null, null, '0', '2019-11-15 17:18:47', '2019-11-15 17:18:47');
INSERT INTO `acl_permission` VALUES ('1195270037005197313', '1195268788138598401', '添加', '2', 'role.add', 'role/add', '/acl/role/form', null, null, '0', '2019-11-15 17:19:19', '2019-11-18 11:05:42');
INSERT INTO `acl_permission` VALUES ('1195270442602782721', '1195268788138598401', '删除', '2', 'role.remove', '', '', null, null, '0', '2019-11-15 17:20:55', '2019-11-15 17:20:55');
INSERT INTO `acl_permission` VALUES ('1195270621548568578', '1195268788138598401', '角色权限', '2', 'role.acl', 'role/distribution/:id', '/acl/role/roleForm', null, null, '0', '2019-11-15 17:21:38', '2019-11-15 17:21:38');
INSERT INTO `acl_permission` VALUES ('1195270744097742849', '1195268893830864898', '查看', '2', 'permission.list', '', '', null, null, '0', '2019-11-15 17:22:07', '2019-11-15 17:22:07');
INSERT INTO `acl_permission` VALUES ('1195270810560684034', '1195268893830864898', '添加', '2', 'permission.add', '', '', null, null, '0', '2019-11-15 17:22:23', '2019-11-15 17:22:23');
INSERT INTO `acl_permission` VALUES ('1195270862100291586', '1195268893830864898', '修改', '2', 'permission.update', '', '', null, null, '0', '2019-11-15 17:22:35', '2019-11-15 17:22:35');
INSERT INTO `acl_permission` VALUES ('1195270887933009922', '1195268893830864898', '删除', '2', 'permission.remove', '', '', null, null, '0', '2019-11-15 17:22:41', '2019-11-15 17:22:41');
INSERT INTO `acl_permission` VALUES ('1195349439240048642', '1', '讲师管理', '1', null, '/teacher', 'Layout', null, null, '0', '2019-11-15 22:34:49', '2019-11-15 22:34:49');
INSERT INTO `acl_permission` VALUES ('1195349699995734017', '1195349439240048642', '讲师列表', '1', null, 'table', '/edu/teacher/list', null, null, '0', '2019-11-15 22:35:52', '2019-11-15 22:35:52');
INSERT INTO `acl_permission` VALUES ('1195349810561781761', '1195349439240048642', '添加讲师', '1', null, 'save', '/edu/teacher/save', null, null, '0', '2019-11-15 22:36:18', '2019-11-15 22:36:18');
INSERT INTO `acl_permission` VALUES ('1195349876252971010', '1195349810561781761', '添加', '2', 'teacher.add', '', '', null, null, '0', '2019-11-15 22:36:34', '2019-11-15 22:36:34');
INSERT INTO `acl_permission` VALUES ('1195349979797753857', '1195349699995734017', '查看', '2', 'teacher.list', '', '', null, null, '0', '2019-11-15 22:36:58', '2019-11-15 22:36:58');
INSERT INTO `acl_permission` VALUES ('1195350117270261762', '1195349699995734017', '修改', '2', 'teacher.update', 'edit/:id', '/edu/teacher/save', null, null, '0', '2019-11-15 22:37:31', '2019-11-15 22:37:31');
INSERT INTO `acl_permission` VALUES ('1195350188359520258', '1195349699995734017', '删除', '2', 'teacher.remove', '', '', null, null, '0', '2019-11-15 22:37:48', '2019-11-15 22:37:48');
INSERT INTO `acl_permission` VALUES ('1195350299365969922', '1', '课程分类', '1', null, '/subject', 'Layout', null, null, '0', '2019-11-15 22:38:15', '2019-11-15 22:38:15');
INSERT INTO `acl_permission` VALUES ('1195350397751758850', '1195350299365969922', '课程分类列表', '1', null, 'list', '/edu/subject/list', null, null, '0', '2019-11-15 22:38:38', '2019-11-15 22:38:38');
INSERT INTO `acl_permission` VALUES ('1195350500512206850', '1195350299365969922', '导入课程分类', '1', null, 'save', '/edu/subject/save', null, null, '0', '2019-11-15 22:39:03', '2019-11-15 22:39:03');
INSERT INTO `acl_permission` VALUES ('1195350612172967938', '1195350397751758850', '查看', '2', 'subject.list', '', '', null, null, '0', '2019-11-15 22:39:29', '2019-11-15 22:39:29');
INSERT INTO `acl_permission` VALUES ('1195350687590748161', '1195350500512206850', '导入', '2', 'subject.import', '', '', null, null, '0', '2019-11-15 22:39:47', '2019-11-15 22:39:47');
INSERT INTO `acl_permission` VALUES ('1195350831744782337', '1', '课程管理', '1', null, '/course', 'Layout', null, null, '0', '2019-11-15 22:40:21', '2019-11-15 22:40:21');
INSERT INTO `acl_permission` VALUES ('1195350919074385921', '1195350831744782337', '课程列表', '1', null, 'list', '/edu/course/list', null, null, '0', '2019-11-15 22:40:42', '2019-11-15 22:40:42');
INSERT INTO `acl_permission` VALUES ('1195351020463296513', '1195350831744782337', '发布课程', '1', null, 'info', '/edu/course/info', null, null, '0', '2019-11-15 22:41:06', '2019-11-15 22:41:06');
INSERT INTO `acl_permission` VALUES ('1195351159672246274', '1195350919074385921', '完成发布', '2', 'course.publish', 'publish/:id', '/edu/course/publish', null, null, '0', '2019-11-15 22:41:40', '2019-11-15 22:44:01');
INSERT INTO `acl_permission` VALUES ('1195351326706208770', '1195350919074385921', '编辑课程', '2', 'course.update', 'info/:id', '/edu/course/info', null, null, '0', '2019-11-15 22:42:19', '2019-11-15 22:42:19');
INSERT INTO `acl_permission` VALUES ('1195351566221938690', '1195350919074385921', '编辑课程大纲', '2', 'chapter.update', 'chapter/:id', '/edu/course/chapter', null, null, '0', '2019-11-15 22:43:17', '2019-11-15 22:43:17');
INSERT INTO `acl_permission` VALUES ('1195351862889254913', '1', '统计分析', '1', null, '/sta', 'Layout', null, null, '0', '2019-11-15 22:44:27', '2019-11-15 22:44:27');
INSERT INTO `acl_permission` VALUES ('1195351968841568257', '1195351862889254913', '生成统计', '1', null, 'create', '/sta/create', null, null, '0', '2019-11-15 22:44:53', '2019-11-15 22:44:53');
INSERT INTO `acl_permission` VALUES ('1195352054917074946', '1195351862889254913', '统计图表', '1', null, 'show', '/sta/show', null, null, '0', '2019-11-15 22:45:13', '2019-11-15 22:45:13');
INSERT INTO `acl_permission` VALUES ('1195352127734386690', '1195352054917074946', '查看', '2', 'daily.list', '', '', null, null, '0', '2019-11-15 22:45:30', '2019-11-15 22:45:30');
INSERT INTO `acl_permission` VALUES ('1195352215768633346', '1195351968841568257', '生成', '2', 'daily.add', '', '', null, null, '0', '2019-11-15 22:45:51', '2019-11-15 22:45:51');
INSERT INTO `acl_permission` VALUES ('1195352547621965825', '1', 'CMS管理', '1', null, '/cms', 'Layout', null, null, '0', '2019-11-15 22:47:11', '2019-11-18 10:51:46');
INSERT INTO `acl_permission` VALUES ('1195352856645701633', '1195353513549205505', '查看', '2', 'banner.list', '', null, null, null, '0', '2019-11-15 22:48:24', '2019-11-15 22:48:24');
INSERT INTO `acl_permission` VALUES ('1195352909401657346', '1195353513549205505', '添加', '2', 'banner.add', 'banner/add', '/cms/banner/form', null, null, '0', '2019-11-15 22:48:37', '2019-11-18 10:52:10');
INSERT INTO `acl_permission` VALUES ('1195353051395624961', '1195353513549205505', '修改', '2', 'banner.update', 'banner/update/:id', '/cms/banner/form', null, null, '0', '2019-11-15 22:49:11', '2019-11-18 10:52:05');
INSERT INTO `acl_permission` VALUES ('1195353513549205505', '1195352547621965825', 'Bander列表', '1', null, 'banner/list', '/cms/banner/list', null, null, '0', '2019-11-15 22:51:01', '2019-11-18 10:51:29');
INSERT INTO `acl_permission` VALUES ('1195353672110673921', '1195353513549205505', '删除', '2', 'banner.remove', '', '', null, null, '0', '2019-11-15 22:51:39', '2019-11-15 22:51:39');
INSERT INTO `acl_permission` VALUES ('1195354076890370050', '1', '订单管理', '1', null, '/order', 'Layout', null, null, '0', '2019-11-15 22:53:15', '2019-11-15 22:53:15');
INSERT INTO `acl_permission` VALUES ('1195354153482555393', '1195354076890370050', '订单列表', '1', null, 'list', '/order/list', null, null, '0', '2019-11-15 22:53:33', '2019-11-15 22:53:58');
INSERT INTO `acl_permission` VALUES ('1195354315093282817', '1195354153482555393', '查看', '2', 'order.list', '', '', null, null, '0', '2019-11-15 22:54:12', '2019-11-15 22:54:12');
INSERT INTO `acl_permission` VALUES ('1196301740985311234', '1195268616021139457', '分配角色', '2', 'user.assgin', 'user/role/:id', '/acl/user/roleForm', null, null, '0', '2019-11-18 13:38:56', '2019-11-18 13:38:56');

-- ----------------------------
-- Table structure for acl_role
-- ----------------------------
DROP TABLE IF EXISTS `acl_role`;
CREATE TABLE `acl_role` (
  `id` char(19) NOT NULL DEFAULT '' COMMENT '角色id',
  `role_name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_code` varchar(20) DEFAULT NULL COMMENT '角色编码',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acl_role
-- ----------------------------
INSERT INTO `acl_role` VALUES ('1', '普通管理员', null, null, '0', '2019-11-11 13:09:32', '2019-11-18 10:27:18');
INSERT INTO `acl_role` VALUES ('1193757683205607426', '课程管理员', null, null, '0', '2019-11-11 13:09:45', '2019-11-18 10:25:44');
INSERT INTO `acl_role` VALUES ('1293826493742329857', '讲师管理员', null, null, '0', '2020-08-13 16:27:29', '2020-08-13 17:24:09');
INSERT INTO `acl_role` VALUES ('1293839529580441601', '111111', null, null, '0', '2020-08-13 17:19:17', '2020-08-13 17:19:17');

-- ----------------------------
-- Table structure for acl_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `acl_role_permission`;
CREATE TABLE `acl_role_permission` (
  `id` char(19) NOT NULL DEFAULT '',
  `role_id` char(19) NOT NULL DEFAULT '',
  `permission_id` char(19) NOT NULL DEFAULT '',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限';

-- ----------------------------
-- Records of acl_role_permission
-- ----------------------------
INSERT INTO `acl_role_permission` VALUES ('1293841416660725762', '1193757683205607426', '1', '0', '2020-08-13 17:26:47', '2020-08-13 17:26:47');
INSERT INTO `acl_role_permission` VALUES ('1293841416660725763', '1193757683205607426', '1195350299365969922', '0', '2020-08-13 17:26:47', '2020-08-13 17:26:47');
INSERT INTO `acl_role_permission` VALUES ('1293841416660725764', '1193757683205607426', '1195350397751758850', '0', '2020-08-13 17:26:47', '2020-08-13 17:26:47');
INSERT INTO `acl_role_permission` VALUES ('1293841416660725765', '1193757683205607426', '1195350612172967938', '0', '2020-08-13 17:26:47', '2020-08-13 17:26:47');
INSERT INTO `acl_role_permission` VALUES ('1293841416660725766', '1193757683205607426', '1195350500512206850', '0', '2020-08-13 17:26:47', '2020-08-13 17:26:47');
INSERT INTO `acl_role_permission` VALUES ('1293841416660725767', '1193757683205607426', '1195350687590748161', '0', '2020-08-13 17:26:47', '2020-08-13 17:26:47');
INSERT INTO `acl_role_permission` VALUES ('1293841416660725768', '1193757683205607426', '1195350831744782337', '0', '2020-08-13 17:26:47', '2020-08-13 17:26:47');
INSERT INTO `acl_role_permission` VALUES ('1293841416660725769', '1193757683205607426', '1195350919074385921', '0', '2020-08-13 17:26:47', '2020-08-13 17:26:47');
INSERT INTO `acl_role_permission` VALUES ('1293841416660725770', '1193757683205607426', '1195351159672246274', '0', '2020-08-13 17:26:47', '2020-08-13 17:26:47');
INSERT INTO `acl_role_permission` VALUES ('1293841416669114370', '1193757683205607426', '1195351326706208770', '0', '2020-08-13 17:26:47', '2020-08-13 17:26:47');
INSERT INTO `acl_role_permission` VALUES ('1293841416669114371', '1193757683205607426', '1195351566221938690', '0', '2020-08-13 17:26:47', '2020-08-13 17:26:47');
INSERT INTO `acl_role_permission` VALUES ('1293841416669114372', '1193757683205607426', '1195351020463296513', '0', '2020-08-13 17:26:47', '2020-08-13 17:26:47');
INSERT INTO `acl_role_permission` VALUES ('1293849680198799361', '1293826493742329857', '1', '0', '2020-08-13 17:59:37', '2020-08-13 17:59:37');
INSERT INTO `acl_role_permission` VALUES ('1293849680207187970', '1293826493742329857', '1195349439240048642', '0', '2020-08-13 17:59:37', '2020-08-13 17:59:37');
INSERT INTO `acl_role_permission` VALUES ('1293849680207187971', '1293826493742329857', '1195349699995734017', '0', '2020-08-13 17:59:37', '2020-08-13 17:59:37');
INSERT INTO `acl_role_permission` VALUES ('1293849680207187972', '1293826493742329857', '1195349979797753857', '0', '2020-08-13 17:59:37', '2020-08-13 17:59:37');
INSERT INTO `acl_role_permission` VALUES ('1293849680207187973', '1293826493742329857', '1195350117270261762', '0', '2020-08-13 17:59:37', '2020-08-13 17:59:37');
INSERT INTO `acl_role_permission` VALUES ('1293849680207187974', '1293826493742329857', '1195350188359520258', '0', '2020-08-13 17:59:37', '2020-08-13 17:59:37');
INSERT INTO `acl_role_permission` VALUES ('1293849680207187975', '1293826493742329857', '1195349810561781761', '0', '2020-08-13 17:59:37', '2020-08-13 17:59:37');
INSERT INTO `acl_role_permission` VALUES ('1293849680207187976', '1293826493742329857', '1195349876252971010', '0', '2020-08-13 17:59:37', '2020-08-13 17:59:37');

-- ----------------------------
-- Table structure for acl_user
-- ----------------------------
DROP TABLE IF EXISTS `acl_user`;
CREATE TABLE `acl_user` (
  `id` char(19) NOT NULL COMMENT '会员id',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '微信openid',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `nick_name` varchar(50) DEFAULT NULL COMMENT '昵称',
  `salt` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `token` varchar(100) DEFAULT NULL COMMENT '用户签名',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表';

-- ----------------------------
-- Records of acl_user
-- ----------------------------
INSERT INTO `acl_user` VALUES ('1', 'admin', '96e79218965eb72c92a549dd5a330112', 'admin', '', null, '0', '2019-11-01 10:39:47', '2019-11-01 10:39:47');
INSERT INTO `acl_user` VALUES ('1293826678719524865', 'asd', 'e10adc3949ba59abbe56e057f20f883e', 'asd', null, null, '0', '2020-08-13 16:28:13', '2020-08-13 16:28:13');
INSERT INTO `acl_user` VALUES ('1293839713794273281', 'lee', 'e10adc3949ba59abbe56e057f20f883e', 'lee', null, null, '0', '2020-08-13 17:20:01', '2020-08-13 17:20:01');
INSERT INTO `acl_user` VALUES ('1293840108851572737', 'lisi', 'e10adc3949ba59abbe56e057f20f883e', '李四', null, null, '0', '2020-08-13 17:21:35', '2020-08-13 17:21:35');

-- ----------------------------
-- Table structure for acl_user_role
-- ----------------------------
DROP TABLE IF EXISTS `acl_user_role`;
CREATE TABLE `acl_user_role` (
  `id` char(19) NOT NULL DEFAULT '' COMMENT '主键id',
  `role_id` char(19) NOT NULL DEFAULT '0' COMMENT '角色id',
  `user_id` char(19) NOT NULL DEFAULT '0' COMMENT '用户id',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acl_user_role
-- ----------------------------
INSERT INTO `acl_user_role` VALUES ('1293841521455411202', '1193757683205607426', '1293826678719524865', '0', '2020-08-13 17:27:12', '2020-08-13 17:27:12');
INSERT INTO `acl_user_role` VALUES ('1293842990686547970', '1293826493742329857', '1293839713794273281', '0', '2020-08-13 17:33:02', '2020-08-13 17:33:02');

-- ----------------------------
-- Table structure for crm_banner
-- ----------------------------
DROP TABLE IF EXISTS `crm_banner`;
CREATE TABLE `crm_banner` (
  `id` char(19) NOT NULL DEFAULT '' COMMENT 'ID',
  `title` varchar(20) DEFAULT '' COMMENT '标题',
  `image_url` varchar(500) NOT NULL DEFAULT '' COMMENT '图片地址',
  `link_url` varchar(500) DEFAULT '' COMMENT '链接地址',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='首页banner表';

-- ----------------------------
-- Records of crm_banner
-- ----------------------------
INSERT INTO `crm_banner` VALUES ('1194556896025845762', 'test1', 'https://online-teach-file.oss-cn-beijing.aliyuncs.com/cms/2019/11/14/297acd3b-b592-4cfb-a446-a28310369675.jpg', '/course', '1', '0', '2019-11-13 18:05:32', '2019-11-18 10:28:22');
INSERT INTO `crm_banner` VALUES ('1194607458461216769', 'test2', 'https://online-teach-file.oss-cn-beijing.aliyuncs.com/cms/2019/11/13/8f80790d-d736-4842-a6a4-4dcb0d684d4e.jpg', '/teacher', '2', '0', '2019-11-13 21:26:27', '2019-11-14 09:12:15');

-- ----------------------------
-- Table structure for edu_chapter
-- ----------------------------
DROP TABLE IF EXISTS `edu_chapter`;
CREATE TABLE `edu_chapter` (
  `id` char(19) NOT NULL COMMENT '章节ID',
  `course_id` char(19) NOT NULL COMMENT '课程ID',
  `title` varchar(50) NOT NULL COMMENT '章节名称',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '显示排序',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='课程';

-- ----------------------------
-- Records of edu_chapter
-- ----------------------------
INSERT INTO `edu_chapter` VALUES ('1289477499608125442', '1289474026963591170', '第一章', '4', '2020-08-01 16:26:08', '2020-08-01 16:26:08');
INSERT INTO `edu_chapter` VALUES ('1289510267171917825', '1289478003239178242', '丢i在', '1', '2020-08-01 18:36:20', '2020-08-01 18:36:20');
INSERT INTO `edu_chapter` VALUES ('1289843780656054273', '1289843740927606786', '第一章：视频1', '1', '2020-08-02 16:41:36', '2020-08-02 16:41:36');
INSERT INTO `edu_chapter` VALUES ('1289843889833787394', '1289843740927606786', '第二章：视频2', '1', '2020-08-02 16:42:02', '2020-08-02 16:42:02');
INSERT INTO `edu_chapter` VALUES ('1291572702452154370', '1291572591215017986', '第一章：java基础', '1', '2020-08-07 11:11:43', '2020-08-07 11:11:43');
INSERT INTO `edu_chapter` VALUES ('1291572790889054209', '1291572591215017986', '第二章：java实战', '0', '2020-08-07 11:12:04', '2020-08-07 11:12:04');
INSERT INTO `edu_chapter` VALUES ('1291578497965355009', '1291578418688815106', '第一章：C++基础', '1', '2020-08-07 11:34:45', '2020-08-07 11:34:45');
INSERT INTO `edu_chapter` VALUES ('1291579860443066370', '1291579791601954818', '第一章:vue基础', '1', '2020-08-07 11:40:10', '2020-08-07 11:40:10');

-- ----------------------------
-- Table structure for edu_comment
-- ----------------------------
DROP TABLE IF EXISTS `edu_comment`;
CREATE TABLE `edu_comment` (
  `id` char(19) NOT NULL COMMENT '讲师ID',
  `course_id` varchar(19) NOT NULL DEFAULT '' COMMENT '课程id',
  `teacher_id` char(19) NOT NULL DEFAULT '' COMMENT '讲师id',
  `member_id` varchar(19) NOT NULL DEFAULT '' COMMENT '会员id',
  `nickname` varchar(50) DEFAULT NULL COMMENT '会员昵称',
  `avatar` varchar(255) DEFAULT NULL COMMENT '会员头像',
  `content` varchar(500) DEFAULT NULL COMMENT '评论内容',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_course_id` (`course_id`),
  KEY `idx_teacher_id` (`teacher_id`),
  KEY `idx_member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='评论';

-- ----------------------------
-- Records of edu_comment
-- ----------------------------
INSERT INTO `edu_comment` VALUES ('1194499162790211585', '1289843740927606786', '1189389726308478977', '1', '小三123', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', '课程很好', '0', '2019-11-13 14:16:08', '2019-11-13 14:16:08');
INSERT INTO `edu_comment` VALUES ('1194898406466420738', '1289843740927606786', '1189389726308478977', '1', '小三123', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', '11', '0', '2019-11-14 16:42:35', '2019-11-14 16:42:35');
INSERT INTO `edu_comment` VALUES ('1194898484388200450', '1289843740927606786', '1189389726308478977', '1', '小三123', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', '111', '0', '2019-11-14 16:42:53', '2019-11-14 16:42:53');
INSERT INTO `edu_comment` VALUES ('1195251020861317122', '1289843740927606786', '1189389726308478977', '1', null, null, '2233', '0', '2019-11-15 16:03:45', '2019-11-15 16:03:45');
INSERT INTO `edu_comment` VALUES ('1292027103599951874', '1289843740927606786', '1189426437876985857', '1291271776835244034', 'we are a team', 'http://thirdwx.qlogo.cn/mmopen/vi_32/ibF9b2XbrwbpHuAicibJ5IjZYzGVnfP0A8ciaQibiagqa3YHDmx9KbjgLx26ibBGluAIUn5qCxKFah1YbBftbd4HedF2g/132', '123', '0', '2020-08-08 17:17:21', '2020-08-08 17:17:21');
INSERT INTO `edu_comment` VALUES ('1292028089441746946', '1289843740927606786', '1189426437876985857', '1291271776835244034', 'we are a team', 'http://thirdwx.qlogo.cn/mmopen/vi_32/ibF9b2XbrwbpHuAicibJ5IjZYzGVnfP0A8ciaQibiagqa3YHDmx9KbjgLx26ibBGluAIUn5qCxKFah1YbBftbd4HedF2g/132', '312', '0', '2020-08-08 17:21:16', '2020-08-08 17:21:16');
INSERT INTO `edu_comment` VALUES ('1292028126339039233', '1289843740927606786', '1189426437876985857', '1291271776835244034', 'we are a team', 'http://thirdwx.qlogo.cn/mmopen/vi_32/ibF9b2XbrwbpHuAicibJ5IjZYzGVnfP0A8ciaQibiagqa3YHDmx9KbjgLx26ibBGluAIUn5qCxKFah1YbBftbd4HedF2g/132', 'ewq', '0', '2020-08-08 17:21:25', '2020-08-08 17:21:25');
INSERT INTO `edu_comment` VALUES ('1292028191480774658', '1291572591215017986', '1286257727579889666', '1291271776835244034', 'we are a team', 'http://thirdwx.qlogo.cn/mmopen/vi_32/ibF9b2XbrwbpHuAicibJ5IjZYzGVnfP0A8ciaQibiagqa3YHDmx9KbjgLx26ibBGluAIUn5qCxKFah1YbBftbd4HedF2g/132', '1312312', '0', '2020-08-08 17:21:40', '2020-08-08 17:21:40');
INSERT INTO `edu_comment` VALUES ('1292030563338715137', '1291572591215017986', '1286257727579889666', '1290608642432757762', 'lee', 'https://eduguli-0409.oss-cn-beijing.aliyuncs.com/2020/07/23/0038055ced1a49ef95f54aead68b685cfile.png', '真棒 真厉害', '0', '2020-08-08 17:31:06', '2020-08-08 17:31:06');

-- ----------------------------
-- Table structure for edu_course
-- ----------------------------
DROP TABLE IF EXISTS `edu_course`;
CREATE TABLE `edu_course` (
  `id` char(19) NOT NULL COMMENT '课程ID',
  `teacher_id` char(19) NOT NULL COMMENT '课程讲师ID',
  `subject_id` char(19) NOT NULL COMMENT '课程专业ID',
  `subject_parent_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '课程专业父级ID',
  `title` varchar(50) NOT NULL COMMENT '课程标题',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '课程销售价格，设置为0则可免费观看',
  `lesson_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '总课时',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程封面图片路径',
  `buy_count` bigint(10) unsigned NOT NULL DEFAULT '0' COMMENT '销售数量',
  `view_count` bigint(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数量',
  `version` bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '乐观锁',
  `status` varchar(10) NOT NULL DEFAULT 'Draft' COMMENT '课程状态 Draft未发布  Normal已发布',
  `is_deleted` tinyint(3) DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_title` (`title`),
  KEY `idx_subject_id` (`subject_id`),
  KEY `idx_teacher_id` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='课程';

-- ----------------------------
-- Records of edu_course
-- ----------------------------
INSERT INTO `edu_course` VALUES ('1289843740927606786', '1189426437876985857', '1287584828027396097', '1287584827628937217', '添加测试完整功能', '0.01', '50', 'https://eduguli-0409.oss-cn-beijing.aliyuncs.com/2020/08/02/cf922f0dbbfe4bc99abbc1647df5300c5.jpg', '5', '0', '1', 'Normal', '0', '2020-08-02 16:41:27', '2020-08-02 16:42:27');
INSERT INTO `edu_course` VALUES ('1291572591215017986', '1286257727579889666', '1287584831156346881', '1287584829847724033', 'java高级编程', '0.01', '40', 'https://eduguli-0409.oss-cn-beijing.aliyuncs.com/2020/08/07/3f5f7a5f670a4d6eac5c130914b658c4java.jpg', '10', '0', '1', 'Normal', '0', '2020-08-07 11:11:17', '2020-08-07 11:38:14');
INSERT INTO `edu_course` VALUES ('1291578418688815106', '1286210099911651329', '1287584832318169090', '1287584829847724033', 'C++', '0.01', '23', 'https://eduguli-0409.oss-cn-beijing.aliyuncs.com/2020/08/07/cbd99af597b2423983681eee6fa1f42b111.jpg', '3', '0', '1', 'Normal', '0', '2020-08-07 11:34:26', '2020-08-07 11:35:25');
INSERT INTO `edu_course` VALUES ('1291579791601954818', '1285513791865458689', '1287584828027396097', '1287584827628937217', 'vue', '0.00', '30', 'https://eduguli-0409.oss-cn-beijing.aliyuncs.com/2020/08/07/70b10ed94a18460fa283343e8461d8e3vue.jpg', '15', '0', '1', 'Normal', '0', '2020-08-07 11:39:53', '2020-08-07 11:43:31');

-- ----------------------------
-- Table structure for edu_course_collect
-- ----------------------------
DROP TABLE IF EXISTS `edu_course_collect`;
CREATE TABLE `edu_course_collect` (
  `id` char(19) NOT NULL COMMENT '收藏ID',
  `course_id` char(19) NOT NULL COMMENT '课程讲师ID',
  `member_id` char(19) NOT NULL DEFAULT '' COMMENT '课程专业ID',
  `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='课程收藏';

-- ----------------------------
-- Records of edu_course_collect
-- ----------------------------
INSERT INTO `edu_course_collect` VALUES ('1196269345666019330', '1192252213659774977', '1', '1', '2019-11-18 11:30:12', '2019-11-18 11:30:12');

-- ----------------------------
-- Table structure for edu_course_description
-- ----------------------------
DROP TABLE IF EXISTS `edu_course_description`;
CREATE TABLE `edu_course_description` (
  `id` char(19) NOT NULL COMMENT '课程ID',
  `description` text COMMENT '课程简介',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='课程简介';

-- ----------------------------
-- Records of edu_course_description
-- ----------------------------
INSERT INTO `edu_course_description` VALUES ('1289843740927606786', '<p>测试删除多个视频1测试删除多个视频</p>', '2020-08-02 16:41:27', '2020-08-02 16:41:27');
INSERT INTO `edu_course_description` VALUES ('1291572591215017986', '<p>java高级编程是一个很好的课程</p>', '2020-08-07 11:11:18', '2020-08-07 11:38:14');
INSERT INTO `edu_course_description` VALUES ('1291578418688815106', '<p>C++真的好难啊</p>', '2020-08-07 11:34:26', '2020-08-07 11:34:26');
INSERT INTO `edu_course_description` VALUES ('1291579791601954818', '<p>vue是一门基于javascript的课程</p>', '2020-08-07 11:39:54', '2020-08-07 11:39:54');

-- ----------------------------
-- Table structure for edu_subject
-- ----------------------------
DROP TABLE IF EXISTS `edu_subject`;
CREATE TABLE `edu_subject` (
  `id` char(19) NOT NULL COMMENT '课程类别ID',
  `title` varchar(10) NOT NULL COMMENT '类别名称',
  `parent_id` char(19) NOT NULL DEFAULT '0' COMMENT '父ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序字段',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='课程科目';

-- ----------------------------
-- Records of edu_subject
-- ----------------------------
INSERT INTO `edu_subject` VALUES ('1287584827628937217', '前端开发', '0', '0', '2020-07-27 11:05:20', '2020-07-27 11:05:20');
INSERT INTO `edu_subject` VALUES ('1287584828027396097', 'vue', '1287584827628937217', '0', '2020-07-27 11:05:20', '2020-07-27 11:05:20');
INSERT INTO `edu_subject` VALUES ('1287584828836896769', 'javascript', '1287584827628937217', '0', '2020-07-27 11:05:20', '2020-07-27 11:05:20');
INSERT INTO `edu_subject` VALUES ('1287584829436682241', 'jquery', '1287584827628937217', '0', '2020-07-27 11:05:20', '2020-07-27 11:05:20');
INSERT INTO `edu_subject` VALUES ('1287584829847724033', '后端开发', '0', '0', '2020-07-27 11:05:20', '2020-07-27 11:05:20');
INSERT INTO `edu_subject` VALUES ('1287584831156346881', 'java', '1287584829847724033', '0', '2020-07-27 11:05:21', '2020-07-27 11:05:21');
INSERT INTO `edu_subject` VALUES ('1287584832318169090', 'C++', '1287584829847724033', '0', '2020-07-27 11:05:21', '2020-07-27 11:05:21');
INSERT INTO `edu_subject` VALUES ('1287584833152835586', '数据库开发', '0', '0', '2020-07-27 11:05:21', '2020-07-27 11:05:21');
INSERT INTO `edu_subject` VALUES ('1287584833853284353', 'mysql', '1287584833152835586', '0', '2020-07-27 11:05:21', '2020-07-27 11:05:21');

-- ----------------------------
-- Table structure for edu_teacher
-- ----------------------------
DROP TABLE IF EXISTS `edu_teacher`;
CREATE TABLE `edu_teacher` (
  `id` char(19) NOT NULL COMMENT '讲师ID',
  `name` varchar(20) NOT NULL COMMENT '讲师姓名',
  `intro` varchar(500) NOT NULL DEFAULT '' COMMENT '讲师简介',
  `career` varchar(500) DEFAULT NULL COMMENT '讲师资历,一句话说明讲师',
  `level` int(10) unsigned NOT NULL COMMENT '头衔 1高级讲师 2首席讲师',
  `avatar` varchar(255) DEFAULT NULL COMMENT '讲师头像',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='讲师';

-- ----------------------------
-- Records of edu_teacher
-- ----------------------------
INSERT INTO `edu_teacher` VALUES ('1', '张三', '近年主持国家自然科学基金（6项）、江苏省重大科技成果转化项目（5项）、江苏省产学研前瞻性联合研究项目（3项）、省工业科技支撑、省高技术、省自然科学基金等省部级及其企业的主要科研项目40多个，多个项目在企业成功转化，产生了较好的经济、社会和环境效益。积极开展产学研科技合作，并与省内16家企业建立了江苏省研究生工作站，其中6家为江苏省优秀研究生工作站', '高级', '1', 'https://guli-file-190513.oss-cn-beijing.aliyuncs.com/avatar/default.jpg', '0', '0', '2019-10-30 14:18:46', '2019-11-12 13:36:36');
INSERT INTO `edu_teacher` VALUES ('1189389726308478977', '晴天', '高级讲师简介', '高级讲师资历', '2', 'https://online-teach-file.oss-cn-beijing.aliyuncs.com/teacher/2019/10/30/de47ee9b-7fec-43c5-8173-13c5f7f689b2.png', '1', '0', '2019-10-30 11:53:03', '2019-10-30 11:53:03');
INSERT INTO `edu_teacher` VALUES ('1189390295668469762', '李刚', '高级讲师简介', '高级讲师', '2', 'https://online-teach-file.oss-cn-beijing.aliyuncs.com/teacher/2019/10/30/b8aa36a2-db50-4eca-a6e3-cc6e608355e0.png', '2', '0', '2019-10-30 11:55:19', '2019-11-12 13:37:52');
INSERT INTO `edu_teacher` VALUES ('1189426437876985857', '王二', '高级讲师简介', '高级讲师', '1', 'https://online-teach-file.oss-cn-beijing.aliyuncs.com/teacher/2019/11/08/e44a2e92-2421-4ea3-bb49-46f2ec96ef88.png', '0', '0', '2019-10-30 14:18:56', '2019-11-12 13:37:35');
INSERT INTO `edu_teacher` VALUES ('1189426464967995393', '王五', '高级讲师简介', '高级讲师', '1', 'https://online-teach-file.oss-cn-beijing.aliyuncs.com/teacher/2019/10/30/65423f14-49a9-4092-baf5-6d0ef9686a85.png', '0', '0', '2019-10-30 14:19:02', '2019-11-12 13:37:18');
INSERT INTO `edu_teacher` VALUES ('1192249914833055746', '李四', '高级讲师简介', '高级讲师', '1', 'https://online-teach-file.oss-cn-beijing.aliyuncs.com/teacher/2019/11/07/91871e25-fd83-4af6-845f-ea8d471d825d.png', '2', '0', '2019-11-07 09:18:25', '2020-07-23 16:02:20');
INSERT INTO `edu_teacher` VALUES ('1192327476087115778', '1222-12-12', '1111', '11', '1', 'https://online-teach-file.oss-cn-beijing.aliyuncs.com/teacher/2019/11/08/5805c6cd-c8ad-4a77-aafd-d2e083bfd8a4.png', '0', '0', '2019-11-07 14:26:37', '2019-11-11 16:26:26');
INSERT INTO `edu_teacher` VALUES ('1195337453429129218', 'test', 'sdfsdf', 'sdfdf', '1', 'https://guli-file-190513.oss-cn-beijing.aliyuncs.com/avatar/default.jpg', '0', '0', '2019-11-15 21:47:12', '2019-11-15 21:47:27');
INSERT INTO `edu_teacher` VALUES ('1285513791865458689', 'lee', '真牛逼', '高级讲师资历', '2', 'https://eduguli-0409.oss-cn-beijing.aliyuncs.com/2020/07/23/0038055ced1a49ef95f54aead68b685cfile.png', '1', '0', '2020-07-21 17:55:46', '2020-07-23 15:58:40');
INSERT INTO `edu_teacher` VALUES ('1286195532611514369', '王小二', '博士后123', '教授', '2', 'https://eduguli-0409.oss-cn-beijing.aliyuncs.com/2020/07/23/0038055ced1a49ef95f54aead68b685cfile.png', '3', '0', '2020-07-23 15:04:46', '2020-07-23 15:58:31');
INSERT INTO `edu_teacher` VALUES ('1286210099911651329', '1111111111', '11111111', '11111111111', '2', 'https://eduguli-0409.oss-cn-beijing.aliyuncs.com/2020/07/23/0038055ced1a49ef95f54aead68b685cfile.png', '1', '0', '2020-07-23 16:02:39', '2020-07-23 16:02:39');
INSERT INTO `edu_teacher` VALUES ('1286257727579889666', '测试头像上传1', '测试头像上传', '测试头像上传', '1', 'https://eduguli-0409.oss-cn-beijing.aliyuncs.com/2020/07/23/0038055ced1a49ef95f54aead68b685cfile.png', '1', '0', '2020-07-23 19:11:54', '2020-07-26 12:14:21');

-- ----------------------------
-- Table structure for edu_video
-- ----------------------------
DROP TABLE IF EXISTS `edu_video`;
CREATE TABLE `edu_video` (
  `id` char(19) NOT NULL COMMENT '视频ID',
  `course_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '课程ID',
  `chapter_id` char(19) NOT NULL COMMENT '章节ID',
  `title` varchar(50) NOT NULL COMMENT '节点名称',
  `video_source_id` varchar(100) DEFAULT NULL COMMENT '云端视频资源',
  `video_original_name` varchar(100) DEFAULT NULL COMMENT '原始文件名称',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序字段',
  `play_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '播放次数',
  `is_free` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否可以试听：0收费 1免费',
  `duration` float NOT NULL DEFAULT '0' COMMENT '视频时长（秒）',
  `status` varchar(20) NOT NULL DEFAULT 'Empty' COMMENT 'Empty未上传 Transcoding转码中  Normal正常',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '视频源文件大小（字节）',
  `version` bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '乐观锁',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_course_id` (`course_id`),
  KEY `idx_chapter_id` (`chapter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='课程视频';

-- ----------------------------
-- Records of edu_video
-- ----------------------------
INSERT INTO `edu_video` VALUES ('1289843848645722113', '1289843740927606786', '1289843780656054273', '第一小节', '9c50df81b84a4938a309b0f133e9dac3', '222.mp4', '1', '0', '0', '0', 'Empty', '0', '1', '2020-08-02 16:41:52', '2020-08-02 16:41:52');
INSERT INTO `edu_video` VALUES ('1289843970855157761', '1289843740927606786', '1289843889833787394', '第一小节：是哦怕', '1eda7d47ff764f4f836ed7699dbd86e0', '222.mp4', '2', '0', '0', '0', 'Empty', '0', '1', '2020-08-02 16:42:21', '2020-08-02 16:42:21');
INSERT INTO `edu_video` VALUES ('1291573110968975361', '1291572591215017986', '1291572702452154370', '第一小节：', '12358ca0fd744d60a50225dca265da59', '222.mp4', '1', '0', '0', '0', 'Empty', '0', '1', '2020-08-07 11:13:21', '2020-08-07 11:13:21');
INSERT INTO `edu_video` VALUES ('1291573229105741825', '1291572591215017986', '1291572790889054209', '第一小节:实战准备工作+', '98081de651aa4cef815ad96f0e50987b', '222.mp4', '1', '0', '0', '0', 'Empty', '0', '1', '2020-08-07 11:13:49', '2020-08-07 11:13:49');
INSERT INTO `edu_video` VALUES ('1291578647525847041', '1291578418688815106', '1291578497965355009', '第一小节：数组', '86380d286b2c43889e6992378f8fb83b', '222.mp4', '1', '0', '0', '0', 'Empty', '0', '1', '2020-08-07 11:35:21', '2020-08-07 11:35:21');
INSERT INTO `edu_video` VALUES ('1291580678927937537', '1291579791601954818', '1291579860443066370', '第一小节：vue指令', 'cf1ad0dc7d9f4e82926774faa80ed80f', '222.mp4', '1', '0', '0', '0', 'Empty', '0', '1', '2020-08-07 11:43:25', '2020-08-07 11:43:25');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------

-- ----------------------------
-- Table structure for statistics_daily
-- ----------------------------
DROP TABLE IF EXISTS `statistics_daily`;
CREATE TABLE `statistics_daily` (
  `id` char(19) NOT NULL COMMENT '主键',
  `date_calculated` varchar(20) NOT NULL COMMENT '统计日期',
  `register_num` int(11) NOT NULL DEFAULT '0' COMMENT '注册人数',
  `login_num` int(11) NOT NULL DEFAULT '0' COMMENT '登录人数',
  `video_view_num` int(11) NOT NULL DEFAULT '0' COMMENT '每日播放视频数',
  `course_num` int(11) NOT NULL DEFAULT '0' COMMENT '每日新增课程数',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `statistics_day` (`date_calculated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网站统计日数据';

-- ----------------------------
-- Records of statistics_daily
-- ----------------------------
INSERT INTO `statistics_daily` VALUES ('1292645323025543170', '2020-08-09', '4', '138', '114', '135', '2020-08-10 10:13:56', '2020-08-10 10:13:56');
INSERT INTO `statistics_daily` VALUES ('1292669328344342530', '2020-08-06', '2', '140', '131', '116', '2020-08-10 11:49:19', '2020-08-10 11:49:19');
INSERT INTO `statistics_daily` VALUES ('1292669399337132033', '2020-08-10', '3', '150', '161', '151', '2020-08-10 11:49:36', '2020-08-10 11:49:36');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` char(19) NOT NULL DEFAULT '',
  `order_no` varchar(20) NOT NULL DEFAULT '' COMMENT '订单号',
  `course_id` varchar(19) NOT NULL DEFAULT '' COMMENT '课程id',
  `course_title` varchar(100) DEFAULT NULL COMMENT '课程名称',
  `course_cover` varchar(255) DEFAULT NULL COMMENT '课程封面',
  `teacher_name` varchar(20) DEFAULT NULL COMMENT '讲师名称',
  `member_id` varchar(19) NOT NULL DEFAULT '' COMMENT '会员id',
  `nickname` varchar(50) DEFAULT NULL COMMENT '会员昵称',
  `mobile` varchar(11) DEFAULT NULL COMMENT '会员手机',
  `total_fee` decimal(10,2) DEFAULT '0.01' COMMENT '订单金额（分）',
  `pay_type` tinyint(3) DEFAULT NULL COMMENT '支付类型（1：微信 2：支付宝）',
  `status` tinyint(3) DEFAULT NULL COMMENT '订单状态（0：未支付 1：已支付）',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_order_no` (`order_no`),
  KEY `idx_course_id` (`course_id`),
  KEY `idx_member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单';

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('1292367159317504001', '20200809154836619', '1291572591215017986', 'java高级编程', 'https://eduguli-0409.oss-cn-beijing.aliyuncs.com/2020/08/07/3f5f7a5f670a4d6eac5c130914b658c4java.jpg', '测试头像上传1', '1290608642432757762', 'lee', '13397477276', '0.01', '1', '1', '0', '2020-08-09 15:48:36', '2020-08-09 16:02:28');
INSERT INTO `t_order` VALUES ('1292389513863200769', '20200809171725021', '1289843740927606786', '添加测试完整功能', 'https://eduguli-0409.oss-cn-beijing.aliyuncs.com/2020/08/02/cf922f0dbbfe4bc99abbc1647df5300c5.jpg', '王二', '1290608642432757762', 'lee', '13397477276', '0.01', '1', '1', '0', '2020-08-09 17:17:26', '2020-08-09 17:17:50');

-- ----------------------------
-- Table structure for t_pay_log
-- ----------------------------
DROP TABLE IF EXISTS `t_pay_log`;
CREATE TABLE `t_pay_log` (
  `id` char(19) NOT NULL DEFAULT '',
  `order_no` varchar(20) NOT NULL DEFAULT '' COMMENT '订单号',
  `pay_time` datetime DEFAULT NULL COMMENT '支付完成时间',
  `total_fee` decimal(10,2) DEFAULT '0.01' COMMENT '支付金额（分）',
  `transaction_id` varchar(30) DEFAULT NULL COMMENT '交易流水号',
  `trade_state` char(20) DEFAULT NULL COMMENT '交易状态',
  `pay_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '支付类型（1：微信 2：支付宝）',
  `attr` text COMMENT '其他属性',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_order_no` (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='支付日志表';

-- ----------------------------
-- Records of t_pay_log
-- ----------------------------
INSERT INTO `t_pay_log` VALUES ('1292370646935805953', '20200809154836619', '2020-08-09 16:02:28', '0.01', '4200000712202008094260464330', 'SUCCESS', '1', '{\"transaction_id\":\"4200000712202008094260464330\",\"nonce_str\":\"HIldfGjzC3JYe9yz\",\"trade_state\":\"SUCCESS\",\"bank_type\":\"OTHERS\",\"openid\":\"oHwsHuGdgkHHHtPrbgNYgtl21Mj8\",\"sign\":\"ED102252677533329213E108FA0E3D8B\",\"return_msg\":\"OK\",\"fee_type\":\"CNY\",\"mch_id\":\"1558950191\",\"cash_fee\":\"1\",\"out_trade_no\":\"20200809154836619\",\"cash_fee_type\":\"CNY\",\"appid\":\"wx74862e0dfcf69954\",\"total_fee\":\"1\",\"trade_state_desc\":\"支付成功\",\"trade_type\":\"NATIVE\",\"result_code\":\"SUCCESS\",\"attach\":\"\",\"time_end\":\"20200809160225\",\"is_subscribe\":\"N\",\"return_code\":\"SUCCESS\"}', '0', '2020-08-09 16:02:28', '2020-08-09 16:02:28');
INSERT INTO `t_pay_log` VALUES ('1292389613435977730', '20200809171725021', '2020-08-09 17:17:50', '0.01', '4200000722202008097052204656', 'SUCCESS', '1', '{\"transaction_id\":\"4200000722202008097052204656\",\"nonce_str\":\"sHGmbmHp8gFGfKOM\",\"trade_state\":\"SUCCESS\",\"bank_type\":\"OTHERS\",\"openid\":\"oHwsHuGdgkHHHtPrbgNYgtl21Mj8\",\"sign\":\"9E0A9103B68DA24F90AD8AFF4D730515\",\"return_msg\":\"OK\",\"fee_type\":\"CNY\",\"mch_id\":\"1558950191\",\"cash_fee\":\"1\",\"out_trade_no\":\"20200809171725021\",\"cash_fee_type\":\"CNY\",\"appid\":\"wx74862e0dfcf69954\",\"total_fee\":\"1\",\"trade_state_desc\":\"支付成功\",\"trade_type\":\"NATIVE\",\"result_code\":\"SUCCESS\",\"attach\":\"\",\"time_end\":\"20200809171749\",\"is_subscribe\":\"N\",\"return_code\":\"SUCCESS\"}', '0', '2020-08-09 17:17:50', '2020-08-09 17:17:50');

-- ----------------------------
-- Table structure for ucenter_member
-- ----------------------------
DROP TABLE IF EXISTS `ucenter_member`;
CREATE TABLE `ucenter_member` (
  `id` char(19) NOT NULL COMMENT '会员id',
  `openid` varchar(128) DEFAULT NULL COMMENT '微信openid',
  `mobile` varchar(11) DEFAULT '' COMMENT '手机号',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `sex` tinyint(2) unsigned DEFAULT NULL COMMENT '性别 1 女，2 男',
  `age` tinyint(3) unsigned DEFAULT NULL COMMENT '年龄',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `sign` varchar(100) DEFAULT NULL COMMENT '用户签名',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用 1（true）已禁用，  0（false）未禁用',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='会员表';

-- ----------------------------
-- Records of ucenter_member
-- ----------------------------
INSERT INTO `ucenter_member` VALUES ('1', null, '13700000001', '96e79218965eb72c92a549dd5a330112', '小三123', '1', '5', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', null, '0', '0', '2020-08-09 12:11:33', '2019-11-08 11:56:01');
INSERT INTO `ucenter_member` VALUES ('1080736474267144193', null, '13700000011', '96e79218965eb72c92a549dd5a330112', '用户XJtDfaYeKk', '1', '19', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', null, '0', '0', '2020-08-09 12:12:45', '2019-01-02 12:12:56');
INSERT INTO `ucenter_member` VALUES ('1080736474355224577', null, '13700000002', '96e79218965eb72c92a549dd5a330112', '用户wUrNkzAPrc', '1', '27', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', null, '0', '0', '2020-08-09 12:13:56', '2019-01-02 12:14:07');
INSERT INTO `ucenter_member` VALUES ('1086387099449442306', null, '13520191388', '96e79218965eb72c92a549dd5a330112', '用户XTMUeHDAoj', '2', '20', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', null, '0', '0', '2020-08-09 06:17:23', '2019-01-19 06:17:23');
INSERT INTO `ucenter_member` VALUES ('1086387099520745473', null, '13520191389', '96e79218965eb72c92a549dd5a330112', '用户vSdKeDlimn', '1', '21', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', null, '0', '0', '2020-08-10 06:17:23', '2019-01-19 06:17:23');
INSERT INTO `ucenter_member` VALUES ('1086387099608825858', null, '13520191381', '96e79218965eb72c92a549dd5a330112', '用户EoyWUVXQoP', '1', '18', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', null, '0', '0', '2020-08-10 06:17:23', '2019-01-19 06:17:23');
INSERT INTO `ucenter_member` VALUES ('1086387099701100545', null, '13520191382', '020', '用户LcAYbxLNdN', '2', '24', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', null, '0', '0', '2020-08-10 06:17:23', '2019-01-19 06:17:23');
INSERT INTO `ucenter_member` VALUES ('1290608642432757762', null, '13397477276', 'e10adc3949ba59abbe56e057f20f883e', 'lee', null, null, 'https://eduguli-0409.oss-cn-beijing.aliyuncs.com/2020/07/23/0038055ced1a49ef95f54aead68b685cfile.png', null, '0', '0', '2020-08-06 19:20:53', '2020-08-04 19:20:53');
INSERT INTO `ucenter_member` VALUES ('1291271776835244034', 'o3_SC5-6qjW71ptFYV9Y9b7qe_jM', '', null, 'we are a team', null, null, 'http://thirdwx.qlogo.cn/mmopen/vi_32/ibF9b2XbrwbpHuAicibJ5IjZYzGVnfP0A8ciaQibiagqa3YHDmx9KbjgLx26ibBGluAIUn5qCxKFah1YbBftbd4HedF2g/132', null, '0', '0', '2020-08-06 15:15:57', '2020-08-06 15:15:57');
