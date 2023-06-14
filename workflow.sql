-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-06-2023 a las 04:05:36
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `workflow`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `flujo`
--

CREATE TABLE `flujo` (
  `Flujo` varchar(3) DEFAULT NULL,
  `proceso` varchar(3) DEFAULT NULL,
  `tipoproceso` varchar(3) DEFAULT NULL,
  `roles` varchar(2) DEFAULT NULL,
  `procesosiguiente` varchar(3) DEFAULT NULL,
  `formulario` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `flujo`
--

INSERT INTO `flujo` (`Flujo`, `proceso`, `tipoproceso`, `roles`, `procesosiguiente`, `formulario`) VALUES
('F1', 'P1', 'P', 'T', 'P2', 'solicitudCartaRecomendacion'),
('F1', 'P2', 'P', 'T', 'P3', 'compraFormulario'),
('F1', 'P3', 'P', 'T', 'P4', 'llenarFormulario'),
('F1', 'P4', 'C', 'S', NULL, 'verificarLlenado'),
('F1', 'P5', 'C', 'J', NULL, 'aprobarFormulario'),
('F1', 'P6', 'P', 'S', 'P7', 'enviarGerente'),
('F1', 'P7', 'P', 'G', 'P8', 'agregarFirma'),
('F1', 'P8', 'C', 'J', NULL, 'verificaEnviaCarta'),
('F1', 'P9', 'P', 'T', 'Fin', 'cartaEntregada'),
('F1', 'P10', 'P', 'T', 'Fin', 'notificarError'),
('F2', 'P1', 'P', 'J', 'P2', 'solicitudVacacion'),
('F2', 'P2', 'C', 'M', NULL, 'evaluarSolicitud'),
('F2', 'P3', 'P', 'J', 'Fin', 'notificarAprobacion'),
('F2', 'P4', 'P', 'J', 'Fin', 'notificarRechazo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formulariorecomendacion`
--

CREATE TABLE `formulariorecomendacion` (
  `id` int(11) NOT NULL,
  `idTrabajador` int(11) NOT NULL,
  `nroTramite` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `aPaterno` varchar(15) NOT NULL,
  `aMaterno` varchar(15) NOT NULL,
  `ci` int(10) NOT NULL,
  `codigoPersonal` int(7) NOT NULL,
  `profesion` varchar(20) NOT NULL,
  `experienciaLaboral` varchar(30) NOT NULL,
  `ciudad` varchar(15) NOT NULL,
  `firmaGerente` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `formulariorecomendacion`
--

INSERT INTO `formulariorecomendacion` (`id`, `idTrabajador`, `nroTramite`, `nombre`, `aPaterno`, `aMaterno`, `ci`, `codigoPersonal`, `profesion`, `experienciaLaboral`, `ciudad`, `firmaGerente`) VALUES
(50, 10, 140, 'Yessid Gaston', 'Miranda', 'Villca', 12894713, 1234, 'informatica', '2 años', 'la paz', 'documentos/25/licenciaConducir.jfif'),
(51, 12, 152, 'abraham', 'huanca', 'aruquipa', 12344321, 12341231, 'asdfa', '1 año', 'la paz', ''),
(52, 13, 154, 'carlos', 'jahuira', 'sullca', 12344321, 12341231, 'asdfa', '1 año', 'la paz', 'documentos/25/licenciaConducir.jfif');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `iniciales`
--

CREATE TABLE `iniciales` (
  `tipo` varchar(20) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `iniciales`
--

INSERT INTO `iniciales` (`tipo`, `valor`) VALUES
('nrotramite', 154);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procesocondicion`
--

CREATE TABLE `procesocondicion` (
  `codFlujo` varchar(3) NOT NULL,
  `codProceso` varchar(3) NOT NULL,
  `codSi` varchar(3) NOT NULL,
  `codNo` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `procesocondicion`
--

INSERT INTO `procesocondicion` (`codFlujo`, `codProceso`, `codSi`, `codNo`) VALUES
('F1', 'P4', 'P5', 'P10'),
('F1', 'P5', 'P6', 'P10'),
('F1', 'P8', 'P9', 'P10'),
('F2', 'P2', 'P3', 'P4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `codRol` varchar(1) NOT NULL,
  `tipo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`codRol`, `tipo`) VALUES
('T', 'Trabajador'),
('J', 'Jefe'),
('G', 'Gerente'),
('S', 'Secretaria'),
('M', 'Supervisor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguimiento`
--

CREATE TABLE `seguimiento` (
  `nroTramite` int(11) DEFAULT NULL,
  `codFlujo` varchar(3) DEFAULT NULL,
  `codProceso` varchar(3) DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL,
  `fechaini` datetime DEFAULT NULL,
  `fechafin` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `seguimiento`
--

INSERT INTO `seguimiento` (`nroTramite`, `codFlujo`, `codProceso`, `usuario`, `fechaini`, `fechafin`) VALUES
(151, 'F1', 'P1', 10, '2023-06-11 21:44:11', '2023-06-11 21:44:15'),
(151, 'F1', 'P2', 10, '2023-06-11 21:44:15', '2023-06-11 21:44:17'),
(151, 'F1', 'P3', 10, '2023-06-11 21:44:17', '2023-06-11 21:44:46'),
(151, 'F1', 'P4', 24, '2023-06-11 21:44:46', '2023-06-11 21:45:29'),
(151, 'F1', 'P5', 20, '2023-06-11 21:45:29', '2023-06-11 21:46:49'),
(151, 'F1', 'P6', 24, '2023-06-11 21:46:49', '2023-06-11 21:47:15'),
(151, 'F1', 'P7', 25, '2023-06-11 21:47:15', '2023-06-11 21:47:44'),
(151, 'F1', 'P8', 20, '2023-06-11 21:47:44', '2023-06-11 21:48:03'),
(151, 'F1', 'P9', 10, '2023-06-11 21:48:03', '2023-06-11 21:54:20'),
(152, 'F1', 'P1', 12, '2023-06-11 21:58:07', '2023-06-11 21:58:09'),
(152, 'F1', 'P2', 12, '2023-06-11 21:58:09', '2023-06-11 21:58:11'),
(152, 'F1', 'P3', 12, '2023-06-11 21:58:11', '2023-06-11 21:58:42'),
(152, 'F1', 'P4', 24, '2023-06-11 21:58:42', '2023-06-11 21:58:56'),
(152, 'F1', 'P10', 12, '2023-06-11 21:58:56', '2023-06-11 21:59:06'),
(153, 'F2', 'P1', 23, '2023-06-11 21:59:29', '2023-06-11 21:59:44'),
(153, 'F2', 'P2', 26, '2023-06-11 21:59:44', '2023-06-11 22:00:03'),
(153, 'F2', 'P3', 23, '2023-06-11 22:00:03', '2023-06-11 22:00:17'),
(154, 'F1', 'P1', 13, '2023-06-11 22:00:39', '2023-06-11 22:00:42'),
(154, 'F1', 'P2', 13, '2023-06-11 22:00:42', '2023-06-11 22:00:44'),
(154, 'F1', 'P3', 13, '2023-06-11 22:00:44', '2023-06-11 22:01:08'),
(154, 'F1', 'P4', 24, '2023-06-11 22:01:08', '2023-06-11 22:01:17'),
(154, 'F1', 'P5', 20, '2023-06-11 22:01:17', '2023-06-11 22:01:38'),
(154, 'F1', 'P6', 24, '2023-06-11 22:01:38', '2023-06-11 22:01:52'),
(154, 'F1', 'P7', 25, '2023-06-11 22:01:52', '2023-06-11 22:02:10'),
(154, 'F1', 'P8', 20, '2023-06-11 22:02:10', '2023-06-11 22:02:21'),
(154, 'F1', 'P9', 13, '2023-06-11 22:02:21', '2023-06-11 22:03:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudvacacion`
--

CREATE TABLE `solicitudvacacion` (
  `id` int(11) NOT NULL,
  `idRol` int(11) NOT NULL,
  `nroTramite` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `fechaIni` date NOT NULL,
  `fechaFin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `solicitudvacacion`
--

INSERT INTO `solicitudvacacion` (`id`, `idRol`, `nroTramite`, `nombre`, `fechaIni`, `fechaFin`) VALUES
(25, 23, 153, 'ana maria', '2023-06-17', '2023-06-21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `rol` varchar(1) NOT NULL,
  `usuario` varchar(25) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `rol`, `usuario`, `password`) VALUES
(10, 'T', 'yessid', '123456'),
(12, 'T', 'abraham', '123456'),
(13, 'T', 'carlos', '123456'),
(20, 'J', 'juan', '123456'),
(23, 'J', 'ana', '123456'),
(24, 'S', 'maria', '123456'),
(25, 'G', 'jose', '123456'),
(26, 'M', 'brayan', '123456');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `formulariorecomendacion`
--
ALTER TABLE `formulariorecomendacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `solicitudvacacion`
--
ALTER TABLE `solicitudvacacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `formulariorecomendacion`
--
ALTER TABLE `formulariorecomendacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `solicitudvacacion`
--
ALTER TABLE `solicitudvacacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
