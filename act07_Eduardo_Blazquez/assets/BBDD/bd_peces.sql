-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-05-2024 a las 12:20:04
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_peces`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pez`
--

CREATE TABLE `pez` (
  `id_pez` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `nombre_cientifico` varchar(50) NOT NULL,
  `tipo_agua` varchar(20) NOT NULL,
  `caracteristicas` varchar(1000) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `habitat` varchar(1000) NOT NULL,
  `dominio` varchar(50) NOT NULL,
  `reino` varchar(50) NOT NULL,
  `filo` varchar(50) NOT NULL,
  `subfilo` varchar(50) NOT NULL,
  `clase` varchar(50) NOT NULL,
  `superorden` varchar(50) NOT NULL,
  `orden` varchar(50) NOT NULL,
  `familia` varchar(50) NOT NULL,
  `subfamilia` varchar(50) NOT NULL,
  `genero` varchar(50) NOT NULL,
  `foto_pez` varchar(100) NOT NULL,
  `foto_habitat` varchar(100) NOT NULL,
  `estado_de_conservacion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usu_id` int(11) NOT NULL,
  `usu_nombre` varchar(50) NOT NULL,
  `usu_alias` varchar(50) NOT NULL,
  `usu_password` varchar(256) NOT NULL,
  `usu_foto` varchar(50) NOT NULL,
  `usu_admin` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pez`
--
ALTER TABLE `pez`
  ADD PRIMARY KEY (`id_pez`),
  ADD UNIQUE KEY `nombre_cientifico` (`nombre_cientifico`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usu_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pez`
--
ALTER TABLE `pez`
  MODIFY `id_pez` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usu_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
