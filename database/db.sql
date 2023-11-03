-- Base de datos: `procastgent_note`
CREATE DATABASE 'procastgent_note';
USE 'procastgent_note';
-- Estructura de tabla para la tabla `client`

CREATE TABLE `client` (
  `IDclient` bigint(20) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Cellphone` bigint(20) DEFAULT NULL,
  `Birthdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customize`
--

CREATE TABLE `customize` (
  `IDcustom` int(11) NOT NULL,
  `IDuser` varchar(50) NOT NULL,
  `DocsFileCustomize` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `note`
--

CREATE TABLE `note` (
  `IDnote` bigint(20) NOT NULL,
  `IDuser` bigint(20) NOT NULL,
  `PathNote` varchar(30) NOT NULL,
  `PathCreate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `taskmanager`
--

CREATE TABLE `taskmanager` (
  `IDtask` bigint(20) NOT NULL,
  `IDuser` bigint(11) NOT NULL,
  `IDtasktype` int(11) NOT NULL,
  `TaskDescription` text NOT NULL,
  `TaskDateCreate` date NOT NULL,
  `TaskDateRequired` date NOT NULL,
  `TaskDateComplete` date DEFAULT NULL,
  `TaskState` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tasktype`
--

CREATE TABLE `tasktype` (
  `IDtaskType` int(11) NOT NULL,
  `NameTaskType` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tasktype`
--

INSERT INTO `tasktype` (`IDtaskType`, `NameTaskType`) VALUES
(1, 'TAREA'),
(2, 'PENDIENTE'),
(3, 'URGENTE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `IDuser` bigint(20) NOT NULL,
  `IDclient` bigint(20) NOT NULL,
  `Nameuser` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `E-mail` varchar(50) NOT NULL,
  `PassModifier` date NOT NULL,
  `Delete` bit(1) DEFAULT NULL,
  `DeleteDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`IDclient`);

--
-- Indices de la tabla `customize`
--
ALTER TABLE `customize`
  ADD PRIMARY KEY (`IDcustom`);

--
-- Indices de la tabla `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`IDnote`);

--
-- Indices de la tabla `taskmanager`
--
ALTER TABLE `taskmanager`
  ADD PRIMARY KEY (`IDtask`);

--
-- Indices de la tabla `tasktype`
--
ALTER TABLE `tasktype`
  ADD PRIMARY KEY (`IDtaskType`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`IDuser`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `client`
--
ALTER TABLE `client`
  MODIFY `IDclient` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `customize`
--
ALTER TABLE `customize`
  MODIFY `IDcustom` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `note`
--
ALTER TABLE `note`
  MODIFY `IDnote` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `taskmanager`
--
ALTER TABLE `taskmanager`
  MODIFY `IDtask` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tasktype`
--
ALTER TABLE `tasktype`
  MODIFY `IDtaskType` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;