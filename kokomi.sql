/*
 Navicat Premium Data Transfer

 Source Server         : kokomi
 Source Server Type    : MySQL
 Source Server Version : 90100 (9.1.0)
 Source Host           : localhost:3306
 Source Schema         : kokomi

 Target Server Type    : MySQL
 Target Server Version : 90100 (9.1.0)
 File Encoding         : 65001

 Date: 27/12/2024 12:49:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `user` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发布人',
  `time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of article
-- ----------------------------
BEGIN;
INSERT INTO `article` (`id`, `name`, `content`, `user`, `time`) VALUES (3, '（永久贴）招工', '\n\n黑塔空间站的科研团队正在扩充，现诚邀有志之士加入我们的行列。我们正在寻找具有科研助理经验、热爱天文和考古学的年轻人才。加入我们，你将有机会与跨星际的顶尖学者合作，参与前沿的异星文物收集与研究项目！\n\n岗位要求：\n	•	具备基本的科研能力，熟悉数据分析工具；\n	•	具备天文学或考古学相关背景者优先；\n	•	能够独立完成文献检索与实验设计；\n	•	强烈的好奇心与团队合作精神。\n\n有意者请将个人简历和研究兴趣发送至团队邮箱。期待与你共同探索宇宙的奥秘！\n\n科研团队负责人——豆沙糕\n![360px豆沙灰灰.png](http://localhost:9090/file/b55785c367cb4f5e94605f5a18bacf60.png)\n黑塔空间站', 'admin', '2024-12-23 01:04:59');
INSERT INTO `article` (`id`, `name`, `content`, `user`, `time`) VALUES (4, 'test', 'test![march_7.gif](http://localhost:9090/file/9f2d92726d394561b86faff643b0c91e.gif)', 'Herta', '2024-12-23 15:12:28');
COMMIT;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '课程名称',
  `score` int DEFAULT NULL COMMENT '学分',
  `times` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '上课时间',
  `state` tinyint(1) DEFAULT NULL COMMENT '是否开课',
  `teacher_id` int DEFAULT NULL COMMENT '授课老师id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of course
-- ----------------------------
BEGIN;
INSERT INTO `course` (`id`, `name`, `score`, `times`, `state`, `teacher_id`) VALUES (4, '古代微生物研究', NULL, NULL, NULL, 33);
INSERT INTO `course` (`id`, `name`, `score`, `times`, `state`, `teacher_id`) VALUES (5, '多管火箭发射系统的设计', NULL, NULL, NULL, 33);
COMMIT;

-- ----------------------------
-- Table structure for student_course
-- ----------------------------
DROP TABLE IF EXISTS `student_course`;
CREATE TABLE `student_course` (
  `student_id` int NOT NULL,
  `course_id` int NOT NULL,
  PRIMARY KEY (`student_id`,`course_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of student_course
-- ----------------------------
BEGIN;
INSERT INTO `student_course` (`student_id`, `course_id`) VALUES (1, 4);
INSERT INTO `student_course` (`student_id`, `course_id`) VALUES (28, 1);
INSERT INTO `student_course` (`student_id`, `course_id`) VALUES (28, 2);
INSERT INTO `student_course` (`student_id`, `course_id`) VALUES (33, 4);
INSERT INTO `student_course` (`student_id`, `course_id`) VALUES (34, 4);
INSERT INTO `student_course` (`student_id`, `course_id`) VALUES (34, 5);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '类型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict` (`name`, `value`, `type`) VALUES ('user', 'el-icon-user', 'icon');
INSERT INTO `sys_dict` (`name`, `value`, `type`) VALUES ('house', 'el-icon-house', 'icon');
INSERT INTO `sys_dict` (`name`, `value`, `type`) VALUES ('menu', 'el-icon-menu', 'icon');
INSERT INTO `sys_dict` (`name`, `value`, `type`) VALUES ('s-custom', 'el-icon-s-custom', 'icon');
INSERT INTO `sys_dict` (`name`, `value`, `type`) VALUES ('s-grid', 'el-icon-s-grid', 'icon');
INSERT INTO `sys_dict` (`name`, `value`, `type`) VALUES ('document', 'el-icon-document', 'icon');
INSERT INTO `sys_dict` (`name`, `value`, `type`) VALUES ('coffee', 'el-icon-coffee\r\n', 'icon');
INSERT INTO `sys_dict` (`name`, `value`, `type`) VALUES ('s-marketing', 'el-icon-s-marketing', 'icon');
COMMIT;

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件类型',
  `size` bigint DEFAULT NULL COMMENT '文件大小(kb)',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '下载链接',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件md5',
  `is_delete` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `enable` tinyint(1) DEFAULT '1' COMMENT '是否禁用链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
BEGIN;
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (44, '360px-豆沙灰灰.png', 'png', 111, 'http://localhost:9090/file/b55785c367cb4f5e94605f5a18bacf60.png', 'fd1db6d44dc1e8f0880c6e6af29db72c', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (45, 'st0z27ry91aovv8okirwqtbhwygaex7.png', 'png', 51, 'http://localhost:9090/file/4db39b184ad648bb860405fdcd9c7359.png', '9e79d4770504e06437b6154bec9a0f27', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (46, '360px-豆沙灰灰.png', 'png', 111, 'http://localhost:9090/file/b55785c367cb4f5e94605f5a18bacf60.png', 'fd1db6d44dc1e8f0880c6e6af29db72c', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (47, '360px-豆沙灰灰.png', 'png', 111, 'http://localhost:9090/file/b55785c367cb4f5e94605f5a18bacf60.png', 'fd1db6d44dc1e8f0880c6e6af29db72c', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (48, 'mbslv8xq112rgfngd57pnnfqhnqvdig.png', 'png', 35, 'http://localhost:9090/file/f5c3809a189f46a3a982be92cd0cc69c.png', '1e4804191eed042a9c85dd751892253d', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (49, 'gbf9yt1fk2878nc3hmvdv1kodx49ieg.png', 'png', 60, 'http://localhost:9090/file/ea8e29a768f749fd9ed240619bc820f1.png', '702d36e7ec76454d0c020e85181408ce', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (50, 'mqe2vm7uhe42uhaw76pvhmnpsjm48s8.png', 'png', 53, 'http://localhost:9090/file/c9d08f876528484c9b00cc9043261c39.png', 'b79318a7b35bff6ab7ac10057e69b513', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (51, 'march_7.gif', 'gif', 1050, 'http://localhost:9090/file/9f2d92726d394561b86faff643b0c91e.gif', 'dc9ee2b118df73a36708688207494832', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (52, 'b55785c367cb4f5e94605f5a18bacf60.png', 'png', 111, 'http://localhost:9090/file/b55785c367cb4f5e94605f5a18bacf60.png', 'fd1db6d44dc1e8f0880c6e6af29db72c', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (53, 'f5c3809a189f46a3a982be92cd0cc69c.png', 'png', 35, 'http://localhost:9090/file/f5c3809a189f46a3a982be92cd0cc69c.png', '1e4804191eed042a9c85dd751892253d', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (54, 'b55785c367cb4f5e94605f5a18bacf60.png', 'png', 111, 'http://localhost:9090/file/b55785c367cb4f5e94605f5a18bacf60.png', 'fd1db6d44dc1e8f0880c6e6af29db72c', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (55, '360px-豆沙灰灰.png', 'png', 111, 'http://localhost:9090/file/b55785c367cb4f5e94605f5a18bacf60.png', 'fd1db6d44dc1e8f0880c6e6af29db72c', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (56, 'b55785c367cb4f5e94605f5a18bacf60.png', 'png', 111, 'http://localhost:9090/file/b55785c367cb4f5e94605f5a18bacf60.png', 'fd1db6d44dc1e8f0880c6e6af29db72c', 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '路径',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图标',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `pid` int DEFAULT NULL COMMENT '父级id',
  `page_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '页面路径',
  `sort_num` int DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` (`id`, `name`, `path`, `icon`, `description`, `pid`, `page_path`, `sort_num`) VALUES (4, '系统管理', NULL, 'el-icon-s-grid', NULL, NULL, NULL, 300);
INSERT INTO `sys_menu` (`id`, `name`, `path`, `icon`, `description`, `pid`, `page_path`, `sort_num`) VALUES (5, '人员管理', '/user', 'el-icon-user', NULL, 4, 'User', 301);
INSERT INTO `sys_menu` (`id`, `name`, `path`, `icon`, `description`, `pid`, `page_path`, `sort_num`) VALUES (6, '权限设置', '/role', 'el-icon-s-custom', NULL, 4, 'Role', 302);
INSERT INTO `sys_menu` (`id`, `name`, `path`, `icon`, `description`, `pid`, `page_path`, `sort_num`) VALUES (8, '文件管理', '/file', 'el-icon-document', NULL, 4, 'File', 304);
INSERT INTO `sys_menu` (`id`, `name`, `path`, `icon`, `description`, `pid`, `page_path`, `sort_num`) VALUES (10, '主页', '/home', 'el-icon-house', NULL, NULL, 'Home', 0);
INSERT INTO `sys_menu` (`id`, `name`, `path`, `icon`, `description`, `pid`, `page_path`, `sort_num`) VALUES (39, '课程管理', '/course', 'el-icon-menu', NULL, NULL, 'Course', 201);
INSERT INTO `sys_menu` (`id`, `name`, `path`, `icon`, `description`, `pid`, `page_path`, `sort_num`) VALUES (41, '广场', '/article', 'el-icon-menu', NULL, NULL, 'Article', 999);
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `flag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '唯一标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` (`id`, `name`, `description`, `flag`) VALUES (1, '系统管理员', '系统管理员', 'ROLE_ADMIN');
INSERT INTO `sys_role` (`id`, `name`, `description`, `flag`) VALUES (4, '研究员', '研究员', 'ROLE_TEACHER');
INSERT INTO `sys_role` (`id`, `name`, `description`, `flag`) VALUES (5, '访客', '访客', 'ROLE_STUDENT');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` int NOT NULL COMMENT '角色id',
  `menu_id` int NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='角色菜单关系表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 4);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 5);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 6);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 7);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 8);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 9);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 10);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 39);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 40);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 41);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 42);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 43);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 2);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 10);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (3, 39);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 10);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 39);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (4, 41);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (5, 10);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (5, 39);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (5, 41);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 4);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 8);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 10);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 39);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (6, 41);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` (`id`, `username`, `password`, `nickname`, `email`, `phone`, `address`, `create_time`, `avatar_url`, `role`) VALUES (1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', 'testem', 'testphone', 'testad', '2022-01-22 21:10:27', 'http://localhost:9090/file/b55785c367cb4f5e94605f5a18bacf60.png', 'ROLE_ADMIN');
INSERT INTO `sys_user` (`id`, `username`, `password`, `nickname`, `email`, `phone`, `address`, `create_time`, `avatar_url`, `role`) VALUES (31, 'Astar', '202cb962ac59075b964b07152d234b70', 'Astar', NULL, NULL, NULL, '2024-12-23 00:50:57', 'http://localhost:9090/file/4db39b184ad648bb860405fdcd9c7359.png', 'ROLE_ADMIN');
INSERT INTO `sys_user` (`id`, `username`, `password`, `nickname`, `email`, `phone`, `address`, `create_time`, `avatar_url`, `role`) VALUES (32, 'Admin_Alan', '202cb962ac59075b964b07152d234b70', 'Admin_Alan', NULL, NULL, NULL, '2024-12-23 00:51:14', NULL, 'ROLE_STUDENT');
INSERT INTO `sys_user` (`id`, `username`, `password`, `nickname`, `email`, `phone`, `address`, `create_time`, `avatar_url`, `role`) VALUES (33, 'March7', '202cb962ac59075b964b07152d234b70', 'March7', NULL, NULL, NULL, '2024-12-23 01:00:11', NULL, 'ROLE_TEACHER');
INSERT INTO `sys_user` (`id`, `username`, `password`, `nickname`, `email`, `phone`, `address`, `create_time`, `avatar_url`, `role`) VALUES (34, 'StarStar', '202cb962ac59075b964b07152d234b70', 'StarStar', NULL, NULL, NULL, '2024-12-23 01:00:22', 'http://localhost:9090/file/f5c3809a189f46a3a982be92cd0cc69c.png', 'ROLE_STUDENT');
INSERT INTO `sys_user` (`id`, `username`, `password`, `nickname`, `email`, `phone`, `address`, `create_time`, `avatar_url`, `role`) VALUES (35, 'himeko', '202cb962ac59075b964b07152d234b70', 'himeko', NULL, NULL, NULL, '2024-12-23 01:00:34', 'http://localhost:9090/file/ea8e29a768f749fd9ed240619bc820f1.png', 'ROLE_STUDENT');
INSERT INTO `sys_user` (`id`, `username`, `password`, `nickname`, `email`, `phone`, `address`, `create_time`, `avatar_url`, `role`) VALUES (36, 'Herta', '202cb962ac59075b964b07152d234b70', 'Herta', NULL, NULL, NULL, '2024-12-23 01:00:40', 'http://localhost:9090/file/c9d08f876528484c9b00cc9043261c39.png', 'ROLE_ADMIN');
COMMIT;

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `user_id` int DEFAULT NULL COMMENT '评论人id',
  `time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论时间',
  `pid` int DEFAULT NULL COMMENT '父id',
  `origin_id` int DEFAULT NULL COMMENT '最上级评论id',
  `article_id` int DEFAULT NULL COMMENT '关联文章的id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
BEGIN;
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (22, '111真招吗\n', 34, '2024-12-23 15:05:43', NULL, NULL, 3);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (23, '2', 35, '2024-12-23 15:08:01', NULL, NULL, 3);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
