-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2018-05-31 08:58:26
-- 服务器版本： 5.7.18
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `paul`
--

-- --------------------------------------------------------

--
-- 表的结构 `competitions`
--

CREATE TABLE `competitions` (
  `competition_id` int(10) UNSIGNED NOT NULL,
  `season` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `type` tinyint(1) DEFAULT '0' COMMENT '0：联赛；1：杯赛',
  `isClub` tinyint(1) NOT NULL DEFAULT '1',
  `order_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `competitions`
--

INSERT INTO `competitions` (`competition_id`, `season`, `name`, `enable`, `type`, `isClub`, `order_id`) VALUES
(1, '2018-2019', '英超', 1, 0, 1, 2),
(2, '2018-2019', '西甲', 1, 0, 1, 3),
(3, '2018-2019', '意甲', 1, 0, 1, 4),
(4, '2018-2019', '德甲', 1, 0, 1, 5),
(5, '2018', '中超', 1, 0, 1, 1),
(6, '2018', '2018世界杯', 1, 1, 0, 0),
(7, '2018-2019', '法甲', 0, 0, 1, 6);

-- --------------------------------------------------------

--
-- 表的结构 `cSessionInfo`
--

CREATE TABLE `cSessionInfo` (
  `open_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uuid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `skey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_visit_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `session_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_info` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会话管理用户信息';

--
-- 转存表中的数据 `cSessionInfo`
--

INSERT INTO `cSessionInfo` (`open_id`, `uuid`, `skey`, `create_time`, `last_visit_time`, `session_key`, `user_info`) VALUES
('ol9g95a2nau0R4p9cJobV6chWEWc', 'cd61c834-7d03-4020-81b8-8d8b6d30bf4f', '7967d9ae780793d0c168aefe33db9c5485b39448', '2018-05-24 05:51:59', '2018-05-24 05:51:59', 'zUb3n3QVXV2DYV5/pleBqw==', '{\"openId\":\"ol9g95a2nau0R4p9cJobV6chWEWc\",\"nickName\":\"Jimi\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Minhang\",\"province\":\"Shanghai\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ54pk5uAKVI2siblfcD9wgtaM93c1UJ2icLf5d0Ycu1jvbNmLAmicfnkyduP0v12phoib6yEbuuxic4ag/132\",\"watermark\":{\"timestamp\":1527141117,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95a4Y4Hup6_Hp-HxsKPnBRHg', '411a2ed3-849c-4c54-8ab8-034b10d31d7a', '9de53e0573a174916a9e33fe9cb7f886b0245e31', '2018-05-30 08:11:23', '2018-05-31 03:59:03', 'foFgumXxT56pQI6DGBWuTA==', '{\"openId\":\"ol9g95a4Y4Hup6_Hp-HxsKPnBRHg\",\"nickName\":\"月咏\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"Jordan\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKic1HtFiaAFz8EUD7AlO0IMC3DF94FkXkVGS5Pk80WibvC3GrEdlbBvCib3MrTTX5fAYBSibwKCpI2MAQ/132\",\"watermark\":{\"timestamp\":1527739142,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95a63bbxArU3p6fA5m-EUYTU', 'ac1aad0c-cb63-4c48-9c9a-43ef993e9ff0', '119680ead07c56d1089776baf8b51233f980219f', '2018-05-24 14:45:59', '2018-05-24 14:45:59', '7/4hcGJ8bEChtWT/9UMsdA==', '{\"openId\":\"ol9g95a63bbxArU3p6fA5m-EUYTU\",\"nickName\":\"王兴\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Hongkou\",\"province\":\"Shanghai\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJzTK7PcEnMn1fpS9ttiaQYAkherLLbE9pzD53xWbPgeDz4UZZ8dlk18wknYqZXiaA6E2mxoU07dibEQ/132\",\"watermark\":{\"timestamp\":1527173157,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95aBmChcZ_ZlPH-LieV5hYSg', '6e8bbd2b-56f8-4eb1-a998-c34d67bd4568', '72e6c835de5f847ba90e005e0bc8243f9f1b1c61', '2018-05-30 09:46:07', '2018-05-30 09:46:07', 'e2HyTaCHAhKkg1cp6NiBZA==', '{\"openId\":\"ol9g95aBmChcZ_ZlPH-LieV5hYSg\",\"nickName\":\"柏陈\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Suzhou\",\"province\":\"Jiangsu\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTInsMdOAPMzYkG389B6t2em6o6k7N87m40Su2keNhAXrnQj8cEEYZ6Cwvp83T5ibpuFj4A9UmxKWWw/132\",\"watermark\":{\"timestamp\":1527673565,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95acofFmWVYRlb1SuXw2jtAo', '351f8dc2-485a-4eab-8bee-2d8649e30bee', '500739e577f66ed8bfcebfee796d68e80881d3a8', '2018-05-24 15:24:14', '2018-05-29 15:15:23', 'NSFA9wGKn2xzleF8F7O7bQ==', '{\"openId\":\"ol9g95acofFmWVYRlb1SuXw2jtAo\",\"nickName\":\"Tiny（Barca）\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Po\",\"province\":\"Shanghai\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqqyricxpIzNRaM0t3NgcZmXP1dfySdkp4ZfAYmsFVIyPvqv6JNSaiaXH97bYf66BAGsXSlzpAcYOLQ/132\",\"watermark\":{\"timestamp\":1527606921,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95agMa0LgBexwjyEUyFFdfb0', '00f8bb3b-bb45-4cb3-94f4-7f1686528051', '4ab254ec1cf09dbf304c3cfe08c1ab865e2452db', '2018-05-29 09:53:23', '2018-05-29 09:53:23', 'gHBIHgTVjxHzcPCdqW/qVg==', '{\"openId\":\"ol9g95agMa0LgBexwjyEUyFFdfb0\",\"nickName\":\"思远\",\"gender\":2,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"Trinidad and Tobago\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIbbFJrCfgWEozxnLU0nUEpBTO54e3ZAnzXlxDycz4OmxxdhMGCoycpribpibICl7aD6I5lfTPZb9SA/132\",\"watermark\":{\"timestamp\":1527587602,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95apmoVfmcV7AyJA6kragf-Q', '18134cf0-3926-43be-ac5b-32f423d721d0', 'c409c3b5254f2176a27d941205fbf31c3189b7b9', '2018-05-29 05:29:09', '2018-05-31 06:18:59', 'apm/0DK5NcHoEJwClLSs3w==', '{\"openId\":\"ol9g95apmoVfmcV7AyJA6kragf-Q\",\"nickName\":\"霞儿\",\"gender\":2,\"language\":\"zh_CN\",\"city\":\"Nantong\",\"province\":\"Jiangsu\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLMdia9R0bMfaNZfiaqPic0KS8oibSlfJvN3MpRM10FUMsyyjZdaIxMYcGbIKFlaVg9ibTWNWo6coZ86ew/132\",\"watermark\":{\"timestamp\":1527747537,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95apuDYNuj2JbiAOK9W3JyfU', '864968a7-1c28-4c8a-adff-1ca8b977e58e', '024d5d816e474ffff644af6906d127725f74dc48', '2018-05-24 00:00:48', '2018-05-31 05:14:53', 'ljVqOc1j84TxuqYceJXacA==', '{\"openId\":\"ol9g95apuDYNuj2JbiAOK9W3JyfU\",\"nickName\":\"小蟹蟹\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"Pakistan\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q3auHgzwzM4PDVhf4pQVxtuziak7eobujHzicXCXXjPRGtmCjhqWSyUPibSMibNSsiatvoKxorLbessqoIzX3raPQtA/132\",\"watermark\":{\"timestamp\":1527743692,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95bmKy7W0qoJ3IjXd6c9W7TI', '324e8f1e-ff47-46ca-9452-6b3a9ec758d1', 'c75d6e19fb731eb91aa4d5aa3be74b0899ede306', '2018-05-29 09:06:50', '2018-05-29 09:06:50', 'fVH37lHrV29ipvEiTHmjKA==', '{\"openId\":\"ol9g95bmKy7W0qoJ3IjXd6c9W7TI\",\"nickName\":\"丐帮CEO\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Quanzhou\",\"province\":\"Fujian\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJjLAnElQ07o9LdWMicZG7iaOic6DoLgusI437HibM0dgIdXVcUNtZakDnZggwh3qDWtS4AHFPmiakX10Q/132\",\"watermark\":{\"timestamp\":1527584808,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95bOgmyRIUuwvhw43-S7W8Yc', '28b63734-b84a-42cb-995f-f177ddf513e7', '7dac00ce78584b7a067a829ebe9118fff518cc3c', '2018-05-29 13:40:36', '2018-05-29 13:40:36', 'IEiMyNqnYLKa6rJSgTNpCg==', '{\"openId\":\"ol9g95bOgmyRIUuwvhw43-S7W8Yc\",\"nickName\":\"云溪\",\"gender\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erFysCoslrLFVoXH3DqRn9hUSIVH1wUKvwtXLMzcbGGHGlvgV96JrD1iay5BrRzO3KPb00ibUmvwic8Q/132\",\"watermark\":{\"timestamp\":1527601234,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95brBvAPP1e6bqqHPGhgZ2ro', 'f3352fc8-57f1-46de-89ee-d0e97f176b50', 'ba9c50d4a61874b6f6946e1bc61b2be95cc8b95a', '2018-05-28 15:51:31', '2018-05-28 15:51:31', 'U51QR0OyanedPJG3vmA4SA==', '{\"openId\":\"ol9g95brBvAPP1e6bqqHPGhgZ2ro\",\"nickName\":\"lim\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Haidian\",\"province\":\"Beijing\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/cviaNUiaiaMq9cXBLkXwdktw7hicnOP1mJVjBmokGbBE6JvKVTHaXVRGa3D1heljLEfOhsbyamFEhJzLk2XVPw6xXw/132\",\"watermark\":{\"timestamp\":1527522689,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95bvhX6_Gg2zqgNg16uwCZQQ', '397e73ec-f295-4299-a325-f11ae29e9b38', '7afe3a6d3e6f5c244848a728377e2831d466e518', '2018-05-25 00:46:31', '2018-05-25 00:46:31', 'XgCbTsZKzHLdYJEpl3s1RA==', '{\"openId\":\"ol9g95bvhX6_Gg2zqgNg16uwCZQQ\",\"nickName\":\"Ray H.Louis V\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Minhang\",\"province\":\"Shanghai\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIQZicmWK7jkkZ2EHJJxVOias30xqzd4xkgsV7tL0fVBictEzcqjdWwq8AJG4Y0fLENot17rK8eBQ17Q/132\",\"watermark\":{\"timestamp\":1527209188,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95bxHo8c8-KDV4RW5KcPbIaI', '931e0e7a-392f-46e6-b7d8-a2a4b5a48ee8', '62296d3578a4baefa0b7d6761f10cae248c82392', '2018-05-29 10:00:42', '2018-05-29 10:00:42', '+vyvqrNAKGjpRrDRETyNqg==', '{\"openId\":\"ol9g95bxHo8c8-KDV4RW5KcPbIaI\",\"nickName\":\"新手\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Shenzhen\",\"province\":\"Guangdong\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Wjc3b94hz5KndqIZuVjYAAJxJTJNribCqar5HONIWic3orAhiafib0vOruR5jYV5icibictH7HU15KVkkDqibemiazibEoWA/132\",\"watermark\":{\"timestamp\":1527588040,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95bXnLN9QzYrjr2flPIztdKw', 'c7ec6d74-9bad-4b97-97a7-f3cdfdec748b', '61f0ddb50ed24273505c12818f153f0c4b3c4e2c', '2018-05-23 07:56:00', '2018-05-31 03:01:19', 'Apwr0MoHLyP4WjYWZx0AYg==', '{\"openId\":\"ol9g95bXnLN9QzYrjr2flPIztdKw\",\"nickName\":\"K\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Minhang\",\"province\":\"Shanghai\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJGkOYktq7Om24BNN4RngYdyPxvR3ksprJDvTKygjIicbgibp6ThYpDz81JNf8iaJe3nUkCXibzXneTtg/132\",\"watermark\":{\"timestamp\":1527735677,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95bzffsbBj_f3iBUt5vsZ0x0', '2780319f-def4-4536-baf4-f0843d90f648', 'cbb501575c9eb7f1958e1b35574374c8333c52d7', '2018-05-29 08:04:40', '2018-05-29 08:04:40', 'ukUcX/v4XLhFmjA90jbXDA==', '{\"openId\":\"ol9g95bzffsbBj_f3iBUt5vsZ0x0\",\"nickName\":\"张卫\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"Shandong\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoNCjUtH1WW1wqJdROomqMvfCCQ8UqiaGf5kxl4yic9PVUrIqaKoicRPFgQDfUQkERhAfUnt3ZwOZQ3w/132\",\"watermark\":{\"timestamp\":1527581078,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95cFF6CG0h6p7kq3WGo8_KhA', '1a7a75c8-9e21-4b5e-b20f-d26cabae85f8', '3dd39aa558cbe6aebf0c651ad2bdc46337cb11bd', '2018-05-27 05:50:53', '2018-05-27 13:42:11', 'HBncZL1/x88p4tc2k6wRqA==', '{\"openId\":\"ol9g95cFF6CG0h6p7kq3WGo8_KhA\",\"nickName\":\"平步青云🛫\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Wanzhou\",\"province\":\"Chongqing\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/z4hFFGreQKcl0XiafUqZbaqp0ARIt3BbjCiaibcw3xMZzWFbXoXkCicPMIpIhwu0qSXOmcraopDKddYwiclGyZ3h5wA/132\",\"watermark\":{\"timestamp\":1527428530,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95cfjc3UY1y6x3hTxAkaq_x8', '41918f3d-59ef-4725-97c8-18a85b8632d6', '5b062befd4ea4a90a40666309e3a553a43d938a3', '2018-05-30 11:27:08', '2018-05-30 11:27:08', 'V5Tn4AVgxFtygPfiXnW5dw==', '{\"openId\":\"ol9g95cfjc3UY1y6x3hTxAkaq_x8\",\"nickName\":\"大⃝傻⃝\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"Andorra\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eo9biaLzxibM9SHZR0zyK5PfbG91QE5buK48iavkOBkp9DpaCo8U6SouHogjRibmMg1M72XdmgGx0nR6w/132\",\"watermark\":{\"timestamp\":1527679626,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95cJQLjdNNaQynX8Fs__LnSA', '3158e0e8-ac8c-47c3-ac81-2a58bb0251a8', '361e65335574ff821a65bc26e0d393583929f9ee', '2018-05-31 07:42:38', '2018-05-31 07:42:38', 'py/VHboBIFrSQqNy5T8eRw==', '{\"openId\":\"ol9g95cJQLjdNNaQynX8Fs__LnSA\",\"nickName\":\"A         王先生\'\'\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Jinnan\",\"province\":\"Tianjin\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKekKwcCTTicV3iaangMIC2H8scWnC0oMcPdkHQSMZQ0gyH0ribOZ1LQicndQYic3fAB38BcMsfvqUZVOg/132\",\"watermark\":{\"timestamp\":1527752556,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95cKrtY73s-OuA4H53QuoomY', '7c0d79f1-7f4b-4150-95b1-db395bb878d0', '4a2aeb90d36c4becb8fbaf624bac3ad1272e654d', '2018-05-27 07:44:09', '2018-05-27 07:44:09', 'wIv8c3Ph3H9KXzvA7zqT+g==', '{\"openId\":\"ol9g95cKrtY73s-OuA4H53QuoomY\",\"nickName\":\"连妹\",\"gender\":2,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"Egypt\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/bFfgpyt4Rib16PU5A2iciasQ6e6UdQWaeY7Ig8MBugptkDAtoicjoGkPj5jCQcqPv7JgGic7iapKFItMV2DSfZImT5uw/132\",\"watermark\":{\"timestamp\":1527407047,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95ckVSW3H0W7U5v-KV_bADPI', '4df2e3f6-9b7f-4f5c-9894-0994ebdf3267', 'f417215423a7595ae255e4b4637a6fea7d644fc3', '2018-05-24 06:52:36', '2018-05-24 06:52:36', 'f1JCYa8EZ3TvM6lkREo3qA==', '{\"openId\":\"ol9g95ckVSW3H0W7U5v-KV_bADPI\",\"nickName\":\"你若爱我怎会让我独自一人\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"Guizhou\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q3csR3XGFcicMGGvdDJeJdAibDGVIzycMqxibVgPNCicKiciakX7riaEvIhHGQth7ribSR9H2L1Jepia9ibw9hlYvms1a3xA/132\",\"watermark\":{\"timestamp\":1527144754,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95cZ8V6Ste8boHPzng-bLDhU', '20eab977-6477-4da3-9fb8-8e7992eb0a51', '19830a2487c7178be2875ba20c506d9224ac982a', '2018-05-30 11:05:34', '2018-05-30 11:05:34', 'AZb2pxOUiO3Fxwpwvw9Ptw==', '{\"openId\":\"ol9g95cZ8V6Ste8boHPzng-bLDhU\",\"nickName\":\"樱雪\",\"gender\":2,\"language\":\"zh_CN\",\"city\":\"Taiyuan\",\"province\":\"Shanxi\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL44y7jg3TKZ1JTYc1KQ0Ojn2QySeaF4DAvpvvuv850Zorn2AVzvfxrQtibwVqTpGyKXKTia7EaKOMg/132\",\"watermark\":{\"timestamp\":1527678332,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95d4qTYjdIrIeTHbBzyk3eGc', 'bfcafd42-bc9a-4b7b-8744-d2a9039eb70a', '3b3b22f70b95184c2b53d6238a49c04ee3908647', '2018-05-28 08:00:39', '2018-05-28 08:00:39', 'V86qgtqjlnczCi0nTIGtMw==', '{\"openId\":\"ol9g95d4qTYjdIrIeTHbBzyk3eGc\",\"nickName\":\"阿炳\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Hangzhou\",\"province\":\"Zhejiang\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/N4AJDQSf3z7bziaEkiaQYPe8bnMicJbjGJgenlwuzrWQvOs7E2wYBWqI0q7Ao2IKELpgqQPAFJ1Xgw3lGXZ0HkVxg/132\",\"watermark\":{\"timestamp\":1527494437,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95d8S994kcfkfGLqSPHOR1p8', '48454164-9081-468c-9e1b-53f45d2e7305', '7e6171e4e43c68f89673abc06f7315472b4aad4e', '2018-05-25 04:18:56', '2018-05-25 04:18:56', '2CgzUl2HihKgAwBhrCNfoQ==', '{\"openId\":\"ol9g95d8S994kcfkfGLqSPHOR1p8\",\"nickName\":\"rdgztest_CWWPCD\",\"gender\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"avatarUrl\":\"\",\"watermark\":{\"timestamp\":1527221935,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95diTM55yeMTN5WMgIw6Pr5g', 'c84b8479-1b6e-4409-961c-db6335dc74b3', 'efb3842fae8942aebab40d4703b70b9eb59e57d0', '2018-05-29 11:07:01', '2018-05-30 06:51:14', 'jEpwXTPrbrP8ODLOOqpCCw==', '{\"openId\":\"ol9g95diTM55yeMTN5WMgIw6Pr5g\",\"nickName\":\"超\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Wuhan\",\"province\":\"Hubei\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/qeDfVAdQaLZAr2icLdUGId2BQicHKBngTz0RwKjoIG0U3xicRhUUEhzpeNsYDtYjDYewRlg04cicVtqDfXvR7uvSUw/132\",\"watermark\":{\"timestamp\":1527663071,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95dZPkmfCqwKH2wd1nQY690A', 'a9acb0f4-6e53-450d-a817-6544b0f2fafb', 'f804bdd6acd6b75c789025db5c7cd9504b6e02fb', '2018-05-26 01:00:18', '2018-05-26 01:00:18', 'wopZAp7OkeIrD/m8kDhJFg==', '{\"openId\":\"ol9g95dZPkmfCqwKH2wd1nQY690A\",\"nickName\":\"阿雅\",\"gender\":2,\"language\":\"zh_CN\",\"city\":\"Wenzhou\",\"province\":\"Zhejiang\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIFYgkQ37CdiaiafYbU07EcnqG3YYQukoa6ERJ2bYTUWGJ0iallQU2mmhMGYAMmd8seFnyYKCK8lbwMQ/132\",\"watermark\":{\"timestamp\":1527296416,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95e8sMQLidxy-IfEXU1vSdKM', '2e1f5d2a-67a8-461d-ba45-f8678b14ac32', 'c1bab1ba52e4f169088b2c209106e67ff5e50d9e', '2018-05-26 09:16:44', '2018-05-26 09:16:44', 'CpDMb46mzjYJ8zzVEbzG6g==', '{\"openId\":\"ol9g95e8sMQLidxy-IfEXU1vSdKM\",\"nickName\":\"敏\",\"gender\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/aWcSG0SxMbhyFkxb16wviaLCQtMobd7KfsvI94HhFUYV1M6EOJsMUE3RcGhmvWArHXhvxdBic9vCRqOLXhqlukCQ/132\",\"watermark\":{\"timestamp\":1527326203,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95edENbVTOIAbU0xp_Dc_efs', '74ff753c-13a5-4142-8601-7f513b2b9adf', 'f1c678405be1db487671300450130279bee8f75a', '2018-05-30 12:27:15', '2018-05-31 02:37:02', 'hfwtxzbrum66AuCA9wmJ6Q==', '{\"openId\":\"ol9g95edENbVTOIAbU0xp_Dc_efs\",\"nickName\":\"邹曙光\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Suzhou\",\"province\":\"Jiangsu\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLqW6zArfmS2BmuibAbdUIpauCUA0jQbYR9y5oLCmNdzBsOV0W9KBdUAnoKPoam35qYj7fDN9ChiaiaQ/132\",\"watermark\":{\"timestamp\":1527734221,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95eJ1-VEEP4p_jRw30lTts5w', '90a6cbc3-09e2-4d37-9395-271182db234c', 'd999e85f957e73f208f2ae3391f48517de2a4125', '2018-05-29 17:06:04', '2018-05-29 17:06:04', 'tST2rG0wFllk4HhoVnKm2w==', '{\"openId\":\"ol9g95eJ1-VEEP4p_jRw30lTts5w\",\"nickName\":\"王贺\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Jining\",\"province\":\"Shandong\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKl05iaebz8zObr2EjgLn2HCdYML71W0yb8FxCag8RYmI1CRvRssEzOmyAOAiaTfbIAXUYxjkFGYzrg/132\",\"watermark\":{\"timestamp\":1527613563,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95eOIVJnfieLOKHDDOg_2gQg', 'cc1adbe6-0e0f-4509-830c-a737549552ad', 'c436d882d96d8441be7abb60fb753c34644346d3', '2018-05-27 04:11:03', '2018-05-27 04:11:03', 'tQ7IzgUeBpvSWyBBpm4SJw==', '{\"openId\":\"ol9g95eOIVJnfieLOKHDDOg_2gQg\",\"nickName\":\"佩玲\",\"gender\":0,\"language\":\"zh_CN\",\"city\":\"Huizhou\",\"province\":\"Guangdong\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/3dwfkbbys5ibUZa99Q4ezRqZRnFuke1V5Zic88CPCeniadnw9uWXPoibiavzriaNOJrDMWx7gkRXLeNzMMcnk4EUV5bg/132\",\"watermark\":{\"timestamp\":1527394261,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95euK0fg3zVSEKnkG2AjFT0U', '3f184633-2f87-4c92-a18a-21ebdb5724a1', '2de71478f73798a342a1988e1775052522625038', '2018-05-24 05:37:51', '2018-05-24 05:37:51', 'E4HDLrQ9MULatK1SaVmD4w==', '{\"openId\":\"ol9g95euK0fg3zVSEKnkG2AjFT0U\",\"nickName\":\"李强\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Minhang\",\"province\":\"Shanghai\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJvvcvZicXEjKiaSibBbsW5ZqPu4CacoN5nNqaTyxEuicNIlqaRcVO8BSuKP6cABkKsrib2qjenL2FOrQA/132\",\"watermark\":{\"timestamp\":1527140266,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95f4YUjDutT8AmdRjz1cVvDY', 'd0b1f938-77ba-4a2a-b0bc-4f7886a4b6e5', 'fb303affd39f6471f8a1c343f799b8ad048a181e', '2018-05-30 04:19:32', '2018-05-30 04:19:32', 'zyG4Zo2Y+mShopgsoaQsZA==', '{\"openId\":\"ol9g95f4YUjDutT8AmdRjz1cVvDY\",\"nickName\":\"CAIXD🤔\",\"gender\":2,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"Paris\",\"country\":\"France\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/pTnnZHVgEAicbQria1OHKI0ss5xMbGQAib238icHuib07lBPP3Eca1DyFntX4rISyd0daz5iaeoTRnyZcG0KBXnGC5GA/132\",\"watermark\":{\"timestamp\":1527653970,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95f9wUEsj95UCPVsP8eaa67M', 'af158322-7479-424f-9d7c-fa25c700ac3b', '930bed3469a7a613d459572a1e789240d2815d3f', '2018-05-31 06:39:50', '2018-05-31 06:39:50', 'DyMMPbsOcHKe5s3qBjEM/g==', '{\"openId\":\"ol9g95f9wUEsj95UCPVsP8eaa67M\",\"nickName\":\"凌\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Hengyang\",\"province\":\"Hunan\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/h8SKpwXDQ0vrmyiaraOhwl6yDtCgQ0YbpQydVedc6JxsynBjOkIKZibAzOQvw7oWko7xTYDvqU3TyvPUrrqFCXpw/132\",\"watermark\":{\"timestamp\":1527748789,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95fFWbEVlcDjUFOgaJGThUuA', '2c9a6410-9452-4a11-a4ff-86e06369ec25', '26203d8d5d31ea008cce0673788a57e3c359cd63', '2018-05-30 01:54:07', '2018-05-30 01:54:07', 'BFn288IDqU1hh+xSFLHOmg==', '{\"openId\":\"ol9g95fFWbEVlcDjUFOgaJGThUuA\",\"nickName\":\"倩小倩\",\"gender\":2,\"language\":\"zh_CN\",\"city\":\"Shenzhen\",\"province\":\"Guangdong\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqh7wg8scPAhOlMNTofouLwAtKib43CVy9eFgzfJGhnHdFGpTHIxhoaqwWuwr2Nw1Kzj7kfy5UV4hA/132\",\"watermark\":{\"timestamp\":1527645246,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95fJe8u-oGBuJlj17rxtyLGM', '6b385dfd-dfaa-4b72-a2c4-bffc2c7c245f', '76448076b09911889be70dc09745f8e04f578eec', '2018-05-29 10:52:16', '2018-05-29 10:52:20', 'X+j8QjbPL9f6mAlzP2s/KA==', '{\"openId\":\"ol9g95fJe8u-oGBuJlj17rxtyLGM\",\"nickName\":\"亮\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"Madagascar\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoQS26ZnhXQPiaSVTo1wQey28vLfBca7jAxB3dNQA4JxQP1hiaylUaWkzXEZEiaKvLr39ZhYD9lKSX4Q/132\",\"watermark\":{\"timestamp\":1527591133,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95frdSzsoNPnvNk8ZBhqlBRo', '1af54488-762e-462d-98e1-1b3d33a18c9e', '58daa254352ac786f7b92d49fa815f727ff837e3', '2018-05-30 12:42:11', '2018-05-30 12:42:11', 'R5NXSa20ouipUc+H8pjLfw==', '{\"openId\":\"ol9g95frdSzsoNPnvNk8ZBhqlBRo\",\"nickName\":\"花蕾\",\"gender\":2,\"language\":\"zh_CN\",\"city\":\"Xi\'an\",\"province\":\"Shaanxi\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLXxvQicmaA1unBY5Sxt85p4cCx94y5wRaoDXiaTTclicQI2d2qqH39FTUJic7pSlTFv6YdeuhRfqOdoA/132\",\"watermark\":{\"timestamp\":1527684129,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95frOspeKlukWaa9RbRAKhZU', 'e797a695-791d-4a52-bc4e-663feefed588', 'c0a8c845f8eac3753f6cb1c11fe744c82254d29c', '2018-05-24 23:08:20', '2018-05-24 23:08:20', 'QkS5MIXlMxQA7glw/TIOpQ==', '{\"openId\":\"ol9g95frOspeKlukWaa9RbRAKhZU\",\"nickName\":\"大脸猫的好朋友张莫\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Xuhui\",\"province\":\"Shanghai\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIQL7qmj6o3Tb5sQ6agvTgFI26d9Lj9IMdHU3uo28ePI02vrc0K9teOCNrHc1DANDwfSFkiaZLnTwA/132\",\"watermark\":{\"timestamp\":1527203298,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95fvIgbP0MLhoGUwStQF01tU', '25fceeb5-de3e-4b34-b435-dfd9b5488938', 'e7ed4e77bfc674f9798ad77465733bad1ce62723', '2018-05-29 05:15:39', '2018-05-29 05:15:39', 'jJwE/I6X8oonGHKGSIv8yw==', '{\"openId\":\"ol9g95fvIgbP0MLhoGUwStQF01tU\",\"nickName\":\"啊\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/ibEDauu4c6nPTWn1iciaSnfdDck3Ap0FyIzIuNMkAY5uKJNnKZbpwicibo9TMw05BxATPYUPjneyZWUyibxFzoOlrBOw/132\",\"watermark\":{\"timestamp\":1527570937,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95fwMnNTJJp8f8hIeD56IkOo', '4f8e3780-79b0-464a-ab94-c012b64b0164', '8fe6ab77c559977d0e10533c86c55c87df5ae35a', '2018-05-26 02:55:17', '2018-05-29 04:52:23', '4byRzvkloovd7V+m7zoE0A==', '{\"openId\":\"ol9g95fwMnNTJJp8f8hIeD56IkOo\",\"nickName\":\"刘平\",\"gender\":2,\"language\":\"zh_CN\",\"city\":\"columns\",\"province\":\"Chongqing\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/esTDRggWUtRNEHPcWFNvjCr3DthDaAuibGYwUVJfMqNs21lXPou6PBQrWGvsIoXGO1VKtCFJqfx32cyoSTXuaUA/132\",\"watermark\":{\"timestamp\":1527569541,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95Q9TbloaYudvUtePEuU_64w', 'e2f3908e-c553-4e15-9144-0d493bac4db9', '47c719c867d688b617f99a618021612b89e05236', '2018-05-31 01:43:29', '2018-05-31 01:43:29', 'nnLhEp3kB7tsyqgukMy70w==', '{\"openId\":\"ol9g95Q9TbloaYudvUtePEuU_64w\",\"nickName\":\"巴黎铁塔的微笑 cium\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"Andorra\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoNH37F6O1Xf2INkgfsPYIPUNRtIqaRWxwVhmNfpPBNov5wialcB0dufr40XNquNYkMrqwj9TcOJ4A/132\",\"watermark\":{\"timestamp\":1527731007,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95QaXqLPJEPDV_BUCfk0KDzM', '110d0868-a14b-4da3-9ca2-5d72b72f2a9f', 'add0a6dde727244156b15985c534790490544f6e', '2018-05-27 02:15:27', '2018-05-31 03:27:24', 'KdL+aCqhPCoMUy5KfQHcRA==', '{\"openId\":\"ol9g95QaXqLPJEPDV_BUCfk0KDzM\",\"nickName\":\"无怨无悔\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"Albania\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIOQsnZwG7fAvGUTIbacf0g7xQkoiaacRZtL8doctcVUXSnc3Ifp99ok4nWmyFOScodkknyFLd7a9g/132\",\"watermark\":{\"timestamp\":1527737242,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95QEW3FvKVjEdgEsdaIE9XjM', 'f81dc347-c3cc-4e54-a983-500e7c7fbd61', 'a917d5e49d39c6272052334c41c5a072535089af', '2018-05-27 05:10:09', '2018-05-27 05:10:09', '/8NR4najNhKrueWKZTA/tA==', '{\"openId\":\"ol9g95QEW3FvKVjEdgEsdaIE9XjM\",\"nickName\":\"。\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Yinchuan\",\"province\":\"Ningxia\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK6ibuad7f847B54NlWZU9mMSAsbcKHDsVXeuDHSZYookao4JMtbw5d2r5WYNngMqYuVAlHQE5XIbw/132\",\"watermark\":{\"timestamp\":1527397807,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95Qky3RdNsIFpHqRLbZ2i_HY', 'fb730c29-5fa2-4b52-ae36-fddb224606b2', '849fa02426595944da7227022f53a81f2647885e', '2018-05-30 03:58:14', '2018-05-30 03:58:14', 'guvZX6ismQ5TwsslK1d7LA==', '{\"openId\":\"ol9g95Qky3RdNsIFpHqRLbZ2i_HY\",\"nickName\":\"蔡蔡\",\"gender\":2,\"language\":\"zh_CN\",\"city\":\"Minhang\",\"province\":\"Shanghai\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJw0vcnlwny3Fej9LZFag7fYCUYB6RtPHvPm39JDibLicwIkqGKRXXUPBSMrZlKFakBQfFJdcoDCmkw/132\",\"watermark\":{\"timestamp\":1527652692,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95QM2XDoKvMYGWygtT5RYTNs', '3b84699a-63cd-406c-8bdd-8d5ea17b7b6d', '902896ce6440da815ff6d8d174d90ebc868aa1f9', '2018-05-30 04:50:17', '2018-05-30 04:50:17', 'BIIO1DGWaAWcKzPGAO9FTQ==', '{\"openId\":\"ol9g95QM2XDoKvMYGWygtT5RYTNs\",\"nickName\":\"你记得吗\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Zhanjiang\",\"province\":\"Guangdong\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKbgZ2OCXv2ba8Xd64MibEqmktuic4wb82aEXG17q1IWQdFg7NacicHIQnwwNhfDcGQrAefhDmAn8CbQ/132\",\"watermark\":{\"timestamp\":1527655816,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95QNMUFp3aEv2z8fJsoQOwCY', '6d25eaf6-cf42-48a9-83c0-b97fbbfe2765', '8e6f7eba3053a067e498fa45870ac779ccb979ec', '2018-05-29 13:38:10', '2018-05-29 13:38:10', 'lX5ydl93ngHgBT081kB9Yg==', '{\"openId\":\"ol9g95QNMUFp3aEv2z8fJsoQOwCY\",\"nickName\":\"拉长的影子\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"Belgium\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erdicQSCwD0jyXecM9iaPDTfajFO3Fo5gKgGyktmgb7GMQ2NodoxiaZmr28K7TCZt7CaHJ34bb2e5ldg/132\",\"watermark\":{\"timestamp\":1527601088,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95QO0RzNoooEWIwHAAv9B2gA', '9118b21d-bdd2-457f-bd88-8a508d33a284', '083ff174bbec301ef28693b3d0332b153130ecdf', '2018-05-28 04:02:20', '2018-05-28 06:28:52', '7QPHMEOB0YEM4KzUTHJkKw==', '{\"openId\":\"ol9g95QO0RzNoooEWIwHAAv9B2gA\",\"nickName\":\"wwp\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Quanzhou\",\"province\":\"Fujian\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqRJpRZjRPjKSoHYvz6v57OvFlVcIIC8yJ0YHclTFbhxHkWme7vaKATfoiauedoMw09mnXicWdFcp8g/132\",\"watermark\":{\"timestamp\":1527488930,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95QO2hAznOdzwwG53k2Hq2_Y', 'd4b46fa5-6f6f-4edb-8177-947e3ac8b3cb', '28a64b833b568d754e416b3adcb540e60788d088', '2018-05-29 02:53:03', '2018-05-29 07:06:36', 'dNHsPoMBGm6TollvHyQsLA==', '{\"openId\":\"ol9g95QO2hAznOdzwwG53k2Hq2_Y\",\"nickName\":\"姜敏\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Pudong New District\",\"province\":\"Shanghai\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLO8YQF4bkspSxmZL4icx6RrgibFgWYgyZtVicA9rRk0n60spBTLlwLRl2K2GgMGGGmatq5h5Q89aDFA/132\",\"watermark\":{\"timestamp\":1527577594,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95Qx91hFfIAbRL8GUttiYoPU', 'f3fa094a-27aa-4834-9ad3-6016b991a789', '8835d611003d8153b960314830182feeb5048036', '2018-05-30 11:41:19', '2018-05-30 11:41:19', 'tirldxUgpfEyCDCC8VLiuQ==', '{\"openId\":\"ol9g95Qx91hFfIAbRL8GUttiYoPU\",\"nickName\":\"鱼精灵🐠\",\"gender\":2,\"language\":\"zh_CN\",\"city\":\"Shantou\",\"province\":\"Guangdong\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJFZIQia6jNT3vpwGS9NQkndfGwibOHqriavo7Ab3j3cBNoAq5O456uzd5VdibESpPafTFgTByAkC2K8Q/132\",\"watermark\":{\"timestamp\":1527680478,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95QZLoDHcAWEys4DRO39of1A', 'a2059214-419b-42f3-80db-380e2c9b5a3f', 'a724fd3667a00de5c9645853b6023507e914483b', '2018-05-29 08:24:51', '2018-05-30 07:09:20', 'nyXs6d2pL1niDgjyfNl7Ug==', '{\"openId\":\"ol9g95QZLoDHcAWEys4DRO39of1A\",\"nickName\":\"不需要\",\"gender\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"avatarUrl\":\"\",\"watermark\":{\"timestamp\":1527664158,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95Rb7os2H8UcyIxx_r8iyWPA', '9f0feef9-72df-4e4b-90e8-02b4c069b27d', 'a5368ba3f8f3b37e0a1de3b8abb90b2c6dae7cb1', '2018-05-30 03:49:06', '2018-05-30 03:49:06', 'qY5Xur/X3wB0AruZPKxiRQ==', '{\"openId\":\"ol9g95Rb7os2H8UcyIxx_r8iyWPA\",\"nickName\":\"黎冉\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Manchester\",\"province\":\"England\",\"country\":\"United Kingdom\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/ksAfkNQgNClA9q3tiawgJyQVz0gHGqoYOCSfvXRaxUbZ7Rc5eDCJNK3p4qRoaBvibXwfoeLYOwzOgeTsJwZyyEkw/132\",\"watermark\":{\"timestamp\":1527652145,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95RbIMgwUmabHSg0sIKYHUQ4', '96ee27bc-9e05-47aa-a8a3-d9972d1b9428', '8885144fe105dde439cae364f8ecfba7cb831e0c', '2018-05-31 01:14:35', '2018-05-31 03:44:24', 'M6T6T39coPxLm4b1pN71YA==', '{\"openId\":\"ol9g95RbIMgwUmabHSg0sIKYHUQ4\",\"nickName\":\"阿锴\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Ningbo\",\"province\":\"Zhejiang\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEI3hia6n1HK9P4UXa7GdicrfUVBlczRiag0sJvBoUXpr6V2xm099kHwEY752b8XWsZeA7tbkmABenl3w/132\",\"watermark\":{\"timestamp\":1527738262,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95RkKT-TPVEQ8Nctw1Ky5nn0', '38730214-6d0e-46ab-be03-c18556eb4c9c', '04dc4c26075842f72ffc8685e363d54e918c520f', '2018-05-26 02:15:30', '2018-05-30 03:55:35', 'tRm2cQoOteRQnHak6BoghA==', '{\"openId\":\"ol9g95RkKT-TPVEQ8Nctw1Ky5nn0\",\"nickName\":\"恺\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Minhang\",\"province\":\"Shanghai\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIxNoEkB9Vqe3lJictibnV2icoWbZt54EWk1ibQJolCPRnXjM8I3NpHHrcT9tiaV6Fh8BsQnpGVjVzUBBQ/132\",\"watermark\":{\"timestamp\":1527652533,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95RV3LxfFv44VqLTKkVRr3eg', '54acdbce-6f43-470b-8dac-1e52593da821', 'c2289b5c2fa04c13bac50c7d9f7c5c93af627ca2', '2018-05-26 11:51:46', '2018-05-26 11:51:46', 'Vq6wOZqmjO2wPNv3OvylJw==', '{\"openId\":\"ol9g95RV3LxfFv44VqLTKkVRr3eg\",\"nickName\":\"王明\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Chengdu\",\"province\":\"Sichuan\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/QW37pKoNeBNujwPeGbprznhUpvwnNgcKO4AQ7djtkDjG6dT81QaFbGgiavyP4QEzleTON8qrZewdzDVWJ4aolnw/132\",\"watermark\":{\"timestamp\":1527335504,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95S_A7dWMsrgQQaWHI8leirg', '7191c499-409d-4053-9ab2-1f3a1db2087f', '2d4d3f758ef5fe784ca5cd5afb035c2acc7c2e41', '2018-05-30 04:19:22', '2018-05-30 04:19:22', '9azy9I8aYklPUTLwymKF3A==', '{\"openId\":\"ol9g95S_A7dWMsrgQQaWHI8leirg\",\"nickName\":\"章哲斐\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Jinhua\",\"province\":\"Zhejiang\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83er80sqv1beibqkHpZyRzMibMgu9cicw0tjZ0mjzhic2D9Ng1NYfMJY4iaIpwDTu1WD0v6aX2Nia6BICia53A/132\",\"watermark\":{\"timestamp\":1527653960,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95S1E04T-6kC5pwRPkhLsnaw', '16792e2f-231d-4667-acd4-78eaca23eaf6', 'b01a7277385b4854658ed650930dcc434312c600', '2018-05-23 11:35:13', '2018-05-23 11:35:13', '6WtIKxvC9asqhIRzowNkBQ==', '{\"openId\":\"ol9g95S1E04T-6kC5pwRPkhLsnaw\",\"nickName\":\"test1\",\"gender\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK15icGmPXgRnriawrqqEBAibF23xic4Vrj5xVNcNCImvLVic72B1grk3fIR9wNfXKQuhibHqFcV34NEfmg/132\",\"watermark\":{\"timestamp\":1527075311,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95SWa29Sem5FaghIRs7sp1dU', '54604162-5aab-4b16-b655-f72a48375990', '04f306a453e7185084dc57fd6c81864380ccf1c1', '2018-05-31 02:53:09', '2018-05-31 02:53:09', 'sF0YOHFCrXbB2CHJghZCNw==', '{\"openId\":\"ol9g95SWa29Sem5FaghIRs7sp1dU\",\"nickName\":\"范海洲\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Xuhui\",\"province\":\"Shanghai\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/paXtDAb9tgXh8j4Owr9I0SOzq0DzhkXkD0N9ky3LKnFqvHNRVWEiagibcmiaiapdG4ic5kJzwxvibtB4q6sQa29Q5QZQ/132\",\"watermark\":{\"timestamp\":1527735187,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95T13Ce_Ps2gQi29PqDzyui0', '7109bab9-0b97-4353-97fe-2db81fbb8918', 'dadd4cfbe74782f383618c6f2bda0a3618f29c6c', '2018-05-24 14:35:47', '2018-05-24 14:35:47', 'yqP7WPUVqVP6jI2fJKLzcg==', '{\"openId\":\"ol9g95T13Ce_Ps2gQi29PqDzyui0\",\"nickName\":\"飞\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Zhabei\",\"province\":\"Shanghai\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJLDlf0jFT20UgARSLgX2VkxPh4J0AGew8vpw6jYBv1DSHGjeJI4yzuTTueksFyIGnzqnHTfQXBkA/132\",\"watermark\":{\"timestamp\":1527172545,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95T4wG9SZEmVp-ezm2oPrRjQ', '3a74a4fe-5880-46bc-adc9-777a9be422af', '4fe7d027bb4d1c7a15f3a3dd13f9df6e47b6275a', '2018-05-29 22:49:37', '2018-05-29 22:49:37', 'XvbRblM6OLE+dyRLqSqI5A==', '{\"openId\":\"ol9g95T4wG9SZEmVp-ezm2oPrRjQ\",\"nickName\":\"涛哥\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Guangzhou\",\"province\":\"Guangdong\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/oY0uMWDwe3icEYcZMheGf7TJ4YGvMlNOQvvnbHDT5xIHjBoKiawshmglos4py7nKoawswzfibzpDWh4cCdwbzh1eQ/132\",\"watermark\":{\"timestamp\":1527634175,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95TEliTT4_mci__dCtegro6w', '6b8cc62a-75bf-4ca5-99e4-81b55a93dfd1', 'f41f684854493e34a6f2ddcff2da141bcfd33336', '2018-05-30 12:04:21', '2018-05-30 12:04:21', '8mbqcYxDQDciMtnLOOycGw==', '{\"openId\":\"ol9g95TEliTT4_mci__dCtegro6w\",\"nickName\":\"被和谐掉的coco\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Chaoyang\",\"province\":\"Beijing\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLRwRAfz8RybkwSJD2Cn5zrAGcV3UWmZqTyBwz1IJKcibSxvXb8d0xRAZunLiblLZ080AFXiaJ4MibqJw/132\",\"watermark\":{\"timestamp\":1527681860,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95TkmaUeCUyMGCUaHyMmSApk', '2ef59e34-d207-422d-a1b5-6db14a4de89a', '5a90169b991bda063320d57bb482174e5b468af1', '2018-05-26 03:35:48', '2018-05-26 03:35:49', '2iOMkVQGoLGV7DU7rE28YA==', '{\"openId\":\"ol9g95TkmaUeCUyMGCUaHyMmSApk\",\"nickName\":\"刘学楷\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Jiangbei\",\"province\":\"Chongqing\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/SluScDGqnhCso63INErfOs1gltzmQczxictS9yIBicGTCZGLXU5PeGoeD9MKNKyUraz3RiaTutSpZD2081Xfibdd2A/132\",\"watermark\":{\"timestamp\":1527305747,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95TnkecTreK7wUmKUduoOgbw', 'aac6d776-0eaf-4e83-957d-c53471079da8', '0b39e5d3db097f64b923f81fe0d1206a36818f35', '2018-05-29 04:22:20', '2018-05-29 04:22:20', 'PhuEVxeLiO+FMCb5CX6iNw==', '{\"openId\":\"ol9g95TnkecTreK7wUmKUduoOgbw\",\"nickName\":\"Jack Cheng\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"Vancouver\",\"country\":\"Canada\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIdbn9DTbJ6KoTkXw1V5YSic1Osd8AWRyzhIicN1P23Oic0nbLM3BSg4yGqKwIg63tt5P1HuTwmT34DQ/132\",\"watermark\":{\"timestamp\":1527567738,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95TNuY-0DysIY4hl954ytzuU', 'da1a37fe-f165-4a36-9e9f-c7bedf81013a', 'e81acaef834da434fedd10c5d797a9225b0ea389', '2018-05-25 04:57:55', '2018-05-25 04:57:55', 'QiyWyiSWy9gvL08iZ/W+qw==', '{\"openId\":\"ol9g95TNuY-0DysIY4hl954ytzuU\",\"nickName\":\"杨朱华\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"Fujian\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/iaECEibqBEeI5t2xWCIURKibSibp5WLeBAwKMZAZ9FWUIlTQ0HstDVe3KcBzjt8C1ao55zrpgez0n66cpnwePkDIBg/132\",\"watermark\":{\"timestamp\":1527224274,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95TQ3E9L9rcRkgUwvcVTBWSc', 'a971860a-f1ac-4952-80e3-7e8afc0e11de', '33094932f34855bc6cf5966d017a144b0d273b92', '2018-05-28 15:53:43', '2018-05-29 11:52:51', 'LEzRqQdQwaWv4wK8wRK2Lg==', '{\"openId\":\"ol9g95TQ3E9L9rcRkgUwvcVTBWSc\",\"nickName\":\"TT\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"Central African Republic\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIV9F17ypndtj5IkxXlDRKyzI9QwcDaXK2cLzwa5BCWsia1lagyAFJiciaFeCFx2x5eEiaOnjpZiaqYe5g/132\",\"watermark\":{\"timestamp\":1527594769,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95TwBw3wS-ky6xEslC7V2wt4', '18b4adb8-a17a-4cda-b1ac-0aa0a0f84eba', '35bf9e9d67187bef896dc3f4cf7a5355ad8f13aa', '2018-05-29 14:07:22', '2018-05-29 14:07:22', 'OrC8CDgS609hePXroyc5TQ==', '{\"openId\":\"ol9g95TwBw3wS-ky6xEslC7V2wt4\",\"nickName\":\"思考的沉默人\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Jing\",\"province\":\"Shanghai\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83ernBCxicBc63DSsWmooqibZC7dVB9Omy50vpeAzjLCDqx16ZGhDUf1FbXTOwGErHfMiabl2vo6ECiaaRA/132\",\"watermark\":{\"timestamp\":1527602840,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95U6pmiURLEBOFwcKlipQr_U', '0bb2ecbb-74d4-4a16-aa39-8a11763c8e7e', '3a3ebdc40b1d66ea057ebea236785eb94820e7f4', '2018-05-29 13:19:30', '2018-05-29 13:19:30', 'RnDc9ofVwe+6G+NQyXojEw==', '{\"openId\":\"ol9g95U6pmiURLEBOFwcKlipQr_U\",\"nickName\":\"Lucky、\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"Greece\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/T1cpBicZRdQe2foamibx1RS2PribNWHTtg8ib8zw5ibfv3XD1zZbbgHtoqB9bxWtEn321KzTG9PMUhwDgtNv4pzoRjw/132\",\"watermark\":{\"timestamp\":1527599968,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95UMmLZKRD2jZIOGsvjNWGPU', 'c6c3b394-4070-466d-a48a-7b083c325d89', 'bcc2f235167496e701290d2f7cf30bd2c6c528c4', '2018-05-29 12:59:09', '2018-05-29 12:59:09', '5gf3bzXH4h/H8RuuIO/sDA==', '{\"openId\":\"ol9g95UMmLZKRD2jZIOGsvjNWGPU\",\"nickName\":\"海豚的眼泪\",\"gender\":2,\"language\":\"zh_CN\",\"city\":\"Wuwei\",\"province\":\"Gansu\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/jbXKuEaQfbPDP5ia4zpgKq7kKwmERFicibRmDicr8reQ2IRLKrX02iaClE73QePER0TWyHHibqUWiaCmlX8dAGnCs00iaQ/132\",\"watermark\":{\"timestamp\":1527598747,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95UqbCmUZeFqh2UbEdEkFw8I', '3b8cc8f0-5c6e-4758-955e-c580660cab90', '194f16ecc91f80a1bb234678bea98fa7d92b8441', '2018-05-24 01:55:26', '2018-05-31 08:52:14', '02Y/mfhbLQ2SAlwyBpRg3w==', '{\"openId\":\"ol9g95UqbCmUZeFqh2UbEdEkFw8I\",\"nickName\":\"K\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"Shanghai\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoL5DuMo0qa0lwhS30ic6j6pyia85H6riaFibdXz0Th3GnBdBczLyQDgKwodvfLicqILWLwaKlzgiapKicAw/132\",\"watermark\":{\"timestamp\":1527756732,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95UZkwAvazZwSWq_g4y7XCgs', '708d8ced-4806-4162-be0d-68bcaa3b6cfa', 'b9ef40590057ac2b2012dff2a1feb9136398e4e5', '2018-05-28 01:54:54', '2018-05-28 01:54:54', 'ywdX2OWyCTtautKC41YHfQ==', '{\"openId\":\"ol9g95UZkwAvazZwSWq_g4y7XCgs\",\"nickName\":\"胡源\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"Ehime\",\"country\":\"Japan\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/a1oRDMVzeRdrYkA1jicSxg63BL99Kt2RleQLPnXdriaS5moe9WsK8jiaylT5FzNS7x9RUuL6VGTFcIowiafLLOr8cw/132\",\"watermark\":{\"timestamp\":1527472493,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95V4kpKcyLbp4euNXiy7qUFg', '0fd208c3-19dd-4b88-b4c1-ceb1883f9c85', '38f1ce15b3685263744f8d0dcd4dc201ce3f0c1d', '2018-05-26 15:19:22', '2018-05-26 15:19:22', 'GRMNxDpb9lTwywsgUXahWQ==', '{\"openId\":\"ol9g95V4kpKcyLbp4euNXiy7qUFg\",\"nickName\":\"宋岙大队\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Wenzhou\",\"province\":\"Zhejiang\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoHkJHc6BwVso3JqnShic8VmPtT3D36icpOhoQ2Cic09tUQhmvno5BA76XksWtgAGn1Ff6f1hdrWA56g/132\",\"watermark\":{\"timestamp\":1527347960,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95V5zLFb1D9kci-iImv9PHX0', '1f7eec53-cf5d-446e-94cc-569c5cd9b008', '93653d72cf6077e1555fd6d3b9eff60f8ae079cb', '2018-05-28 23:55:18', '2018-05-28 23:55:18', 'TpDk/GNZQneoAgSB2AjPlQ==', '{\"openId\":\"ol9g95V5zLFb1D9kci-iImv9PHX0\",\"nickName\":\"仝\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Changzhou\",\"province\":\"Jiangsu\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/BLEfbqXlQkZndcAPSiaamedW3Svib4KXB82xbaa8vQZbWluA6neBrZD4BYfyic83hSScKiaxbGBHXaDClJ8LJQvnkg/132\",\"watermark\":{\"timestamp\":1527551716,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95VB-kGRyxsSCz4U4UExZgIc', 'ec60b84b-2d05-46ff-8d7e-c77de64c77cc', '53caf78aaba8875faf43c508cd5baaa9c3010bdb', '2018-05-26 12:22:30', '2018-05-26 12:22:30', '5LS/ppeMkZgiIyMLeRLjrA==', '{\"openId\":\"ol9g95VB-kGRyxsSCz4U4UExZgIc\",\"nickName\":\"LifePro\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"Reunion\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEIYCBROUPYEjpiatgaNlDFiaGexicAqOBKy7Ma6soyDo4E8Xb3jtr9Rv4SialkkcDeGExsrRbjtFFABRQ/132\",\"watermark\":{\"timestamp\":1527337348,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95VjTCn2VTVWgkluKks8QJ9U', 'e5a5fd71-6913-41f6-a065-c4c6ffb53007', 'f170ec5c528e07322e7acd97c8e2f787c22e9eb1', '2018-05-30 12:19:40', '2018-05-30 12:19:40', 'L3kfkIPj7afxDyksFIp5sg==', '{\"openId\":\"ol9g95VjTCn2VTVWgkluKks8QJ9U\",\"nickName\":\"林小小\",\"gender\":2,\"language\":\"zh_CN\",\"city\":\"Suzhou\",\"province\":\"Jiangsu\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLj8u4u1EYDIdm9fK2vD3CRqSajFS4hjxibhgJ07of7OCnke41gnWMOD5LtYyWsskEAupFznY641LQ/132\",\"watermark\":{\"timestamp\":1527682779,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95VK-gJbRtJ9L9jM2WB-dBB8', '868a4472-1d50-4fcc-9942-582b7ef38db1', 'b285b030fc4affbf97194c46a698bc808b54a836', '2018-05-31 01:57:43', '2018-05-31 01:57:43', 'm5dF3UG7XBA2l+7cN9CTyQ==', '{\"openId\":\"ol9g95VK-gJbRtJ9L9jM2WB-dBB8\",\"nickName\":\"阿茗\",\"gender\":2,\"language\":\"zh_CN\",\"city\":\"Yantai\",\"province\":\"Shandong\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIkqxY5Wm9DNdTCk7y9yOE6lviaiatfN1Ff7Lww6DVVWGVvVEGc1fVjBJ3WXgXibhmSSiaHugGjrR2XEQ/132\",\"watermark\":{\"timestamp\":1527731862,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95VkJi6zp0EfmTyR4BXdmFf4', 'b5582142-7987-46ef-8bc4-121b32763b91', '6caa990bfca0ab026a79950811edaa225d490cf3', '2018-05-29 07:59:17', '2018-05-29 07:59:17', 'LH1qwvOkFx8TGQWwRM+WMg==', '{\"openId\":\"ol9g95VkJi6zp0EfmTyR4BXdmFf4\",\"nickName\":\"梵宇若水\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Ningbo\",\"province\":\"Zhejiang\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKSuJNl0HRQTCtjXtBkficNnY7ibpaLmVibkppOoYgMf7jBPP3u8TDvHJKzKWRGC4okKfcRibzsr1WbAQ/132\",\"watermark\":{\"timestamp\":1527580755,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95Vp4y10bJl8XE1Sz4_mbjqY', '18819886-e123-4f10-9da9-4579cafa0b66', 'bb869ac910ff155617e792c1e3c5961a15d14b0c', '2018-05-29 11:41:21', '2018-05-29 11:41:21', '4QcP7BZ2W8FifUmMd+ty1g==', '{\"openId\":\"ol9g95Vp4y10bJl8XE1Sz4_mbjqY\",\"nickName\":\"涂灵捷\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"Torino\",\"country\":\"Italy\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eptHG2NOOYgzCQv57ft04cIFqjDiaZN6qHMcRibz9B1bkPcBmjcyByxiaLoIgUhZGVaibw0ohY2BKO5dQ/132\",\"watermark\":{\"timestamp\":1527594079,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95VphW1mBJK26jMHy2zSO94A', 'e6e8da4a-77d1-47af-8e56-7e756061eb9d', '9bf2c3f5eafbf096c532d35276d156c0e2beae03', '2018-05-31 07:25:12', '2018-05-31 07:25:12', 'qKrzRkLZKkPniOC8ibPGDA==', '{\"openId\":\"ol9g95VphW1mBJK26jMHy2zSO94A\",\"nickName\":\"帅宝@\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Jing\",\"province\":\"Shanghai\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJq0cx86WYgxZAAwOAeRwUm6g7sX6nwb52YYqCw57EeVdFFt1Q3D6XGRSbpOrXYkOP5B3PzZYZRTg/132\",\"watermark\":{\"timestamp\":1527751511,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95VveoHv1wXhRIyiCSuAD7BU', '4fa069d7-7105-441a-beb5-9b59b59d9186', '3ba8e6b9363a4d440aaae490d93fc0c513b02b91', '2018-05-25 02:28:23', '2018-05-25 04:57:27', 'BAh4BxrvtnJl/2Eyb2H66A==', '{\"openId\":\"ol9g95VveoHv1wXhRIyiCSuAD7BU\",\"nickName\":\"陳档\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Xiamen\",\"province\":\"Fujian\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erZpAJcG68cMrZMnDDrE987NVeibla7Euib63wEuibbLnviaXnvatxaBhJAKiacYfImOKwIjRic93ibyyEDg/132\",\"watermark\":{\"timestamp\":1527224246,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95VVRAa1HKT6peuei8NRA8WE', '75dbf6fc-f223-4020-9db2-f0fee85639a7', '1e5b99ed1e52196a1450ba4ddd8d6ae02138e7d0', '2018-05-29 09:10:47', '2018-05-29 09:10:47', 'Wg8jf2/ZgOvdtSwsB9taTA==', '{\"openId\":\"ol9g95VVRAa1HKT6peuei8NRA8WE\",\"nickName\":\"阿隆索\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Xiamen\",\"province\":\"Fujian\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJcEKI64IovCG1texkUI9icA0qJibmOYKKtKK67cf01UD23736H0dW9WeficITibB9u5x9qGVUAJQMenQ/132\",\"watermark\":{\"timestamp\":1527585045,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95W8egds4FjJekXw0k1sKIcQ', 'd5528919-f0b8-4fc7-b88a-3b57ba302a11', 'a6022cc425b58c7b845101422a671041eae3709d', '2018-05-30 10:06:35', '2018-05-30 10:06:35', 'W/MR3Rj8YPx6t5HxVapUoA==', '{\"openId\":\"ol9g95W8egds4FjJekXw0k1sKIcQ\",\"nickName\":\"香水有毒\",\"gender\":2,\"language\":\"zh_CN\",\"city\":\"Hangzhou\",\"province\":\"Zhejiang\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLD3mxY3KsAGhDMasPwfAianWVLGYJZjhBRckSarqD72uuxaTAKiawsLhoniajP3GNedX82V4WeP3M2w/132\",\"watermark\":{\"timestamp\":1527674793,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95WGD_LNrQ-zU_s-DczpyNk4', '090c8e7d-38d2-4a47-930b-cd0e3ccb8526', '2d127bd25281bbc55fe293dcabe3e0453fd573ff', '2018-05-29 13:32:13', '2018-05-29 13:32:13', '3SKPNpwUJAoGASlb7Rn7bA==', '{\"openId\":\"ol9g95WGD_LNrQ-zU_s-DczpyNk4\",\"nickName\":\"王者荣耀（孙悟空至尊宝）\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Chenzhou\",\"province\":\"Hunan\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epiaQjiaTuVJ6k6B55y1duwWydbLIpV85jTYhXRBxjjNauz0WLQN2ZzZibOBZQJGUSS7MJxgcibs2icX1w/132\",\"watermark\":{\"timestamp\":1527600731,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95WGEEuiC-0h25qJ4EeZGeHA', 'f2a67687-b22d-4bf2-b7ce-7f0ce61741dc', '6ccb329c78fc32e2a6ea5cb5913838d0f4b060bf', '2018-05-31 01:52:40', '2018-05-31 01:52:40', 'nUDpLPXa6MuskrlyF3Yemw==', '{\"openId\":\"ol9g95WGEEuiC-0h25qJ4EeZGeHA\",\"nickName\":\"1234567\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Changsha\",\"province\":\"Hunan\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/csdkearHwnQhnjUsesTrJshsDCY1pDsJa8iaiaAEWibUQefxHFtphUq3oIArVM8Vxjib0D9peTPbkicPqunv8V7iaT3w/132\",\"watermark\":{\"timestamp\":1527731558,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95Wji8QrBJWfXUgj2yCH8DEA', '253f3efe-6401-43a8-88dc-4e4b33ed580f', '2daa092914aafe39568a0d50f0c6eccaf30adfe2', '2018-05-25 02:41:32', '2018-05-25 02:41:32', 'ZGDCOiAoKCOUTfH08y1uzQ==', '{\"openId\":\"ol9g95Wji8QrBJWfXUgj2yCH8DEA\",\"nickName\":\"徐鑫\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Changsha\",\"province\":\"Hunan\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLBdqGYw4jfIsdRvyTrXFb1VjsLvRknlrPUGjvOicBgI1pI3zdxUicqkwBSwWoLqWWVYEDPamyCKwSQ/132\",\"watermark\":{\"timestamp\":1527216090,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95WQ77WktYqX6Ybff0YoKGKs', 'ab976375-921e-4793-8d0d-1fd05781aa90', 'f1879a4459130eafab2b09a238da61cf460d7975', '2018-05-28 11:30:11', '2018-05-28 11:30:11', 'EJiELN+/Sghp4c/XOrTvLQ==', '{\"openId\":\"ol9g95WQ77WktYqX6Ybff0YoKGKs\",\"nickName\":\"小姑娘\",\"gender\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/UWQPMeVbLTOHFrxkygwxN0DxwKO1OwMicYmPGHTmanPav7xA7zBITFZiaKNvEO8xg2zkAK8XTxNWCgQSE7GWCa7A/132\",\"watermark\":{\"timestamp\":1527507009,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95WWLLjdP2F3OzwS-U1sDzj8', '9048cf4c-af45-4ce5-b290-fa9c0e3f6f25', '9c69ec499f4a52654b556cd3dfc2851290106bbf', '2018-05-29 13:04:11', '2018-05-29 13:04:11', 'AhtbuGoali1aa9zAn6vYHw==', '{\"openId\":\"ol9g95WWLLjdP2F3OzwS-U1sDzj8\",\"nickName\":\"叶茂\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Minhang\",\"province\":\"Shanghai\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJX0s1vNmBS8qecnWoOWkVt9oH5G8TTGnJyEAcBICBK57WoKuCG0ZJnZtngyWWpOhxyaxoH3wbVew/132\",\"watermark\":{\"timestamp\":1527599050,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95Xd6ZsiHSMUUovg__IX1MR4', '2211d7a6-8e5b-4d6f-b12c-812262fe59ed', '75d0f2404c5204b4bdf88849a91eae84bb83dd65', '2018-05-30 17:25:44', '2018-05-30 17:25:44', 'JbWhgNyHMGQ8U9uTCD1xYA==', '{\"openId\":\"ol9g95Xd6ZsiHSMUUovg__IX1MR4\",\"nickName\":\"🍉\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Shenzhen\",\"province\":\"Guangdong\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/CWzdhOeqkzmuicNszvveBRfTn13oZAA734EV2qVafNia8iaGcPyn3WvChXXMICYmOev8eibPEQ0wlbKRH6wEjfASFw/132\",\"watermark\":{\"timestamp\":1527701142,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95XgcIBysL9uFYzqrdi69Z4U', '64efab21-439d-4217-ac7a-511c64bce1fc', '520b8bb71684efdac8a30e0d8a81d0a2df56489a', '2018-05-25 00:41:49', '2018-05-26 13:18:58', 'gJvub5Yk89OaKAELcBNXcg==', '{\"openId\":\"ol9g95XgcIBysL9uFYzqrdi69Z4U\",\"nickName\":\"芙蕾德莉卡·贝伦卡斯泰露\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"Dublin\",\"country\":\"Ireland\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJjZQU2mFGP1f562mcgVaUQttnPzpvlaia8H6wpRRrh3HvuiaQuSOia0Tia1YYCpmAvq8Utr7Yb0HAXeA/132\",\"watermark\":{\"timestamp\":1527340736,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95XNbPNP3VpNkXbk_hjHR9J0', '6e5b7b4b-d7b1-4dd9-b1f5-1c58f9e3b9f0', 'e570b7003cf697af168bf3d3ebecd1cf3382b900', '2018-05-29 22:44:52', '2018-05-29 22:44:52', 'giu3EaYrUeu6XU0gYqrURQ==', '{\"openId\":\"ol9g95XNbPNP3VpNkXbk_hjHR9J0\",\"nickName\":\"🐑Tissot♈️\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Changning\",\"province\":\"Shanghai\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEI5QufeWI0APrJZy8SkXgK9hdNkxaiaP3QZ6ax4PdW46UXgXKlmo4DFd6CAdxKzchq8BFPDaDVpiaLA/132\",\"watermark\":{\"timestamp\":1527633890,\"appid\":\"wx5ea56788e04ad18f\"}}');
INSERT INTO `cSessionInfo` (`open_id`, `uuid`, `skey`, `create_time`, `last_visit_time`, `session_key`, `user_info`) VALUES
('ol9g95XpLOB2Xv_2FTI9GppHCZS4', '86d9f91d-bca7-4b95-b14b-61e48a190247', '74d407e5f408a15aa5b302daec0ec36e457115ef', '2018-05-29 09:10:33', '2018-05-31 07:39:19', '9cCAbPc22XrJZdyWGTRSog==', '{\"openId\":\"ol9g95XpLOB2Xv_2FTI9GppHCZS4\",\"nickName\":\"小时候很帅\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Xiamen\",\"province\":\"Fujian\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLeZallM5hpuRzTiaCptI2EB3nuErKE55ylraDF6QeHnWbicB4S1biblGZ2mxF9XrYFEdUBbLTyAbRcA/132\",\"watermark\":{\"timestamp\":1527752357,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95XvtXSk1XWuf1LdUqe7Fr2c', 'e3cb1629-ffc4-4fa2-b4d9-e97a7a31f838', '60e06fdde5051073376a83418a0e9538ee0fecdd', '2018-05-31 04:44:41', '2018-05-31 04:44:41', 'Y0JEGz59wyU3ukbFKELtog==', '{\"openId\":\"ol9g95XvtXSk1XWuf1LdUqe7Fr2c\",\"nickName\":\"俊俊\",\"gender\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/JibAsXX4daEqiclIujVfaOrDJKqC991haQAYapelz1icPicR4vslop0jnU7z9P17tNib1ns9r65oGHtib3s0XkslMO0A/132\",\"watermark\":{\"timestamp\":1527741879,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95XzSNfF8D5rqo9jnUTIHoos', '6fc40e02-1c0f-4489-be48-dc2fb9ae0dca', 'd4dcadf69becd9cf273bb000587cdcbc095b48bc', '2018-05-30 19:24:09', '2018-05-30 19:24:09', 'i+TaQffKnKDoT+48YoHbxQ==', '{\"openId\":\"ol9g95XzSNfF8D5rqo9jnUTIHoos\",\"nickName\":\"L\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"Portugal\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEIeXpiboJsprg46JyjOjS91lapMXbiaItjas5YdedsYiaqDeKn4TtPcJjkv79gibP9ae8xhO0ER4vfk6A/132\",\"watermark\":{\"timestamp\":1527708247,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95Y1eGd-7puYgucED2i7ixOU', '04c4ffc8-9041-4e88-ae03-7cfb45bde170', '5dfb5c1e496f38d60f22c97c747583214dc079f0', '2018-05-31 04:10:45', '2018-05-31 04:10:45', 'iXCGBE6dSodMKPRdU/4EDQ==', '{\"openId\":\"ol9g95Y1eGd-7puYgucED2i7ixOU\",\"nickName\":\"Mr.吴\",\"gender\":1,\"language\":\"en\",\"city\":\"Jing\",\"province\":\"Shanghai\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKcibbqSaADlAldTJYGia53ictwianEedHoreNia3UI7cUwxHq85dXE5ia2mHHa1TcibGeTtWURAWibN1pzsg/132\",\"watermark\":{\"timestamp\":1527739840,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95Y2-FAx1iJXaeDjFys-0-Xo', 'ba8823fa-6737-4fd2-b82c-82e9d8a18639', 'ad0362d8da6a52d32d2745a40a9f9bc87bce61d1', '2018-05-29 13:08:28', '2018-05-29 13:08:28', 'hpAeVTUsuNYf5Moss/kAGg==', '{\"openId\":\"ol9g95Y2-FAx1iJXaeDjFys-0-Xo\",\"nickName\":\"Sugarman\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Minhang\",\"province\":\"Shanghai\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKKanXkQ9KWDBvOibeQVm1595vVcyv3WVicFTv7TA7gZhwA6XmuEMuHldt0pI9lU4Nup9IVTzWbG5sg/132\",\"watermark\":{\"timestamp\":1527599306,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95Y3zMmVhgq6EKgQcgDuWnrU', 'e24e4295-f700-4a28-9464-4ccab9958719', '10969eb095e4847aa3c481da6ecb57b9db592858', '2018-05-29 09:44:42', '2018-05-29 09:44:42', 'csD0eGpfIuoHAYwOWaofIg==', '{\"openId\":\"ol9g95Y3zMmVhgq6EKgQcgDuWnrU\",\"nickName\":\"Johnny.Ren\",\"gender\":1,\"language\":\"en\",\"city\":\"Zhuzhou\",\"province\":\"Hunan\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/tQFtjZjSa88AB8rRGYCO0MUWMibmm6t4rChKOtIb43WflNyR6NUepoLo5cP4B1cDqolgxUpTFeH83JB4vbvlqiaA/132\",\"watermark\":{\"timestamp\":1527587081,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95Y82lAJ-L39ZWaduuPoS_84', 'b62a6ccf-afde-4ea4-b76e-e0ea23912e8c', '03de51cc4857114405d767b24438c545988ac870', '2018-05-29 14:23:10', '2018-05-29 14:23:10', 'Vhh4UZZ0Fo+SZ2SoZ5n8Rg==', '{\"openId\":\"ol9g95Y82lAJ-L39ZWaduuPoS_84\",\"nickName\":\"豆芽\",\"gender\":2,\"language\":\"zh_CN\",\"city\":\"Minhang\",\"province\":\"Shanghai\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJfvRiaIv8BWzN72BlwE6pznEOuLCyJnH6mR6QXramP0ic7Z3Exicx6EBheFmH6IEUfE0q4sykRV4k2Q/132\",\"watermark\":{\"timestamp\":1527603788,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95YMx9-cxGQjOneeCi41T8Gs', '38b1be90-d4a3-414c-984c-b4347a1da248', '2171c6a39ee0b53c1740fce44cd06d0bae627d43', '2018-05-30 13:10:26', '2018-05-30 13:10:26', 'vKWia7aJak1f8/8h+Gi+qg==', '{\"openId\":\"ol9g95YMx9-cxGQjOneeCi41T8Gs\",\"nickName\":\"XX\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"Bermuda\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJwNsiaL7u0f2PV59SvoSfhauAywvbPbxAqlBa0dI7GhWtppsp3hod2qqXFtLHg2FsRG75Vib18yWmA/132\",\"watermark\":{\"timestamp\":1527685825,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95YNdPFxj0KnJea5HCMe7Ntc', 'f0defc28-c47f-4106-aa59-e5e76c7c0b84', '628438170b8fac774b237591f24447cb0f4b38af', '2018-05-24 10:02:58', '2018-05-24 10:02:59', 'Y0qs+6/XxRR+n0uLeVdeEg==', '{\"openId\":\"ol9g95YNdPFxj0KnJea5HCMe7Ntc\",\"nickName\":\"rdgztest_YJBOAJ\",\"gender\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"avatarUrl\":\"\",\"watermark\":{\"timestamp\":1527156177,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95YpN7JqMgrqMlx0cdwFbeuw', '52c0b6aa-f459-4d9c-b4a4-d906f6cec495', '3d0abb90db540868de56dd7d6809e46e5d68db22', '2018-05-24 05:59:38', '2018-05-24 05:59:38', 'zawU7RaYLRbzcO5hFwOE4Q==', '{\"openId\":\"ol9g95YpN7JqMgrqMlx0cdwFbeuw\",\"nickName\":\"小马校长\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Pudong New District\",\"province\":\"Shanghai\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83er4qw5CC1L8CX7AER7qpG3Gv7X0171kS6yRLU2O4hg7CdFz7kyic5MXlkicN0Sy9NRcicnAyJPL01bBQ/132\",\"watermark\":{\"timestamp\":1527141576,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95YxItQcGuufOl0zjzkWBwkE', '09c721e8-e8aa-4679-90a8-b8ae5043b019', '96ca65ab7fcf39b0ab70aa9378b7f96e4020a3bc', '2018-05-27 09:36:49', '2018-05-27 09:36:49', 'f2A+zt5Y0ysFb0D/xiXKPA==', '{\"openId\":\"ol9g95YxItQcGuufOl0zjzkWBwkE\",\"nickName\":\"小星星\",\"gender\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/dAkTIgz3sFrcoUdmjvkP1Ha3XOJReLwQFX5DJYD0C3cicZ5TkIgz9fOz8eAv0V26a9gmPElmCyQBSu9rVhAWRGw/132\",\"watermark\":{\"timestamp\":1527413807,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95YZhloON0x2t1oiiGTxo2BE', 'afee90c5-e668-4e6f-a26d-d898b4a0bff8', '971b721ee656fe6bc250545e74b5bf6b0132558e', '2018-05-29 04:42:19', '2018-05-29 04:42:19', '7CtjA2gi92/tLWe1dsdzPw==', '{\"openId\":\"ol9g95YZhloON0x2t1oiiGTxo2BE\",\"nickName\":\"江华秀\",\"gender\":0,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/ib9icPWDcOywlzN28Iiag8PUbpglj9f55FDMEN19pVEbicelRBrIbIec7er4Uzj3wUfpic4HRCvLbAIYA6J02liaUJhQ/132\",\"watermark\":{\"timestamp\":1527568937,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95Z47Kaew8mSqOt-A8d12bVA', '42c21547-a709-4bc0-9557-83bd53eee1ab', '69201c5f1375d2cc4a90b06fd86d7bc51f2c4a89', '2018-05-31 02:10:22', '2018-05-31 02:10:22', 'C1zxtdJypgUHGXTRo/ysyA==', '{\"openId\":\"ol9g95Z47Kaew8mSqOt-A8d12bVA\",\"nickName\":\"何钊\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Shenzhen\",\"province\":\"Guangdong\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/icrwichU19y0Rdib3CjZCtQUXXFWckLR9RDmfbYxxGuwBj3xACyc49YWbqib69qMmGuqatsiaPalQkIRCRbicghRfPSg/132\",\"watermark\":{\"timestamp\":1527732620,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95Z6TZDwwVPJ9ZjlaB8f8cYI', 'c5731c3f-eacb-4746-8963-a995d9e91907', 'a834b69d5f32cac259e280a20050d10b334e9aef', '2018-05-29 12:32:15', '2018-05-29 12:32:15', 'jCXgnbf2S19szkKzBvrZ/Q==', '{\"openId\":\"ol9g95Z6TZDwwVPJ9ZjlaB8f8cYI\",\"nickName\":\"  王靖宇 \",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"\",\"country\":\"Lebanon\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIveg9NB5dINQeYPy7Z5VHLzGrJLmq2FbibLO9H5cBMQXsj5woiaU0ghmyLy7zCStwn4GcctKJ6rNuQ/132\",\"watermark\":{\"timestamp\":1527597133,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95ZboY4LE6ztIbxTmd-Gdhd8', 'fec80c06-4d1a-478e-8f55-6b5b1dd5bd27', 'fe339e261109dcc69845f037e8b94a5012ff7b6b', '2018-05-31 08:14:23', '2018-05-31 08:14:23', 'reMXlzHzv+5cdGi4cG4yzQ==', '{\"openId\":\"ol9g95ZboY4LE6ztIbxTmd-Gdhd8\",\"nickName\":\"宋刚\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Hefei\",\"province\":\"Anhui\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKZft6vsr7rwbh7G06Vcxa70K2WMt7eNTf4z03QusgAiaAw6atJ4Bhl3REmxk1voYQV6Z4tXdHlPRA/132\",\"watermark\":{\"timestamp\":1527754461,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95ZJFCUNH--j4ORMjtiMifv4', '5a6cdd5b-ede7-403a-900e-6265f5477af3', 'd069536bb73eaa5c2e42f1bf4f9e6eb6357ddce3', '2018-05-30 00:55:08', '2018-05-30 00:55:08', 'Iqu2Uz1vzqj6e8sSh3QDlQ==', '{\"openId\":\"ol9g95ZJFCUNH--j4ORMjtiMifv4\",\"nickName\":\"学伟Kevin\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Shenzhen\",\"province\":\"Guangdong\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/AopgbmSGaV0ZekfiaAasgnb4YY4RibpwmibibaDFvN3q31STtH4rpvyibVIhVCicAwkDZOwgbhVYhP8OvLepJxic50HfQ/132\",\"watermark\":{\"timestamp\":1527641706,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95ZK79gJFYnSBKNqCHJfrjh8', '89764425-9796-4a41-8be3-a001c021c359', 'd9a07a271d2ba5ea668c6e9f4f19fdc76ad14669', '2018-05-24 05:55:19', '2018-05-24 05:55:19', 'AMvRPHT84F/C+Mg2Nx0/2g==', '{\"openId\":\"ol9g95ZK79gJFYnSBKNqCHJfrjh8\",\"nickName\":\"Camus\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"Torino\",\"country\":\"Italy\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoibCsX0lnBhfLPic9j3fJZ3uYxZakdaDRquOu6EPfjTECia8KVnTvtseNHmXa3IISag016YFl0aU4lQ/132\",\"watermark\":{\"timestamp\":1527141317,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95ZK8eKHdh23K0o1ued3zX1o', 'e9589926-ac4b-4fbe-953b-bdbb7e206780', '4b9bb2485bcd8cb73bf203257b3c7c2bd7f8a5c4', '2018-05-29 03:20:21', '2018-05-29 03:20:21', 'qqY1WlkFh4c4vNKSZcbzPw==', '{\"openId\":\"ol9g95ZK8eKHdh23K0o1ued3zX1o\",\"nickName\":\"筱琦Fiona\",\"gender\":2,\"language\":\"en\",\"city\":\"Shenzhen\",\"province\":\"Guangdong\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/ICkKn49K4dQgrw7gqU9PkBBmdlvQ2Ev3dEBSURK3g5zj14iacpjJ7mdN1pthKiaV9ZPwFeDaFjwBHZ3yr8zpEibHA/132\",\"watermark\":{\"timestamp\":1527564019,\"appid\":\"wx5ea56788e04ad18f\"}}'),
('ol9g95ZVu_CfxDDoZtAHlSwqz-SE', 'f5c675aa-fcc9-40c5-b30d-4e070c66b229', '5f003b45f4e9fc2aedf5b7944bd700f98ea84ad9', '2018-05-31 08:08:25', '2018-05-31 08:08:25', '++ukvz/mumvuFjdIUVPtrQ==', '{\"openId\":\"ol9g95ZVu_CfxDDoZtAHlSwqz-SE\",\"nickName\":\"崔书浩\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"Chengdu\",\"province\":\"Sichuan\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/EMZ1niaYzY7kbeLGE8zB4nBxJxcYTv4JkwTBj74UPD7nYYdu4sfBBasopjlmLVo1S2vT9PSHAsKt5MiaxWAHCGqg/132\",\"watermark\":{\"timestamp\":1527754103,\"appid\":\"wx5ea56788e04ad18f\"}}');

-- --------------------------------------------------------

--
-- 表的结构 `matchs`
--

CREATE TABLE `matchs` (
  `match_id` int(10) UNSIGNED NOT NULL,
  `competition_id` int(10) UNSIGNED NOT NULL,
  `round` int(10) DEFAULT NULL,
  `home` varchar(255) DEFAULT NULL,
  `score_home` int(11) DEFAULT NULL,
  `away` varchar(255) DEFAULT NULL,
  `score_away` int(10) UNSIGNED DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `matchs`
--

INSERT INTO `matchs` (`match_id`, `competition_id`, `round`, `home`, `score_home`, `away`, `score_away`, `match_time`, `enable`) VALUES
(4, 6, 32, '俄罗斯', NULL, '沙特阿拉伯', NULL, '2018-06-14 23:00:00', 1),
(5, 5, 11, '天津泰达', 1, '山东鲁能', 2, '2018-05-18 19:35:00', 1),
(9, 6, 32, '埃及', NULL, '乌拉圭', NULL, '2018-06-15 20:00:00', 1),
(10, 6, 32, '摩洛哥', NULL, '伊朗', NULL, '2018-06-15 23:00:00', 1),
(11, 6, 32, '葡萄牙', NULL, '西班牙', NULL, '2018-06-16 02:00:00', 1),
(12, 6, 32, '法国', NULL, '澳大利亚', NULL, '2018-06-16 18:00:00', 1),
(13, 6, 32, '阿根廷', NULL, '冰岛', NULL, '2018-06-16 21:00:00', 1),
(14, 6, 32, '秘鲁', NULL, '丹麦', NULL, '2018-06-17 00:00:00', 1),
(15, 6, 32, '克罗地亚', NULL, '尼日利亚', NULL, '2018-06-17 03:00:00', 1),
(16, 6, 32, '哥斯达黎加', NULL, '塞尔维亚', NULL, '2018-06-17 20:00:00', 1),
(17, 6, 32, '德国', NULL, '墨西哥', NULL, '2018-06-17 23:00:00', 1),
(18, 6, 32, '巴西', NULL, '瑞士', NULL, '2018-06-18 02:00:00', 1),
(19, 6, 32, '瑞典', NULL, '韩国', NULL, '2018-06-18 20:00:00', 1),
(20, 6, 32, '比利时', NULL, '巴拿马', NULL, '2018-06-18 23:00:00', 1),
(21, 6, 32, '突尼斯', NULL, '英格兰', NULL, '2018-06-19 02:00:00', 1),
(22, 6, 32, '哥伦比亚', NULL, '日本', NULL, '2018-06-19 20:00:00', 1),
(23, 6, 32, '波兰', NULL, '塞内加尔', NULL, '2018-06-19 23:00:00', 1),
(24, 6, 32, '俄罗斯', NULL, '埃及', NULL, '2018-06-20 02:00:00', 1),
(25, 6, 32, '葡萄牙', NULL, '摩洛哥', NULL, '2018-06-20 20:00:00', 1),
(26, 6, 32, '乌拉圭', NULL, '沙特阿拉伯', NULL, '2018-06-20 23:00:00', 1),
(27, 6, 32, '伊朗', NULL, '西班牙', NULL, '2018-06-21 02:00:00', 1),
(28, 6, 32, '丹麦', NULL, '澳大利亚', NULL, '2018-06-21 20:00:00', 1),
(29, 6, 32, '法国', NULL, '秘鲁', NULL, '2018-06-21 23:00:00', 1),
(30, 6, 32, '阿根廷', NULL, '克罗地亚', NULL, '2018-06-22 02:00:00', 1),
(31, 6, 32, '巴西', NULL, '哥斯达黎加', NULL, '2018-06-22 20:00:00', 1),
(32, 6, 32, '尼日利亚', NULL, '冰岛', NULL, '2018-06-22 23:00:00', 1),
(33, 6, 32, '塞尔维亚', NULL, '瑞士', NULL, '2018-06-23 02:00:00', 1),
(34, 6, 32, '比利时', NULL, '突尼斯', NULL, '2018-06-23 20:00:00', 1),
(35, 6, 32, '韩国', NULL, '墨西哥', NULL, '2018-06-23 23:00:00', 1),
(36, 6, 32, '德国', NULL, '瑞典', NULL, '2018-06-24 02:00:00', 1),
(37, 6, 32, '英格兰', NULL, '巴拿马', NULL, '2018-06-24 20:00:00', 1),
(38, 6, 32, '日本', NULL, '塞内加尔', NULL, '2018-06-24 23:00:00', 1),
(39, 6, 32, '波兰', NULL, '哥伦比亚', NULL, '2018-06-25 02:00:00', 1),
(40, 6, 32, '沙特阿拉伯', NULL, '埃及', NULL, '2018-06-25 22:00:00', 1),
(41, 6, 32, '乌拉圭', NULL, '俄罗斯', NULL, '2018-06-25 22:00:00', 1),
(42, 6, 32, '伊朗', NULL, '葡萄牙', NULL, '2018-06-26 02:00:00', 1),
(43, 6, 32, '西班牙', NULL, '摩洛哥', NULL, '2018-06-26 02:00:00', 1),
(44, 6, 32, '澳大利亚', NULL, '秘鲁', NULL, '2018-06-26 22:00:00', 1),
(45, 6, 32, '丹麦', NULL, '法国', NULL, '2018-06-26 22:00:00', 1),
(46, 6, 32, '冰岛', NULL, '克罗地亚', NULL, '2018-06-27 02:00:00', 1),
(47, 6, 32, '尼日利亚', NULL, '阿根廷', NULL, '2018-06-27 02:00:00', 1),
(48, 6, 32, '韩国', NULL, '德国', NULL, '2018-06-27 22:00:00', 1),
(49, 6, 32, '墨西哥', NULL, '瑞典', NULL, '2018-06-27 22:00:00', 1),
(50, 6, 32, '塞尔维亚', NULL, '巴西', NULL, '2018-06-28 02:00:00', 1),
(51, 6, 32, '瑞士', NULL, '哥斯达黎加', NULL, '2018-06-28 02:00:00', 1),
(52, 6, 32, '日本', NULL, '波兰', NULL, '2018-06-28 22:00:00', 1),
(53, 6, 32, '塞内加尔', NULL, '哥伦比亚', NULL, '2018-06-28 22:00:00', 1),
(54, 6, 32, '英格兰', NULL, '比利时', NULL, '2018-06-29 02:00:00', 1),
(55, 6, 32, '巴拿马', NULL, '突尼斯', NULL, '2018-06-29 02:00:00', 1),
(56, 6, 16, 'C组第一', NULL, 'D组第二', NULL, '2018-06-30 22:00:00', 1),
(58, 5, 11, '长春亚泰', 0, '北京国安', 2, '2018-05-19 15:30:00', 1),
(59, 5, 11, '广州富力', 1, '河南建业', 1, '2018-05-19 19:35:00', 1),
(60, 5, 11, '河北华夏', 2, '重庆斯威', 1, '2018-05-19 19:35:00', 1),
(61, 5, 11, '北京人和', 2, '广州恒大', 0, '2018-05-20 15:30:00', 1),
(62, 5, 11, '天津权健', 2, '上海申花', 1, '2018-05-20 18:00:00', 1),
(63, 5, 11, '大连一方', 2, '贵州恒丰', 1, '2018-05-20 19:35:00', 1),
(64, 5, 11, '上海上港', 2, '江苏苏宁', 0, '2018-05-20 20:00:00', 1),
(65, 5, 12, '重庆斯威', NULL, '长春亚泰', NULL, '2018-07-17 19:35:00', 1),
(66, 5, 12, '江苏苏宁', NULL, '北京人和', NULL, '2018-07-17 19:35:00', 1),
(67, 5, 12, '山东鲁能', NULL, '上海上港', NULL, '2018-07-17 19:35:00', 1),
(68, 5, 12, '天津权健', NULL, '广州富力', NULL, '2018-07-17 19:35:00', 1),
(69, 5, 12, '北京国安', NULL, '河南建业', NULL, '2018-07-18 19:35:00', 1),
(70, 5, 12, '大连一方', NULL, '河北华夏', NULL, '2018-07-18 19:35:00', 1),
(71, 5, 12, '广州恒大', NULL, '贵州恒丰', NULL, '2018-07-18 19:35:00', 1),
(72, 5, 12, '上海申花', NULL, '天津泰达', NULL, '2018-07-18 19:35:00', 1);

-- --------------------------------------------------------

--
-- 表的结构 `paul`
--

CREATE TABLE `paul` (
  `paul_id` int(20) UNSIGNED NOT NULL,
  `open_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `match_id` int(10) UNSIGNED NOT NULL,
  `paul_home` int(10) UNSIGNED NOT NULL,
  `paul_away` int(10) NOT NULL,
  `last_paul_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `paul_score` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `enable` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `paul`
--

INSERT INTO `paul` (`paul_id`, `open_id`, `match_id`, `paul_home`, `paul_away`, `last_paul_time`, `paul_score`, `last_update_time`, `enable`) VALUES
(42, 'ol9g95UqbCmUZeFqh2UbEdEkFw8I', 4, 1, 0, '2018-05-24 13:15:55', 0, '2018-05-24 05:15:55', 1),
(43, 'ol9g95a2nau0R4p9cJobV6chWEWc', 4, 2, 3, '2018-05-24 13:52:08', 0, '2018-05-24 05:52:08', 1),
(44, 'ol9g95a2nau0R4p9cJobV6chWEWc', 9, 2, 1, '2018-05-24 13:54:21', 0, '2018-05-24 05:54:21', 1),
(45, 'ol9g95ZK79gJFYnSBKNqCHJfrjh8', 4, 0, 2, '2018-05-24 13:55:26', 0, '2018-05-24 05:55:26', 1),
(46, 'ol9g95YpN7JqMgrqMlx0cdwFbeuw', 10, 3, 0, '2018-05-24 13:59:47', 0, '2018-05-24 05:59:47', 1),
(47, 'ol9g95YpN7JqMgrqMlx0cdwFbeuw', 11, 3, 0, '2018-05-24 14:00:21', 0, '2018-05-24 06:00:21', 1),
(48, 'ol9g95ckVSW3H0W7U5v-KV_bADPI', 65, 1, 1, '2018-05-24 14:52:57', 0, '2018-05-24 06:52:57', 1),
(49, 'ol9g95YpN7JqMgrqMlx0cdwFbeuw', 9, 0, 0, '2018-05-24 14:54:19', 0, '2018-05-24 06:54:19', 1),
(50, 'ol9g95UqbCmUZeFqh2UbEdEkFw8I', 9, 2, 2, '2018-05-24 22:30:29', 0, '2018-05-24 14:30:29', 1),
(51, 'ol9g95T13Ce_Ps2gQi29PqDzyui0', 4, 0, 1, '2018-05-24 22:35:53', 0, '2018-05-24 14:35:53', 1),
(52, 'ol9g95a63bbxArU3p6fA5m-EUYTU', 4, 2, 0, '2018-05-24 22:46:12', 0, '2018-05-24 14:46:12', 1),
(53, 'ol9g95a63bbxArU3p6fA5m-EUYTU', 9, 1, 1, '2018-05-24 22:46:22', 0, '2018-05-24 14:46:22', 1),
(54, 'ol9g95a63bbxArU3p6fA5m-EUYTU', 10, 1, 1, '2018-05-24 22:46:37', 0, '2018-05-24 14:46:37', 1),
(55, 'ol9g95a63bbxArU3p6fA5m-EUYTU', 11, 1, 1, '2018-05-24 22:46:48', 0, '2018-05-24 14:46:48', 1),
(56, 'ol9g95a63bbxArU3p6fA5m-EUYTU', 12, 2, 0, '2018-05-24 22:46:55', 0, '2018-05-24 14:46:55', 1),
(57, 'ol9g95a63bbxArU3p6fA5m-EUYTU', 13, 2, 0, '2018-05-24 22:47:04', 0, '2018-05-24 14:47:04', 1),
(58, 'ol9g95UqbCmUZeFqh2UbEdEkFw8I', 67, 1, 2, '2018-05-24 22:55:41', 0, '2018-05-24 14:55:41', 1),
(59, 'ol9g95acofFmWVYRlb1SuXw2jtAo', 4, 2, 1, '2018-05-24 23:24:54', 0, '2018-05-24 15:24:54', 1),
(60, 'ol9g95acofFmWVYRlb1SuXw2jtAo', 9, 0, 2, '2018-05-24 23:25:02', 0, '2018-05-24 15:25:02', 1),
(61, 'ol9g95acofFmWVYRlb1SuXw2jtAo', 10, 1, 1, '2018-05-24 23:25:11', 0, '2018-05-24 15:25:11', 1),
(62, 'ol9g95acofFmWVYRlb1SuXw2jtAo', 11, 1, 2, '2018-05-24 23:25:19', 0, '2018-05-24 15:25:19', 1),
(63, 'ol9g95acofFmWVYRlb1SuXw2jtAo', 12, 4, 0, '2018-05-24 23:25:26', 0, '2018-05-24 15:25:26', 1),
(64, 'ol9g95acofFmWVYRlb1SuXw2jtAo', 13, 2, 0, '2018-05-24 23:25:31', 0, '2018-05-24 15:25:31', 1),
(65, 'ol9g95acofFmWVYRlb1SuXw2jtAo', 14, 0, 1, '2018-05-24 23:25:36', 0, '2018-05-24 15:25:36', 1),
(66, 'ol9g95acofFmWVYRlb1SuXw2jtAo', 15, 2, 1, '2018-05-24 23:25:48', 0, '2018-05-24 15:25:48', 1),
(67, 'ol9g95acofFmWVYRlb1SuXw2jtAo', 16, 0, 2, '2018-05-24 23:25:54', 0, '2018-05-24 15:25:54', 1),
(68, 'ol9g95acofFmWVYRlb1SuXw2jtAo', 17, 3, 1, '2018-05-24 23:26:05', 0, '2018-05-24 15:26:05', 1),
(69, 'ol9g95acofFmWVYRlb1SuXw2jtAo', 18, 2, 0, '2018-05-24 23:26:11', 0, '2018-05-24 15:26:11', 1),
(70, 'ol9g95acofFmWVYRlb1SuXw2jtAo', 19, 1, 0, '2018-05-24 23:26:17', 0, '2018-05-24 15:26:17', 1),
(71, 'ol9g95acofFmWVYRlb1SuXw2jtAo', 20, 3, 0, '2018-05-24 23:26:23', 0, '2018-05-24 15:26:23', 1),
(72, 'ol9g95acofFmWVYRlb1SuXw2jtAo', 21, 0, 2, '2018-05-24 23:26:30', 0, '2018-05-24 15:26:30', 1),
(73, 'ol9g95acofFmWVYRlb1SuXw2jtAo', 22, 2, 0, '2018-05-24 23:26:35', 0, '2018-05-24 15:26:35', 1),
(74, 'ol9g95acofFmWVYRlb1SuXw2jtAo', 23, 1, 0, '2018-05-24 23:26:44', 0, '2018-05-24 15:26:44', 1),
(75, 'ol9g95acofFmWVYRlb1SuXw2jtAo', 24, 1, 0, '2018-05-24 23:26:51', 0, '2018-05-24 15:26:51', 1),
(76, 'ol9g95acofFmWVYRlb1SuXw2jtAo', 25, 2, 0, '2018-05-24 23:26:56', 0, '2018-05-24 15:26:56', 1),
(77, 'ol9g95acofFmWVYRlb1SuXw2jtAo', 26, 3, 1, '2018-05-24 23:27:04', 0, '2018-05-24 15:27:04', 1),
(78, 'ol9g95acofFmWVYRlb1SuXw2jtAo', 27, 0, 2, '2018-05-24 23:27:14', 0, '2018-05-24 15:27:14', 1),
(79, 'ol9g95acofFmWVYRlb1SuXw2jtAo', 28, 2, 1, '2018-05-24 23:27:24', 0, '2018-05-24 15:27:24', 1),
(80, 'ol9g95acofFmWVYRlb1SuXw2jtAo', 29, 3, 1, '2018-05-24 23:27:33', 0, '2018-05-24 15:27:33', 1),
(81, 'ol9g95acofFmWVYRlb1SuXw2jtAo', 30, 1, 0, '2018-05-24 23:27:39', 0, '2018-05-24 15:27:39', 1),
(82, 'ol9g95acofFmWVYRlb1SuXw2jtAo', 31, 3, 0, '2018-05-24 23:27:45', 0, '2018-05-24 15:27:45', 1),
(83, 'ol9g95acofFmWVYRlb1SuXw2jtAo', 32, 2, 1, '2018-05-24 23:27:52', 0, '2018-05-24 15:27:52', 1),
(84, 'ol9g95XgcIBysL9uFYzqrdi69Z4U', 4, 2, 0, '2018-05-25 08:41:59', 0, '2018-05-25 00:41:59', 1),
(85, 'ol9g95bvhX6_Gg2zqgNg16uwCZQQ', 4, 1, 1, '2018-05-25 08:46:41', 0, '2018-05-25 00:46:41', 1),
(86, 'ol9g95Wji8QrBJWfXUgj2yCH8DEA', 4, 0, 0, '2018-05-25 10:41:39', 0, '2018-05-25 02:41:39', 1),
(87, 'ol9g95Wji8QrBJWfXUgj2yCH8DEA', 65, 0, 0, '2018-05-25 10:42:42', 0, '2018-05-25 02:42:42', 1),
(88, 'ol9g95UqbCmUZeFqh2UbEdEkFw8I', 11, 0, 1, '2018-05-25 12:27:13', 0, '2018-05-25 04:27:13', 1),
(89, 'ol9g95dZPkmfCqwKH2wd1nQY690A', 13, 20, 6, '2018-05-26 09:00:31', 0, '2018-05-26 01:00:31', 1),
(90, 'ol9g95TkmaUeCUyMGCUaHyMmSApk', 19, 3, 1, '2018-05-26 11:36:01', 0, '2018-05-26 03:36:01', 1),
(91, 'ol9g95TkmaUeCUyMGCUaHyMmSApk', 65, 1, 3, '2018-05-26 11:37:29', 0, '2018-05-26 03:37:29', 1),
(92, 'ol9g95YxItQcGuufOl0zjzkWBwkE', 4, 2, 3, '2018-05-27 17:37:11', 0, '2018-05-27 09:37:11', 1),
(93, 'ol9g95UZkwAvazZwSWq_g4y7XCgs', 14, 2, 3, '2018-05-28 09:55:04', 0, '2018-05-28 01:55:04', 1),
(94, 'ol9g95QO0RzNoooEWIwHAAv9B2gA', 9, 2, 4, '2018-05-28 14:32:05', 0, '2018-05-28 06:32:05', 1),
(95, 'ol9g95d4qTYjdIrIeTHbBzyk3eGc', 12, 4, 20, '2018-05-28 16:00:48', 0, '2018-05-28 08:00:48', 1),
(96, 'ol9g95d4qTYjdIrIeTHbBzyk3eGc', 13, 0, 20, '2018-05-28 16:00:58', 0, '2018-05-28 08:00:58', 1),
(97, 'ol9g95d4qTYjdIrIeTHbBzyk3eGc', 14, 20, 20, '2018-05-28 16:01:04', 0, '2018-05-28 08:01:04', 1),
(98, 'ol9g95WQ77WktYqX6Ybff0YoKGKs', 18, 0, 0, '2018-05-28 19:30:25', 0, '2018-05-28 11:30:25', 1),
(99, 'ol9g95V5zLFb1D9kci-iImv9PHX0', 65, 1, 0, '2018-05-29 07:55:26', 0, '2018-05-28 23:55:26', 1),
(100, 'ol9g95QO2hAznOdzwwG53k2Hq2_Y', 65, 0, 0, '2018-05-29 10:54:29', 0, '2018-05-29 02:54:29', 1),
(101, 'ol9g95ZK8eKHdh23K0o1ued3zX1o', 9, 1, 2, '2018-05-29 11:20:37', 0, '2018-05-29 03:20:37', 1),
(102, 'ol9g95TnkecTreK7wUmKUduoOgbw', 12, 2, 0, '2018-05-29 12:22:27', 0, '2018-05-29 04:22:27', 1),
(103, 'ol9g95YZhloON0x2t1oiiGTxo2BE', 13, 4, 1, '2018-05-29 12:42:31', 0, '2018-05-29 04:42:31', 1),
(104, 'ol9g95YZhloON0x2t1oiiGTxo2BE', 17, 4, 0, '2018-05-29 12:42:40', 0, '2018-05-29 04:42:40', 1),
(105, 'ol9g95YZhloON0x2t1oiiGTxo2BE', 18, 3, 1, '2018-05-29 12:42:58', 0, '2018-05-29 04:42:58', 1),
(106, 'ol9g95YZhloON0x2t1oiiGTxo2BE', 30, 4, 1, '2018-05-29 12:43:12', 0, '2018-05-29 04:43:12', 1),
(107, 'ol9g95YZhloON0x2t1oiiGTxo2BE', 31, 4, 0, '2018-05-29 12:43:17', 0, '2018-05-29 04:43:17', 1),
(108, 'ol9g95YZhloON0x2t1oiiGTxo2BE', 71, 2, 0, '2018-05-29 12:43:41', 0, '2018-05-29 04:43:41', 1),
(109, 'ol9g95YZhloON0x2t1oiiGTxo2BE', 67, 3, 2, '2018-05-29 12:43:56', 0, '2018-05-29 04:43:56', 1),
(110, 'ol9g95fwMnNTJJp8f8hIeD56IkOo', 19, 20, 6, '2018-05-29 12:53:51', 0, '2018-05-29 04:53:51', 1),
(111, 'ol9g95fwMnNTJJp8f8hIeD56IkOo', 21, 0, 0, '2018-05-29 12:54:24', 0, '2018-05-29 04:54:24', 1),
(112, 'ol9g95fvIgbP0MLhoGUwStQF01tU', 65, 0, 0, '2018-05-29 13:16:15', 0, '2018-05-29 05:16:15', 1),
(113, 'ol9g95VkJi6zp0EfmTyR4BXdmFf4', 4, 1, 0, '2018-05-29 15:59:24', 0, '2018-05-29 07:59:24', 1),
(114, 'ol9g95bzffsbBj_f3iBUt5vsZ0x0', 4, 1, 0, '2018-05-29 16:04:48', 0, '2018-05-29 08:04:48', 1),
(115, 'ol9g95QZLoDHcAWEys4DRO39of1A', 4, 0, 0, '2018-05-29 16:25:39', 0, '2018-05-29 08:25:39', 1),
(116, 'ol9g95bmKy7W0qoJ3IjXd6c9W7TI', 4, 0, 1, '2018-05-29 17:07:47', 0, '2018-05-29 09:07:47', 1),
(117, 'ol9g95bmKy7W0qoJ3IjXd6c9W7TI', 11, 3, 2, '2018-05-29 17:08:51', 0, '2018-05-29 09:08:51', 1),
(118, 'ol9g95Y3zMmVhgq6EKgQcgDuWnrU', 4, 0, 12, '2018-05-29 17:45:03', 0, '2018-05-29 09:45:03', 1),
(119, 'ol9g95agMa0LgBexwjyEUyFFdfb0', 4, 0, 2, '2018-05-29 17:53:27', 0, '2018-05-29 09:53:27', 1),
(120, 'ol9g95bxHo8c8-KDV4RW5KcPbIaI', 69, 6, 7, '2018-05-29 18:00:56', 0, '2018-05-29 10:00:56', 1),
(121, 'ol9g95bxHo8c8-KDV4RW5KcPbIaI', 9, 0, 0, '2018-05-29 18:01:00', 0, '2018-05-29 10:01:00', 1),
(122, 'ol9g95Vp4y10bJl8XE1Sz4_mbjqY', 4, 2, 1, '2018-05-29 19:41:32', 0, '2018-05-29 11:41:32', 1),
(123, 'ol9g95Z6TZDwwVPJ9ZjlaB8f8cYI', 10, 0, 0, '2018-05-29 20:32:22', 0, '2018-05-29 12:32:22', 1),
(124, 'ol9g95UMmLZKRD2jZIOGsvjNWGPU', 32, 2, 2, '2018-05-29 20:59:42', 0, '2018-05-29 12:59:42', 1),
(125, 'ol9g95WWLLjdP2F3OzwS-U1sDzj8', 4, 3, 1, '2018-05-29 21:04:38', 0, '2018-05-29 13:04:38', 1),
(126, 'ol9g95WWLLjdP2F3OzwS-U1sDzj8', 9, 0, 0, '2018-05-29 21:04:48', 0, '2018-05-29 13:04:48', 1),
(127, 'ol9g95WWLLjdP2F3OzwS-U1sDzj8', 10, 0, 1, '2018-05-29 21:04:54', 0, '2018-05-29 13:04:54', 1),
(128, 'ol9g95U6pmiURLEBOFwcKlipQr_U', 4, 3, 1, '2018-05-29 21:19:38', 0, '2018-05-29 13:19:38', 1),
(129, 'ol9g95WGD_LNrQ-zU_s-DczpyNk4', 4, 16, 16, '2018-05-29 21:32:31', 0, '2018-05-29 13:32:31', 1),
(130, 'ol9g95WGD_LNrQ-zU_s-DczpyNk4', 9, 7, 5, '2018-05-29 21:32:51', 0, '2018-05-29 13:32:51', 1),
(131, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 4, 2, 0, '2018-05-29 21:38:31', 0, '2018-05-29 13:38:31', 1),
(132, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 9, 1, 2, '2018-05-29 21:38:48', 0, '2018-05-29 13:38:48', 1),
(133, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 10, 3, 2, '2018-05-29 21:38:59', 0, '2018-05-29 13:38:59', 1),
(134, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 11, 2, 2, '2018-05-29 21:39:08', 0, '2018-05-29 13:39:08', 1),
(135, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 12, 0, 1, '2018-05-29 21:39:14', 0, '2018-05-29 13:39:14', 1),
(136, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 13, 2, 1, '2018-05-29 21:39:21', 0, '2018-05-29 13:39:21', 1),
(137, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 14, 0, 0, '2018-05-29 21:39:27', 0, '2018-05-29 13:39:27', 1),
(138, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 15, 0, 1, '2018-05-29 21:39:32', 0, '2018-05-29 13:39:32', 1),
(139, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 16, 3, 1, '2018-05-29 21:39:38', 0, '2018-05-29 13:39:38', 1),
(140, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 17, 3, 1, '2018-05-29 21:39:44', 0, '2018-05-29 13:39:44', 1),
(141, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 18, 1, 1, '2018-05-29 21:39:52', 0, '2018-05-29 13:39:52', 1),
(142, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 19, 2, 2, '2018-05-29 21:40:11', 0, '2018-05-29 13:40:11', 1),
(143, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 20, 0, 0, '2018-05-29 21:40:13', 0, '2018-05-29 13:40:13', 1),
(144, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 21, 2, 3, '2018-05-29 21:40:21', 0, '2018-05-29 13:40:21', 1),
(145, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 22, 2, 0, '2018-05-29 21:40:26', 0, '2018-05-29 13:40:26', 1),
(146, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 23, 1, 1, '2018-05-29 21:40:31', 0, '2018-05-29 13:40:31', 1),
(147, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 24, 1, 0, '2018-05-29 21:40:35', 0, '2018-05-29 13:40:35', 1),
(148, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 25, 0, 0, '2018-05-29 21:40:37', 0, '2018-05-29 13:40:37', 1),
(149, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 26, 0, 0, '2018-05-29 21:40:40', 0, '2018-05-29 13:40:40', 1),
(150, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 27, 1, 2, '2018-05-29 21:40:44', 0, '2018-05-29 13:40:44', 1),
(151, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 28, 1, 2, '2018-05-29 21:40:48', 0, '2018-05-29 13:40:48', 1),
(152, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 29, 2, 0, '2018-05-29 21:40:51', 0, '2018-05-29 13:40:51', 1),
(153, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 30, 3, 2, '2018-05-29 21:40:56', 0, '2018-05-29 13:40:56', 1),
(154, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 31, 1, 0, '2018-05-29 21:41:01', 0, '2018-05-29 13:41:01', 1),
(155, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 32, 3, 3, '2018-05-29 21:41:06', 0, '2018-05-29 13:41:06', 1),
(156, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 33, 1, 1, '2018-05-29 21:41:10', 0, '2018-05-29 13:41:10', 1),
(157, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 34, 2, 3, '2018-05-29 21:41:14', 0, '2018-05-29 13:41:14', 1),
(158, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 35, 0, 2, '2018-05-29 21:41:18', 0, '2018-05-29 13:41:18', 1),
(159, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 36, 1, 1, '2018-05-29 21:41:23', 0, '2018-05-29 13:41:23', 1),
(160, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 37, 2, 0, '2018-05-29 21:41:26', 0, '2018-05-29 13:41:26', 1),
(161, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 38, 0, 2, '2018-05-29 21:41:30', 0, '2018-05-29 13:41:30', 1),
(162, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 39, 1, 0, '2018-05-29 21:41:33', 0, '2018-05-29 13:41:33', 1),
(163, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 40, 0, 0, '2018-05-29 21:41:34', 0, '2018-05-29 13:41:34', 1),
(164, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 41, 1, 1, '2018-05-29 21:41:39', 0, '2018-05-29 13:41:39', 1),
(165, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 42, 2, 0, '2018-05-29 21:41:42', 0, '2018-05-29 13:41:42', 1),
(166, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 43, 2, 0, '2018-05-29 21:41:44', 0, '2018-05-29 13:41:44', 1),
(167, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 44, 1, 0, '2018-05-29 21:41:47', 0, '2018-05-29 13:41:47', 1),
(168, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 45, 0, 1, '2018-05-29 21:41:50', 0, '2018-05-29 13:41:50', 1),
(169, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 46, 0, 3, '2018-05-29 21:41:54', 0, '2018-05-29 13:41:54', 1),
(170, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 47, 1, 3, '2018-05-29 21:41:58', 0, '2018-05-29 13:41:58', 1),
(171, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 48, 1, 2, '2018-05-29 21:42:02', 0, '2018-05-29 13:42:02', 1),
(172, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 49, 0, 1, '2018-05-29 21:42:04', 0, '2018-05-29 13:42:04', 1),
(173, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 50, 0, 2, '2018-05-29 21:42:07', 0, '2018-05-29 13:42:07', 1),
(174, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 51, 1, 0, '2018-05-29 21:42:11', 0, '2018-05-29 13:42:11', 1),
(175, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 52, 0, 1, '2018-05-29 21:42:13', 0, '2018-05-29 13:42:13', 1),
(176, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 53, 1, 2, '2018-05-29 21:42:17', 0, '2018-05-29 13:42:17', 1),
(177, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 54, 2, 2, '2018-05-29 21:42:21', 0, '2018-05-29 13:42:21', 1),
(178, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 55, 0, 0, '2018-05-29 21:42:26', 0, '2018-05-29 13:42:26', 1),
(179, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 56, 0, 1, '2018-05-29 21:42:27', 0, '2018-05-29 13:42:27', 1),
(180, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 65, 1, 2, '2018-05-29 21:43:24', 0, '2018-05-29 13:43:24', 1),
(181, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 66, 2, 1, '2018-05-29 21:43:29', 0, '2018-05-29 13:43:29', 1),
(182, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 67, 2, 2, '2018-05-29 21:43:33', 0, '2018-05-29 13:43:33', 1),
(183, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 68, 2, 3, '2018-05-29 21:43:45', 0, '2018-05-29 13:43:45', 1),
(184, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 69, 2, 0, '2018-05-29 21:43:48', 0, '2018-05-29 13:43:48', 1),
(185, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 70, 3, 3, '2018-05-29 21:43:54', 0, '2018-05-29 13:43:54', 1),
(186, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 71, 2, 3, '2018-05-29 21:43:59', 0, '2018-05-29 13:43:59', 1),
(187, 'ol9g95QNMUFp3aEv2z8fJsoQOwCY', 72, 3, 1, '2018-05-29 21:44:05', 0, '2018-05-29 13:44:05', 1),
(188, 'ol9g95TwBw3wS-ky6xEslC7V2wt4', 4, 2, 1, '2018-05-29 22:08:55', 0, '2018-05-29 14:08:55', 1),
(189, 'ol9g95TwBw3wS-ky6xEslC7V2wt4', 9, 1, 3, '2018-05-29 22:09:05', 0, '2018-05-29 14:09:05', 1),
(190, 'ol9g95TwBw3wS-ky6xEslC7V2wt4', 10, 0, 0, '2018-05-29 22:09:12', 0, '2018-05-29 14:09:12', 1),
(191, 'ol9g95TwBw3wS-ky6xEslC7V2wt4', 11, 2, 2, '2018-05-29 22:09:20', 0, '2018-05-29 14:09:20', 1),
(192, 'ol9g95TwBw3wS-ky6xEslC7V2wt4', 12, 2, 1, '2018-05-29 22:09:40', 0, '2018-05-29 14:09:40', 1),
(193, 'ol9g95TwBw3wS-ky6xEslC7V2wt4', 13, 1, 0, '2018-05-29 22:09:45', 0, '2018-05-29 14:09:45', 1),
(194, 'ol9g95TwBw3wS-ky6xEslC7V2wt4', 14, 2, 3, '2018-05-29 22:09:52', 0, '2018-05-29 14:09:52', 1),
(195, 'ol9g95TwBw3wS-ky6xEslC7V2wt4', 15, 2, 2, '2018-05-29 22:09:59', 0, '2018-05-29 14:09:59', 1),
(196, 'ol9g95Y82lAJ-L39ZWaduuPoS_84', 4, 0, 0, '2018-05-29 22:30:50', 0, '2018-05-29 14:30:50', 1),
(197, 'ol9g95eJ1-VEEP4p_jRw30lTts5w', 11, 19, 0, '2018-05-30 01:06:13', 0, '2018-05-29 17:06:13', 1),
(198, 'ol9g95XNbPNP3VpNkXbk_hjHR9J0', 4, 2, 0, '2018-05-30 06:45:02', 0, '2018-05-29 22:45:02', 1),
(199, 'ol9g95XNbPNP3VpNkXbk_hjHR9J0', 9, 1, 2, '2018-05-30 06:45:13', 0, '2018-05-29 22:45:13', 1),
(200, 'ol9g95ZJFCUNH--j4ORMjtiMifv4', 4, 0, 0, '2018-05-30 08:55:21', 0, '2018-05-30 00:55:21', 1),
(201, 'ol9g95fFWbEVlcDjUFOgaJGThUuA', 9, 1, 1, '2018-05-30 09:55:14', 0, '2018-05-30 01:55:14', 1),
(202, 'ol9g95Qky3RdNsIFpHqRLbZ2i_HY', 4, 2, 0, '2018-05-30 11:58:23', 0, '2018-05-30 03:58:23', 1),
(203, 'ol9g95Qky3RdNsIFpHqRLbZ2i_HY', 9, 0, 1, '2018-05-30 11:58:31', 0, '2018-05-30 03:58:31', 1),
(204, 'ol9g95Qky3RdNsIFpHqRLbZ2i_HY', 10, 0, 1, '2018-05-30 11:58:39', 0, '2018-05-30 03:58:39', 1),
(205, 'ol9g95S_A7dWMsrgQQaWHI8leirg', 4, 0, 0, '2018-05-30 12:19:36', 0, '2018-05-30 04:19:36', 1),
(206, 'ol9g95a4Y4Hup6_Hp-HxsKPnBRHg', 4, 20, 20, '2018-05-30 16:12:03', 0, '2018-05-30 08:12:03', 1),
(207, 'ol9g95diTM55yeMTN5WMgIw6Pr5g', 9, 0, 1, '2018-05-30 16:16:22', 0, '2018-05-30 08:16:22', 1),
(208, 'ol9g95diTM55yeMTN5WMgIw6Pr5g', 4, 2, 0, '2018-05-30 16:16:28', 0, '2018-05-30 08:16:28', 1),
(209, 'ol9g95diTM55yeMTN5WMgIw6Pr5g', 10, 4, 0, '2018-05-30 16:16:46', 0, '2018-05-30 08:16:46', 1),
(210, 'ol9g95aBmChcZ_ZlPH-LieV5hYSg', 4, 7, 15, '2018-05-30 17:46:16', 0, '2018-05-30 09:46:16', 1),
(211, 'ol9g95W8egds4FjJekXw0k1sKIcQ', 11, 1, 3, '2018-05-30 18:07:17', 0, '2018-05-30 10:07:17', 1),
(212, 'ol9g95W8egds4FjJekXw0k1sKIcQ', 12, 16, 20, '2018-05-30 18:07:28', 0, '2018-05-30 10:07:28', 1),
(213, 'ol9g95cZ8V6Ste8boHPzng-bLDhU', 28, 0, 0, '2018-05-30 19:05:52', 0, '2018-05-30 11:05:52', 1),
(214, 'ol9g95cfjc3UY1y6x3hTxAkaq_x8', 14, 0, 13, '2018-05-30 19:27:14', 0, '2018-05-30 11:27:14', 1),
(215, 'ol9g95Qx91hFfIAbRL8GUttiYoPU', 31, 2, 20, '2018-05-30 19:41:39', 0, '2018-05-30 11:41:39', 1),
(216, 'ol9g95TEliTT4_mci__dCtegro6w', 66, 0, 1, '2018-05-30 20:04:37', 0, '2018-05-30 12:04:37', 1),
(217, 'ol9g95VjTCn2VTVWgkluKks8QJ9U', 4, 0, 0, '2018-05-30 20:19:48', 0, '2018-05-30 12:19:48', 1),
(218, 'ol9g95edENbVTOIAbU0xp_Dc_efs', 4, 3, 2, '2018-05-30 20:27:26', 0, '2018-05-30 12:27:26', 1),
(219, 'ol9g95edENbVTOIAbU0xp_Dc_efs', 9, 1, 2, '2018-05-30 20:27:37', 0, '2018-05-30 12:27:37', 1),
(220, 'ol9g95frdSzsoNPnvNk8ZBhqlBRo', 4, 0, 0, '2018-05-30 20:42:34', 0, '2018-05-30 12:42:34', 1),
(221, 'ol9g95YMx9-cxGQjOneeCi41T8Gs', 69, 2, 0, '2018-05-30 21:10:48', 0, '2018-05-30 13:10:48', 1),
(222, 'ol9g95YMx9-cxGQjOneeCi41T8Gs', 71, 0, 1, '2018-05-30 21:11:25', 0, '2018-05-30 13:11:25', 1),
(223, 'ol9g95YMx9-cxGQjOneeCi41T8Gs', 65, 0, 0, '2018-05-30 21:11:32', 0, '2018-05-30 13:11:32', 1),
(224, 'ol9g95YMx9-cxGQjOneeCi41T8Gs', 66, 0, 1, '2018-05-30 21:11:37', 0, '2018-05-30 13:11:37', 1),
(225, 'ol9g95YMx9-cxGQjOneeCi41T8Gs', 67, 1, 2, '2018-05-30 21:11:48', 0, '2018-05-30 13:11:48', 1),
(226, 'ol9g95YMx9-cxGQjOneeCi41T8Gs', 68, 1, 1, '2018-05-30 21:11:53', 0, '2018-05-30 13:11:53', 1),
(227, 'ol9g95YMx9-cxGQjOneeCi41T8Gs', 70, 1, 2, '2018-05-30 21:12:05', 0, '2018-05-30 13:12:05', 1),
(228, 'ol9g95YMx9-cxGQjOneeCi41T8Gs', 72, 2, 0, '2018-05-30 21:12:12', 0, '2018-05-30 13:12:12', 1),
(229, 'ol9g95Xd6ZsiHSMUUovg__IX1MR4', 15, 1, 0, '2018-05-31 01:26:08', 0, '2018-05-30 17:26:08', 1),
(230, 'ol9g95XzSNfF8D5rqo9jnUTIHoos', 4, 0, 0, '2018-05-31 03:24:31', 0, '2018-05-30 19:24:31', 1),
(231, 'ol9g95RbIMgwUmabHSg0sIKYHUQ4', 12, 3, 0, '2018-05-31 09:14:41', 0, '2018-05-31 01:14:41', 1),
(232, 'ol9g95RbIMgwUmabHSg0sIKYHUQ4', 19, 20, 0, '2018-05-31 12:12:30', 0, '2018-05-31 04:12:30', 1),
(233, 'ol9g95VK-gJbRtJ9L9jM2WB-dBB8', 4, 2, 0, '2018-05-31 09:58:02', 0, '2018-05-31 01:58:02', 1),
(234, 'ol9g95VK-gJbRtJ9L9jM2WB-dBB8', 9, 0, 0, '2018-05-31 09:58:20', 0, '2018-05-31 01:58:20', 1),
(235, 'ol9g95Z47Kaew8mSqOt-A8d12bVA', 4, 5, 0, '2018-05-31 10:10:30', 0, '2018-05-31 02:10:30', 1),
(236, 'ol9g95Z47Kaew8mSqOt-A8d12bVA', 9, 3, 6, '2018-05-31 10:10:36', 0, '2018-05-31 02:10:36', 1),
(237, 'ol9g95VK-gJbRtJ9L9jM2WB-dBB8', 24, 0, 0, '2018-05-31 10:42:38', 0, '2018-05-31 02:42:38', 1),
(238, 'ol9g95VK-gJbRtJ9L9jM2WB-dBB8', 10, 0, 1, '2018-05-31 10:44:29', 0, '2018-05-31 02:44:29', 1),
(239, 'ol9g95RbIMgwUmabHSg0sIKYHUQ4', 4, 1, 0, '2018-05-31 11:44:44', 0, '2018-05-31 03:44:44', 1),
(240, 'ol9g95Y1eGd-7puYgucED2i7ixOU', 9, 0, 2, '2018-05-31 12:26:11', 0, '2018-05-31 04:26:11', 1),
(241, 'ol9g95Y1eGd-7puYgucED2i7ixOU', 10, 1, 1, '2018-05-31 12:26:58', 0, '2018-05-31 04:26:58', 1),
(242, 'ol9g95RbIMgwUmabHSg0sIKYHUQ4', 9, 1, 0, '2018-05-31 13:15:23', 0, '2018-05-31 05:15:23', 1),
(243, 'ol9g95f9wUEsj95UCPVsP8eaa67M', 4, 0, 2, '2018-05-31 14:39:56', 0, '2018-05-31 06:39:56', 1),
(244, 'ol9g95f9wUEsj95UCPVsP8eaa67M', 9, 0, 10, '2018-05-31 14:40:11', 0, '2018-05-31 06:40:11', 1),
(245, 'ol9g95VphW1mBJK26jMHy2zSO94A', 4, 2, 0, '2018-05-31 15:25:19', 0, '2018-05-31 07:25:19', 1),
(246, 'ol9g95cJQLjdNNaQynX8Fs__LnSA', 65, 19, 19, '2018-05-31 15:42:57', 0, '2018-05-31 07:42:57', 1),
(247, 'ol9g95ZVu_CfxDDoZtAHlSwqz-SE', 65, 2, 1, '2018-05-31 16:09:29', 0, '2018-05-31 08:09:29', 1),
(248, 'ol9g95ZboY4LE6ztIbxTmd-Gdhd8', 4, 9, 2, '2018-05-31 16:14:35', 0, '2018-05-31 08:14:35', 1);

-- --------------------------------------------------------

--
-- 表的结构 `teams`
--

CREATE TABLE `teams` (
  `team_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `logo` varchar(512) DEFAULT NULL,
  `competition_id` int(10) UNSIGNED DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0：俱乐部；1：国家队'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `teams`
--

INSERT INTO `teams` (`team_id`, `name`, `logo`, `competition_id`, `type`) VALUES
(1, '切尔西', NULL, NULL, 0),
(2, '阿森纳', NULL, NULL, 0),
(3, '丹麦', NULL, NULL, 0),
(4, '乌拉圭', NULL, NULL, 0),
(5, '伊朗', NULL, NULL, 0),
(6, '俄罗斯', NULL, NULL, 0),
(7, '克罗地亚', NULL, NULL, 0),
(8, '冰岛', NULL, NULL, 0),
(9, '哥伦比亚', NULL, NULL, 0),
(10, '哥斯达黎加', NULL, NULL, 0),
(11, '土耳其', NULL, NULL, 0),
(12, '埃及', NULL, NULL, 0),
(13, '塞内加尔', NULL, NULL, 0),
(14, '塞尔维亚', NULL, NULL, 0),
(15, '墨西哥', NULL, NULL, 0),
(16, '尼日利亚', NULL, NULL, 0),
(17, '巴拿马', NULL, NULL, 0),
(18, '巴西', NULL, NULL, 0),
(19, '德国', NULL, NULL, 0),
(20, '摩洛哥', NULL, NULL, 0),
(21, '日本', NULL, NULL, 0),
(22, '比利时', NULL, NULL, 0),
(23, '沙特阿拉伯', NULL, NULL, 0),
(24, '法国', NULL, NULL, 0),
(25, '波兰', NULL, NULL, 0),
(26, '澳大利亚', NULL, NULL, 0),
(27, '瑞典', NULL, NULL, 0),
(28, '瑞士', NULL, NULL, 0),
(29, '秘鲁', NULL, NULL, 0),
(30, '英格兰', NULL, NULL, 0),
(31, '葡萄牙', NULL, NULL, 0),
(32, '西班牙', NULL, NULL, 0),
(33, '阿根廷', NULL, NULL, 0),
(34, '韩国', NULL, NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `competitions`
--
ALTER TABLE `competitions`
  ADD PRIMARY KEY (`competition_id`),
  ADD KEY `competition_id` (`competition_id`);

--
-- Indexes for table `cSessionInfo`
--
ALTER TABLE `cSessionInfo`
  ADD PRIMARY KEY (`open_id`),
  ADD KEY `openid` (`open_id`) USING BTREE,
  ADD KEY `skey` (`skey`) USING BTREE;

--
-- Indexes for table `matchs`
--
ALTER TABLE `matchs`
  ADD PRIMARY KEY (`match_id`),
  ADD KEY `competiton_id` (`competition_id`),
  ADD KEY `match_id` (`match_id`);

--
-- Indexes for table `paul`
--
ALTER TABLE `paul`
  ADD PRIMARY KEY (`paul_id`),
  ADD KEY `match_id` (`match_id`),
  ADD KEY `paul_id` (`paul_id`),
  ADD KEY `open_id` (`open_id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`team_id`),
  ADD KEY `competition_id` (`competition_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `competitions`
--
ALTER TABLE `competitions`
  MODIFY `competition_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `matchs`
--
ALTER TABLE `matchs`
  MODIFY `match_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
--
-- 使用表AUTO_INCREMENT `paul`
--
ALTER TABLE `paul`
  MODIFY `paul_id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=249;
--
-- 使用表AUTO_INCREMENT `teams`
--
ALTER TABLE `teams`
  MODIFY `team_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- 限制导出的表
--

--
-- 限制表 `matchs`
--
ALTER TABLE `matchs`
  ADD CONSTRAINT `competiton_id` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`competition_id`) ON UPDATE CASCADE;

--
-- 限制表 `paul`
--
ALTER TABLE `paul`
  ADD CONSTRAINT `match_id` FOREIGN KEY (`match_id`) REFERENCES `matchs` (`match_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `open_id` FOREIGN KEY (`open_id`) REFERENCES `cSessionInfo` (`open_id`);

--
-- 限制表 `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `competition_id` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`competition_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
