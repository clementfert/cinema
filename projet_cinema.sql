
CREATE DATABASE cinema_studi;

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `select_tarif` int(11) NOT NULL,
  `select_screening` int(11) NOT NULL,
  `id_person` int(11) NOT NULL
) ;


CREATE TABLE `cinema_place` (
  `id` int(11) NOT NULL,
  `City` varchar(255) NOT NULL
) ;


INSERT INTO `cinema_place` (`id`, `City`) VALUES
(1, 'LILLE'),
(2, 'LYON'),
(3, 'MARSEILLE'),
(4, 'PARIS');


CREATE TABLE `movie` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `duration` time NOT NULL,
  `genre` varchar(15) NOT NULL,
  `not_recommended` varchar(11) NOT NULL
) ;



INSERT INTO `movie` (`id`, `name`, `duration`, `genre`, `not_recommended`) VALUES
(1, 'The Batman', '02:56:00', 'Action', 'all public'),
(2, 'Belfast', '01:38:00', 'drame', 'all public'),
(3, 'Uncharted', '01:56:00', 'Adventure', 'all public'),
(4, 'Sing 2', '01:42:40', 'animation', 'all public'),
(5, 'SPIDER-MAN: NO WAY HOME', '02:28:00', 'Action', 'all public'),
(6, 'EN ATTENDANT BOJANGLES', '02:05:00', 'Drame', 'all public'),
(7, 'Goliath', '02:02:00', 'Thriller', 'all public');


CREATE TABLE `person` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `id_roles` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `person`
--

INSERT INTO `person` (`id`, `firstname`, `surname`, `id_roles`) VALUES
(1, 'clement', 'fert', 1),
(2, 'eduardo', 'elgrande', 2),
(3, 'laura', 'rodriguez', 3);



CREATE TABLE `role_access` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `id_role` int(11) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Structure de la table `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `capacity` int(11) NOT NULL,
  `place` int(11) NOT NULL,
  `3D` BOOLEAN
) ;


INSERT INTO `room` (`id`, `capacity`, `place`, `3D`) VALUES
(1, 300, 1, false),
(2, 500, 2, false),
(3, 400, 4, false),
(4, 450, 2, false),
(5, 600, 3, false),
(6, 800, 4, true);

-- --------------------------------------------------------

--
-- Structure de la table `rôles`
--

CREATE TABLE `rôles` (
  `id` int(11) NOT NULL,
  `rôles` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `rôles`
--

INSERT INTO `rôles` (`id`, `rôles`) VALUES
(1, 'manager'),
(2, 'Administrateur'),
(3, 'User');


CREATE TABLE `screening` (
  `id` int(11) NOT NULL,
  `DATE-screening` datetime NOT NULL,
  `id_movie` int(11) NOT NULL,
  `room_in _the_cinema` int(11) NOT NULL
) ;


CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `tarif` float NOT NULL
) ;


INSERT INTO `ticket` (`id`, `name`, `tarif`) VALUES
(1, 'Normal', 9.2),
(2, 'etudiant', 7.6),
(3, 'enfant', 5.2);


--
-- Index pour les tables déchargées
--

--
-- Index pour la table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_tarif` (`select_tarif`),
  ADD KEY `select_screening` (`select_screening`),
  ADD KEY `fk_id_book_id_personne` (`id_person`);

--
-- Index pour la table `cinema_place`
--
ALTER TABLE `cinema_place`
  ADD PRIMARY KEY (`id`),
  ADD KEY `City` (`City`);

--
-- Index pour la table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_roles` (`id_roles`);

--
-- Index pour la table `role_access`
--
ALTER TABLE `role_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_role` (`id_role`);

--
-- Index pour la table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_room_cinema` (`place`);

--
-- Index pour la table `rôles`
--
ALTER TABLE `rôles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `screening`
--
ALTER TABLE `screening`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_movie` (`id_movie`),
  ADD KEY `screening_ibfk_3` (`room_in _the_cinema`);

--
-- Index pour la table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cinema_place`
--
ALTER TABLE `cinema_place`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `movie`
--
ALTER TABLE `movie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `person`
--
ALTER TABLE `person`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `role_access`
--
ALTER TABLE `role_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `rôles`
--
ALTER TABLE `rôles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `screening`
--
ALTER TABLE `screening`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_tarif` FOREIGN KEY (`select_tarif`) REFERENCES `ticket` (`id`),
  ADD CONSTRAINT `fk_id_book_id_personne` FOREIGN KEY (`id_person`) REFERENCES `person` (`id`),
  ADD CONSTRAINT `select_screening` FOREIGN KEY (`select_screening`) REFERENCES `screening` (`id`);

--
-- Contraintes pour la table `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `fk_roles_person` FOREIGN KEY (`id_roles`) REFERENCES `rôles` (`id`);

--
-- Contraintes pour la table `role_access`
--
ALTER TABLE `role_access`
  ADD CONSTRAINT `fk_idRoles_roles` FOREIGN KEY (`id_role`) REFERENCES `rôles` (`id`);

--
-- Contraintes pour la table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `fk_room_cinema` FOREIGN KEY (`place`) REFERENCES `cinema_place` (`id`);

--
-- Contraintes pour la table `screening`
--
ALTER TABLE `screening`
  ADD CONSTRAINT `screening_ibfk_1` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id`),
  ADD CONSTRAINT `screening_ibfk_3` FOREIGN KEY (`room_in _the_cinema`) REFERENCES `room` (`id`);
COMMIT;

