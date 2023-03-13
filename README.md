# OpenClassrooms
- Développeur d'application
- Parcours PHP/Symfony
- Projet 8

## Améliorez une application existante de ToDo & Co

![OpenClassrooms banneer](./ressources/images/todo-and-co.jpg)

[![Symfony Badge](https://img.shields.io/badge/Symfony-5.4-000000?style=flat-square&logo=symfony&logoColor=white/)](https://symfony.com/)
[![Composer Badge](https://img.shields.io/badge/Composer-2.4-6c3e22?style=flat-square&logo=composer&logoColor=white/)](https://getcomposer.org/)
[![PHP Badge](https://img.shields.io/badge/PHP-8.1-7a86b8?style=flat-square&logo=php&logoColor=white/)](https://www.php.net/)
[![Twig Badge](https://img.shields.io/badge/Twig-2.0-bacf29?style=flat-square&logo=symfony&logoColor=white/)](https://twig.symfony.com/)
[![CSS Badge](https://img.shields.io/badge/CSS-3-1572B6?style=flat-square&logo=css3&logoColor=white/)](https://developer.mozilla.org/fr/docs/Web/CSS)
[![Draw.io Badge](https://img.shields.io/badge/Diagrams.net-20.7-F08705?style=flat-square&logo=diagrams.net&logoColor=white/)](https://www.diagrams.net/)

### À propos

Bonjour et bienvenue sur le dépôt de mon travail, qui traite du huitième projet d'OpenClassrooms, intitulé **Améliorez une application existante de ToDo & Co** ! Vous trouverez, ci-après, la procédure d'installation pour prendre en main le code du projet, ainsi que la structure de la base de données.

Vous trouverez, dans le dossier `ressources`, les **diagrammes UML**, la **base de données** au format SQL, le **rapport d'audit**, ainsi que la **documentation d'implémentation de l'authentification**.

Dans le dossier `public/test-coverage` se trouvent les fichiers de **rapport de tests**, réalisés avec **PHPUnit**. Une version en ligne de ces rapports est disponible, vous les trouverez en cliquant sur le bouton "**Couverture de test**", ci-après.

[![Preview site](https://img.shields.io/badge/Site%20web--fe746e?style=for-the-badge&logo=InternetExplorer&logoColor=white)](http://todoandco.florianjourde.com/)
[![Couverture de test](https://img.shields.io/badge/Couverture%20de%20test--7a86b8?style=for-the-badge&logo=PHP&logoColor=white)](https://testcoverage-todoandco.florianjourde.com/test-coverage/)
[![Dépôt](https://img.shields.io/badge/Dépôt%20initial--000000?style=for-the-badge&logo=Github&logoColor=white)](https://github.com/saro0h/projet8-TodoList)
[![Audit](https://img.shields.io/badge/Audit--f0f4fd?style=for-the-badge&logo=Adobe-Acrobat-Reader&logoColor=white)](https://testcoverage-todoandco.florianjourde.com/ToDo%20&%20Co%20-%20Audit.pdf)
[![Authentification](https://img.shields.io/badge/Authentification--fff5ca?style=for-the-badge&logo=Adobe-Acrobat-Reader&logoColor=white)](https://testcoverage-todoandco.florianjourde.com/ToDo%20&%20Co%20-%20Audit.pdf)


---

## Remarque

Pour pouvoir installer ce projet, le gestionnaire de dépendance **Composer** doit être présent sur votre machine, un serveur local sous **PHP 8.1**, ainsi que le framework **Symfony** en version **5.4**. Si vous ne disposez pas de ces outils, vous pourrez les télécharger et les installer, en suivant ces liens :
- Télécharger [Composer](https://getcomposer.org/)
- Télécharger [Symfony](https://symfony.com/download)
- Télécharger [Wamp](https://www.wampserver.com/) (Windows)
- Télécharger [Mamp](https://www.wampserver.com/) (Mamp)

---

## Installation

1. À l'aide d'un terminal, créez un dossier à l'emplacement souhaité pour l'installation du projet. Lancez ensuite la commande suivante :

```shell
git clone https://github.com/FlorianJourde/OpenClassrooms-8-Enhance-an-existing-ToDo-and-Co-app.git
```


2. Lancez cette commande pour vous rendre dans le dossier adequat :

```shell
cd OpenClassrooms-8-Enhance-an-existing-ToDo-and-Co-app
```


3. À la racine de ce répertoire, lancez la commande suivante pour installer les dépendances Composer :

```shell
composer install
```


4. Une fois l'installation des dépendances terminée, vous devez maintenant dupliquer le fichier `.env` situé à la racine du projet, puis renommer le nouveau fichier en `.env.local`, pour vous connecter à votre base de données. À la ligne 27, remplacez les identifiants de connexion par vos identifiants de base de données locale :

```php
DATABASE_URL="mysql://username:password@127.0.0.1:3306/todoandco_db?serverVersion=5.7.36&charset=utf8mb4"
```


5. Après avoir modifié le fichier `.env.local` avec vos informations de connexion, lancez cette commande pour créer la base de données :

```shell
php bin/console doctrine:database:create
```


6. Exportez désormais la structure de votre base de données, grace aux commandes suivantes :

```shell
php bin/console make:migration
```

puis

```shell
php bin/console doctrine:migrations:migrate
```


7. Si tout s'est correctement déroulé, une nouvelle base de données `todoandco_db` est apparu parmi les tables de votre serveur local. Lancez ensuite la commande suivante pour générer un jeu de données, s'appuyant sur les fixtures :

```shell
php bin/console doctrine:fixtures:load
```


8. À ce stade, un jeu de données devrait avoir été créé. Si vous n'avez pas réussi à créer et importer un jeu de données, vous pouvez importer le fichier `todoandco_db.sql`, présent dans le dossier `ressources`, dans votre base de données SQL locale.


9. Via le terminal, lancez la commande suivante pour démarrer l'application Symfony :

```zsh
symfony server:start
```

Si vous rencontrez un problème à cette étape, veuillez vous assurer que WAMP ou MAMP est présent et lancé sur votre machine et que le démarrage du serveur local de Symfony a bien été effectué depuis le dossier racine du projet.


10. Pour pouvoir tester les fonctionnalités du site, veuillez utiliser les identifiants par défaut :
- Admin
	- ID : admin@todoandco.com
	- MDP : 123456
- User
	- ID : user1@todoandco.com
	- MDP : 123456


---

## Contribution

1. Pour contribuer au projet, il vous suffit de cliquer sur le bouton "**fork**", en haut de cette page.


2. Un titre et une description vous seront demandées. Ces informations apparaîtront telles que vous les avez remplies sur votre compte GitHub. Vous pouvez les modifier par la suite.


3. Cliquez ensuite sur le bouton "**Create fork**" pour importer le dépôt parmi vos projets sur GitHub.


4. Une fois le projet ToDo & Co importé sur votre GitHub, vous êtes libre d'y apporter des modifications. Pour ce faire, clônez simplement le projet en local et commencez les modifications sur la branche `main`, ou une branche dédiée.


### Merci pour votre attention !