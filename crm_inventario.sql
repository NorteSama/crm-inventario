-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-07-2025 a las 17:43:58
-- Versión del servidor: 8.0.42
-- Versión de PHP: 8.2.12
   USE railway;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `crm_inventario`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE `documentos` (
  `id` int NOT NULL,
  `equipo_id` int DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `url_archivo` varchar(255) DEFAULT NULL,
  `fecha_subida` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_vencimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `documentos`
--

INSERT INTO `documentos` (`id`, `equipo_id`, `tipo`, `url_archivo`, `fecha_subida`, `fecha_vencimiento`) VALUES
(1, 1, 'certificado', 'uploads\\archivo-1751215807878-437638527.xlsx', '2025-06-29 16:50:07', NULL),
(2, 1, 'certificado', 'uploads\\archivo-1751304860845-90610623.pdf', '2025-06-30 17:34:20', NULL),
(3, 1, 'foto', 'uploads\\archivo-1751306231958-540197191.png', '2025-06-30 17:57:12', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `id` int NOT NULL,
  `categoria` varchar(255) DEFAULT NULL,
  `existencia` int DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `marca` varchar(255) DEFAULT NULL,
  `modelo` varchar(255) DEFAULT NULL,
  `subcategoria` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`id`, `categoria`, `existencia`, `nombre`, `descripcion`, `marca`, `modelo`, `subcategoria`) VALUES
(1, 'electrico', 10, 'Multímetro', 'Multímetro digital de laboratorio', 'Fluke', '117', NULL),
(2, 'mecánico', 5, 'Torno', 'Torno de precisión para metal', 'Jet', 'BD920N', NULL),
(3, 'campo', 20, 'GPS', 'GPS portátil para geolocalización', 'Garmin', 'eTrex 32x', NULL),
(4, 'laboratorio_central', 8, 'Fuente de poder', 'Fuente regulable para laboratorio', 'BK Precision', '1687B', 'eléctrico'),
(5, 'laboratorio_central', 3, 'Prensa hidráulica', 'Prensa para ensayos de materiales', 'Instron', '3345', 'mecánico'),
(6, 'campo', 12, 'Medidor de aislamiento', 'Medidor portátil para campo', 'Megger', 'MIT400', 'eléctrico'),
(7, 'campo', 7, 'Balanza portátil', 'Balanza para muestreo en campo', 'Ohaus', 'Scout', 'mecánico'),
(8, 'consumible_lab_central', 50, 'Reactivo A', 'Reactivo para análisis', 'Sigma', 'RA-100', 'químico'),
(9, 'consumible_lab_central', 30, 'Probeta', 'Probeta de vidrio 100ml', 'Pyrex', '100ml', 'vidriería'),
(10, 'consumible_seguridad', 20, 'Guantes de nitrilo', 'Guantes para laboratorio', 'Ansell', 'TouchNTuff', 'protección'),
(11, 'consumible_seguridad', 10, 'Gafas de seguridad', 'Gafas para protección ocular', '3M', 'Virtua', 'protección'),
(12, 'laboratorio_campo', 5, 'Tester solar', 'Tester para paneles solares', 'Fluke', 'SMFT-1000', 'eléctrico'),
(13, 'laboratorio_campo', 2, 'Mini torno', 'Torno portátil para campo', 'Proxxon', 'FD 150/E', 'mecánico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_calibracion`
--

CREATE TABLE `historial_calibracion` (
  `id` int NOT NULL,
  `equipo_id` int DEFAULT NULL,
  `fecha_calibracion` date NOT NULL,
  `resultado` varchar(255) DEFAULT NULL,
  `observaciones` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `rol` enum('admin','usuario') DEFAULT 'usuario',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipo_id` (`equipo_id`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `historial_calibracion`
--
ALTER TABLE `historial_calibracion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipo_id` (`equipo_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `documentos`
--
ALTER TABLE `documentos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `historial_calibracion`
--
ALTER TABLE `historial_calibracion`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD CONSTRAINT `documentos_ibfk_1` FOREIGN KEY (`equipo_id`) REFERENCES `equipos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `historial_calibracion`
--
ALTER TABLE `historial_calibracion`
  ADD CONSTRAINT `historial_calibracion_ibfk_1` FOREIGN KEY (`equipo_id`) REFERENCES `equipos` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
