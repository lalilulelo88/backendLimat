-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-01-2020 a las 22:40:10
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 7.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `limatco`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_inserta_guia_ingreso` (IN `idGuia` INT(5))  BEGIN
    INSERT into guia_ingreso (numeroGuia, estado_guia) values (idGuia,0);


    select id
      from guia_ingreso
     order by id desc
     limit 1;
 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_Inserta_producto_guia` (IN `calibre` DOUBLE, IN `cantidad_primaria` DOUBLE, IN `codigo_tecnico` VARCHAR(250), IN `descripcion_producto` VARCHAR(250), IN `numero_de_pallet` BIGINT(20), IN `posicion_pallet` VARCHAR(250), IN `razon_social` VARCHAR(250), IN `tono` DOUBLE, IN `guia_ingreso` BIGINT, IN `id_estadoPallet` INT, OUT `outID` BIGINT(20))  NO SQL
BEGIN


INSERT INTO pallet(calibre, cantidad_primaria, codigo_tecnico, descripcion_producto, numero_de_pallet, posicion_pallet, razon_social, tono, guia_ingreso, id_estadoPallet)
VALUES (calibre, cantidad_primaria,codigo_tecnico,descripcion_producto,
       numero_de_pallet, posicion_pallet,razon_social,tono,guia_ingreso,
       id_estadoPallet);
       
  SET outID = LAST_INSERT_ID();
  
  SELECT outID as id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_obtener_productos_IDGuiaIngreso` (IN `IDGuiaIngreso` BIGINT(10))  NO SQL
BEGIN
select 
p.id ,
p.descripcion_producto,
p.fechaRegistro

from guia_ingreso gi
join pallet p on gi.id = p.guia_ingreso 
where gi.id = IDGuiaIngreso;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_obtiene_guia_sin_ingresar` (OUT `Guia` BIGINT(10))  NO SQL
select 
gi.numeroGuia,
gi.fecha

from guia_ingreso gi 
where gi.estado_guia = 0$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_role`
--

CREATE TABLE `app_role` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `role_name` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `app_role`
--

INSERT INTO `app_role` (`id`, `description`, `role_name`) VALUES
(1, 'ADMIN User - Has permission to perform admin tasks', 'ADMIN_USER'),
(2, 'BODEGA_USER User - Has permission to perform admin tasks', 'BODEGA_USER'),
(3, 'BODEGA_USER User - Has permission to perform admin tasks', 'JEFE_BODEGA_USER');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_user`
--

CREATE TABLE `app_user` (
  `id` bigint(20) NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `app_user`
--

INSERT INTO `app_user` (`id`, `first_name`, `last_name`, `password`, `username`) VALUES
(1, 'Pedro', 'De Valdivia', '$2a$10$qtH0F1m488673KwgAfFXEOWxsoZSeHqqlB/8BTt3a6gsI5c2mdlfe', 'pdevaldivia'),
(2, 'Manuel', 'Rodriguez', '$2a$10$qtH0F1m488673KwgAfFXEOWxsoZSeHqqlB/8BTt3a6gsI5c2mdlfe', 'mrodriguez'),
(3, 'Jose Manuel', 'Balmaceda', '$2a$10$qtH0F1m488673KwgAfFXEOWxsoZSeHqqlB/8BTt3a6gsI5c2mdlfe', 'jmbalmaceda'),
(4, 'Eliseo', 'Henriquez', '$2a$10$bto1J/sie3ovETyYGNV/DeDmAZqncK4z7mPkJShhhUPTt5GYoLGNq', 'eliseo_h'),
(5, 'sebastian', 'salgado', '$2a$10$4A6UiKGoe9bUUGWdyO5FvO6QofUX7HA7zNrSi37KrrcX0F76yNFIe', 'ssalgado'),
(6, 'feña', 'raihuanque', 'f1234', 'frai');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guia_ingreso`
--

CREATE TABLE `guia_ingreso` (
  `id` bigint(20) NOT NULL,
  `numeroGuia` int(20) NOT NULL,
  `estado_guia` int(11) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `guia_ingreso`
--

INSERT INTO `guia_ingreso` (`id`, `numeroGuia`, `estado_guia`, `fecha`) VALUES
(1, 3983, 0, '2019-11-19 16:10:01'),
(2, 5104, 0, '2019-11-19 23:32:09'),
(3, 5094, 0, '2019-11-19 23:58:13'),
(4, 3982, 0, '2019-11-23 15:34:40'),
(5, 3982, 0, '2019-11-23 15:39:28'),
(6, 3982, 0, '2019-11-23 15:43:40'),
(7, 3982, 0, '2019-11-23 15:51:44'),
(8, 3982, 0, '2019-11-23 16:00:52'),
(9, 3982, 0, '2019-11-23 16:02:43'),
(10, 3982, 0, '2019-11-23 16:06:49'),
(11, 3982, 0, '2019-11-24 10:26:47'),
(12, 5104, 0, '2019-11-24 10:28:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet`
--

CREATE TABLE `pallet` (
  `id` bigint(20) NOT NULL,
  `calibre` double DEFAULT NULL,
  `cantidad_primaria` double DEFAULT NULL,
  `codigo_tecnico` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `descripcion_producto` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `numero_de_pallet` bigint(20) DEFAULT NULL,
  `posicion_pallet` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `razon_social` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `tono` double DEFAULT NULL,
  `guia_ingreso` bigint(20) DEFAULT NULL,
  `id_estadoPallet` int(20) NOT NULL,
  `fechaRegistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `pallet`
--

INSERT INTO `pallet` (`id`, `calibre`, `cantidad_primaria`, `codigo_tecnico`, `descripcion_producto`, `numero_de_pallet`, `posicion_pallet`, `razon_social`, `tono`, `guia_ingreso`, `id_estadoPallet`, `fechaRegistro`) VALUES
(1, 333, 18304, '3730Be', 'Turre Beige 45x45 (2,08)  CPe', 3, NULL, NULL, 321, 1, 0, '2019-11-24 14:06:35'),
(2, 1, 18304, '3730Ca', 'Turre Cafe 45x45 (2,08)  CPe', 321, NULL, NULL, 231, 1, 0, '2019-11-24 14:06:35'),
(3, 32, 12096, '6681', 'Porc.Olmo Beige 23x120(1,12)', 132, NULL, NULL, 132, 1, 0, '2019-11-24 14:06:35'),
(4, 1, 2016, '3185Wh', 'Brick White Bisel 10x20 (1,40) Cord-Rpc', 213, NULL, NULL, 21, 1, 0, '2019-11-24 14:06:35'),
(5, 21, 25344, '3199Gr', 'Tapei Gris 24x40(1,76) CPe', 321, NULL, NULL, 231, 1, 0, '2019-11-24 14:06:35'),
(6, 3, 1804, '3032Mi', 'Berta Mixtura 45,3x45,3 (2,05) CAr', 321, NULL, NULL, 21, 2, 0, '2019-11-24 14:06:35'),
(7, 321, 9216, '3636DG', 'Gres Porc. Ceuta Dark Grey 60x60 (1,44) Co-RPC', 2313, NULL, NULL, 231, 2, 0, '2019-11-24 14:06:35'),
(8, 12, 9216, '3637', 'Gres Porc. Limestone Sand 60x60 (1,44) Co-RPC', 321, NULL, NULL, 1231, 2, 0, '2019-11-24 14:06:35'),
(9, 21, 1804, '3705Ma', 'Portland Marfil 45,3x45,3 (2,05) CAr', 231, NULL, NULL, 321, 2, 0, '2019-11-24 14:06:35'),
(10, 21, 1804, '3727', 'Taracea Natural 45,3x45,3 (2,05) CAr', 231, NULL, NULL, 21, 2, 0, '2019-11-24 14:06:35'),
(11, 12, 15928, '3729Be', 'Tilo Beige 36x36 (1,81) Cpe', 32123, NULL, NULL, 213, 2, 0, '2019-11-24 14:06:35'),
(12, 666, 66, 'sdsd', 'sdsd', 4, '66', 'asdasd', 66, 4, 0, '2019-11-24 14:06:35'),
(13, 666, 27456, '5405Ca', 'Composto Caramelo 45x45(2,08)  CPe', 666, NULL, NULL, 666, 8, 0, '2019-11-24 14:06:35'),
(14, 666, 27456, '5405Ca', 'Composto Caramelo 45x45(2,08)  CPe', 666, NULL, NULL, 666, 9, 0, '2019-11-24 14:06:35'),
(15, 666, 27456, '5405Ca', 'Composto Caramelo 45x45(2,08)  CPe', 666, NULL, NULL, 666, 10, 0, '2019-11-24 14:06:35'),
(16, 666, 27456, '5405Ca', 'Composto Caramelo 45x45(2,08)  CPe', 666, NULL, NULL, 666, 10, 0, '2019-11-24 14:06:35'),
(17, 1231, 27456, '5405Ca', 'Composto Caramelo 45x45(2,08)  CPe', 323, NULL, NULL, 12, 11, 0, '2019-11-24 14:26:47'),
(18, 1232, 1804, '3032Mi', 'Berta Mixtura 45,3x45,3 (2,05) CAr', 123, NULL, NULL, 13, 12, 0, '2019-11-24 14:28:18'),
(19, 2323, 9216, '3636DG', 'Gres Porc. Ceuta Dark Grey 60x60 (1,44) Co-RPC', 32, NULL, NULL, 23, 12, 0, '2019-11-24 14:28:19'),
(20, 123, 9216, '3637', 'Gres Porc. Limestone Sand 60x60 (1,44) Co-RPC', 23, NULL, NULL, 43, 12, 0, '2019-11-24 14:28:21'),
(21, 434, 1804, '3705Ma', 'Portland Marfil 45,3x45,3 (2,05) CAr', 11, NULL, NULL, 34, 12, 0, '2019-11-24 14:28:23'),
(22, 313, 1804, '3727', 'Taracea Natural 45,3x45,3 (2,05) CAr', 11, NULL, NULL, 123, 12, 0, '2019-11-24 14:28:23'),
(23, 132, 15928, '3729Be', 'Tilo Beige 36x36 (1,81) Cpe', 11, NULL, NULL, 12, 12, 0, '2019-11-24 14:28:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_pos`
--

CREATE TABLE `pallet_pos` (
  `id` bigint(20) NOT NULL,
  `fecha_in` datetime DEFAULT NULL,
  `fecha_out` datetime DEFAULT NULL,
  `posicion_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `pallet_pos`
--

INSERT INTO `pallet_pos` (`id`, `fecha_in`, `fecha_out`, `posicion_id`) VALUES
(1, '0012-12-09 00:00:00', '0012-12-09 00:00:00', 1),
(2, '0012-12-09 00:00:00', '0012-12-09 00:00:00', 1),
(3, '0012-12-09 00:00:00', '0012-12-09 00:00:00', 1),
(8, '2019-10-15 00:00:00', NULL, 1),
(4, '2019-10-15 00:00:00', NULL, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL,
  `nombre_proveedor` text COLLATE utf8_spanish_ci NOT NULL,
  `rut_proveedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_role`
--

CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `app_role`
--
ALTER TABLE `app_role`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `app_user`
--
ALTER TABLE `app_user`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `guia_ingreso`
--
ALTER TABLE `guia_ingreso`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pallet`
--
ALTER TABLE `pallet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKt6f4fre9wooef4p714rwvi0dv` (`guia_ingreso`);

--
-- Indices de la tabla `pallet_pos`
--
ALTER TABLE `pallet_pos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `user_role`
--
ALTER TABLE `user_role`
  ADD KEY `FKp6m37g6n6c288s096400uw8fw` (`role_id`),
  ADD KEY `FKg7fr1r7o0fkk41nfhnjdyqn7b` (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `app_role`
--
ALTER TABLE `app_role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `app_user`
--
ALTER TABLE `app_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `guia_ingreso`
--
ALTER TABLE `guia_ingreso`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `pallet`
--
ALTER TABLE `pallet`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `pallet_pos`
--
ALTER TABLE `pallet_pos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
