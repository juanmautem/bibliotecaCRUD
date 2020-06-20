-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-05-2020 a las 08:08:05
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autores`
--

CREATE TABLE `autores` (
  `autorID` smallint(6) NOT NULL,
  `autorNombre` varchar(30) NOT NULL,
  `autorAPat` varchar(30) DEFAULT NULL,
  `autorAMat` varchar(30) DEFAULT NULL,
  `autorNac` varchar(50) NOT NULL,
  `fechaCreacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autoreslibros`
--

CREATE TABLE `autoreslibros` (
  `autoresLibrosID` smallint(6) NOT NULL,
  `autorID` smallint(6) NOT NULL,
  `libroID` smallint(6) NOT NULL,
  `fechaCreacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciones`
--

CREATE TABLE `direcciones` (
  `direccionID` smallint(6) NOT NULL,
  `calleDir` varchar(50) NOT NULL,
  `numeroExterior` varchar(10) NOT NULL,
  `numeroInterior` varchar(10) NOT NULL,
  `coloniaDir` varchar(50) NOT NULL,
  `ciudadDir` varchar(30) NOT NULL,
  `estadoDir` varchar(30) NOT NULL,
  `fechaCreacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `libroID` smallint(6) NOT NULL,
  `codigoLibro` varchar(6) NOT NULL,
  `tituloLibro` varchar(100) NOT NULL,
  `libroISBN` varchar(30) NOT NULL,
  `editorialLibro` varchar(60) NOT NULL,
  `libroPaginas` smallint(6) NOT NULL,
  `fechaCreacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listaprestamo`
--

CREATE TABLE `listaprestamo` (
  `listaID` smallint(6) NOT NULL,
  `prestamoID` smallint(6) NOT NULL,
  `libroID` smallint(6) NOT NULL,
  `fechaEntrega` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `prestamoID` smallint(6) NOT NULL,
  `usuarioID` smallint(6) NOT NULL,
  `empleadoID` smallint(6) NOT NULL,
  `fechaPrestamo` date NOT NULL,
  `fechaCreacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuarios`
--

CREATE TABLE `tipousuarios` (
  `tipoUsuarioID` smallint(6) NOT NULL,
  `tipoNombre` varchar(30) NOT NULL,
  `descripcionTipo` text DEFAULT NULL,
  `fechaCreacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usuarioID` smallint(6) NOT NULL,
  `usuarioNombre` varchar(50) NOT NULL,
  `usuarioAPat` varchar(30) DEFAULT NULL,
  `usuarioAMat` varchar(30) NOT NULL,
  `direccionID` smallint(6) NOT NULL,
  `telefonoUsuario` varchar(10) NOT NULL,
  `emailUsuario` varchar(30) NOT NULL,
  `statusUsuario` tinyint(1) NOT NULL,
  `fechaCreacion` datetime NOT NULL,
  `passUsuario` varchar(16) NOT NULL DEFAULT 'Biblioteca2020'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariotipo`
--

CREATE TABLE `usuariotipo` (
  `usuarioTipoID` smallint(6) NOT NULL,
  `usuarioID` smallint(6) NOT NULL,
  `tipoID` smallint(6) NOT NULL,
  `fechaCreacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`autorID`);

--
-- Indices de la tabla `autoreslibros`
--
ALTER TABLE `autoreslibros`
  ADD PRIMARY KEY (`autoresLibrosID`),
  ADD KEY `autorID` (`autorID`),
  ADD KEY `libroID` (`libroID`);

--
-- Indices de la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD PRIMARY KEY (`direccionID`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`libroID`);

--
-- Indices de la tabla `listaprestamo`
--
ALTER TABLE `listaprestamo`
  ADD PRIMARY KEY (`listaID`),
  ADD KEY `prestamoID` (`prestamoID`),
  ADD KEY `libroID` (`libroID`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`prestamoID`),
  ADD KEY `usuarioID` (`usuarioID`),
  ADD KEY `empleadoID` (`empleadoID`);

--
-- Indices de la tabla `tipousuarios`
--
ALTER TABLE `tipousuarios`
  ADD PRIMARY KEY (`tipoUsuarioID`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuarioID`),
  ADD UNIQUE KEY `usuarioDireccion` (`direccionID`);

--
-- Indices de la tabla `usuariotipo`
--
ALTER TABLE `usuariotipo`
  ADD PRIMARY KEY (`usuarioTipoID`),
  ADD KEY `usuarioID` (`usuarioID`),
  ADD KEY `tipoID` (`tipoID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autores`
--
ALTER TABLE `autores`
  MODIFY `autorID` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `autoreslibros`
--
ALTER TABLE `autoreslibros`
  MODIFY `autoresLibrosID` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `direcciones`
--
ALTER TABLE `direcciones`
  MODIFY `direccionID` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `libroID` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `listaprestamo`
--
ALTER TABLE `listaprestamo`
  MODIFY `listaID` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  MODIFY `prestamoID` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipousuarios`
--
ALTER TABLE `tipousuarios`
  MODIFY `tipoUsuarioID` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usuarioID` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuariotipo`
--
ALTER TABLE `usuariotipo`
  MODIFY `usuarioTipoID` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `autoreslibros`
--
ALTER TABLE `autoreslibros`
  ADD CONSTRAINT `autoreslibros_ibfk_1` FOREIGN KEY (`autorID`) REFERENCES `autores` (`autorID`),
  ADD CONSTRAINT `autoreslibros_ibfk_2` FOREIGN KEY (`libroID`) REFERENCES `libros` (`libroID`);

--
-- Filtros para la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD CONSTRAINT `direcciones_ibfk_1` FOREIGN KEY (`direccionID`) REFERENCES `usuario` (`direccionID`);

--
-- Filtros para la tabla `listaprestamo`
--
ALTER TABLE `listaprestamo`
  ADD CONSTRAINT `listaprestamo_ibfk_1` FOREIGN KEY (`prestamoID`) REFERENCES `prestamo` (`prestamoID`),
  ADD CONSTRAINT `listaprestamo_ibfk_2` FOREIGN KEY (`libroID`) REFERENCES `libros` (`libroID`);

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `prestamo_ibfk_1` FOREIGN KEY (`usuarioID`) REFERENCES `usuario` (`usuarioID`),
  ADD CONSTRAINT `prestamo_ibfk_2` FOREIGN KEY (`empleadoID`) REFERENCES `usuario` (`usuarioID`);

--
-- Filtros para la tabla `usuariotipo`
--
ALTER TABLE `usuariotipo`
  ADD CONSTRAINT `usuariotipo_ibfk_1` FOREIGN KEY (`usuarioID`) REFERENCES `usuario` (`usuarioID`),
  ADD CONSTRAINT `usuariotipo_ibfk_2` FOREIGN KEY (`tipoID`) REFERENCES `tipousuarios` (`tipoUsuarioID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
