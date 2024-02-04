Ce repo contient le squelette d'une application à compléter dans le cadre du processus de recrutement des développeurs.

Plus d'infos à propos du poste de développeur chez Captain Contrat sur [notre page jobs](https://www.welcometothejungle.com/fr/companies/captain-contrat/jobs)

# Captain Challenge

Bienvenue jeune moussaillon !

Pour intégrer le navire Captain Contrat, tu dois créer une arène où deux héros pourront s'affronter !

Pour ce faire, nous avons mis à ta disposition une appli vide qu'il te faudra compléter.

## Résultat attendu

Le but de ce challenge est de tester ta capacité à monter une petite application [dans le respect des bonnes pratiques](https://medium.com/captain-contrat-tech).  
On te propose quatre étapes clés, avec des bonus facultatifs.

Nous nous intéresserons tout particulièrement aux choix de conception que tu feras, comment tu abordes les fonctionnalités à développer et ta connaissance des outils que tu utilises.

## Tes armes

- Ruby
- Rails
- git

## Étapes

### 1. Page d'accueil statique

C'est l'accueil de l'arène, d'où nous pourrons lancer les combats.  
Le but est donc de modifier (ou supprimer/remplacer) la page d'accueil existante.

Bonus :

- Un petit texte d'introduction de ton cru. C'est plus fun.
- Joli design (mais n'y perd pas trop de temps non plus)

### 2. Pouvoir créer un personnage

Données requises :

- Nom
- Points de vie
- Points d'attaque

Assure-toi qu'il n'y ait pas de grand déséquilibre entre combattants.  

Bonus :

- L'arène n'est pas vide au premier démarrage de l'appli.
- Les persos ont une photo de profil (ou de face)
- Crud complet des personnages
- Ajouter d'autres caractéristiques de ton choix aux personnages

### 3. READY? FIGHT!

Pouvoir choisir deux personnages et les faire combattre, puis afficher le gagnant avec un récapitulatif du combat.

Bonus :

- Historique des combats qui ont eu lieu
- Ajout de points d'expérience (mais pourquoi faire ?)
- Statistiques des combats : taux de victoire par perso et tout ça

### 4. Des armes

Pouvoir assigner une arme aux personnages avant le combat.

Bonus :

- Il n'y a pas que les armes dans la vie, il y a des boucliers aussi
- Pouvoir utiliser plusieurs équipements

# Solution proposé

## Fonctionnalités

# 1. Page d'acceuill
 Notre page d'accueil présente un formulaire simple permettant aux utilisateurs de configurer rapidement un combat entre deux personnages. Chaque utilisateur peut sélectionner deux combattants parmi une liste disponible, ainsi que personnaliser leurs équipements en choisissant des armes et des boucliers spécifiques pour chaque combattant.

### Caractéristiques Clés :

- **Sélection des Combattants :** Choisissez deux héros distincts pour s'affronter dans l'arène.
- **Personnalisation des Équipements :** Attribuez des armes et des boucliers à vos combattants pour influencer l'issue du duel.
- **Lancement du Combat :** Soumettez le formulaire pour voir le résultat du combat, incluant le vainqueur et un résumé des actions.

# 2. Gestion des Éléments du Jeu

Notre application permet une gestion intuitive des éléments clés du jeu : personnages, armes et boucliers.

- **Personnages :** Créez, visualisez, modifiez et supprimez des héros, chacun avec ses propres statistiques.
- **Armes/Boucliers :** Gérez l'équipement en ajoutant de nouvelles options, en consultant les caractéristiques existantes, en ajustant les attributs ou en retirant des éléments.

Ces outils de gestion offrent une flexibilité totale pour personnaliser les combats et stratégies dans l'arène.

# Algorithme de Combat et Mécanismes Avancés

Notre application offre une expérience de combat immersive et stratégique, orchestrée par l'algorithme de combat centralisé dans `BattleService`. Cet algorithme, en conjonction avec les caractéristiques détaillées des personnages, armes, et boucliers, crée un environnement dynamique où chaque décision peut influencer l'issue d'un duel.

## Fonctionnement de l'Algorithme de Combat

Le processus de combat suit plusieurs étapes clés pour déterminer le vainqueur d'une confrontation :

- **Initialisation :** Deux combattants et l'instance de bataille sont préparés. Les points de vie initiaux sont enregistrés pour tracer l'état de départ.
- **Déroulement du Combat :** Les combattants s'affrontent en alternance. Chaque attaque inflige des dégâts calculés par la formule `total_attack_points`*, qui prend en compte les statistiques du personnage, l'impact de son arme, et un bonus lié à son niveau.
- **Effet des Boucliers :** Les boucliers jouent un rôle défensif en réduisant les dégâts reçus, grâce à la méthode `receive_damage`* qui applique le bonus de défense du bouclier.
- **Enregistrement des Actions :** Chaque attaque et ses conséquences (dégâts infligés, points de vie restants) sont consignées, offrant une visibilité complète sur le déroulement du combat.
- **Conclusion :** Le combat se poursuit jusqu'à ce qu'un combattant soit vaincu (ses points de vie tombent à zéro), à quel point le vainqueur est déclaré et les récompenses d'expérience sont distribuées.

## Mécanismes Avancés

- **Armes et Boucliers :** La sélection d'armes et de boucliers avant le combat permet aux joueurs d'affiner leur stratégie, influençant directement les capacités offensives et défensives des personnages.
- **Système d'Expérience :** Les personnages gagnent de l'expérience à travers les combats. Accumuler suffisamment d'expérience conduit à une augmentation de niveau, renforçant les capacités du personnage et reflétant son évolution et son expérience de combat.
- **Progression et Stratégie :** L'accumulation d'expérience et l'amélioration des niveaux, combinées à la sélection stratégique d'équipements, encouragent une approche réfléchie et une progression continue.


## Méthodes Clés du Système de Combat

### total_attack_points

La méthode `total_attack_points` calcule la puissance d'attaque totale d'un personnage en tenant compte de plusieurs facteurs :

- **Points d'Attaque de Base :** Les points d'attaque intrinsèques du personnage, définissant leur capacité offensive de base.
- **Bonus d'Arme :** Un pourcentage d'augmentation des points d'attaque, fourni par l'arme équipée. Cette augmentation est calculée sur les points d'attaque de base du personnage.
- **Bonus de Niveau :** Un bonus additionnel basé sur le niveau du personnage, reflétant leur expérience et leur habileté acquises au fil des combats.

La formule utilisée pour calculer les points d'attaque totaux est la suivante :

```ruby
total_attack_points = (attack_points * (1 + (weapon&.attack_bonus.to_f || 0) / 100) + (level * 0.25)).round
```

### receive_damage

La méthode `receive_damage` joue un rôle crucial dans notre système de combat, déterminant la manière dont un personnage absorbe ou réduit les dégâts infligés par un adversaire. Cette fonction reflète l'importance de la défense et de la stratégie d'équipement dans la survie et la victoire des personnages.

#### Fonctionnement :

La méthode calcule les dégâts nets reçus après application de la réduction due au bouclier équipé. Les étapes de calcul sont les suivantes :

- **Calcul de la Réduction :** Utilise le bonus de défense du bouclier (si équipé) pour déterminer le pourcentage des dégâts à réduire. Si aucun bouclier n'est équipé, la réduction est de 0.

- **Application de la Réduction :** Réduit les dégâts infligés par l'attaquant en fonction du pourcentage de réduction calculé précédemment.

- **Mise à Jour des Points de Vie :** Soustrait les dégâts réduits des points de vie du personnage défenseur.

#### Code Exemple :

```ruby
def receive_damage(damage)
  reduction = (shield&.defense_bonus.to_f || 0) / 100
  reduced_damage = damage * (1 - reduction)
  self.life_points -= reduced_damage.round
end
```

## Installation

Pour installer et exécuter ce projet localement sur votre machine, suivez les étapes ci-dessous :

## Prérequis

Avant de commencer l'installation de ce projet, assurez-vous que vous avez les versions suivantes installées sur votre système :

- Ruby version 3.2.2
- Rails version 7.0.7
- node >= 14.0.0

### Étape 1 : Cloner le dépôt

Commencez par cloner le dépôt GitHub sur votre machine locale en utilisant la commande suivante dans votre terminal :

```bash
git clone https://github.com/seifeddinhaj/Captain-Challenge.git
```
### Étape 2 : Installer les dépendances
```bash
cd Captain-Challenge
bundle install
yarn install
```

### Étape 3 : Configurer la base de données
```bash
rails db:setup
```
### Étape 4 : Lancer le serveur
```bash
./bin/dev
