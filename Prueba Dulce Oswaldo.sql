-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-01-2025 a las 16:53:46
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prueba`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `contraseña` varchar(34) NOT NULL,
  `tipo_documento` enum('V-','E-','J-') NOT NULL,
  `n_documento` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `analista`
--

CREATE TABLE `analista` (
  `id_analista` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `contraseña` varchar(34) NOT NULL,
  `tipo_documento` enum('V-','E-','J-') NOT NULL,
  `n_documento` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `tipo_documento` enum('V-','E-','J-') NOT NULL,
  `n_documento` varchar(20) NOT NULL,
  `direccion_principal` varchar(50) NOT NULL,
  `primer_nombre` varchar(50) NOT NULL,
  `segundo_nombre` varchar(50) DEFAULT NULL,
  `primer_apellido` varchar(50) NOT NULL,
  `segundo_apellido` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `id_direccion` int(11) NOT NULL,
  `estatus` enum('activo','inactivo') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `id_usuario`, `tipo_documento`, `n_documento`, `direccion_principal`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `fecha_nacimiento`, `telefono`, `correo`, `id_direccion`, `estatus`) VALUES
(1, NULL, 'V-', '12345678', 'Calle Principal 123', 'Juan', 'Carlos', 'Pérez', 'Gómez', '1990-01-01', '1234567890', 'juan@example.com', 1, 'activo'),
(2, NULL, 'E-', '87654321', 'Calle Secundaria 456', 'María', 'Isabel', 'López', 'Rodríguez', '1985-05-15', '0987654321', 'maria@example.com', 2, 'activo'),
(3, NULL, 'J-', '98765432', 'Avenida Central 789', 'Carlos', NULL, 'García', 'Martínez', '1980-12-31', '1122334455', 'carlos@example.com', 3, 'activo'),
(4, NULL, 'V-', '12345678', 'Calle Principal 123', 'Juan', 'Carlos', 'Pérez', 'Gómez', '1990-01-01', '1234567890', 'juan@example.com', 4, 'activo'),
(5, NULL, 'E-', '87654321', 'Calle Secundaria 456', 'María', 'Isabel', 'López', 'Rodríguez', '1985-05-15', '0987654321', 'maria@example.com', 5, 'activo'),
(6, NULL, 'J-', '98765432', 'Avenida Central 789', 'Carlos', NULL, 'García', 'Martínez', '1980-12-31', '1122334455', 'carlos@example.com', 6, 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes`
--

CREATE TABLE `reportes` (
  `id_reporte` int(11) NOT NULL,
  `asunto` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `estado` enum('en espera','atendido','archivado') DEFAULT 'en espera'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reportes`
--

INSERT INTO `reportes` (`id_reporte`, `asunto`, `descripcion`, `estado`) VALUES
(2, 'Prueba de reporte 2', 'Para ver si redirije aqui ', 'en espera');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id_servicio` int(11) NOT NULL,
  `nombre_plan` varchar(50) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad_mb` int(11) NOT NULL,
  `tipo` enum('fibra_optica','inalambrica') NOT NULL,
  `estado` enum('Activo','Inactivo') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id_servicio`, `nombre_plan`, `precio`, `cantidad_mb`, `tipo`, `estado`) VALUES
(1, 'Plan Hogar', 50.00, 1000, 'fibra_optica', 'Activo'),
(2, 'Plan Premium', 75.00, 2000, 'fibra_optica', 'Activo'),
(3, 'Plan Básico', 30.00, 500, 'inalambrica', 'Activo'),
(4, 'Plan Empresarial', 100.00, 3000, 'fibra_optica', 'Activo'),
(5, 'Plan Móvil', 40.00, 1000, 'inalambrica', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `tipo_usuario` enum('id_admin','id_analista') NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `contraseña` varchar(34) NOT NULL,
  `rol` enum('admin','analista','cliente') NOT NULL,
  `status` enum('activo','inactivo') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `id_cliente`, `tipo_usuario`, `usuario`, `contraseña`, `rol`, `status`) VALUES
(1, 1, 'id_admin', 'root', '21232f297a57a5a743894a0e4a801fc3', 'admin', 'activo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `analista`
--
ALTER TABLE `analista`
  ADD PRIMARY KEY (`id_analista`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD PRIMARY KEY (`id_reporte`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id_servicio`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `analista`
--
ALTER TABLE `analista`
  MODIFY `id_analista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `reportes`
--
ALTER TABLE `reportes`
  MODIFY `id_reporte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `analista`
--
ALTER TABLE `analista`
  ADD CONSTRAINT `analista_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
