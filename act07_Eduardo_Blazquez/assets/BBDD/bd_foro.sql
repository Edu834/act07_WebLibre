-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-03-2024 a las 14:37:34
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
-- Base de datos: `bd_foro`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE `mensajes` (
  `men_id` int(11) NOT NULL,
  `men_mensaje` mediumtext COLLATE utf8_spanish_ci NOT NULL,
  `men_tema_id` int(11) NOT NULL,
  `men_usu_id` int(11) NOT NULL,
  `men_fecha_hora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `mensajes`
--

INSERT INTO `mensajes` (`men_id`, `men_mensaje`, `men_tema_id`, `men_usu_id`, `men_fecha_hora`) VALUES
(1, 'Adornar la web', 2, 1, '2024-01-09 17:59:27'),
(3, 'Prueba', 2, 1, '2024-01-09 18:23:15'),
(7, 'Hola soy nuevo en el foro', 2, 10, '2024-03-19 08:59:06'),
(11, 'aa', 2, 10, '2024-03-19 09:00:49'),
(16, 'dddddrrreew', 9, 1, '2024-03-19 09:11:55'),
(17, 'dfbesntsrmf', 5, 1, '2024-03-19 09:11:58'),
(21, 'aaaaa', 1, 1, '2024-03-19 10:05:47'),
(22, 'fagwrgawv', 7, 1, '2024-03-19 10:05:51'),
(23, 'hebtnn', 4, 1, '2024-03-19 10:05:54'),
(25, 'A pesar de que HTML suele ser un lenguaje altamente intuitivo, en algunas ocasiones quienes apenas se están familiarizando con él pueden tener problemas para entender algunos de sus comportamientos. Si este es tu caso podrías preguntarte, por ejemplo, ¿cómo puedo añadir más de un espacio entre dos palabras o caracteres en HTML?  El sentido común nos diría que tenemos que presionar el espaciador dos veces ¡y listo! ¿Pero es realmente esta la manera correcta de hacerlo?  << [Plantilla gratuita] >> Plantillas de códigos de programación para HTML. Infortunadamente, las cosas no son tan sencillas en este lenguaje de programación. Si quieres añadir muchos espacios adyacentes dentro de tu documento no bastará con presionar el espaciador en múltiples ocasiones. Por el contrario, no importa cuántos espacios introduzcas, el sistema lo reducirá siempre a uno.', 4, 1, '2024-03-19 11:41:59'),
(26, 'Este comportamiento es conocido como colapso de espacios en blanco, o «whitespace collapse» en inglés, y consiste en que los navegadores mostrarán los espacios contiguos de tu código en HTML como uno solo y, a su vez, ignorarán los espacios que están antes y después de elementos o que se encuentran fuera de ellos.  Aunque esta regla puede parecer inconveniente, existen algunos trucos que todo programador principiante de HTMLldebe conocer para salir de este callejón. Para ayudarte a que tu contenido funcione tal como quieres, en este artículo te mostraremos cuatro métodos rápidos para poner espacios adicionales en tus documentos de HTML, así como algunos consejos para hacerlo en CSS.  Cómo insertar un espacio en HTML HTML es el lenguaje encargado de manejar el contenido de una página web. Si tu contenido requiere espacios adicionales para tener sentido, puedes probar con alguno de los siguientes métodos.  Si, por otro lado, quieres añadir espacios por algún motivo estético o de presentación (como para separar elementos visualmente), te recomendamos usar CSS. Al final de este artículo trataremos este tema.  Espacio duro (', 4, 1, '2024-03-19 11:44:52'),
(28, 'Este comportamiento es conocido como colapso de espacios en blanco, o «whitespace collapse» en inglés, y consiste en que los navegadores mostrarán los espacios contiguos de tu código en HTML como uno solo y, a su vez, ignorarán los espacios que están antes y después de elementos o que se encuentran fuera de ellos. Aunque esta regla puede parecer inconveniente, existen algunos trucos que todo programador principiante de HTMLldebe conocer para salir de este callejón. Para ayudarte a que tu contenido funcione tal como quieres, en este artículo te mostraremos cuatro métodos rápidos para poner espacios adicionales en tus documentos de HTML, así como algunos consejos para hacerlo en CSS. Cómo insertar un espacio en HTML HTML es el lenguaje encargado de manejar el contenido de una página web. Si tu contenido requiere espacios adicionales para tener sentido, puedes probar con alguno de los siguientes métodos. Si, por otro lado, quieres añadir espacios por algún motivo estético o de presentación (como para separar elementos visualmente), te recomendamos usar CSS. Al final de este artículo trataremos este tema. Espacio duro (', 4, 1, '2024-03-19 13:16:52'),
(31, 'Este comportamiento es conocido como colapso de espacios en blanco, o «whitespace collapse» en inglés, y consiste en que los navegadores mostrarán los espacios contiguos de tu código en HTML como uno solo y, a su vez, ignorarán los espacios que están antes y después de elementos o que se encuentran fuera de ellos. Aunque esta regla puede parecer inconveniente, existen algunos trucos que todo programador principiante de HTMLldebe conocer para salir de este callejón. Para ayudarte a que tu contenido funcione tal como quieres, en este artículo te mostraremos cuatro métodos rápidos para poner espacios adicionales en tus documentos de HTML, así como algunos consejos para hacerlo en CSS. Cómo insertar un espacio en HTML HTML es el lenguaje encargado de manejar el contenido de una página web. Si tu contenido requiere espacios adicionales para tener sentido, puedes probar con alguno de los siguientes métodos. Si, por otro lado, quieres añadir espacios por algún motivo estético o de presentación (como para separar elementos visualmente), te recomendamos usar CSS. Al final de este artículo trataremos este tema. Espacio duro (', 4, 1, '2024-03-19 13:17:31'),
(35, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 4, 1, '2024-03-19 13:27:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temas`
--

CREATE TABLE `temas` (
  `tema_id` int(11) NOT NULL,
  `tema_tema` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `temas`
--

INSERT INTO `temas` (`tema_id`, `tema_tema`) VALUES
(1, 'HTML'),
(2, 'CSS'),
(4, 'PHP'),
(5, 'Java'),
(7, 'Oracle'),
(9, 'JavaScript');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usu_id` int(11) NOT NULL,
  `usu_nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `usu_alias` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `usu_password` varchar(256) COLLATE utf8_spanish_ci NOT NULL,
  `usu_foto` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `usu_admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usu_id`, `usu_nombre`, `usu_alias`, `usu_password`, `usu_foto`, `usu_admin`) VALUES
(1, 'administrador', 'administrador', '91f5167c34c400758115c2a6826ec2e3', 'u15.gif', 1),
(2, 'usuario', 'usuario', 'f8032d5cae3de20fcec887f395ec9a6a', 'u02.gif', 0),
(3, 'Pepe', 'pepe', '926e27eecdbc7a18858b3798ba99bddd', 'anonimo.png', 0),
(7, 'Pepe2', 'pepe2', '926e27eecdbc7a18858b3798ba99bddd', 'anonimo.png', 0),
(8, 'Juana', 'juana', 'a94652aa97c7211ba8954dd15a3cf838', 'u03.gif', 0),
(9, 'a', 'a', '0cc175b9c0f1b6a831c399e269772661', 'u01.gif', 0),
(10, 'Eduardo', 'Edu34', '0963898a1755d5951eb4217e9b97b857', 'u01.gif', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`men_id`),
  ADD KEY `men_tema_id` (`men_tema_id`),
  ADD KEY `men_usu_id` (`men_usu_id`);

--
-- Indices de la tabla `temas`
--
ALTER TABLE `temas`
  ADD PRIMARY KEY (`tema_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usu_id`),
  ADD UNIQUE KEY `usu_alias` (`usu_alias`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `men_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `temas`
--
ALTER TABLE `temas`
  MODIFY `tema_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD CONSTRAINT `mensajes_fk` FOREIGN KEY (`men_tema_id`) REFERENCES `temas` (`tema_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `mensajes_ibfk_1` FOREIGN KEY (`men_usu_id`) REFERENCES `usuarios` (`usu_id`),
  ADD CONSTRAINT `mensajes_ibfk_2` FOREIGN KEY (`men_tema_id`) REFERENCES `temas` (`tema_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
