import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/character_model.dart';
import '../../domain/entities/character.dart';

class LocalStorageService {
  late Future<Isar> db;

  LocalStorageService() {
    db = _initDb();
  }

  Future<Isar> _initDb() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [CharacterModelSchema],
        directory: dir.path,
      );
    }
    return Isar.getInstance()!;
  }

  Future<void> cacheCharacters(List<Character> characters) async {
    final isar = await db;
    final models = characters.map((e) => CharacterModel.fromEntity(e)).toList();
    await isar.writeTxn(() async {
      await isar.characterModels.putAll(models);
    });
  }

  Future<List<Character>> getCachedCharacters({int limit = 20, int offset = 0}) async {
    final isar = await db;
    final models = await isar.characterModels
        .where()
        .offset(offset)
        .limit(limit)
        .findAll();
    return models.map((e) => e.toEntity()).toList();
  }

  Future<void> clearCache() async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.characterModels.clear();
    });
  }
}
