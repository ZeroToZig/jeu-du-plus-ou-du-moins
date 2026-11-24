const std = @import("std");
const couleurs = @import("couleurs.zig");
const utilisateur = @import("utilisateur.zig");

pub fn main(init: std.process.Init) !void {
    var rng_impl: std.Random.IoSource = .{ .io = init.io };
    const rand = rng_impl.interface();
    std.debug.print("{s}          -----------------------------------{s}\n", .{ couleurs.JAUNE, couleurs.RESET });
    std.debug.print("{s}                 Jeu du plus ou moins{s}\n", .{ couleurs.JAUNE, couleurs.RESET });
    std.debug.print("{s}          -----------------------------------{s}\n", .{ couleurs.JAUNE, couleurs.RESET });
    std.debug.print("{s}                catégorie   : Jeu{s}\n", .{ couleurs.BLEU, couleurs.RESET });
    std.debug.print("{s}                Langage     : ZIG{s}\n", .{ couleurs.BLEU, couleurs.RESET });
    std.debug.print("{s}                développeur : Gr€g {s}\n", .{ couleurs.BLEU, couleurs.RESET });
    std.debug.print("\n", .{});
    std.debug.print("\n", .{});

    // initialisation de buffer (100 cases)
    var buffer: [100]u8 = undefined;

    // 1_ Boucle pour redemander à jouer
    while (true) {

        // 2_ On tire un nouveau nombre à chaque partie
        const nombre_secret = rand.intRangeAtMost(u8, 1, 100);

        // 3_ nombre d'essaie
        var essais: u8 = 0;

        // 4_ Boucle de la partie en cours
        while (true) {
            const proposition = utilisateur.demanderNombre(init.io, &buffer, "Entre un nombre entre 1 et 100 = ") catch {
                std.debug.print("{s}Entrée Invalide ❌ Nombre entre 1 et 100 !{s}\n", .{ couleurs.ROUGE, couleurs.RESET });
                continue;
            };
            // On incremente esaais
            essais += 1;

            // 5_ Condition pour le nombre
            if (proposition < nombre_secret) {
                std.debug.print("{s}C'est plus haut !{s}\n", .{ couleurs.VERT, couleurs.RESET });
            } else if (proposition > nombre_secret) {
                std.debug.print("{s}C'est plus bas !{s}\n", .{ couleurs.ROUGE, couleurs.RESET });
            } else {
                std.debug.print("{s}Bravo 👋 ✅ ! Trouvé en {d} essais !{s}\n\n", .{ couleurs.JAUNE, essais, couleurs.RESET });
                break; // On sort de la petite boucle
            }
        }
        // 3_ On réutilse la même fonction de saisie pour recommencer ou quitter le programme

        const choix = utilisateur.demanderNombre(init.io, &buffer, "\nVeux-tu rejouer ? (1 = Oui | 0 = Quitter)\n") catch 0;

        if (choix == 0) {
            std.debug.print("{s}Merci d'avoir joué ! À bientôt 👋{s}\n", .{ couleurs.CYAN, couleurs.RESET });
            break; // on sort de la boucle
        }
        // si choix = 1 ou autre on continue.
    }
}
