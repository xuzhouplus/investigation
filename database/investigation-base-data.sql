# 问题类型
INSERT INTO `inv_type`(`id`, `name`, `description`) VALUES (1, '现实自我', '我认为现实中的自己');
INSERT INTO `inv_type`(`id`, `name`, `description`) VALUES (2, '虚拟自我', '我任务这一个虚拟化身');
INSERT INTO `inv_type`(`id`, `name`, `description`) VALUES (3, '情绪量化', '当您在使用该化身时，会出现以下哪些情绪感受');

# 化身文件
INSERT INTO `inv_file`(`id`, `base_url`, `file_path`, `type`, `size`, `name`) VALUES (1, 'http://172.29.2.37:8009/storage', '/1/yqdb_KNylEGszYIqaXvnQ3v9z6r25AFl.png', 'image/png', 383797, '暗夜男.png');
INSERT INTO `inv_file`(`id`, `base_url`, `file_path`, `type`, `size`, `name`) VALUES (2, 'http://172.29.2.37:8009/storage', '/1/ZYdZ5G9JxQeTHnHkWMfYqpu4e9sWe-Sv.png', 'image/png', 301283, '暗夜女.png');
INSERT INTO `inv_file`(`id`, `base_url`, `file_path`, `type`, `size`, `name`) VALUES (3, 'http://172.29.2.37:8009/storage', '/1/j4zYJeUF5DsAmo_iaqPIHBEXijRuEwWA.png', 'image/png', 517185, '德莱尼男.png');
INSERT INTO `inv_file`(`id`, `base_url`, `file_path`, `type`, `size`, `name`) VALUES (4, 'http://172.29.2.37:8009/storage', '/1/djNfw2_5X1iqQQLP8UNNeDYETh4sQuiH.png', 'image/png', 294498, '德莱尼女.png');
INSERT INTO `inv_file`(`id`, `base_url`, `file_path`, `type`, `size`, `name`) VALUES (5, 'http://172.29.2.37:8009/storage', '/1/ct6eWOSgJBESzM-QTcEZXuX-IvfAIAEE.png', 'image/png', 492353, '巨魔男.png');
INSERT INTO `inv_file`(`id`, `base_url`, `file_path`, `type`, `size`, `name`) VALUES (6, 'http://172.29.2.37:8009/storage', '/1/khsOnGpSGEvFnyOSFDAz17jWonV6VoQF.png', 'image/png', 331167, '巨魔女.png');
INSERT INTO `inv_file`(`id`, `base_url`, `file_path`, `type`, `size`, `name`) VALUES (7, 'http://172.29.2.37:8009/storage', '/1/Dls48oNKwEIl3Mvzr3O6_RFEaUNpE9CG.png', 'image/png', 549665, '牛头男.png');
INSERT INTO `inv_file`(`id`, `base_url`, `file_path`, `type`, `size`, `name`) VALUES (8, 'http://172.29.2.37:8009/storage', '/1/eZqAUdbYh77OkyQ91wDQ7zIIpHzFHOYN.png', 'image/png', 374689, '牛头女.png');
INSERT INTO `inv_file`(`id`, `base_url`, `file_path`, `type`, `size`, `name`) VALUES (9, 'http://172.29.2.37:8009/storage', '/1/jjosyM2RaLMwC4V26_HPfCajlUtr430_.png', 'image/png', 304216, '人类男.png');
INSERT INTO `inv_file`(`id`, `base_url`, `file_path`, `type`, `size`, `name`) VALUES (10, 'http://172.29.2.37:8009/storage', '/1/tFKP91Dj417WjuRNvnQLpWPvqTzSCOqF.png', 'image/png', 206395, '人类女.png');
INSERT INTO `inv_file`(`id`, `base_url`, `file_path`, `type`, `size`, `name`) VALUES (11, 'http://172.29.2.37:8009/storage', '/1/p34V0h1aKEfFcsblpXXJFn33dyVQm3yi.png', 'image/png', 308447, '亡灵男.png');
INSERT INTO `inv_file`(`id`, `base_url`, `file_path`, `type`, `size`, `name`) VALUES (12, 'http://172.29.2.37:8009/storage', '/1/FYNayeOSW5JPP9WY3x4vnLcjmw7rmLZR.png', 'image/png', 242558, '亡灵女.png');

# 化身
INSERT INTO `inv_incarnation`(`id`, `name`, `file_id`, `description`, `gender`, `grade`) VALUES (1, '暗夜', '1', '', 'male', NULL);
INSERT INTO `inv_incarnation`(`id`, `name`, `file_id`, `description`, `gender`, `grade`) VALUES (2, '暗夜', '2', '', 'female', NULL);
INSERT INTO `inv_incarnation`(`id`, `name`, `file_id`, `description`, `gender`, `grade`) VALUES (3, '德莱尼', '3', '', 'male', NULL);
INSERT INTO `inv_incarnation`(`id`, `name`, `file_id`, `description`, `gender`, `grade`) VALUES (4, '德莱尼', '4', '', 'female', NULL);
INSERT INTO `inv_incarnation`(`id`, `name`, `file_id`, `description`, `gender`, `grade`) VALUES (5, '巨魔', '5', '', 'male', NULL);
INSERT INTO `inv_incarnation`(`id`, `name`, `file_id`, `description`, `gender`, `grade`) VALUES (6, '巨魔', '6', '', 'female', NULL);
INSERT INTO `inv_incarnation`(`id`, `name`, `file_id`, `description`, `gender`, `grade`) VALUES (7, '牛头', '7', '', 'male', NULL);
INSERT INTO `inv_incarnation`(`id`, `name`, `file_id`, `description`, `gender`, `grade`) VALUES (8, '牛头', '8', '', 'female', NULL);
INSERT INTO `inv_incarnation`(`id`, `name`, `file_id`, `description`, `gender`, `grade`) VALUES (9, '人类', '9', '', 'male', NULL);
INSERT INTO `inv_incarnation`(`id`, `name`, `file_id`, `description`, `gender`, `grade`) VALUES (10, '人类', '10', '', 'female', NULL);
INSERT INTO `inv_incarnation`(`id`, `name`, `file_id`, `description`, `gender`, `grade`) VALUES (11, '亡灵', '11', '', 'female', NULL);
INSERT INTO `inv_incarnation`(`id`, `name`, `file_id`, `description`, `gender`, `grade`) VALUES (12, '亡灵', '12', '', 'male', NULL);
