DROP TABLE IF EXISTS `user_info_tab`;
CREATE TABLE `user_info_tab`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'user name',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT 'password,encryption',
  `profile_photo` varchar(500) NOT NULL DEFAULT '' COMMENT 'profile photo',
  `user_email` varchar(64) NOT NULL DEFAULT '' COMMENT 'email',
  `user_phone` varchar(64) NOT NULL DEFAULT '' COMMENT 'phone',
  `alias` varchar(255) NOT NULL DEFAULT '' COMMENT 'alias',
  `account_type` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT 'account type.0:customer,1:seller',
  `account_status` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '0:normal,1:restrict ,2:lock',
  `create_time` int UNSIGNED NOT NULL COMMENT 'create time',
  `update_time` int UNSIGNED NOT NULL COMMENT 'update time',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '0:valid,1:logically deleted',
  PRIMARY KEY (`id`),
  INDEX `idx_account_type`(`account_type`) USING BTREE,
  INDEX `idx_is_delete`(`is_delete`) USING BTREE
) COMMENT = 'user base info';

DROP TABLE IF EXISTS `user_visit_history_tab`;
CREATE TABLE `user_visit_history_tab`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,   
  `user_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT 'user info id',
  `goods_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT 'goods id',
  `goods_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'goods name',
  `goods_price` decimal UNSIGNED NOT NULL DEFAULT 0 COMMENT 'goods price',
  `goods_main_pic`  varchar(255) NOT NULL DEFAULT '' COMMENT 'the main picture url of goods',
  `create_time` int UNSIGNED NOT NULL COMMENT 'create time',
  `update_time` int UNSIGNED NOT NULL COMMENT 'update time',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '0:valid,1:logically deleted',
  PRIMARY KEY (`id`),
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_goods_id`(`goods_id`) USING BTREE
) COMMENT = 'browsing history';

DROP TABLE IF EXISTS `shop_info_tab`;
CREATE TABLE `shop_info_tab`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `shop_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT 'shop id',
  `user_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT 'owner id',
  `shop_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'shop name',
  `shop_image` varchar(500) NOT NULL DEFAULT '' COMMENT 'main image of shop',
  `shop_brief`  varchar(500) NOT NULL DEFAULT '' COMMENT 'shop brief',
  `create_time` int UNSIGNED NOT NULL COMMENT 'create time',
  `update_time` int UNSIGNED NOT NULL COMMENT 'update time',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '0:valid,1:logically deleted',
  PRIMARY KEY (`id`),
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_shop_id`(`shop_id`) USING BTREE
) COMMENT = 'shop info';

DROP TABLE IF EXISTS `goods_info_tab`;
CREATE TABLE `goods_info_tab`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `goods_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT 'goods id',
  `shop_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT 'shop id',
  `user_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT 'owner id',
  `goods_title` varchar(255) NOT NULL DEFAULT '' COMMENT 'goods title',
  `goods_price` decimal UNSIGNED NOT NULL DEFAULT 0 COMMENT 'price',
  `goods_status` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '0:edit,1auditing,2normal,3off,4forbid,5del',
  `goods_main_image` varchar(500) NOT NULL DEFAULT '' COMMENT 'goods main image',
  `goods_stock` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT 'stock',
  `create_time` int UNSIGNED NOT NULL COMMENT 'create time',
  `update_time` int UNSIGNED NOT NULL COMMENT 'update time',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '0:valid,1:logically deleted',
  PRIMARY KEY (`id`),
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_goods_id`(`goods_id`) USING BTREE,
  INDEX `idx_goods_title`(`goods_title`) USING BTREE,
  INDEX `idx_goods_status`(`goods_status`) USING BTREE,
  INDEX `idx_shop_id`(`shop_id`) USING BTREE
) COMMENT = 'goods info';

DROP TABLE IF EXISTS `goods_info_extend_tab`;
CREATE TABLE `goods_info_extend_tab`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `goods_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT 'goods id',
  `goods_all_image` varchar(1024) NOT NULL DEFAULT '' COMMENT 'goods all image',
  `goods_category_id` int(20) NOT NULL DEFAULT 0 COMMENT '0:other.see category detail tab...',
  `goods_category_name` varchar(1024) NOT NULL DEFAULT '' COMMENT 'goods category name',
  `goods_brand` varchar(1024) NOT NULL DEFAULT '' COMMENT 'brand',
  `goods_properties` varchar(1024) NOT NULL DEFAULT '' COMMENT 'properties detail',
  `goods_brief` varchar(1024) NOT NULL DEFAULT '' COMMENT 'goods detail',
  `create_time` int UNSIGNED NOT NULL COMMENT 'create time',
  `update_time` int UNSIGNED NOT NULL COMMENT 'update time',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '0:valid,1:logically deleted',
  PRIMARY KEY (`id`),
  INDEX `idx_goods_id`(`goods_id`) USING BTREE
) COMMENT = 'goods info extend';

DROP TABLE IF EXISTS `goods_auditing_tab`;
CREATE TABLE `goods_auditing_tab`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `goods_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT 'goods id',
  `shop_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT 'shop id',
  `create_time` int UNSIGNED NOT NULL COMMENT 'create time',
  `update_time` int UNSIGNED NOT NULL COMMENT 'update time',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '0:valid,1:logically deleted',
  PRIMARY KEY (`id`),
  INDEX `idx_goods_id`(`goods_id`) USING BTREE
) COMMENT = 'auditing tmp tab';

DROP TABLE IF EXISTS `goods_auditing_record_tab`;
CREATE TABLE `goods_auditing_record_tab`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `goods_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT 'goods id',
  `shop_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT 'shop id',
  `goods_status_from` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '0:edit,1auditing,2normal,3off,4forbid,5del',
  `goods_status_to` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '0:edit,1auditing,2normal,3off,4forbid,5del',
  `create_time` int UNSIGNED NOT NULL COMMENT 'create time',
  `update_time` int UNSIGNED NOT NULL COMMENT 'update time',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '0:valid,1:logically deleted',
  PRIMARY KEY (`id`),
  INDEX `idx_goods_extend_id`(`goods_id`) USING BTREE
) COMMENT = '1auditing record log';