-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:33065
-- Tiempo de generación: 12-09-2021 a las 19:22:29
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `servicesgreat`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agenda`
--

CREATE TABLE `agenda` (
  `id_agen` int(4) NOT NULL,
  `idprofage_agen` int(4) NOT NULL,
  `idempr_agen` int(4) NOT NULL,
  `anho_agen` int(4) NOT NULL,
  `dia_agen` int(2) NOT NULL,
  `mes_agen` int(2) NOT NULL,
  `hsini_agen` int(4) NOT NULL,
  `hsfin_agen` int(4) NOT NULL,
  `estado_agen` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `id_empr` int(4) NOT NULL,
  `locacion_empr` int(30) NOT NULL,
  `estado_empr` smallint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id_per` int(4) NOT NULL,
  `tipodoc_per` int(2) NOT NULL,
  `nrodoc_per` int(9) NOT NULL,
  `nombre_per` varchar(20) NOT NULL,
  `apellido_per` varchar(20) NOT NULL,
  `genero_per` smallint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id_per`, `tipodoc_per`, `nrodoc_per`, `nombre_per`, `apellido_per`, `genero_per`) VALUES
(0, 1, 35147312, 'adrian', 'lagonegro', 1),
(1, 1, 33137379, 'otro', 'lagonegro', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_prod` int(4) NOT NULL,
  `nombre_prod` varchar(30) NOT NULL,
  `valor_prod` decimal(5,0) NOT NULL,
  `stock_prod` int(3) NOT NULL,
  `estado_prod` smallint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesional`
--

CREATE TABLE `profesional` (
  `id_prof` int(4) NOT NULL,
  `idusu_prof` int(4) NOT NULL,
  `descrip_prof` varchar(30) NOT NULL,
  `idempr_prof` int(4) DEFAULT NULL,
  `estado_prof` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prof_age`
--

CREATE TABLE `prof_age` (
  `id_profag` int(4) NOT NULL,
  `idprof_profag` int(4) NOT NULL,
  `idagen_profag` int(4) NOT NULL,
  `idemp_profag` int(4) NOT NULL,
  `estad_profag` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prof_empr`
--

CREATE TABLE `prof_empr` (
  `id_profem` int(4) NOT NULL,
  `idprof_profem` int(4) NOT NULL,
  `idempr_profem` int(4) NOT NULL,
  `estado_profem` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prof_prod`
--

CREATE TABLE `prof_prod` (
  `id_profpr` int(4) NOT NULL,
  `idprof_profpr` int(4) NOT NULL,
  `idprod_profpr` int(4) NOT NULL,
  `descrip_profpr` varchar(30) NOT NULL,
  `estado_profpr` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prof_serv`
--

CREATE TABLE `prof_serv` (
  `id_prose` int(4) NOT NULL,
  `idprof_prose` int(4) NOT NULL,
  `idserv_prose` int(4) NOT NULL,
  `estado_prose` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `id_rese` int(4) NOT NULL,
  `idprof_rese` int(4) NOT NULL,
  `idusu_rese` int(4) NOT NULL,
  `idagen_rese` int(4) NOT NULL,
  `idserv_rese` int(4) NOT NULL,
  `estado_rese` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id_serv` int(4) NOT NULL,
  `descr_serv` varchar(30) NOT NULL,
  `valor_serv` decimal(6,0) NOT NULL,
  `tiempo_serv` int(4) NOT NULL,
  `estado_serv` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usu` int(4) NOT NULL,
  `idper_usu` int(4) NOT NULL,
  `name_usu` varchar(10) NOT NULL,
  `pass_usu` varchar(10) NOT NULL,
  `estado_usu` smallint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usu`, `idper_usu`, `name_usu`, `pass_usu`, `estado_usu`) VALUES
(0, 0, 'alagonegro', '123', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`id_agen`),
  ADD KEY `idempr_agen` (`idempr_agen`),
  ADD KEY `idprofage_agen` (`idprofage_agen`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id_empr`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id_per`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_prod`);

--
-- Indices de la tabla `profesional`
--
ALTER TABLE `profesional`
  ADD PRIMARY KEY (`id_prof`),
  ADD KEY `idusu_prof` (`idusu_prof`);

--
-- Indices de la tabla `prof_age`
--
ALTER TABLE `prof_age`
  ADD PRIMARY KEY (`id_profag`),
  ADD KEY `idprof_profag` (`idprof_profag`),
  ADD KEY `idagen_profag` (`idagen_profag`),
  ADD KEY `idemp_profag` (`idemp_profag`);

--
-- Indices de la tabla `prof_empr`
--
ALTER TABLE `prof_empr`
  ADD PRIMARY KEY (`id_profem`),
  ADD KEY `idempr_profem` (`idempr_profem`),
  ADD KEY `idprof_profem` (`idprof_profem`);

--
-- Indices de la tabla `prof_prod`
--
ALTER TABLE `prof_prod`
  ADD PRIMARY KEY (`id_profpr`),
  ADD KEY `idprof_prod` (`idprof_profpr`),
  ADD KEY `idprod_profpr` (`idprod_profpr`);

--
-- Indices de la tabla `prof_serv`
--
ALTER TABLE `prof_serv`
  ADD PRIMARY KEY (`id_prose`),
  ADD KEY `idprof_prose` (`idprof_prose`),
  ADD KEY `idserv_prose` (`idserv_prose`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`id_rese`),
  ADD KEY `idprof_rese` (`idprof_rese`),
  ADD KEY `idusu_rese` (`idusu_rese`),
  ADD KEY `idagen_rese` (`idagen_rese`),
  ADD KEY `idserv_rese` (`idserv_rese`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id_serv`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usu`),
  ADD KEY `idper_usu` (`idper_usu`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agenda`
--
ALTER TABLE `agenda`
  ADD CONSTRAINT `agenda_ibfk_1` FOREIGN KEY (`idempr_agen`) REFERENCES `empresa` (`id_empr`) ON UPDATE CASCADE,
  ADD CONSTRAINT `agenda_ibfk_2` FOREIGN KEY (`idprofage_agen`) REFERENCES `profesional` (`id_prof`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `profesional`
--
ALTER TABLE `profesional`
  ADD CONSTRAINT `profesional_ibfk_1` FOREIGN KEY (`idusu_prof`) REFERENCES `usuario` (`id_usu`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `prof_age`
--
ALTER TABLE `prof_age`
  ADD CONSTRAINT `prof_age_ibfk_1` FOREIGN KEY (`idprof_profag`) REFERENCES `profesional` (`id_prof`) ON UPDATE CASCADE,
  ADD CONSTRAINT `prof_age_ibfk_2` FOREIGN KEY (`idagen_profag`) REFERENCES `agenda` (`id_agen`) ON UPDATE CASCADE,
  ADD CONSTRAINT `prof_age_ibfk_3` FOREIGN KEY (`idemp_profag`) REFERENCES `empresa` (`id_empr`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `prof_empr`
--
ALTER TABLE `prof_empr`
  ADD CONSTRAINT `prof_empr_ibfk_1` FOREIGN KEY (`idempr_profem`) REFERENCES `empresa` (`id_empr`) ON UPDATE CASCADE,
  ADD CONSTRAINT `prof_empr_ibfk_2` FOREIGN KEY (`idprof_profem`) REFERENCES `profesional` (`id_prof`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `prof_prod`
--
ALTER TABLE `prof_prod`
  ADD CONSTRAINT `prof_prod_ibfk_1` FOREIGN KEY (`idprof_profpr`) REFERENCES `profesional` (`id_prof`) ON UPDATE CASCADE,
  ADD CONSTRAINT `prof_prod_ibfk_2` FOREIGN KEY (`idprod_profpr`) REFERENCES `producto` (`id_prod`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `prof_serv`
--
ALTER TABLE `prof_serv`
  ADD CONSTRAINT `prof_serv_ibfk_1` FOREIGN KEY (`idprof_prose`) REFERENCES `profesional` (`id_prof`) ON UPDATE CASCADE,
  ADD CONSTRAINT `prof_serv_ibfk_2` FOREIGN KEY (`idserv_prose`) REFERENCES `servicio` (`id_serv`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`idprof_rese`) REFERENCES `profesional` (`id_prof`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`idusu_rese`) REFERENCES `usuario` (`id_usu`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reserva_ibfk_3` FOREIGN KEY (`idagen_rese`) REFERENCES `agenda` (`id_agen`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reserva_ibfk_4` FOREIGN KEY (`idserv_rese`) REFERENCES `servicio` (`id_serv`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idper_usu`) REFERENCES `persona` (`id_per`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
