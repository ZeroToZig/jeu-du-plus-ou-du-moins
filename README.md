# 🎯 Jeu du Plus ou Moins (Zig 0.17)

Un mini-jeu en ligne de commande développé en **Zig** pour mettre en pratique l'architecture modulaire, la gestion des entrées/sorties (`std.Io`), la génération de nombres aléatoires et les couleurs ANSI dans le terminal.

## ✨ Fonctionnalités
* Tirage aléatoire d'un nombre secret entre **1 et 100** (`std.Random.IoSource`).
* Interface terminal colorée (entêtes, indices « Plus haut » / « Plus bas », victoire).
* Validation complète des saisies utilisateur avec gestion personnalisée des erreurs (`try` / `catch`).
* Compteur d'essais et possibilité d'enchaîner plusieurs parties.

## 🗂️ Architecture du projet
* `jeu.zig` : Boucle principale du jeu et logique de comparaison.
* `utilisateur.zig` : Module dédié à la lecture clavier et à la validation des nombres.
* `couleurs.zig` : Constantes des codes couleurs ANSI pour le terminal.

## 🚀 Lancer le jeu
Assurez-vous d'avoir **Zig 0.17.0** (ou supérieur) installé, puis exécutez :

```bash
zig run jeu.zig
```

## 👨‍💻 Auteur
Développé par **Grégory** ([@ZeroToZig](https://github.com)) — Suivez mon apprentissage complet du langage Zig en français sur [mon blog Dev.to](https://dev.to).

<img width="482" height="500" alt="Capture d’écran 2026-11-24 à 08 57 44" src="https://github.com/user-attachments/assets/ee8217a5-0870-4f14-a051-8971ed38a573" />

