
-- --------------------------------------------------------

--
-- Estructura para la vista `t02_vh_calificacion`
--
DROP TABLE IF EXISTS `t02_vh_calificacion`;

CREATE ALGORITHM=UNDEFINED DEFINER=`c4n`@`localhost` SQL SECURITY DEFINER VIEW `t02_vh_calificacion` AS select concat(`t02_vh_respuesta`.`id_participante`,'_',`t02_vh_pregunta`.`id_seccion`,'_',`t02_vh_pregunta`.`id_categoria`) AS `id`,`t02_vh_respuesta`.`id_participante` AS `id_participante`,`t02_vh_seccion`.`seccion` AS `seccion`,`t02_vh_categoria`.`categoria` AS `categoria`,sum(`t02_vh_respuesta`.`valor`) AS `resultado`,`t02_vh_pregunta`.`id_seccion` AS `id_seccion`,`t02_vh_pregunta`.`id_categoria` AS `id_categoria` from (((`t02_vh_pregunta` join `t02_vh_respuesta` on((`t02_vh_pregunta`.`id` = `t02_vh_respuesta`.`id_pregunta`))) join `t02_vh_categoria` on((`t02_vh_pregunta`.`id_categoria` = `t02_vh_categoria`.`id`))) join `t02_vh_seccion` on((`t02_vh_pregunta`.`id_seccion` = `t02_vh_seccion`.`id`))) group by `t02_vh_respuesta`.`id_participante`,`t02_vh_seccion`.`seccion`,`t02_vh_categoria`.`categoria`,`t02_vh_pregunta`.`id_seccion`,`t02_vh_pregunta`.`id_categoria` order by `t02_vh_respuesta`.`id_participante`,`t02_vh_pregunta`.`id_seccion`,`t02_vh_pregunta`.`id_categoria`;


-- --------------------------------------------------------

--
-- Estructura para la vista `t02_vh_participante`
--
DROP TABLE IF EXISTS `t02_vh_participante`;

CREATE ALGORITHM=UNDEFINED DEFINER=`c4n`@`localhost` SQL SECURITY DEFINER VIEW `t02_vh_participante` AS select distinct `participante`.`jornada` AS `jornada`,`participante`.`grado` AS `grado`,`participante`.`curso` AS `curso`,`participante`.`documento_identidad` AS `documento_identidad`,`participante`.`nombres_participante` AS `nombres_participante`,`participante`.`apellidos_participante` AS `apellidos_participante`,`participante`.`fecha_nacimiento_participante` AS `fecha_nacimiento_participante`,`participante`.`fecha_ingreso_participante` AS `fecha_ingreso_participante` from (`participante` join `t02_vh_respuesta` on((`participante`.`id_participante` = `t02_vh_respuesta`.`id_participante`)));

--
-- Estructura para la vista `t02_vh_resultado`
--
DROP TABLE IF EXISTS `t02_vh_resultado`;

CREATE ALGORITHM=UNDEFINED DEFINER=`c4n`@`localhost` SQL SECURITY DEFINER VIEW `t02_vh_resultado` AS select concat(`t02_vh_respuesta`.`id_participante`,'_',`t02_vh_pregunta`.`id_categoria`) AS `id`,`t02_vh_respuesta`.`id_participante` AS `id_participante`,`t02_vh_pregunta`.`id_categoria` AS `id_categoria`,sum(`t02_vh_respuesta`.`valor`) AS `resultado`,`t02_vh_categoria`.`categoria` AS `categoria` from ((`t02_vh_pregunta` join `t02_vh_respuesta` on((`t02_vh_pregunta`.`id` = `t02_vh_respuesta`.`id_pregunta`))) join `t02_vh_categoria` on((`t02_vh_pregunta`.`id_categoria` = `t02_vh_categoria`.`id`))) group by concat(`t02_vh_respuesta`.`id_participante`,'_',`t02_vh_pregunta`.`id_categoria`),`t02_vh_respuesta`.`id_participante`,`t02_vh_pregunta`.`id_categoria`,`t02_vh_categoria`.`categoria` order by `t02_vh_respuesta`.`id_participante`,sum(`t02_vh_respuesta`.`valor`) desc,`t02_vh_pregunta`.`id_categoria`;

