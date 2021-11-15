/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : febs_cloud_base

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 14/11/2021 22:44:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_dept
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept`  (
  `DEPT_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `PARENT_ID` bigint(20) NOT NULL COMMENT '上级部门ID',
  `DEPT_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门名称',
  `ORDER_NUM` double(20, 0) NULL DEFAULT NULL COMMENT '排序',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`DEPT_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_dept
-- ----------------------------
INSERT INTO `t_dept` VALUES (1, 0, '开发部', 1, '2018-01-04 15:42:26', '2019-01-05 21:08:27');

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu`  (
  `MENU_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单/按钮ID',
  `PARENT_ID` bigint(20) NOT NULL COMMENT '上级菜单ID',
  `MENU_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单/按钮名称',
  `PATH` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应路由path',
  `COMPONENT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应路由组件component',
  `PERMS` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `ICON` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `TYPE` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型 0菜单 1按钮',
  `ORDER_NUM` double(20, 0) NULL DEFAULT NULL COMMENT '排序',
  `CREATE_TIME` datetime(0) NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`MENU_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES (1, 0, '系统管理', '/system', 'Layout', NULL, 'el-icon-set-up', '0', 1, '2017-12-27 16:39:07', '2019-07-20 16:19:04');
INSERT INTO `t_menu` VALUES (2, 1, '用户管理', '/system/user', 'febs/system/user/Index', 'user:view', '', '0', 1, '2017-12-27 16:47:13', '2019-01-22 06:45:55');
INSERT INTO `t_menu` VALUES (3, 2, '新增用户', '', '', 'user:add', NULL, '1', NULL, '2017-12-27 17:02:58', NULL);
INSERT INTO `t_menu` VALUES (4, 2, '修改用户', '', '', 'user:update', NULL, '1', NULL, '2017-12-27 17:04:07', NULL);
INSERT INTO `t_menu` VALUES (5, 2, '删除用户', '', '', 'user:delete', NULL, '1', NULL, '2017-12-27 17:04:58', NULL);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `ROLE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `ROLE_NAME` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `REMARK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `CREATE_TIME` datetime(0) NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`ROLE_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '管理员', '管理员', '2019-08-08 16:23:11', '2019-08-09 14:38:59');

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu`  (
  `ROLE_ID` bigint(20) NOT NULL,
  `MENU_ID` bigint(20) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES (1, 1);
INSERT INTO `t_role_menu` VALUES (1, 2);
INSERT INTO `t_role_menu` VALUES (1, 3);
INSERT INTO `t_role_menu` VALUES (1, 4);
INSERT INTO `t_role_menu` VALUES (1, 5);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `USER_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `USERNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `PASSWORD` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `DEPT_ID` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `EMAIL` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `MOBILE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `STATUS` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态 0锁定 1有效',
  `CREATE_TIME` datetime(0) NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `LAST_LOGIN_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最近访问时间',
  `SSEX` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别 0男 1女 2保密',
  `AVATAR` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `DESCRIPTION` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`USER_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'MrBird', '$2a$10$gzhiUb1ldc1Rf3lka4k/WOoFKKGPepHSzJxzcPSN5/65SzkMdc.SK', 1, 'mrbird@qq.com', '17788888888', '1', '2019-06-14 20:39:22', '2019-07-19 10:18:36', '2019-08-02 15:57:00', '0', 'default.jpg', '我是帅比作者。');
INSERT INTO `t_user` VALUES (2, 'jane', '$2a$10$cEHCYT.mid5y/jrmjJpyROto2cYj1c0wfxGqj1OdUKg4i/V5/lt4G', NULL, NULL, NULL, '1', '2021-10-11 22:50:37', NULL, NULL, '1', 'default.jpg', NULL);

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `USER_ID` bigint(20) NOT NULL COMMENT '用户ID',
  `ROLE_ID` bigint(20) NOT NULL COMMENT '角色ID'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES (1, 1);
INSERT INTO `t_user_role` VALUES (2, 1);
INSERT INTO `t_user_role` VALUES (3, 1);
INSERT INTO `t_user_role` VALUES (4, 1);

-- ----------------------------
-- Table structure for zipkin_annotations
-- ----------------------------
DROP TABLE IF EXISTS `zipkin_annotations`;
CREATE TABLE `zipkin_annotations`  (
  `trace_id_high` bigint(20) NOT NULL DEFAULT 0 COMMENT 'If non zero, this means the trace uses 128 bit traceIds instead of 64 bit',
  `trace_id` bigint(20) NOT NULL COMMENT 'coincides with zipkin_spans.trace_id',
  `span_id` bigint(20) NOT NULL COMMENT 'coincides with zipkin_spans.id',
  `a_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'BinaryAnnotation.key or Annotation.value if type == -1',
  `a_value` blob NULL COMMENT 'BinaryAnnotation.value(), which must be smaller than 64KB',
  `a_type` int(11) NOT NULL COMMENT 'BinaryAnnotation.type() or -1 if Annotation',
  `a_timestamp` bigint(20) NULL DEFAULT NULL COMMENT 'Used to implement TTL; Annotation.timestamp or zipkin_spans.timestamp',
  `endpoint_ipv4` int(11) NULL DEFAULT NULL COMMENT 'Null when Binary/Annotation.endpoint is null',
  `endpoint_ipv6` binary(16) NULL DEFAULT NULL COMMENT 'Null when Binary/Annotation.endpoint is null, or no IPv6 address',
  `endpoint_port` smallint(6) NULL DEFAULT NULL COMMENT 'Null when Binary/Annotation.endpoint is null',
  `endpoint_service_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Null when Binary/Annotation.endpoint is null',
  UNIQUE INDEX `trace_id_high`(`trace_id_high`, `trace_id`, `span_id`, `a_key`, `a_timestamp`) USING BTREE COMMENT 'Ignore insert on duplicate',
  INDEX `trace_id_high_2`(`trace_id_high`, `trace_id`, `span_id`) USING BTREE COMMENT 'for joining with zipkin_spans',
  INDEX `trace_id_high_3`(`trace_id_high`, `trace_id`) USING BTREE COMMENT 'for getTraces/ByIds',
  INDEX `endpoint_service_name`(`endpoint_service_name`) USING BTREE COMMENT 'for getTraces and getServiceNames',
  INDEX `a_type`(`a_type`) USING BTREE COMMENT 'for getTraces and autocomplete values',
  INDEX `a_key`(`a_key`) USING BTREE COMMENT 'for getTraces and autocomplete values',
  INDEX `trace_id`(`trace_id`, `span_id`, `a_key`) USING BTREE COMMENT 'for dependencies job'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compressed;

-- ----------------------------
-- Records of zipkin_annotations
-- ----------------------------
INSERT INTO `zipkin_annotations` VALUES (0, -2443935885181011133, -2443935885181011133, 'lc', '', 6, 1634830000996000, -1062731606, NULL, NULL, 'febs-server-system');
INSERT INTO `zipkin_annotations` VALUES (0, 7726305239188662965, 7726305239188662965, 'sr', NULL, -1, 1634830001074505, -1062731606, NULL, NULL, 'febs-server-system');
INSERT INTO `zipkin_annotations` VALUES (0, 7726305239188662965, 7726305239188662965, 'ss', NULL, -1, 1634830001083537, -1062731606, NULL, NULL, 'febs-server-system');
INSERT INTO `zipkin_annotations` VALUES (0, 7726305239188662965, 7726305239188662965, 'ca', 0x01, 0, 1634830001074505, -1062731775, NULL, -8412, '');
INSERT INTO `zipkin_annotations` VALUES (0, 7726305239188662965, 7726305239188662965, 'http.method', 0x474554, 6, 1634830001074505, -1062731606, NULL, NULL, 'febs-server-system');
INSERT INTO `zipkin_annotations` VALUES (0, 7726305239188662965, 7726305239188662965, 'http.path', 0x2F6163747561746F72, 6, 1634830001074505, -1062731606, NULL, NULL, 'febs-server-system');
INSERT INTO `zipkin_annotations` VALUES (0, -5645082439512264888, -5645082439512264888, 'lc', '', 6, 1634830003818000, -1062731606, NULL, NULL, 'febs-server-test');
INSERT INTO `zipkin_annotations` VALUES (0, 3988931329354820024, 3988931329354820024, 'sr', NULL, -1, 1634830004003324, -1062731606, NULL, NULL, 'febs-server-test');
INSERT INTO `zipkin_annotations` VALUES (0, 3988931329354820024, 3988931329354820024, 'ss', NULL, -1, 1634830004014045, -1062731606, NULL, NULL, 'febs-server-test');
INSERT INTO `zipkin_annotations` VALUES (0, 3988931329354820024, 3988931329354820024, 'ca', 0x01, 0, 1634830004003324, -1062731775, NULL, -8378, '');
INSERT INTO `zipkin_annotations` VALUES (0, 3988931329354820024, 3988931329354820024, 'http.method', 0x474554, 6, 1634830004003324, -1062731606, NULL, NULL, 'febs-server-test');
INSERT INTO `zipkin_annotations` VALUES (0, 3988931329354820024, 3988931329354820024, 'http.path', 0x2F6163747561746F72, 6, 1634830004003324, -1062731606, NULL, NULL, 'febs-server-test');
INSERT INTO `zipkin_annotations` VALUES (0, 5887678610039420238, 3554885541279608291, 'cs', NULL, -1, 1634830093794075, -1062731606, NULL, NULL, 'febs-server-test');
INSERT INTO `zipkin_annotations` VALUES (0, 5887678610039420238, 3554885541279608291, 'cr', NULL, -1, 1634830093865981, -1062731606, NULL, NULL, 'febs-server-test');
INSERT INTO `zipkin_annotations` VALUES (0, 5887678610039420238, 3554885541279608291, 'http.method', 0x474554, 6, 1634830093794075, -1062731606, NULL, NULL, 'febs-server-test');
INSERT INTO `zipkin_annotations` VALUES (0, 5887678610039420238, 3554885541279608291, 'http.path', 0x2F617574682F75736572, 6, 1634830093794075, -1062731606, NULL, NULL, 'febs-server-test');
INSERT INTO `zipkin_annotations` VALUES (0, 5887678610039420238, -777597801599545717, 'cs', NULL, -1, 1634830094742632, -1062731606, NULL, NULL, 'febs-server-system');
INSERT INTO `zipkin_annotations` VALUES (0, 5887678610039420238, -777597801599545717, 'cr', NULL, -1, 1634830094782180, -1062731606, NULL, NULL, 'febs-server-system');
INSERT INTO `zipkin_annotations` VALUES (0, 5887678610039420238, -777597801599545717, 'http.method', 0x474554, 6, 1634830094742632, -1062731606, NULL, NULL, 'febs-server-system');
INSERT INTO `zipkin_annotations` VALUES (0, 5887678610039420238, -777597801599545717, 'http.path', 0x2F617574682F75736572, 6, 1634830094742632, -1062731606, NULL, NULL, 'febs-server-system');
INSERT INTO `zipkin_annotations` VALUES (0, 5887678610039420238, -8946801476051011086, 'sr', NULL, -1, 1634830094733128, -1062731606, NULL, NULL, 'febs-server-system');
INSERT INTO `zipkin_annotations` VALUES (0, 5887678610039420238, -8946801476051011086, 'ss', NULL, -1, 1634830094820756, -1062731606, NULL, NULL, 'febs-server-system');
INSERT INTO `zipkin_annotations` VALUES (0, 5887678610039420238, -8946801476051011086, 'ca', 0x01, 0, 1634830094733128, 2130706433, NULL, -5577, '');
INSERT INTO `zipkin_annotations` VALUES (0, 5887678610039420238, -8946801476051011086, 'http.method', 0x474554, 6, 1634830094733128, -1062731606, NULL, NULL, 'febs-server-system');
INSERT INTO `zipkin_annotations` VALUES (0, 5887678610039420238, -8946801476051011086, 'http.path', 0x2F68656C6C6F, 6, 1634830094733128, -1062731606, NULL, NULL, 'febs-server-system');
INSERT INTO `zipkin_annotations` VALUES (0, 5887678610039420238, -8946801476051011086, 'mvc.controller.class', 0x54657374436F6E74726F6C6C6572, 6, 1634830094733128, -1062731606, NULL, NULL, 'febs-server-system');
INSERT INTO `zipkin_annotations` VALUES (0, 5887678610039420238, -8946801476051011086, 'mvc.controller.method', 0x68656C6C6F, 6, 1634830094733128, -1062731606, NULL, NULL, 'febs-server-system');
INSERT INTO `zipkin_annotations` VALUES (0, 5887678610039420238, -8946801476051011086, 'cs', NULL, -1, 1634830094728838, -1062731606, NULL, NULL, 'febs-server-test');
INSERT INTO `zipkin_annotations` VALUES (0, 5887678610039420238, -8946801476051011086, 'cr', NULL, -1, 1634830094824276, -1062731606, NULL, NULL, 'febs-server-test');
INSERT INTO `zipkin_annotations` VALUES (0, 5887678610039420238, -8946801476051011086, 'http.method', 0x474554, 6, 1634830094728838, -1062731606, NULL, NULL, 'febs-server-test');
INSERT INTO `zipkin_annotations` VALUES (0, 5887678610039420238, -8946801476051011086, 'http.path', 0x2F68656C6C6F, 6, 1634830094728838, -1062731606, NULL, NULL, 'febs-server-test');
INSERT INTO `zipkin_annotations` VALUES (0, 5887678610039420238, -4687535314961952217, 'lc', '', 6, 1634830094201929, -1062731606, NULL, NULL, 'febs-server-test');
INSERT INTO `zipkin_annotations` VALUES (0, 5887678610039420238, 5887678610039420238, 'sr', NULL, -1, 1634830093786146, -1062731606, NULL, NULL, 'febs-server-test');
INSERT INTO `zipkin_annotations` VALUES (0, 5887678610039420238, 5887678610039420238, 'ss', NULL, -1, 1634830094847026, -1062731606, NULL, NULL, 'febs-server-test');
INSERT INTO `zipkin_annotations` VALUES (0, 5887678610039420238, 5887678610039420238, 'ca', 0x01, 0, 1634830093786146, NULL, 0x00000000000000000000000000000001, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, 5887678610039420238, 5887678610039420238, 'http.method', 0x474554, 6, 1634830093786146, -1062731606, NULL, NULL, 'febs-server-test');
INSERT INTO `zipkin_annotations` VALUES (0, 5887678610039420238, 5887678610039420238, 'http.path', 0x2F68656C6C6F, 6, 1634830093786146, -1062731606, NULL, NULL, 'febs-server-test');
INSERT INTO `zipkin_annotations` VALUES (0, 5887678610039420238, 5887678610039420238, 'mvc.controller.class', 0x54657374436F6E74726F6C6C6572, 6, 1634830093786146, -1062731606, NULL, NULL, 'febs-server-test');
INSERT INTO `zipkin_annotations` VALUES (0, 5887678610039420238, 5887678610039420238, 'mvc.controller.method', 0x68656C6C6F, 6, 1634830093786146, -1062731606, NULL, NULL, 'febs-server-test');

-- ----------------------------
-- Table structure for zipkin_dependencies
-- ----------------------------
DROP TABLE IF EXISTS `zipkin_dependencies`;
CREATE TABLE `zipkin_dependencies`  (
  `day` date NOT NULL,
  `parent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `child` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `call_count` bigint(20) NULL DEFAULT NULL,
  `error_count` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`day`, `parent`, `child`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compressed;

-- ----------------------------
-- Table structure for zipkin_spans
-- ----------------------------
DROP TABLE IF EXISTS `zipkin_spans`;
CREATE TABLE `zipkin_spans`  (
  `trace_id_high` bigint(20) NOT NULL DEFAULT 0 COMMENT 'If non zero, this means the trace uses 128 bit traceIds instead of 64 bit',
  `trace_id` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remote_service_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  `debug` bit(1) NULL DEFAULT NULL,
  `start_ts` bigint(20) NULL DEFAULT NULL COMMENT 'Span.timestamp(): epoch micros used for endTs query and to implement TTL',
  `duration` bigint(20) NULL DEFAULT NULL COMMENT 'Span.duration(): micros used for minDuration and maxDuration query',
  PRIMARY KEY (`trace_id_high`, `trace_id`, `id`) USING BTREE,
  INDEX `trace_id_high`(`trace_id_high`, `trace_id`) USING BTREE COMMENT 'for getTracesByIds',
  INDEX `name`(`name`) USING BTREE COMMENT 'for getTraces and getSpanNames',
  INDEX `remote_service_name`(`remote_service_name`) USING BTREE COMMENT 'for getTraces and getRemoteServiceNames',
  INDEX `start_ts`(`start_ts`) USING BTREE COMMENT 'for getTraces ordering and range'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compressed;

-- ----------------------------
-- Records of zipkin_spans
-- ----------------------------
INSERT INTO `zipkin_spans` VALUES (0, -5645082439512264888, -5645082439512264888, 'async', '', NULL, NULL, 1634830003818000, 111675);
INSERT INTO `zipkin_spans` VALUES (0, -2443935885181011133, -2443935885181011133, 'async', '', NULL, NULL, 1634830000996000, 4964);
INSERT INTO `zipkin_spans` VALUES (0, 3988931329354820024, 3988931329354820024, 'get', '', NULL, NULL, 1634830004003324, 10721);
INSERT INTO `zipkin_spans` VALUES (0, 5887678610039420238, -8946801476051011086, 'get', '', -4687535314961952217, NULL, 1634830094728838, 95438);
INSERT INTO `zipkin_spans` VALUES (0, 5887678610039420238, -4687535314961952217, 'hystrix', '', 5887678610039420238, NULL, 1634830094201929, 638342);
INSERT INTO `zipkin_spans` VALUES (0, 5887678610039420238, -777597801599545717, 'get', '', -8946801476051011086, NULL, 1634830094742632, 39548);
INSERT INTO `zipkin_spans` VALUES (0, 5887678610039420238, 3554885541279608291, 'get', '', 5887678610039420238, NULL, 1634830093794075, 71906);
INSERT INTO `zipkin_spans` VALUES (0, 5887678610039420238, 5887678610039420238, 'get /hello', '', NULL, NULL, 1634830093786146, 1060880);
INSERT INTO `zipkin_spans` VALUES (0, 7726305239188662965, 7726305239188662965, 'get', '', NULL, NULL, 1634830001074505, 9032);

SET FOREIGN_KEY_CHECKS = 1;
