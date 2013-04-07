CREATE TABLE IF NOT EXISTS `t01_im_pregunta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pregunta` varchar(600) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- Volcado de datos para la tabla `t01_im_pregunta`
--

INSERT INTO `t01_im_pregunta` (`id`, `pregunta`) VALUES
(1, 'Prefiero hacer un mapa que explicarle a alguien como tiene que llegar.'),
(2, 'Si estoy enojado(a) o contento (a) generalmente sé exactamente por  qué.'),
(3, 'Sé tocar (o antes sabía tocar) un instrumento musical'),
(4, 'Asocio la música con mis estados de ánimo.'),
(5, 'Puedo sumar o multiplicar  mentalmente con mucha rapidez'),
(6, 'Puedo ayudar a un amigo a manejar sus sentimientos porque yo lo  pude hacer  antes en relación a sentimientos parecidos'),
(7, 'Me gusta trabajar con calculadoras y computadores'),
(8, 'Aprendo rápido a bailar un baile nuevo'),
(9, 'No me es difícil decir lo que pienso en el curso de una discusión o debate.'),
(10, 'Disfruto de una buena charla, discurso o sermón.'),
(11, 'Siempre distingo el norte del sur, esté donde esté.'),
(12, 'Me gusta reunir grupos de personas en una fiesta o en un evento especial.'),
(13, 'La vida me parece vacía sin música'),
(14, 'Siempre entiendo los gráficos que vienen en las instrucciones de equipos o   instrumentos.'),
(15, 'Me gusta hacer rompecabezas y entretenerme con juegos electrónicos'),
(16, 'Me fue fácil aprender a andar en bicicleta. ( o patines) '),
(17, 'Me enojo cuando oigo una discusión o una afirmación que perece  ilógica'),
(18, 'Soy capaz de convencer a otros que sigan mis planes'),
(19, 'Tengo buen sentido de equilibrio y coordinación.'),
(20, 'Con frecuencia veo configuraciones y relaciones entre números con más rapidez y  facilidad que otros.'),
(21, 'Me gusta construir modelos ( o hacer esculturas) '),
(22, 'Tengo agudeza para encontrar el significado de las palabras.'),
(23, 'Puedo mirar un objeto de una manera y con la misma facilidad verlo de otra manera'),
(24, 'Con frecuencia hago la conexión entre una  pieza de música y algún evento de  mi vida'),
(25, 'Me gusta trabajar con números y figuras'),
(26, 'Me gusta sentarme silenciosamente y reflexionar sobre mis sentimientos íntimos'),
(27, 'Con sólo mirar la forma de construcciones y estructuras me siento a gusto.'),
(28, 'Me gusta tararear, silbar y cantar en la ducha o cuando estoy sola'),
(29, 'Soy bueno(a) para el atletismo.'),
(30, 'Me gusta escribir cartas detalladas a mis amigos.'),
(31, 'Generalmente me doy cuenta de la expresión que tengo en la cara'),
(32, 'Me doy cuenta de las expresiones en la cara de otras personas.'),
(33, 'Me mantengo "en contacto" con mis estados de ánimo. No me cuesta identificarlos.'),
(34, 'Me doy cuenta de los estados de ánimo de otros.'),
(35, 'Me doy cuenta bastante bien de lo que otros piensan de mí');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t01_im_respuesta`
--

CREATE TABLE IF NOT EXISTS `t01_im_respuesta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_participante` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL,
  `valor` int(11) NOT NULL,
  `fecha_respuesta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_participante` (`id_participante`),
  KEY `id_pregunta` (`id_pregunta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t01_im_resultado`
--

CREATE TABLE IF NOT EXISTS `t01_im_resultado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_participante` int(11) NOT NULL,
  `a_v_l` int(11) NOT NULL,
  `b_l_m` int(11) NOT NULL,
  `c_v_e` int(11) NOT NULL,
  `d_k_c` int(11) NOT NULL,
  `e_m_r` int(11) NOT NULL,
  `f_intrapersonal` int(11) NOT NULL,
  `g_interpersonal` int(11) NOT NULL,
  `h_naturista` int(11) NOT NULL,
  `fecha_resultado` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_participante` (`id_participante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `t02_vh_calificacion`
--
CREATE TABLE IF NOT EXISTS `t02_vh_calificacion` (
`id` varchar(35)
,`id_participante` int(11)
,`seccion` varchar(200)
,`categoria` varchar(10)
,`resultado` decimal(32,0)
,`id_seccion` int(11)
,`id_categoria` int(11)
);
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t02_vh_carrera`
--

CREATE TABLE IF NOT EXISTS `t02_vh_carrera` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria_1` int(11) NOT NULL,
  `id_categoria_2` int(11) NOT NULL,
  `id_ocupacion` int(11) NOT NULL,
  `carrera` varchar(300) NOT NULL,
  `id_nivel_educativo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_categoria_1` (`id_categoria_1`),
  KEY `id_categoria_2` (`id_categoria_2`),
  KEY `id_ocupacion` (`id_ocupacion`),
  KEY `id_nivel_educativo` (`id_nivel_educativo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=445 ;

--
-- Volcado de datos para la tabla `t02_vh_carrera`
--

INSERT INTO `t02_vh_carrera` (`id`, `id_categoria_1`, `id_categoria_2`, `id_ocupacion`, `carrera`, `id_nivel_educativo`) VALUES
(1, 1, 3, 1, 'Decorador de aparadores comerciales', 4),
(2, 1, 3, 1, 'Técnico artesanal con textiles', 4),
(3, 1, 3, 1, 'Técnico de efectos de sonido', 6),
(4, 1, 6, 1, 'Asistente de electricista', 4),
(5, 1, 6, 1, 'Carpintero', 4),
(6, 1, 6, 1, 'Chofer de Tráiler', 4),
(7, 1, 6, 1, 'Dibujante arquitectónico', 4),
(8, 1, 6, 1, 'Empleado de laboratorio (clínico)', 4),
(9, 1, 6, 1, 'Empacador', 2),
(10, 1, 6, 1, 'Hojalatero', 3),
(11, 1, 6, 1, 'Inspector de Seguridad', 8),
(12, 1, 6, 1, 'Mecánico automotriz', 3),
(13, 1, 6, 1, 'Mezclador de sonido', 6),
(14, 1, 6, 1, 'Operador de tractor', 4),
(15, 1, 6, 1, 'Reparador de instrumentos', 3),
(16, 1, 6, 1, 'Técnico de electrocardiograma', 6),
(17, 1, 6, 1, 'Técnico de encefalograma', 5),
(18, 1, 6, 1, 'Técnico de equipo audiovisual', 4),
(19, 1, 6, 1, 'Técnico de laboratorio de películas', 6),
(20, 1, 6, 1, 'Técnico en diseño asistido por computadora', 4),
(21, 1, 6, 1, 'Técnico zootecnista', 6),
(22, 1, 5, 1, 'Agente de embarques', 8),
(23, 1, 5, 1, 'Bombero', 4),
(24, 1, 5, 1, 'Buzo (ciencias marinas)', 8),
(25, 1, 5, 1, 'Cerrajero', 5),
(26, 1, 5, 1, 'Cocinero, jefe de cocina', 4),
(27, 1, 5, 1, 'Conductor de autobús', 5),
(28, 1, 5, 1, 'Encargado de oficina de abastos', 4),
(29, 1, 5, 1, 'Entrenador de animales', 5),
(30, 1, 5, 1, 'Exterminador de plagas (fumigador)', 7),
(31, 1, 5, 1, 'Guardián de caza y pesca', 8),
(32, 1, 5, 1, 'Horticultor', 7),
(33, 1, 5, 1, 'Ingenieros de vuelos', 7),
(34, 1, 5, 1, 'Inspector de mantenimiento', 7),
(35, 1, 5, 1, 'Joyero', 3),
(36, 1, 5, 1, 'Maletero', 4),
(37, 1, 5, 1, 'Aperador de excavadora (buldozer)', 4),
(38, 1, 5, 1, 'Piloto de barco (timonel)', 6),
(39, 1, 5, 1, 'Plomero (construcción)', 4),
(40, 1, 5, 1, 'Profesor de artes industriales', 6),
(41, 1, 5, 1, 'Reparador de botes', 4),
(42, 1, 5, 1, 'Representantes de conservación de energía', 8),
(43, 1, 5, 1, 'Rotulador', 2),
(44, 1, 5, 1, 'Topógrafo marino', 7),
(45, 1, 2, 1, 'Agricultor general', 7),
(46, 1, 2, 1, 'Analista (evaluador de control de calidad)', 4),
(47, 1, 2, 1, 'Asistente farmacéutico', 6),
(48, 1, 2, 1, 'Chofer de taxi', 4),
(49, 1, 2, 1, 'Electricista', 5),
(50, 1, 2, 1, 'Encargado de establos', 2),
(51, 1, 2, 1, 'Geólogo', 7),
(52, 1, 2, 1, 'Guardabosques', 7),
(53, 1, 2, 1, 'Ingeniero de sistemas', 7),
(54, 1, 2, 1, 'Ingeniero Mecánico', 7),
(55, 1, 2, 1, 'Jardinero paisajista', 6),
(56, 1, 2, 1, 'Maquinista', 5),
(57, 1, 2, 1, 'Operador de estación de radio', 7),
(58, 1, 2, 1, 'Piloto de avión comercial', 6),
(59, 1, 2, 1, 'Reparador de aparatos electrodomésticos', 4),
(60, 1, 2, 1, 'Soldador de arco', 4),
(61, 1, 2, 1, 'Técnico de laboratorio clínico', 4),
(62, 1, 2, 1, 'Técnico de sonido', 6),
(63, 1, 2, 1, 'Técnico de televisión', 4),
(64, 1, 2, 1, 'Técnico en telecomunicaciones', 6),
(65, 1, 2, 1, 'Tecnólogo en terapia de radiación', 6),
(66, 1, 4, 1, 'Agente de control de vida silvestre', 7),
(67, 1, 4, 1, 'Albañil (construcción)', 2),
(68, 1, 4, 1, 'Analista de telecomunicaciones', 7),
(69, 1, 4, 1, 'Asistente ortopédico', 2),
(70, 1, 4, 1, 'Carnicero', 5),
(71, 1, 4, 1, 'Chofer de ambulancias', 4),
(72, 1, 4, 1, 'Empleado de correos', 5),
(73, 1, 4, 1, 'Ganadero', 8),
(74, 1, 4, 1, 'Inspector de inmigración', 8),
(75, 1, 4, 1, 'Inspector de puentes', 7),
(76, 1, 4, 1, 'Modista', 6),
(77, 1, 4, 1, 'Oficial de policía carreteras', 6),
(78, 1, 4, 1, 'Operador de conmutador', 4),
(79, 1, 4, 1, 'Panadero (hotel y restaurante)', 4),
(80, 1, 4, 1, 'Peluquero de perros', 6),
(81, 1, 4, 1, 'Reparador de bicicletas', 5),
(82, 1, 4, 1, 'Sastre', 4),
(83, 1, 4, 1, 'Técnico de ultrasonido', 4),
(84, 1, 4, 1, 'Técnico de urgencias médicas', 6),
(85, 1, 4, 1, 'Técnico electrónico', 4),
(86, 2, 3, 1, 'Biólogo', 7),
(87, 2, 3, 1, 'Economista', 7),
(88, 2, 3, 1, 'Psicólogo experimental', 7),
(89, 2, 3, 1, 'Valuador – Tasador de obras de arte', 8),
(90, 2, 6, 1, 'Analista de diseños en Ingeniería', 7),
(91, 2, 6, 1, 'Analista empresarial', 8),
(92, 2, 6, 1, 'Auditor interno', 7),
(93, 2, 6, 1, 'Citotecnologo (analista de cambios en células)', 8),
(94, 2, 6, 1, 'Dibujante en jefe', 4),
(95, 2, 6, 1, 'Navegante  (Marinero, ciencias navales)', 7),
(96, 2, 5, 1, 'Analista de sistemas', 7),
(97, 2, 5, 1, 'Consultor de internet', 4),
(98, 2, 5, 1, 'Director de Recursos informativos', 7),
(99, 2, 5, 1, 'Farmacéutico', 7),
(100, 2, 5, 1, 'Gerente de Seguridad', 7),
(101, 2, 5, 1, 'Inspector de tierras', 7),
(102, 2, 5, 1, 'Jefe de laboratorio químico', 7),
(103, 2, 5, 1, 'Matemático', 7),
(104, 2, 5, 1, 'Médico aeroespacial', 8),
(105, 2, 5, 1, 'Oficial de servicios de salud pública', 6),
(106, 2, 5, 1, 'Primer maquinista', 4),
(107, 2, 5, 1, 'Psicólogo educativo', 7),
(108, 2, 5, 1, 'Psicólogo industrial', 7),
(109, 2, 5, 1, 'Psicólogo organizacional', 7),
(110, 2, 5, 1, 'Sociólogo', 7),
(111, 2, 5, 1, 'Supervisor de sistemas de agua y alcantarillado', 8),
(112, 2, 1, 1, 'Administrador de base de datos', 4),
(113, 2, 1, 1, 'Administrador de internet / Intranet', 4),
(114, 2, 1, 1, 'Administrador de recursos naturales', 7),
(115, 2, 1, 1, 'Analista de sistemas de computo', 7),
(116, 2, 1, 1, 'Anestesiólogo', 8),
(117, 2, 1, 1, 'Arqueólogo', 7),
(118, 2, 1, 1, 'Arquitecto marino', 8),
(119, 2, 1, 1, 'Astrónomo', 8),
(120, 2, 1, 1, 'Cirujano', 8),
(121, 2, 1, 1, 'Dibujante aeronáutico', 4),
(122, 2, 1, 1, 'Estadístico, aplicación', 8),
(123, 2, 1, 1, 'Físico', 7),
(124, 2, 1, 1, 'Geógrafo', 7),
(125, 2, 1, 1, 'Ginecólogo', 8),
(126, 2, 1, 1, 'Ingeniero Agrícola', 7),
(127, 2, 1, 1, 'Ingeniero Biomédico', 7),
(128, 2, 1, 1, 'Ingeniero Civil', 7),
(129, 2, 1, 1, 'Ingeniero en electrónica médica', 7),
(130, 2, 1, 1, 'Ingeniero Químico', 7),
(131, 2, 1, 1, 'Médico del Deporte', 8),
(132, 2, 1, 1, 'Médico Militar', 7),
(133, 2, 1, 1, 'Médico Naval', 7),
(134, 2, 1, 1, 'Meteorólogo', 7),
(135, 2, 1, 1, 'Programador de computadoras', 4),
(136, 2, 1, 1, 'Programador de juegos', 7),
(137, 2, 1, 1, 'Promotor de proyectos de comercio electrónico', 8),
(138, 2, 1, 1, 'Químico', 7),
(139, 2, 1, 1, 'Radiólogo', 8),
(140, 2, 1, 1, 'Técnico de laboratorio químico', 4),
(141, 2, 1, 1, 'Veterinario', 7),
(142, 2, 4, 1, 'Actuario (modelos matemáticos)', 7),
(143, 2, 4, 1, 'Alergólogo', 8),
(144, 2, 4, 1, 'Asistentes de investigaciones', 8),
(145, 2, 4, 1, 'Audiólogo (especialista en audición)', 8),
(146, 2, 4, 1, 'Criminólogo', 8),
(147, 2, 4, 1, 'Odontólogo', 7),
(148, 2, 4, 1, 'Ingeniero aeroportuario', 7),
(149, 2, 4, 1, 'Médico de consulta general (servicios médicos)', 7),
(150, 2, 4, 1, 'Mercadología', 7),
(151, 2, 4, 1, 'Optometrista', 4),
(152, 2, 4, 1, 'Psiquiatra', 8),
(153, 2, 4, 1, 'Quiropráctico (medicina física y rehabilitación)', 6),
(154, 2, 4, 1, 'Técnico cirujano', 7),
(155, 2, 4, 1, 'Tecnólogo médico', 7),
(156, 2, 4, 1, 'Traductor', 7),
(157, 3, 6, 2, 'Coordinador de sitios en la red (especialista en desarrollo de la red)', 7),
(158, 3, 6, 2, 'Grafólogo (experto/analista de la Escritura)', 4),
(159, 3, 6, 2, 'Organista', 6),
(160, 3, 5, 2, 'Actor', 6),
(161, 3, 5, 2, 'Artista de maquillaje de cuerpo', 4),
(162, 3, 5, 2, 'Artista de modas', 4),
(163, 3, 5, 2, 'Bailarín', 3),
(164, 3, 5, 2, 'Camarógrafo (TV o cine)', 6),
(165, 3, 5, 2, 'Cantante', 6),
(166, 3, 5, 2, 'Caricaturista', 7),
(167, 3, 5, 2, 'Columnista', 7),
(168, 3, 5, 2, 'Comediante', 6),
(169, 3, 5, 2, 'Comentarista', 7),
(170, 3, 5, 2, 'Coreógrafo', 6),
(171, 3, 5, 2, 'Crítico (de teatro, de literatura)', 6),
(172, 3, 5, 2, 'Decorador', 4),
(173, 3, 5, 2, 'Director artístico', 6),
(174, 3, 5, 2, 'Director coral', 6),
(175, 3, 5, 2, 'Director de escenarios', 6),
(176, 3, 5, 2, 'Director de orquesta', 6),
(177, 3, 5, 2, 'Diseñador de interiores', 6),
(178, 3, 5, 2, 'Diseñador de muebles', 6),
(179, 3, 5, 2, 'Editor de libros(novelas, ensayos)', 7),
(180, 3, 5, 2, 'Ejecutivo de cuentas', 7),
(181, 3, 5, 2, 'Escultor', 8),
(182, 3, 5, 2, 'Especialista en investigación de inteligencia', 8),
(183, 3, 5, 2, 'Especialista en planeación de bodas', 4),
(184, 3, 5, 2, 'Especialista en producciones audiovisuales', 7),
(185, 3, 5, 2, 'Guitarrista', 6),
(186, 3, 5, 2, 'Percusionista', 3),
(187, 3, 5, 2, 'Pianista', 6),
(188, 3, 5, 2, 'Poeta', 7),
(189, 3, 5, 2, 'Supervisor de taller de letreros y anuncios', 5),
(190, 3, 5, 2, 'Violinista', 6),
(191, 3, 2, 2, 'Analista de textos en clave (criptoanalista)', 7),
(192, 3, 2, 2, 'Arquitecto', 7),
(193, 3, 2, 2, 'Bailarín de danza clásica', 6),
(194, 3, 2, 2, 'Escenógrafo cinematográfico', 6),
(195, 3, 2, 2, 'Escritor (prosa, ficción y no ficción)', 7),
(196, 3, 2, 2, 'Ilustrador médico y científico', 6),
(197, 3, 2, 2, 'Restaurador de papeles e impresos', 7),
(198, 3, 1, 2, 'Acomodador de mercancías', 3),
(199, 3, 1, 2, 'Alfarero', 4),
(200, 3, 1, 2, 'Constructor de maquetas', 4),
(201, 3, 1, 2, 'Decorador de bizcochos o pasteles', 3),
(202, 3, 1, 2, 'Diseñador de arreglos florales', 3),
(203, 3, 1, 2, 'Fotógrafo (estática)', 4),
(204, 3, 1, 2, 'Técnico artesanal con esmaltes', 3),
(205, 3, 1, 2, 'Técnico de escenografía', 6),
(206, 3, 4, 2, 'Bailarín de danza folclórica', 6),
(207, 3, 4, 2, 'Compositor', 6),
(208, 3, 4, 2, 'Diseñador de ropa o de modas', 7),
(209, 3, 4, 2, 'Dramaturgo', 7),
(210, 3, 4, 2, 'Instructor de danza clásica', 7),
(211, 3, 4, 2, 'Instructor de modelaj4', 4),
(212, 3, 4, 2, 'Músico instrumental', 6),
(213, 3, 4, 2, 'Profesor de arte', 7),
(214, 3, 4, 2, 'Profesor de drama (teatro)', 7),
(215, 3, 4, 2, 'Profesor de lengua inglesa', 8),
(216, 3, 4, 2, 'Reportero', 7),
(217, 3, 4, 2, 'Supervisor de operación de presentaciones de espectáculos', 6),
(218, 4, 3, 3, 'Asistente dental', 7),
(219, 4, 3, 3, 'Bibliotecario', 7),
(220, 4, 3, 3, 'Enfermera', 6),
(221, 4, 3, 3, 'Inspector de alimentos', 7),
(222, 4, 3, 3, 'Maestro de guardería', 6),
(223, 4, 3, 3, 'Maestro de preescolar, jardín infantil, o kínder', 7),
(224, 4, 3, 3, 'Ministro/Sacerdote/Rabino', 2),
(225, 4, 3, 3, 'Orientador vocacional', 8),
(226, 4, 3, 3, 'Profesor de escuela primaria', 7),
(227, 4, 3, 3, 'Puericulturista', 4),
(228, 4, 3, 3, 'Terapeuta del lenguaje', 8),
(229, 4, 6, 3, 'Asistente educativo', 6),
(230, 4, 6, 3, 'Asistente médico', 4),
(231, 4, 6, 3, 'Doble cinematográfico', 4),
(232, 4, 6, 3, 'Empleado de biblioteca, libros en cinta de audio', 6),
(233, 4, 6, 3, 'Empleado de servicios de comida rápida', 2),
(234, 4, 6, 3, 'Encargado de salón de juegos', 5),
(235, 4, 6, 3, 'Intérprete para sordos', 7),
(236, 4, 6, 3, 'Proyeccionista en jefe (cine)', 6),
(237, 4, 6, 3, 'Técnico de consejería vocacional', 7),
(238, 4, 6, 3, 'Valuador-tasador de bienes raíces', 8),
(239, 4, 5, 3, 'Administrador de redes de cómputo', 4),
(240, 4, 5, 3, 'Administrador hospitalario', 2),
(241, 4, 5, 3, 'Ama de casa', 4),
(242, 4, 5, 3, 'Asistente legal', 7),
(243, 4, 5, 3, 'Científico en ciencias políticas', 8),
(244, 4, 5, 3, 'Consejero de rehabilitación vocacional', 7),
(245, 4, 5, 3, 'Cosmetólogo', 4),
(246, 4, 5, 3, 'Detective', 7),
(247, 4, 5, 3, 'Director atlético', 7),
(248, 4, 5, 3, 'Director de biblioteca', 7),
(249, 4, 5, 3, 'Director de educación especial', 7),
(250, 4, 5, 3, 'Director de escuela', 8),
(251, 4, 5, 3, 'Director de institución correccional', 8),
(252, 4, 5, 3, 'Enfermero, supervisor', 5),
(253, 4, 5, 3, 'Especialista en relaciones laborales', 7),
(254, 4, 5, 3, 'Estilista de peinado', 4),
(255, 4, 5, 3, 'Gerente de almacenaje', 7),
(256, 4, 5, 3, 'Gerente de operaciones de cómputo', 7),
(257, 4, 5, 3, 'Gerente de servicios de comida rápida', 7),
(258, 4, 5, 3, 'Historiador', 7),
(259, 4, 5, 3, 'Jefe de servicios municipales', 8),
(260, 4, 5, 3, 'Oficial de policía', 3),
(261, 4, 5, 3, 'Presidente de institución financiera', 8),
(262, 4, 5, 3, 'Profesor de educación para adultos', 7),
(263, 4, 5, 3, 'Profesor universitario', 2),
(264, 4, 5, 3, 'Socorrista', 5),
(265, 4, 5, 3, 'Supervisor de educación especial', 7),
(266, 4, 5, 3, 'Supervisor de laboratorio dental', 4),
(267, 4, 5, 3, 'Supervisor de reparación de carrocería para automóviles', 4),
(268, 4, 5, 3, 'Técnico dietista', 4),
(269, 4, 5, 3, 'Terapeuta recreacional', 7),
(270, 4, 5, 3, 'Trabajador social de rehabilitación familiar', 8),
(271, 4, 2, 3, 'Abogado civil', 8),
(272, 4, 2, 3, 'Abogado penalista', 8),
(273, 4, 2, 3, 'Administrador de archivos médicos', 4),
(274, 4, 2, 3, 'Dietista clínico', 8),
(275, 4, 2, 3, 'Enfermero militar', 4),
(276, 4, 2, 3, 'Enfermero naval', 4),
(277, 4, 2, 3, 'Enfermero,instructor', 4),
(278, 4, 2, 3, 'Fisioterapeuta', 7),
(279, 4, 2, 3, 'Podiatra (especialista en enfermedades en los pies)', 3),
(280, 4, 2, 3, 'Psicólogo clínico', 7),
(281, 4, 2, 3, 'Psicólogo social', 7),
(282, 4, 2, 3, 'Supervisor de distrito', 7),
(283, 4, 1, 3, 'Atleta profesional', 6),
(284, 4, 1, 3, 'Camillero', 5),
(285, 4, 1, 3, 'Entrenador de atletas profesionales', 7),
(286, 4, 1, 3, 'Gerente de criadero de perros', 7),
(287, 4, 1, 3, 'Guardián', 5),
(288, 4, 1, 3, 'Instructor de vuelo', 6),
(289, 4, 1, 3, 'Supervisor de cosméticos', 7),
(290, 4, 1, 3, 'Supervisor de planta industrial', 7),
(291, 4, 1, 3, 'Supervisor de revelado de película fotográfica', 4),
(292, 4, 1, 3, 'Terapeuta ocupacional', 7),
(293, 5, 3, 4, 'Coordinador de modas', 7),
(294, 5, 3, 4, 'Gerente de análisis de archivos', 7),
(295, 5, 3, 4, 'Gerente de locaciones (cine, TV)', 6),
(296, 5, 3, 4, 'Modelo de Fotógrafos', 5),
(297, 5, 3, 4, 'Subastador (encargado de subastas)', 6),
(298, 5, 3, 4, 'Supervisor de Música', 7),
(299, 5, 6, 4, 'Administrador ejecutivo de propiedades', 7),
(300, 5, 6, 4, 'Agente de Viajes', 7),
(301, 5, 6, 4, 'Auxiliar de oficina', 2),
(302, 5, 6, 4, 'Conductor de flete terrestre', 5),
(303, 5, 6, 4, 'Conductor fiscal', 8),
(304, 5, 6, 4, 'Despachador de servicio (servicios públicos)', 5),
(305, 5, 6, 4, 'Gerente de Club de golf', 7),
(306, 5, 6, 4, 'Gerente de sucursal de almacén', 7),
(307, 5, 6, 4, 'Inspector de seguridad de y salud ocupacional', 8),
(308, 5, 6, 4, 'Mesero', 4),
(309, 5, 6, 4, 'Notario', 7),
(310, 5, 6, 4, 'Superintendente de suministro de energía eléctrica', 7),
(311, 5, 6, 4, 'Supervisor de aislamiento térmico de edificios', 7),
(312, 5, 6, 4, 'Supervisor de distribución', 8),
(313, 5, 6, 4, 'Supervisor de telecomunicaciones', 7),
(314, 5, 2, 4, 'Contralor', 8),
(315, 5, 2, 4, 'Contratista', 7),
(316, 5, 2, 4, 'Corredor de divisas extranjeras', 8),
(317, 5, 2, 4, 'Director de servicios alimentarios', 7),
(318, 5, 2, 4, 'Gerente de educación y capacitación', 8),
(319, 5, 2, 4, 'Ingeniero industrial', 7),
(320, 5, 2, 4, 'Investigador de servicios públicos', 8),
(321, 5, 2, 4, 'Supervisor de laboratorio (profesional y afin)', 4),
(322, 5, 2, 4, 'Supervisor de Mantenimiento (servicios públicos)', 3),
(323, 5, 1, 4, 'Agente especial (servicios gubernamentales)', 8),
(324, 5, 1, 4, 'Asesor de bienes muebles', 8),
(325, 5, 1, 4, 'Asistente de vestuario', 3),
(326, 5, 1, 4, 'Botones', 5),
(327, 5, 1, 4, 'Director de investigación y desarrollo', 8),
(328, 5, 1, 4, 'Gerente de gasolinera', 4),
(329, 5, 1, 4, 'Gerente de muelles marítmos', 4),
(330, 5, 1, 4, 'Gerente de producción', 7),
(331, 5, 1, 4, 'Jefe de bomberos', 7),
(332, 5, 1, 4, 'Jefe de mantenimiento aeroportuario', 3),
(333, 5, 1, 4, 'Piloto de servicio de patrulla de caminos', 7),
(334, 5, 1, 4, 'Representante de ventas, sistemas de seguridad', 4),
(335, 5, 1, 4, 'Supervisor de parques', 4),
(336, 5, 1, 4, 'Supervisor de siderúrgica (preparación de minerales, fundición y refinamiento)', 8),
(337, 5, 1, 4, 'Supervisor de vivero forestal', 7),
(338, 5, 4, 4, 'Abogado', 7),
(339, 5, 4, 4, 'Administrador de asistencia social', 8),
(340, 5, 4, 4, 'Administrador de finca', 7),
(341, 5, 4, 4, 'Agente de bienes raíces', 4),
(342, 5, 4, 4, 'Ajustador de seguros', 6),
(343, 5, 4, 4, 'Analista ambiental [servicios gubernamentales]', 7),
(344, 5, 4, 4, 'Árbitro', 4),
(345, 5, 4, 4, 'Asesor bibliotecario', 7),
(346, 5, 4, 4, 'Asistente administrativo', 7),
(347, 5, 4, 4, 'Ayudante de terapia física', 6),
(348, 5, 4, 4, 'Barbero', 4),
(349, 5, 4, 4, 'Comprador (de bolsa, de mercancías)', 7),
(350, 5, 4, 4, 'Conductor de ruta de ventas', 4),
(351, 5, 4, 4, 'Consejero de seguridad', 8),
(352, 5, 4, 4, 'Corredor (financiero)', 7),
(353, 5, 4, 4, 'Chef', 6),
(354, 5, 4, 4, 'Director de deportes', 7),
(355, 5, 4, 4, 'Director de investigación institucional en escuela', 8),
(356, 5, 4, 4, 'Director de jardín infantil', 8),
(357, 5, 4, 4, 'Director de museo', 8),
(358, 5, 4, 4, 'Director de zoológico', 7),
(359, 5, 4, 4, 'Evaluador de licencias para conducir', 6),
(360, 5, 4, 4, 'Gerente de aeropuerto', 8),
(361, 5, 4, 4, 'Gerente de agencia de viajes', 7),
(362, 5, 4, 4, 'Gerente de banco', 7),
(363, 5, 4, 4, 'Gerente de empleo', 7),
(364, 5, 4, 4, 'Gerente de escenario (radio, TV, teatro)', 7),
(365, 5, 4, 4, 'Gerente de estación (radio y televisión )', 7),
(366, 5, 4, 4, 'Gerente de hotel o motel', 7),
(367, 5, 4, 4, 'Gerente mercantil de comercio electrónico', 8),
(368, 5, 4, 4, 'Guardia de cruce peatonal escolar', 4),
(369, 5, 4, 4, 'Guía de turistas', 4),
(370, 5, 4, 4, 'Intérprete', 8),
(371, 5, 4, 4, 'Investigador privador', 7),
(372, 5, 4, 4, 'Jefe de departamento (colegio o universidad)', 8),
(373, 5, 4, 4, 'Jefe de redacción de un periódico', 7),
(374, 5, 4, 4, 'Juez', 8),
(375, 5, 4, 4, 'Locutor de noticias', 4),
(376, 5, 4, 4, 'Maestro de ciencias empresariales', 8),
(377, 5, 4, 4, 'Manicurista', 4),
(378, 5, 4, 4, 'Oficial de servicio diplomático', 7),
(379, 5, 4, 4, 'Planificador financiero', 2),
(380, 5, 4, 4, 'Político', 8),
(381, 5, 4, 4, 'Presidente (cualquier industria)', 8),
(382, 5, 4, 4, 'Productor ejecutivo, promociones', 4),
(383, 5, 4, 4, 'Sobrecargo (asistente de vuelo)', 4),
(384, 5, 4, 4, 'Supervisor de almacenaje (jefe de almacén)', 6),
(385, 5, 4, 4, 'Supervisor de operación de computadoras', 3),
(386, 5, 4, 4, 'Vendedor de aparatos electrodomésticos', 4),
(387, 5, 4, 4, 'Vendedor de automóviles', 4),
(388, 5, 4, 4, 'Vendedor de productos farmacéuticos', 6),
(389, 6, 3, 5, 'Pendiente', 1),
(390, 6, 5, 5, 'Agente de reservaciones [transporte aéreo]', 7),
(391, 6, 5, 5, 'Analista de presupuesto', 7),
(392, 6, 5, 5, 'Asistente de congresista', 8),
(393, 6, 5, 5, 'Encargado de barra de cafetería', 4),
(394, 6, 5, 5, 'Especialista en funciones de vuelo', 6),
(395, 6, 5, 5, 'Inspector de aduanas', 8),
(396, 6, 5, 5, 'Inspector de incendios', 7),
(397, 6, 5, 5, 'Operador de información telefónica', 3),
(398, 6, 5, 5, 'Pintor de dibujos animados', 4),
(399, 6, 5, 5, 'Preparador de impuestos', 8),
(400, 6, 5, 5, 'Registrador de Museo', 7),
(401, 6, 5, 5, 'Representante de servicios al cliente', 7),
(402, 6, 5, 5, 'Secretario medico', 4),
(403, 6, 5, 5, 'Secretario social', 5),
(404, 6, 5, 5, 'Supervisor de procesador de palabras', 3),
(405, 6, 2, 5, 'Asistente editorial', 7),
(406, 6, 2, 5, 'Contador de costos', 7),
(407, 6, 2, 5, 'Editor de sitios en la red', 4),
(408, 6, 2, 5, 'Especialista en seguridad de computadoras', 8),
(409, 6, 2, 5, 'Inspector de obras', 7),
(410, 6, 2, 5, 'Técnico en expedientes médicos', 4),
(411, 6, 1, 5, 'Analista de crédito', 8),
(412, 6, 1, 5, 'Camarista (hotel)', 2),
(413, 6, 1, 5, 'Cartero', 5),
(414, 6, 1, 5, 'Coordinador de mantenimiento preventivo', 7),
(415, 6, 1, 5, 'Empleado de oficina', 4),
(416, 6, 1, 5, 'Empleado de producciones de televisión', 6),
(417, 6, 1, 5, 'Empleado de la oficina de hipotecas', 8),
(418, 6, 1, 5, 'Ensamblador de instrumentos musicales', 4),
(419, 6, 1, 5, 'Ensamblador de juguetes', 4),
(420, 6, 1, 5, 'Ensamblador de muebles', 4),
(421, 6, 1, 5, 'Ensamblador de piezas electrónicas', 3),
(422, 6, 1, 5, 'Inspector de línea de ensamblaje', 4),
(423, 6, 1, 5, 'Operador de procesador de textos', 3),
(424, 6, 1, 5, 'Operador de radioaeronave', 6),
(425, 6, 1, 5, 'Programador de tripulación/grupo de trabajo', 7),
(426, 6, 1, 5, 'Recepcionista', 3),
(427, 6, 1, 5, 'Representante de seguridad de aerolínea', 7),
(428, 6, 4, 5, 'Agente de seguros', 8),
(429, 6, 4, 5, 'Analista de apoyo al usuario [analista de ventanilla de información]', 7),
(430, 6, 4, 5, 'Asistente de producción (explosivos)', 6),
(431, 6, 4, 5, 'Auxiliar bibliotecario', 7),
(432, 6, 4, 5, 'Cajero de banco', 6),
(433, 6, 4, 5, 'Capturista de datos', 4),
(434, 6, 4, 5, 'Contador', 7),
(435, 6, 4, 5, 'Contador de sistemas', 4),
(436, 6, 4, 5, 'Corrector de estilo en textos', 6),
(437, 6, 4, 5, 'Despachador por radio', 6),
(438, 6, 4, 5, 'Ebanista', 3),
(439, 6, 4, 5, 'Empleado de contabilidad', 4),
(440, 6, 4, 5, 'Lector de medidor de servicios públicos', 5),
(441, 6, 4, 5, 'Operador de teléfonos (telefonista)', 3),
(442, 6, 4, 5, 'Secretario', 5),
(443, 6, 4, 5, 'Secretario de juzgados', 7),
(444, 6, 4, 5, 'Taquillero', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t02_vh_categoria`
--

CREATE TABLE IF NOT EXISTS `t02_vh_categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `t02_vh_categoria`
--

INSERT INTO `t02_vh_categoria` (`id`, `categoria`) VALUES
(1, 'R'),
(2, 'I'),
(3, 'A'),
(4, 'S'),
(5, 'E'),
(6, 'C');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t02_vh_nivel_educativo`
--

CREATE TABLE IF NOT EXISTS `t02_vh_nivel_educativo` (
  `id` int(11) NOT NULL,
  `nivel` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `t02_vh_nivel_educativo`
--

INSERT INTO `t02_vh_nivel_educativo` (`id`, `nivel`) VALUES
(1, 'Ninguno'),
(2, 'Grado 10'),
(3, 'Bachilleres'),
(4, 'Técnicos'),
(5, 'Tecnologías'),
(6, 'Profesionales Universitarios'),
(7, 'Especialistas'),
(8, 'Niveles de posgrado (maestrías doctorados)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t02_vh_ocupacion`
--

CREATE TABLE IF NOT EXISTS `t02_vh_ocupacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ocupacion` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `t02_vh_ocupacion`
--

INSERT INTO `t02_vh_ocupacion` (`id`, `ocupacion`) VALUES
(1, 'REALISTAS'),
(2, 'ARTISTICAS'),
(3, 'SOCIALES'),
(4, 'EMPRENDEDORAS'),
(5, 'CONVENCIONALES');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `t02_vh_participante`
--
CREATE TABLE IF NOT EXISTS `t02_vh_participante` (
`jornada` varchar(100)
,`grado` int(11)
,`curso` int(11)
,`documento_identidad` varchar(50)
,`nombres_participante` varchar(300)
,`apellidos_participante` varchar(300)
,`fecha_nacimiento_participante` timestamp
,`fecha_ingreso_participante` timestamp
);
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t02_vh_pregunta`
--

CREATE TABLE IF NOT EXISTS `t02_vh_pregunta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_seccion` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `pregunta` varchar(600) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_seccion` (`id_seccion`),
  KEY `id_categoria` (`id_categoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=216 ;

--
-- Volcado de datos para la tabla `t02_vh_pregunta`
--

INSERT INTO `t02_vh_pregunta` (`id`, `id_seccion`, `id_categoria`, `pregunta`) VALUES
(1, 1, 1, 'Componer cosas eléctricas '),
(2, 1, 1, '"Reparar una bicicleta, auto o motocicleta."'),
(3, 1, 1, 'Componer cosas mecánicas'),
(4, 1, 1, 'Usar herramientas para trabajo con metales o maquinarias.'),
(5, 1, 1, 'Trabajar con un gran mecánico o técnico.'),
(6, 1, 1, 'Instalar o reparar un teléfono.'),
(7, 1, 1, 'Construir cosas con madera'),
(8, 1, 1, 'Tomar una clase de educación tecnológica (como artes industriales o taller automotriz).'),
(9, 1, 1, 'Trabajar en exteriores'),
(10, 1, 1, 'Trabajar con equipo electrónico.'),
(11, 1, 1, 'Ir de visita por una ferretería.'),
(12, 1, 2, 'Escribir un reporte científico. '),
(13, 1, 2, 'Aprender acerca de la física.'),
(14, 1, 2, 'Estudiar química.'),
(15, 1, 2, 'Tomar una clase de biología.'),
(16, 1, 2, 'Leer libros o revistas científicos.'),
(17, 1, 2, 'Trabajar en un proyecto de investigación.'),
(18, 1, 2, 'Estudiar una teoría científica.'),
(19, 1, 2, 'Analizar Información'),
(20, 1, 2, 'Estudiar astronomía '),
(21, 1, 2, 'Visitar un museo de ciencias.'),
(22, 1, 2, 'Estudiar el cerebro.'),
(23, 1, 3, '"Hacer bocetos, dibujar o pintar."'),
(24, 1, 3, 'Tomar fotografías'),
(25, 1, 3, 'Escribir para una revista o periódico.'),
(26, 1, 3, 'Pintar retratos.'),
(27, 1, 3, 'Leer o escribir poesía.'),
(28, 1, 3, 'Tomar una clase de arte.'),
(29, 1, 3, '"Estudiar con un artista plástico, músico o escritor talentoso."'),
(30, 1, 3, 'Tocar un instrumento musical.'),
(31, 1, 3, '"Pertenecer a una orquesta, banda o grupo musical."'),
(32, 1, 3, 'Escribir novelas u obras de teatro.'),
(33, 1, 3, '"Leer acerca de arte, literatura o música."'),
(34, 1, 4, 'Dar clases en una escuela.'),
(35, 1, 4, 'Ayudar a nuños discapacitados.'),
(36, 1, 4, 'Conocer a educadores o terapeutas importantes.'),
(37, 1, 4, 'Leer libros o artículos de psicología.'),
(38, 1, 4, 'Tomar una clase de relaciones humanas.'),
(39, 1, 4, 'Tomar una clase de superación personal.'),
(40, 1, 4, 'Resolver conflictos entre otras personas.'),
(41, 1, 4, 'Escribirles cartas a los amigos.'),
(42, 1, 4, 'Ayudar a la gente cuando esta enferma.'),
(43, 1, 4, 'Trabajar para una línea telefónica de urgencia para suicidas o jóvenes que huyen del hogar.'),
(44, 1, 4, 'Ayudar a otros a que resuelvan sus problemas.'),
(45, 1, 5, 'Ser jefe de un proyecto.'),
(46, 1, 5, 'Desempeñarse como funcionario de un grupo.'),
(47, 1, 5, 'Aprender a ser exitoso en los negocios.'),
(48, 1, 5, 'Tomar una clase breve sobre liderazgo.'),
(49, 1, 5, 'Supervisar el trabajo de otros.'),
(50, 1, 5, 'Conducir a un grupo a obtener su meta.'),
(51, 1, 5, 'Conocer a ejecutivos y líderes importantes.'),
(52, 1, 5, 'Participar en una campaña política.'),
(53, 1, 5, 'Dirigir el trabajo de otros.'),
(54, 1, 5, 'Operar mi propio negocio.'),
(55, 1, 5, 'Vender espacios publicitarios en el revista escolar.'),
(56, 1, 6, '"Sumar, restar, multiplicar y dividir números en un negocio o en contaduría."'),
(57, 1, 6, 'Llevar un registro de gastos.'),
(58, 1, 6, 'Tomar una clase de cálculo mercantil.'),
(59, 1, 6, 'Examinar documentos o productos para encontrar errores o fallas.'),
(60, 1, 6, 'Revisar registros financieros para encontrar errores.'),
(61, 1, 6, 'Cuadrar las cuentas en una chequera.'),
(62, 1, 6, 'Llevar registros.'),
(63, 1, 6, 'Operar maquinaria de oficina (como fax o copiadora).'),
(64, 1, 6, 'Tomar una clase de contabilidad.'),
(65, 1, 6, 'Hacer un inventario de suministros o productos.'),
(66, 1, 6, 'Establecer un sistema de registro.'),
(67, 2, 1, 'Cambiar una llanta.'),
(68, 2, 1, 'Operar herramientas eléctricas como un taladro o una máquina de coser.'),
(69, 2, 1, 'Interpretar un plano.'),
(70, 2, 1, 'Hacer reparaciones eléctricas sencillas.'),
(71, 2, 1, 'Reparar muebles.'),
(72, 2, 1, 'Usar la mayoría de las herramientas de un carpintero.'),
(73, 2, 1, 'Usar equipo de soldadura.'),
(74, 2, 1, 'Cazar o pescar.'),
(75, 2, 1, 'Hacer dibujos mecánicos.'),
(76, 2, 1, 'Construir cosas sencillas de madera.'),
(77, 2, 1, 'Componer un grifo que tiene una fuga.'),
(78, 2, 2, 'Entender la vida media de un elemento radioactivo.'),
(79, 2, 2, 'Describir la función de los glóbulos blancos.'),
(80, 2, 2, 'Escribir un reporte científico o de gran erudición.'),
(81, 2, 2, 'Interpretar formulas químicas sencillas.'),
(82, 2, 2, 'Usar una computadora para analizar datos.'),
(83, 2, 2, 'Entender por qué no caen a la tierra satélites artificiales.'),
(84, 2, 2, 'Llevar a cabo un experimento científico.'),
(85, 2, 2, 'Explicar cómo funciona una computadora.'),
(86, 2, 2, 'Usar un microscopio.'),
(87, 2, 2, 'Entender la tabla periódica de los elementos.'),
(88, 2, 2, 'Explicar por qué algunos jabones flotan y otros se hunden.'),
(89, 2, 3, 'Tocar un instrumento musical.'),
(90, 2, 3, 'Participar en un canto coral de dos o cuatro voces.'),
(91, 2, 3, '"Hacer una pintura, una acuarela o una escultura"'),
(92, 2, 3, 'Hacer arreglos o composiciones musicales.'),
(93, 2, 3, '"Diseñar ropa, carteles o muebles."'),
(94, 2, 3, 'Crear la representación artística de un concepto o idea.'),
(95, 2, 3, 'Escribir bien cuentos o poemas'),
(96, 2, 3, 'Presentarme como solista musical'),
(97, 2, 3, 'Dar una plática entretenida.'),
(98, 2, 3, '"Publicar un cuento, poema o ensayo en el periódico escolar o en alguno otra publicación."'),
(99, 2, 3, '"Estar en una banda de música, orquesta o coro."'),
(100, 2, 4, 'Ayudar a personas que estén alteradas o afligidas.'),
(101, 2, 4, 'Enseñar con facilidad a los niños.'),
(102, 2, 4, 'Cooperar y trabajar bien con los demás.'),
(103, 2, 4, 'Reconocer las fortalezas y debilidades de las personas.'),
(104, 2, 4, 'Calmar a la gente cuando esté alterada.'),
(105, 2, 4, 'Trabajar con otros en un proyecto de equipo.'),
(106, 2, 4, 'Hacer sentir cómoda a la gente.'),
(107, 2, 4, 'Dar clases a otros.'),
(108, 2, 4, 'Tener una buena compresión de las relaciones sociales.'),
(109, 2, 4, 'Escuchar a la gente.'),
(110, 2, 4, 'Hacer que la gente me busque para contarme sus problemas.'),
(111, 2, 5, 'Ser un buen vendedor.'),
(112, 2, 5, 'Planear una estrategia para lograr una meta.'),
(113, 2, 5, 'Ser un líder exitoso.'),
(114, 2, 5, 'Ser un buen orador.'),
(115, 2, 5, 'Administrar una campaña de ventas.'),
(116, 2, 5, 'Organizar el trabajo de otros.'),
(117, 2, 5, 'Ser bueno en los debates.'),
(118, 2, 5, 'Supervisar el trabajo de otros.'),
(119, 2, 5, 'Empezar mi propio negocio.'),
(120, 2, 5, 'Ser el vocero de un salón de clases o grupo.'),
(121, 2, 5, 'Ser una persona ambiciosa. '),
(122, 2, 6, 'Usar una copiadora'),
(123, 2, 6, 'Archivar correspondencia y otros documentos.'),
(124, 2, 6, 'Hacer mucho papeleo en un tiempo corto.'),
(125, 2, 6, 'Llevar registros precisos de pagos o ventas.'),
(126, 2, 6, 'Transcribir de un dictáfono.'),
(127, 2, 6, 'Obtener información por teléfono. '),
(128, 2, 6, 'Utilizar un procesador de textos.'),
(129, 2, 6, 'Tener un empleo de oficina.'),
(130, 2, 6, 'Usar una computadora para analizar datos empresariales.'),
(131, 2, 6, 'Dar el cambio correcto de manera rápida.'),
(132, 2, 6, 'Encontrar errores en el trabajo e los demás.'),
(133, 3, 1, 'Mecánico automotriz-arregla automóviles'),
(134, 3, 1, 'Carpintero-construye cosas con madera '),
(135, 3, 1, 'Inspector de construcciones-inspecciona edificios nuevos para ver si están bien construidos'),
(136, 3, 1, 'Radiooperador –manda y recibe mensajes de radio'),
(137, 3, 1, 'Agricultor-levanta cosechas'),
(138, 3, 1, 'Mecánico aeronáutico-arregla aviones'),
(139, 3, 1, 'Bombero –extingue y ayuda a prevenir incendios'),
(140, 3, 1, 'Conductor de camiones en distancias largas- maneja una ruta de autobuses o tráileres'),
(141, 3, 1, '"Mecánico –construye, repara o trabaja con maquinaria"'),
(142, 3, 1, 'Electricista- arregla el cableado eléctrico en edificios o máquinas'),
(143, 3, 1, '"Técnico en electrónica-construye, prueba y arregla equipo electrónico"'),
(144, 3, 1, 'Carpintero-construye muebles para casas o edificio'),
(145, 3, 2, 'Biólogo- Estudia plantas y animales'),
(146, 3, 2, 'Técnico Laboratorista médico-.trabaja con equipo médico'),
(147, 3, 2, 'Antropólogo-estudia culturas diversas'),
(148, 3, 2, 'Químico- Estudia y hace sustancias químicas'),
(149, 3, 2, 'Investigador científico-ayuda a encontrar las respuestas a preguntas científicas '),
(150, 3, 2, 'Cirujano- realiza operaciones médicas'),
(151, 3, 2, 'Investigador en ciencias sociales-estudia problemas sociales'),
(152, 3, 2, '"Físico-estudia las leyes de la naturaleza, como la ley de gravedad"'),
(153, 3, 2, 'Meteorólogo-estudia el clima'),
(154, 3, 2, 'Astrónomo-estudia el sistema solar'),
(155, 3, 2, 'Zoólogo-estudia la historia de los animales'),
(156, 3, 2, 'Geólogo- estudia la historia del planeta Tierra'),
(157, 3, 3, 'Poeta-escribe poemas'),
(158, 3, 3, '"Artista plástico-crea pinturas, dibujos y otros tipos de arte"'),
(159, 3, 3, 'Dramaturgo-escribe obras de teatro'),
(160, 3, 3, 'Músico- toca un instrumento musical'),
(161, 3, 3, '"Actor-trabaja en un obra de teatro, espectáculo o película"'),
(162, 3, 3, 'Cantante-canta frente a un público'),
(163, 3, 3, 'Compositor-escribe canciones o música'),
(164, 3, 3, 'Escultor-crea esculturas o estatuas'),
(165, 3, 3, '"Artista de espectáculos-canta, baila, cuenta chistes"'),
(166, 3, 3, '"Escritor-escribe libros, artículos o cuentos"'),
(167, 3, 3, 'Maestro de teatro-enseña técnicas de actuación a actores'),
(168, 3, 3, 'Fotógrafo-toma fotografías'),
(169, 3, 4, 'Consejero matrimonial-ayuda a las parejas con sus problemas'),
(170, 3, 4, 'Director de una agencia de beneficencia-supervisa a trabajadores que ayudan a gente necesitada '),
(171, 3, 4, 'Director de campamento juvenil-supervisa los programas y trabajadores de un campamento'),
(172, 3, 4, 'Orientador en abuso de sustancias-ayuda a las personas que tienen un problema con droga o alcohol'),
(173, 3, 4, 'Director de actividades de recreo-organiza actividades '),
(174, 3, 4, '"Psicólogo clínico-ayuda a gente con problemas con sus sentimientos, pensamientos o conductas"'),
(175, 3, 4, '"Trabajador social-ayuda a gente con problemas en su familia, trabajo o amigos"'),
(176, 3, 4, 'Auxiliar de enfermería- ayuda en el cuidado de pacientes'),
(177, 3, 4, 'Maestro- da clases en una escuela'),
(178, 3, 4, 'Asistente social de libertad condicional- ayuda a las personas que han tenido problemas con la ley'),
(179, 3, 4, 'Orientador escolar- ayuda a alumnos con problemas'),
(180, 3, 4, 'Asistente médico- examina pacientes en un consultorio médico'),
(181, 3, 5, 'Inversionista-invierte dinero en tratos de negocios'),
(182, 3, 5, 'Vendedor-vende bienes o servicios'),
(183, 3, 5, 'Gerente de ventas- supervisa un equipo de vendedores'),
(184, 3, 5, 'Director de mercadotecnia-planea programas de comercialización'),
(185, 3, 5, 'Representante de ventas- vende productos a otras empresas'),
(186, 3, 5, 'Comprador- decide qué productos va a vender a un almacén'),
(187, 3, 5, 'Agente de bienes raíces-vende casas y terrenos'),
(188, 3, 5, 'Gerente de estación televisiva-dirige una estación de televisión'),
(189, 3, 5, 'Corredor de bolsa-compra y vende acciones y bonos'),
(190, 3, 5, 'Ejecutivo empresarial- supervisa a mucha gente en una empresa'),
(191, 3, 5, 'Funcionario gubernamental- detenta un cargo público'),
(192, 3, 5, 'Gerente- supervisa un grupo de trabajadores'),
(193, 3, 6, 'Técnico en contabilidad- lleva cuenta del dinero en un negocio'),
(194, 3, 6, 'Revisor presupuestal- ayuda a una empresa a decidir cómo gastar y ahorrar dinero  Contador público- lleva cuenta de transacciones financieras'),
(195, 3, 6, 'Jefe de Almacén- lleva inventario de suministros o mercancías'),
(196, 3, 6, 'Capturista- ingresa información en un computador'),
(197, 3, 6, 'Administrador de nóminas- se asegura que los trabajadores reciban sus sueldos por la cantidad correcta'),
(198, 3, 6, 'Examinador bancario- revisa registros bancarios para detectar errores'),
(199, 3, 6, 'Secretario- ayuda a su jefe con el  trabajo de oficina'),
(200, 3, 6, 'Asesor fiscal- calcula la cantidad de impuestos que se deben'),
(201, 3, 6, 'Analista financiero- ayuda a una empresa a invertir dinero'),
(202, 3, 6, 'Corrector de estilo- revisa material escrito para detectar errores'),
(203, 3, 6, 'Cajero bancario- ayuda a los clientes del banco'),
(204, 4, 1, 'Capacidad mecánica (Componer cosas, utilizar herramientas y máquinas)'),
(205, 4, 2, 'Capacidad Científica (biología, ciencia, experimentos)'),
(206, 4, 3, 'Capacidad Artística (música,arte,escritura, teatro)'),
(207, 4, 4, 'Capacidad  Para enseñanza (ayudar a otros a que aprendan)'),
(208, 4, 5, 'Capacidad En ventas (vender o supervisar a otros vendedores)'),
(209, 4, 6, 'Capacidad en trabajo de oficina (archivar papeles, ortografía, sumar números)'),
(210, 4, 1, 'Habilidades Manuales (Construir cosas, trabajar con las manos)'),
(211, 4, 2, 'Habilidades en matemáticas (trabajar con números y fórmulas)'),
(212, 4, 3, 'Habilidades musicales (cantar o tocar un instrumento)'),
(213, 4, 4, 'Comprensión de otros (trabajar con personas y ayudarlas)'),
(214, 4, 5, 'Habilidades gerenciales (supervisar a otros o manejar un negocio)'),
(215, 4, 6, 'Habilidades de oficina (mecanografía, utilizar máquinas de oficina)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t02_vh_respuesta`
--

CREATE TABLE IF NOT EXISTS `t02_vh_respuesta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_participante` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL,
  `valor` int(11) NOT NULL,
  `fecha_respuesta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_participante` (`id_participante`),
  KEY `id_pregunta` (`id_pregunta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `t02_vh_resultado`
--
CREATE TABLE IF NOT EXISTS `t02_vh_resultado` (
`id` varchar(23)
,`id_participante` int(11)
,`id_categoria` int(11)
,`resultado` decimal(32,0)
,`categoria` varchar(10)
);
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t02_vh_seccion`
--

CREATE TABLE IF NOT EXISTS `t02_vh_seccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seccion` varchar(200) NOT NULL,
  `texto` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `t02_vh_seccion`
--

INSERT INTO `t02_vh_seccion` (`id`, `seccion`, `texto`) VALUES
(1, 'ACTIVIDADES', 'Enseguida encontrará una lista de actividades.  Responda (Si) si las actividades te gustan o crees que te gustaría hacerlas.  Elige  (No) si las actividades no te gustan o no te gustaría hacerlas.'),
(2, 'HABILIDADES', 'A continuación se encuentra una lista de capacidades o habilidades.  Elige (Si) si son cosas que haces bien o que quisieras aprender a hacer bien.  Elige (No) si son habilidades que no tienes o que no quieres aprender.\r\n<br>\r\n<b>Sé cómo o quiero aprender a...</b>'),
(3, 'CARRERAS Y OCUPACIONES', 'A continuación se encuentra una lista de carreras y ocupaciones y empleos. Elige (Sí) si crees que te gustarían. Elige (No) si piensas que estas carreras, ocupaciones o empleos no te gustarían'),
(4, 'CALIFICA TUS CAPACIDADES', 'Califícate en cada una de las siguientes capacidades en cuanto a cómo crees que realmente eres en comparación con otras personas de tu misma edad. Elige el número adecuado y asegúrate de que no te califiques de manera igual en cada categoría.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `test`
--

CREATE TABLE IF NOT EXISTS `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(300) NOT NULL,
  `url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `test`
--

INSERT INTO `test` (`id`, `nombre`, `url`) VALUES
(1, 'Inteligencias Múltiples', 't01_im.jsp'),
(2, 'Preferencias Vocacionales De Holland', 't02_ch.jsp');

-- --------------------------------------------------------

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `t01_im_respuesta`
--
ALTER TABLE `t01_im_respuesta`
  ADD CONSTRAINT `t01_im_respuesta_ibfk_2` FOREIGN KEY (`id_pregunta`) REFERENCES `t01_im_pregunta` (`id`);

--
-- Filtros para la tabla `t02_vh_carrera`
--
ALTER TABLE `t02_vh_carrera`
  ADD CONSTRAINT `t02_vh_carrera_ibfk_1` FOREIGN KEY (`id_categoria_1`) REFERENCES `t02_vh_categoria` (`id`),
  ADD CONSTRAINT `t02_vh_carrera_ibfk_2` FOREIGN KEY (`id_categoria_2`) REFERENCES `t02_vh_categoria` (`id`),
  ADD CONSTRAINT `t02_vh_carrera_ibfk_3` FOREIGN KEY (`id_ocupacion`) REFERENCES `t02_vh_ocupacion` (`id`),
  ADD CONSTRAINT `t02_vh_carrera_ibfk_4` FOREIGN KEY (`id_nivel_educativo`) REFERENCES `t02_vh_nivel_educativo` (`id`);

--
-- Filtros para la tabla `t02_vh_pregunta`
--
ALTER TABLE `t02_vh_pregunta`
  ADD CONSTRAINT `t02_vh_pregunta_ibfk_1` FOREIGN KEY (`id_seccion`) REFERENCES `t02_vh_seccion` (`id`),
  ADD CONSTRAINT `t02_vh_pregunta_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `t02_vh_categoria` (`id`);

--
-- Filtros para la tabla `t02_vh_respuesta`
--
ALTER TABLE `t02_vh_respuesta`
  ADD CONSTRAINT `t02_vh_respuesta_ibfk_2` FOREIGN KEY (`id_pregunta`) REFERENCES `t02_vh_pregunta` (`id`);

