-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-06-2023 a las 19:30:30
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `trabajoo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidad`
--

CREATE TABLE `localidad` (
  `ID_Localidad` int(10) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Codigo postal` int(10) NOT NULL,
  `Prefijo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `localidad`
--

INSERT INTO `localidad` (`ID_Localidad`, `Nombre`, `Codigo postal`, `Prefijo`) VALUES
(1, 'Achiras', 5833, '03582'),
(2, 'Alpa corral ', 5801, '0356'),
(3, 'rio curto', 5800, '358'),
(4, 'las albahacas', 6141, '03582'),
(5, 'dean funes', 2132, '0341'),
(6, 'cerro colorado', 4400, '03522'),
(7, 'jesus maria', 5220, '03525'),
(8, 'san carlos minas', 3542, '5201'),
(9, 'copacabana', 51040, '00574'),
(10, 'arroyito', 2434, '03576'),
(11, 'cruz alta', 2189, '03467'),
(12, 'agua de oro', 5107, '03525');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `region`
--

CREATE TABLE `region` (
  `ID_Region` int(10) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Puntos turisticos` int(10) NOT NULL,
  `Climas` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `region`
--

INSERT INTO `region` (`ID_Region`, `Nombre`, `Puntos turisticos`, `Climas`) VALUES
(1, 'Sur', 3, 'Muy frio'),
(2, 'Este', 3, 'nublado'),
(3, 'Norte ', 3, 'templado'),
(4, 'Sureste', 3, 'Poco lluvioso'),
(5, 'Oeste', 3, 'Lluvias'),
(6, 'Centro', 3, 'soleado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relacion`
--

CREATE TABLE `relacion` (
  `ID_Relacion` int(10) NOT NULL,
  `ID_Usuario` int(10) NOT NULL,
  `ID_Region` int(10) NOT NULL,
  `ID_Localidad` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sugerencia`
--

CREATE TABLE `sugerencia` (
  `ID_Sugerencia` int(10) NOT NULL,
  `ID_Usuario` int(10) NOT NULL,
  `Comunicativo` varchar(20) NOT NULL,
  `Tema` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID_Usuario` int(10) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Apellido` varchar(20) NOT NULL,
  `Gmaill` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD PRIMARY KEY (`ID_Localidad`);

--
-- Indices de la tabla `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`ID_Region`);

--
-- Indices de la tabla `relacion`
--
ALTER TABLE `relacion`
  ADD KEY `ID_Relacion` (`ID_Relacion`,`ID_Usuario`,`ID_Region`,`ID_Localidad`),
  ADD KEY `ID_Usuario` (`ID_Usuario`),
  ADD KEY `ID_Localidad` (`ID_Localidad`),
  ADD KEY `ID_Region` (`ID_Region`);

--
-- Indices de la tabla `sugerencia`
--
ALTER TABLE `sugerencia`
  ADD PRIMARY KEY (`ID_Sugerencia`),
  ADD KEY `ID_Usuario` (`ID_Usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_Usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `localidad`
--
ALTER TABLE `localidad`
  MODIFY `ID_Localidad` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `region`
--
ALTER TABLE `region`
  MODIFY `ID_Region` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `sugerencia`
--
ALTER TABLE `sugerencia`
  MODIFY `ID_Sugerencia` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_Usuario` int(10) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `relacion`
--
ALTER TABLE `relacion`
  ADD CONSTRAINT `relacion_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`),
  ADD CONSTRAINT `relacion_ibfk_2` FOREIGN KEY (`ID_Localidad`) REFERENCES `localidad` (`ID_Localidad`),
  ADD CONSTRAINT `relacion_ibfk_3` FOREIGN KEY (`ID_Region`) REFERENCES `region` (`ID_Region`);

--
-- Filtros para la tabla `sugerencia`
--
ALTER TABLE `sugerencia`
  ADD CONSTRAINT `sugerencia_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
