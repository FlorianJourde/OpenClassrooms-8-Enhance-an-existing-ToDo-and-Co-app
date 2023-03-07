# OpenClassrooms
- Développeur d'application
- Parcours PHP/Symfony
- Projet 8

## Améliorez une application existante de ToDo & Co

![OpenClassrooms banneer](./ressources/images/todo-and-co.jpg)

[![Symfony Badge](https://img.shields.io/badge/Symfony-5.4-000000?style=flat-square&logo=symfony&logoColor=white/)](https://symfony.com/) [![Composer Badge](https://img.shields.io/badge/Composer-2.4-6c3e22?style=flat-square&logo=composer&logoColor=white/)](https://getcomposer.org/) [![PHP Badge](https://img.shields.io/badge/PHP-7.4-7a86b8?style=flat-square&logo=php&logoColor=white/)](https://www.php.net/) [![Draw.io Badge](https://img.shields.io/badge/Diagrams.net-20.7-F08705?style=flat-square&logo=diagrams.net&logoColor=white/)](https://www.diagrams.net/)

### À propos

Bonjour et bienvenue sur le dépôt de mon travail, qui traite du septième projet d'OpenClassrooms, intitulé **Améliorez une application existante de ToDo & Co** ! Vous trouverez, ci-après, la procédure d'installation pour prendre en main le code du projet, ainsi que la base de données et sa structure, conçue pour fonctionner avec.

Vous trouverez également, dans le dossier **ressources**, les diagrammes UML conçus en amont du projet, la base de données au format SQL, ainsi qu'un lien vers la documentation de l'API, hébergée par Postman.

[![Preview site](https://img.shields.io/badge/Site%20web--fe746e?style=for-the-badge&logo=InternetExplorer&logoColor=white)](http://todoandco.florianjourde.com/) [![Dépôt](https://img.shields.io/badge/Dépôt%20initial--000000?style=for-the-badge&logo=Github&logoColor=white)](https://github.com/saro0h/projet8-TodoList)


---

## Remarque

Pour pouvoir installer ce projet, le gestionnaire de dépendance **Composer** doit être présent sur votre machine, un serveur local sous **PHP 7.4**, ainsi que le framework **Symfony** en version **5.4**. Si vous ne disposez pas de ces outils, vous pourrez les télécharger et les installer, en suivant ces liens :
- Télécharger [Composer](https://getcomposer.org/)
- Télécharger [Symfony](https://symfony.com/download)
- Télécharger [Wamp](https://www.wampserver.com/) (Windows)
- Télécharger [Mamp](https://www.wampserver.com/) (Mamp)

---

[comment]: <> (## Installation)

[comment]: <> (1. À l'aide d'un terminal, créez un dossier à l'emplacement souhaité pour l'installation du projet. Lancez ensuite la commande suivante :)

[comment]: <> (```shell)

[comment]: <> (git clone https://github.com/FlorianJourde/OpenClassrooms-7-Create-a-web-service-exposing-an-API)

[comment]: <> (```)


[comment]: <> (2. Lancez cette commande pour vous rendre dans le dossier adequat :)

[comment]: <> (```shell)

[comment]: <> (cd OpenClassrooms-7-Create-a-web-service-exposing-an-API)

[comment]: <> (```)


[comment]: <> (3. À la racine de ce répertoire, lancez la commande suivante pour installer les dépendances Composer :)

[comment]: <> (```shell)

[comment]: <> (composer install)

[comment]: <> (```)


[comment]: <> (4. Créez un dossier nommé `jwt` dans le dossier `config`, puis lancez la commande suivante pour créer une clé privée :)

[comment]: <> (```shell)

[comment]: <> (openssl genpkey -out config/jwt/private.pem -aes256 -algorithm rsa -pkeyopt rsa_keygen_bits:4096)

[comment]: <> (```)

[comment]: <> (Cette commande permet de générer une clé privée pour permettre l'authentification via JWT. Lorsqu'un passphrase vous sera demandé, choissisez-en un, que vous indiquerez ensuite dans le fichier `.env.local`.)


[comment]: <> (5. Lancez maintenant cette commande pour générer une clé publique :)

[comment]: <> (```shell)

[comment]: <> (openssl pkey -in config/jwt/private.pem -out config/jwt/public.pem -pubout)

[comment]: <> (```)

[comment]: <> (Entrez à nouveau le passphrase choisi.)


[comment]: <> (6. Une fois l'installation des dépendances terminée, vous devez maintenant dupliquer le fichier `.env` situé à la racine du projet, puis renommer le nouveau fichier en `.env.local`, pour vous connecter à votre base de données. À la ligne 33, remplacez les identifiants de connexion par vos identifiants de base de données locale :)

[comment]: <> (```php)

[comment]: <> (DATABASE_URL="mysql://username:password@127.0.0.1:3306/bilemo_db?serverVersion=5.7.36&charset=utf8mb4")

[comment]: <> (```)


[comment]: <> (7. Dans ce même fichier, vous devez également modifier la ligne 25, pour y indiquer le passphrase choisi pour JWT, ce qui donnera ceci :)

[comment]: <> (```)

[comment]: <> (JWT_PASSPHRASE=passphrase)

[comment]: <> (```)


[comment]: <> (8. Après avoir modifié le fichier `.env.local` avec vos informations de connexion, lancez cette commande pour créer la base de données :)

[comment]: <> (```shell)

[comment]: <> (php bin/console doctrine:database:create)

[comment]: <> (```)


[comment]: <> (9. Exportez désormais la structure de votre base de données, grace aux commandes suivantes :)

[comment]: <> (```shell)

[comment]: <> (php bin/console make:migration)

[comment]: <> (```)

[comment]: <> (puis)

[comment]: <> (```shell)

[comment]: <> (php bin/console doctrine:migrations:migrate)

[comment]: <> (```)


[comment]: <> (10. Si tout s'est correctement déroulé, une nouvelle base de données `bilemo_db` est apparu parmi les tables de votre serveur local. Lancez ensuite la commande suivante pour générer un jeu de données, s'appuyant sur les fixtures :)

[comment]: <> (```shell)

[comment]: <> (php bin/console doctrine:fixtures:load)

[comment]: <> (```)


[comment]: <> (11. À ce stade, un jeu de données devrait avoir été créé. Si vous n'avez pas réussi à créer et importer un jeu de données, vous pouvez importer le fichier `bilemo_db.sql`, présent dans le dossier `ressources`, dans votre base de données SQL locale.)


[comment]: <> (12. Via le terminal, lancez la commande suivante pour démarrer l'application Symfony :)

[comment]: <> (```zsh)

[comment]: <> (symfony server:start)

[comment]: <> (```)


[comment]: <> (Si vous rencontrez un problème à cette étape, veuillez vous assurer que WAMP ou MAMP est présent et lancé sur votre machine et que le démarrage du serveur local de Symfony a bien été effectué depuis le dossier racine du projet.)


[comment]: <> (13. Une fois la connexion avec la base de données établie, vous pouvez commencer à tester les fonctionnalités de l'API via le logiciel Postman. Le programme doit être installé en local pour fonctionner correctement.)


[comment]: <> (14. Vous trouverez les identifiants de connexion et toutes les autres informations nécéssaires directement sur la documentation de l'API, dont le lien se trouve en haut de ce fichier.)

1. Pour pouvoir tester les fonctionnalités du site, veuillez utiliser les identifiants par défaut :
- Admin
	- ID : admin@todoandco.com
	- MDP : 123456
- User
	- ID : user1@todoandco.com
	- MDP : 123456


### Merci pour votre attention !