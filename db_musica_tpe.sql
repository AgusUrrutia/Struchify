-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-11-2021 a las 04:30:55
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_musica_tpe`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id_comentarios` int(11) NOT NULL,
  `comentario` varchar(200) NOT NULL,
  `puntaje` tinyint(5) NOT NULL,
  `id_cancion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id_comentarios`, `comentario`, `puntaje`, `id_cancion`) VALUES
(84, 'asdsa', 2, 50),
(85, 'asdasdasdas', 3, 50),
(86, '123123123', 4, 50),
(87, 'a rAFAFQA', 5, 50),
(90, 'temazoo', 4, 51),
(97, 'asdd', 3, 50),
(100, 'asdasd', 3, 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE `generos` (
  `id` int(11) NOT NULL,
  `genero` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`id`, `genero`) VALUES
(1, 'Cumbia'),
(2, 'Trap'),
(3, 'Rock'),
(4, 'Reggae'),
(6, 'Rap'),
(7, 'Todos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `musica`
--

CREATE TABLE `musica` (
  `id_musica` int(11) NOT NULL,
  `nombreCancion` varchar(200) NOT NULL,
  `artista` varchar(100) NOT NULL,
  `album` varchar(100) NOT NULL,
  `anio` date NOT NULL,
  `favorito` tinyint(1) DEFAULT NULL,
  `imagen` varchar(500) DEFAULT NULL,
  `cancion` varchar(200) DEFAULT NULL,
  `id_genero_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `musica`
--

INSERT INTO `musica` (`id_musica`, `nombreCancion`, `artista`, `album`, `anio`, `favorito`, `imagen`, `cancion`, `id_genero_fk`) VALUES
(10, 'Nunca quise', 'Intoxicados', 'OTRO DIA EN EL PLANETA TIERRA', '2008-02-13', 0, 'img/NuncaQuise.jpg', '1c36WTqJNiOgXHTSqEckuLmpnmhrqbANM', 3),
(11, 'Fresco', 'WOS', 'Carabana', '2019-10-04', 0, 'img/619ee5fe663ef.jpg', '1Thr23Xgmlref9njs4BtyVa1G1uzVnD0_', 2),
(12, 'Llenos de magia', 'La Vela Puerca', 'A contra luz', '2016-07-08', 0, 'img/619ee5968bc1f.jpg', '1SCW1V9w0CmXPRVImJrGwIUHnJVOVJCtp', 3),
(13, 'Viejo Karma!', 'Las Pastillas Del Abuelo', 'Desafios', '2017-11-12', 0, 'img/619ee5a216eca.jpg', '1H5_IzcYETPFAtr_v8TZF5ORBLFTuvM-Y', 3),
(14, 'Demaciado Loco', 'Paulo Londra', 'Home Run', '2019-05-23', 1, 'img/619ee546a2d5c.jpg', '12PkyT6eF-zoZmTNKCOXbp0APqg2B4HE1', 2),
(15, 'Loco', 'Tiago PZK', 'Loco', '2021-09-16', 0, 'img/619ee56ba2d08.jpg', '1gW_pPSIjuICLcz0wkuwo03JHg2Z7srMR', 2),
(16, 'Hazmelo', 'Tiago PZK', 'Hazmelo', '2021-05-26', 1, 'img/619ee58123050.jpg', '1ZUtWLhW4cBCNgj8-JvL99PJNWdvx1FBy', 2),
(17, 'Como si no importara', 'Emilia & Duki', 'Como si no importara', '2021-07-13', 0, 'img/ComoSiNoImportara.jpg', '10HmSdl5O4G_yjcX81WfARhrYjYoXRAZh', 2),
(18, 'ADEMAS DE MI REMIX', 'Rusherking, Tiago PZK, KHEA, LIT Killah, Duki, Maria Becerra', 'A demas de mi', '2021-03-04', 1, 'img/AdemasDeMiRemix.jpg', '1X5cR-hZV1ui5HNvBHo40wrMIYhHOEw1k', 2),
(19, 'Nat Geo', 'Falke 912, Bhavi Ft. LIT Killah', 'Nat Geo', '2021-07-15', 0, 'img/NatGeo.jpg', '1EVYEGNGIKo78wxQRvH6szNx7oCoHSfxz', 2),
(20, 'No me conocen (REMIX)', 'BANDIDO, DUKI, REI, TIAGO PZK', 'No me conocen', '2021-06-16', 1, 'img/NoMeConocen (REMIX).jpg', '1lZhW85bHXHDQlgX8lN6tBpyN0XGKTcif', 2),
(21, 'Prende la Cámara', 'FMK, Tiago PZK', 'Prende la Cámara', '2021-07-01', 0, 'img/PrendeLaCámara.jpg', '1WE40S98GgpFS2R154UpGfP_2N6H2Aidh', 2),
(22, 'Rápido Lento', 'Emilia, Tiago PZK', 'Rápido Lento', '2021-09-30', 0, 'img/RápidoLento.jpg', '16F0nWdnANnTyDwUmCw_5yXgFNRqCkyOB', 2),
(26, 'M1 A1', 'Gorillaz', 'M1 A1', '2015-02-12', 0, 'img/gorillaz.jpg', '1L6H21S_IZGwOBreKz8jB_4F8JWFjDhwF', 3),
(27, 'Ruta 66', 'Pappo\'s Blues', 'Caso Cerrado', '1995-03-15', 0, 'img/papo.jpg', '12D0A_rulcyAW5CPP4-pDBhS0drYjs7qO', 3),
(28, 'Balada Del Diablo y La Muerte', 'La Renga', 'Despedazado por mil partes', '1996-07-21', 0, 'img/LaRenga.jpg', '15p5ym2et0K4imMe7scR_7hxbDzvFgDnn', 3),
(29, 'Toxicity ', 'System Of A Down', 'System Of A Down', '2001-09-04', 0, 'img/SystemOfaDown.jpg', '1pHcIy09ECzUHp2u0JfNu-QCWqQYif3VL', 3),
(30, 'Crimen', 'Gustavo Cerati', 'Ahí Vamos', '2006-10-05', 0, 'img/cerati.jpg', '1IR7QulRHp5oHGa3SVfpP0ST9do1GKMGM', 3),
(31, 'JIJIJI', 'Los Redondos', 'Oktubre', '1986-10-18', 1, 'img/indioSolari.jpg', '1tt6rJxJ70zRN4dyGVexYOw29t8aAFtId', 3),
(32, 'GALANG', 'Alika', 'EDUCATE YOURSELF', '2008-04-19', 0, 'img/619ee5b419da4.jpg', '12Tw-CKGDuXqnUKEsEsD1KuRchSztc5CK', 4),
(33, 'Te robaste mi corazon', 'Fidel Nadal', 'Forever together', '2010-10-10', 0, 'img/619ee5c17947e.jpg', '1gtEP7Xu7xIbZi2PUdswPgqDBa0gN-_Py', 4),
(34, 'International love ', 'Fidel Nadal', 'INTERNATIONAL LOVE', '2008-10-16', 0, 'img/619ee5cf1d773.jpg', '1MF106bi8_AM3ctsfFgZqCwJLirRniX60', 4),
(35, 'Somewhere over the Rainbow', 'Israel ', 'Over the Rainbow', '2010-04-12', 0, 'img/OverTheRainbow.jpg', '1DYaTkQI4euqJg775TJ9u0rbY0wpA6gHc', 4),
(36, 'Is This Love', 'Bob Marley & The Wailers', 'Kaya', '1978-07-07', 0, 'img/BobMarley.jpg', '12DGLMDSaCE8RFS1I2h6WyCda9Ux7rMtV', 4),
(37, 'Hoja en Blanco', 'Dread Mar I', '10 Años ', '2016-11-04', 0, 'img/DreadMarI.jpg', '1Vj3aJYNCVH-oE_dUD1eq7RTy2oRJybkf', 4),
(38, 'Tiempo', 'Rabeat & Underdann', 'Tiempo', '2016-10-13', 0, 'img/Rabeat.jpg', '1zQYwqXdasrObT1zHyawWmCAgLwRxgd_-', 4),
(39, 'Un Nuevo Día', 'Zona Ganjah', 'Poder', '2010-06-10', 0, 'img/ZonaGanjah.jpg', '1rE5070hL71yIAZxYbp729iT5O7zpZ4jq', 4),
(40, 'Lose Yourself', 'Eminem', 'Lose Yourself', '2002-06-22', 0, 'img/619ee6a3df274.jpg', '1BmI4jA6Gi-UmWukWU1W5jAD9dHUkSGR-', 6),
(41, 'Rap God', 'Eminem', 'Sencillo', '2013-10-13', 0, 'img/619ee6b493c68.jpg', '1DfSPlh7assLFojwydiOnl7vKQRIGM3rZ', 6),
(42, 'In Da Club', '50 Cent', 'In Da Club', '2009-06-09', 0, 'img/619ee7833feeb.jpg', '1YZOYw_y2f269jNrrcI9jjhSHkiyxz2Lc', 6),
(43, 'Candy Shop', '50 Cent', 'Candy Shop', '2009-06-16', 0, 'img/50Cent.jpg', '1UhaxUvz2HNMr_rUyN3nu2HZeDnaoqvqW', 6),
(44, 'goosebumps', 'Travis Scott', 'Birds in the Trap Sing McKnight', '2017-04-14', 0, 'img/TravisScott.jpg', '1YQzvh6au1PRLFv_vWFqYex5jCwnbq8o6', 6),
(45, 'Black And Yellow', 'Wiz Khalifa', 'Black and Yellow (feat. Juicy J, Snoop Dogg & T-Pain)', '2011-01-07', 0, 'img/wizKhalifa.jpg', '1PcVBSzSHlqQb6VxQh09wCMFYnAmMQxwQ', 6),
(46, 'En Boca De Tantos', 'Porta', 'En Boca De Tantos', '2009-06-26', 0, 'img/porta.jpg', '1wX5Uibz0bDTM2xF6qzbsc2JCdm6NUhAk', 6),
(50, 'La Marca de La Gorra', 'Mala Fama', 'La Tonga', '2017-12-19', 0, 'img/619ee4cc2dac1.jpg', '1O2eZe--NGkYFvVbo2ohbx4HaLT_xStWV', 1),
(51, 'La Mas Linda Del Salon', 'Los Nota Lokos', 'Los Nota Lokos', '2012-09-30', 0, 'img/619ee5005cc7e.jpg', '1DZ2lQ5_3YBZQ1eYSBloDRSMIlPO1Rh2i', 1),
(52, 'Re Loco ', 'De La Calle', 'Mas Negro Que La Noche', '2016-07-26', NULL, 'img/619ee5333969b.jpg', '1H367UvZai_1knot0PsP9tr-XQhJD3XZy', 1),
(53, 'De Regreso al Penal ', 'Pala Ancha', 'Cumbia Callejera', '2001-07-19', NULL, 'img/619ee9b48f161.jpg', '17rIAPAIkwkHBNQgbQ_zfrb0cV3pp4kvb', 1),
(54, 'solo quiero amarte ', 'La Champion Liga', ' Confía en Mí', '2010-07-24', NULL, 'img/619ee9dbb01ef.jpg', '14oLQrCUYeAYoFZnzoHRYBfs5_MuItMMn', 1),
(55, 'Mujer Yo te amo', 'Mc Caco', 'Mc Caco', '2010-06-25', NULL, NULL, '1BtHXYyBXyrQN9fPxUWF8XuGgsbnmeWCv', 1),
(56, 'Hoy Volví a Verte ', 'El Retutu', 'El Retutu', '2011-01-28', NULL, 'img/ElRetutu.jpg', '1wUi8pMAEKvr9HGHtVC8xa4I684DU-r2z', 1),
(57, 'Una Wacha Piola', 'De La Calle', 'De La Calle', '2016-07-26', NULL, 'img/deLaCalle.jpg', '1g3C5pcaa6bXpM5OfZfqbaLBzlHHq9tpx', 1),
(58, 'Llama', 'Marka Akme', 'Marka Akme', '2016-05-16', NULL, 'img/markaAkme.jpg', '1ufha_etnkkOgaRVGk3jTFLx1Gwgy3QGk', 1),
(59, 'Wup Wup!', 'RPM', 'Revolucion Por Minuto RPM  ', '2014-08-05', NULL, 'img/619dac264e1e7.jpg', '19ZhpZzmD2n8yAyNE4kkvLq5pi79i7IIM', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `contraseña` varchar(100) NOT NULL,
  `permiso` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usuario`, `contraseña`, `permiso`) VALUES
(2, 'admin', '$2a$12$E/XOxZiDcvenz3l5Ycu34.PwDJmxuY2RnR/r1111V3Z1f3D0bBJBC', 1),
(8, 'pato', '$2y$10$GGWJZw6eavvwrMAjl0UUq.9Vq3q2lJ6IrlCdQKAEMth2pFZSJ5GLy', 0),
(13, 'user', '$2y$10$7T1prP9gS0TI46AZZkX7BOPn0.20/WN1Bu/p/NqwAT7lFY2tPkd/u', 0),
(14, 'pedrito alcachofa', '$2y$10$VsUAUVYge0/IY6pv1rWqru1Hx/DRgg99146U/ghbvGplj/wh4cw.y', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id_comentarios`),
  ADD KEY `id_cancion` (`id_cancion`);

--
-- Indices de la tabla `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `musica`
--
ALTER TABLE `musica`
  ADD PRIMARY KEY (`id_musica`),
  ADD KEY `id_genero` (`id_genero_fk`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id_comentarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT de la tabla `generos`
--
ALTER TABLE `generos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `musica`
--
ALTER TABLE `musica`
  MODIFY `id_musica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`id_cancion`) REFERENCES `musica` (`id_musica`);

--
-- Filtros para la tabla `musica`
--
ALTER TABLE `musica`
  ADD CONSTRAINT `musica_ibfk_1` FOREIGN KEY (`id_genero_fk`) REFERENCES `generos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
