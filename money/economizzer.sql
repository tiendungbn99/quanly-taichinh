-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 30, 2021 lúc 11:31 AM
-- Phiên bản máy phục vụ: 10.4.20-MariaDB
-- Phiên bản PHP: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `economizzer`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cashbook`
--

CREATE TABLE `cashbook` (
  `id` int(11) NOT NULL,
  `value` float NOT NULL,
  `description` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `is_pending` tinyint(1) NOT NULL DEFAULT 0,
  `attachment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `inc_datetime` datetime DEFAULT NULL COMMENT 'insert date',
  `edit_datetime` datetime DEFAULT NULL COMMENT 'edit date',
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Control financial movement';

--
-- Đang đổ dữ liệu cho bảng `cashbook`
--

INSERT INTO `cashbook` (`id`, `value`, `description`, `date`, `is_pending`, `attachment`, `inc_datetime`, `edit_datetime`, `user_id`, `category_id`, `type_id`) VALUES
(611, -1000000, 'Gạo, Táo ,chuỗi , trứng, thịt cá, rau', '2021-08-25', 0, NULL, '2021-08-30 04:41:12', NULL, 3, 1012, 2),
(612, -5000000, 'Hạ Long', '2021-08-26', 0, NULL, '2021-08-30 05:34:04', '2021-08-30 05:34:26', 3, 1015, 2),
(613, 15000000, '', '2021-08-10', 0, NULL, '2021-08-30 10:46:02', NULL, 3, 1017, 1),
(614, -300000, 'Áo phông trắng', '2021-08-28', 0, NULL, '2021-08-30 10:46:42', NULL, 3, 1012, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id_category` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `desc_category` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `hexcolor_category` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` int(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Categories of entries: Water, light, card, etc.';

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id_category`, `parent_id`, `desc_category`, `hexcolor_category`, `is_active`, `user_id`) VALUES
(1010, NULL, 'Mua Sắm', '#ff0000', 1, 3),
(1011, NULL, 'Du Lịch', '#ff9900', 1, 3),
(1012, 1010, 'Đồ Ăn', '#ff0000', 1, 3),
(1013, 1010, 'Quần áo', '#ff0000', 1, 3),
(1014, 1011, 'Châu Á', '#ff9900', 1, 3),
(1015, 1011, 'Việt Nam', '#ff9900', 1, 3),
(1016, NULL, 'Lương', '#ffffff', 1, 3),
(1017, 1016, 'Tháng 7', '#d9d9d9', 1, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1630290173),
('m160320_200425_initial', 1630290182);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `profile`
--

CREATE TABLE `profile` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `startpage` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'cashbook/index',
  `currencycode` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'USD',
  `decimalseparator` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `profile`
--

INSERT INTO `profile` (`id`, `user_id`, `create_time`, `update_time`, `full_name`, `language`, `startpage`, `currencycode`, `decimalseparator`) VALUES
(1, 1, '2015-01-24 19:53:12', NULL, 'the one', 'en', 'cashbook/index', 'USD', '.'),
(3, 3, '2015-02-13 20:03:28', '2021-08-30 03:42:44', 'Tiến Dũng', 'fr', 'dashboard/overview', 'VND', ',');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `can_admin` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`id`, `name`, `create_time`, `update_time`, `can_admin`) VALUES
(1, 'Admin', '2015-01-24 19:53:11', NULL, 1),
(2, 'User', '2015-01-24 19:53:11', NULL, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type`
--

CREATE TABLE `type` (
  `id_type` int(11) NOT NULL,
  `desc_type` varchar(45) CHARACTER SET latin1 NOT NULL,
  `hexcolor_type` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `icon_type` varchar(45) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Movement Type: Debit, Credit';

--
-- Đang đổ dữ liệu cho bảng `type`
--

INSERT INTO `type` (`id_type`, `desc_type`, `hexcolor_type`, `icon_type`) VALUES
(1, 'Revenue', '#18bc9c', ''),
(2, 'Expense', '#e74c3c', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `api_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login_time` timestamp NULL DEFAULT NULL,
  `create_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `ban_time` timestamp NULL DEFAULT NULL,
  `ban_reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `role_id`, `status`, `email`, `new_email`, `username`, `password`, `auth_key`, `api_key`, `login_ip`, `login_time`, `create_ip`, `create_time`, `update_time`, `ban_time`, `ban_reason`) VALUES
(1, 1, 1, 'tiendungbn1801@gmail.com', NULL, 'tiendung', '$2y$13$cRwqEDU2Elh6KLYfPzLVkuoGwNlUvi8JEUSHXc.0gMQ1fd4IqQSFm', 'ub1TTuSVSATn3NXbuVh4bhR-m2EXgVT0', 'Ahc7a0TXH6Gqe_8GTi1UlZEWVxHsOLcv', '189.3.54.36', '2021-08-23 18:13:36', NULL, '2021-08-22 19:53:12', '2021-08-23 23:24:53', NULL, NULL),
(3, 2, 1, 'dung@gmail.com', NULL, 'dung', '$2y$13$35B0rxLTERV8nMkmL613oeCHbOs7/2dAhCd3UhIrw44tWmcQKOE9C', 'qA_US4c8xUCucUDWXyYC-SA1qcxCiGTV', 'GWQuKuPFhAJTjE8GL5w2tvaveKs1Bvno', '::1', '2021-08-30 04:29:07', '127.0.0.1', '2021-08-22 20:03:28', '2021-08-24 10:05:45', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_auth`
--

CREATE TABLE `user_auth` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider_attributes` text COLLATE utf8_unicode_ci NOT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_key`
--

CREATE TABLE `user_key` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  `key_value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `consume_time` timestamp NULL DEFAULT NULL,
  `expire_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user_key`
--

INSERT INTO `user_key` (`id`, `user_id`, `type`, `key_value`, `create_time`, `consume_time`, `expire_time`) VALUES
(1, 3, 1, 'fgX4vB8x1UW8uGdCaKQTj9kKo7Kfbltp', '2015-02-13 20:03:28', NULL, NULL),
(3, 3, 2, 'jkApCoj4zQ1osBGZ6gEwIJ9zgLeiOFxb', '2015-04-21 12:15:00', NULL, '2015-10-09 10:05:45');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cashbook`
--
ALTER TABLE `cashbook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tb_cashbook_tb_user1_idx` (`user_id`),
  ADD KEY `fk_tb_cashbook_tb_category1_idx` (`category_id`),
  ADD KEY `fk_tb_cashbook_tb_type1_idx` (`type_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_category`),
  ADD KEY `fk_tb_category_tb_user1_idx` (`user_id`);

--
-- Chỉ mục cho bảng `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Chỉ mục cho bảng `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_profile_user_id` (`user_id`) USING BTREE;

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id_type`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tb_user_email` (`email`) USING BTREE,
  ADD UNIQUE KEY `tb_user_username` (`username`) USING BTREE,
  ADD KEY `tb_user_role_id` (`role_id`) USING BTREE;

--
-- Chỉ mục cho bảng `user_auth`
--
ALTER TABLE `user_auth`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_user_auth_provider_id` (`provider_id`) USING BTREE,
  ADD KEY `tb_user_auth_user_id` (`user_id`) USING BTREE;

--
-- Chỉ mục cho bảng `user_key`
--
ALTER TABLE `user_key`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tb_user_key_key` (`key_value`) USING BTREE,
  ADD KEY `tb_user_key_user_id` (`user_id`) USING BTREE;

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cashbook`
--
ALTER TABLE `cashbook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=615;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1018;

--
-- AUTO_INCREMENT cho bảng `profile`
--
ALTER TABLE `profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `type`
--
ALTER TABLE `type`
  MODIFY `id_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT cho bảng `user_auth`
--
ALTER TABLE `user_auth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT cho bảng `user_key`
--
ALTER TABLE `user_key`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cashbook`
--
ALTER TABLE `cashbook`
  ADD CONSTRAINT `fk_tb_cashbook_tb_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id_category`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tb_cashbook_tb_type1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id_type`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tb_cashbook_tb_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `fk_tb_category_tb_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Các ràng buộc cho bảng `user_auth`
--
ALTER TABLE `user_auth`
  ADD CONSTRAINT `user_auth_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `user_key`
--
ALTER TABLE `user_key`
  ADD CONSTRAINT `user_key_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
