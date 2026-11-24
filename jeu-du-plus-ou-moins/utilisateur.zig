const std = @import("std");
// Importation des couleurs ANSI
const couleurs = @import("couleurs.zig");

// 1_ Erreurs personalisées
pub const ErreurSaisie = error{
    HorsLimites,
};

// 2_ LA fonction public pour gérer l'entrée utilisateur
pub fn demanderNombre(io: std.Io, buffer: []u8, message: []const u8) !u8 {
    var stdin_reader = std.Io.File.stdin().reader(io, buffer);
    const stdin = &stdin_reader.interface;
    std.debug.print("{s}", .{message});

    // lecture jusqu'a l'entrée
    const ligne = try stdin.takeDelimiterExclusive('\n');
    const propre = std.mem.trim(u8, ligne, "\r\n\t");

    // Conversion en entier en u8 (renvoie error.InvalidCharacter ou error.Overflow si invalide)
    const nombre = try std.fmt.parseInt(u8, propre, 10);

    //Vérification que le nombre est bien entre 1 et 100
    if (nombre < 1 or nombre > 100) {
        return ErreurSaisie.HorsLimites;
    }

    return nombre;
}
