import '../../domain/entities/character.dart';
import '../../domain/repositories/character_repository.dart';
import '../datasources/api_service.dart';
import '../datasources/local_storage_service.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final ApiService apiService;
  final LocalStorageService localStorageService;

  CharacterRepositoryImpl({
    required this.apiService,
    required this.localStorageService,
  });

  @override
  Future<List<Character>> getCharacters({int page = 1}) async {
    try {
      final dtos = await apiService.fetchCharacters(page: page);
      final entities = dtos.map((e) => e.toEntity()).toList();
      
      // Cache the first page or everything? 
      // Requirement says "cache the last successful response".
      // We'll cache everything we fetch to support scrolling offline.
      await localStorageService.cacheCharacters(entities);
      
      return entities;
    } catch (e) {
      // If network fails, return cached data for the requested page
      final cached = await localStorageService.getCachedCharacters(
        offset: (page - 1) * 20,
        limit: 20,
      );
      if (cached.isEmpty && page == 1) {
        rethrow; // No data at all
      }
      return cached;
    }
  }

  @override
  Future<Character?> getCharacterById(int id) async {
    try {
      final dto = await apiService.fetchCharacterById(id);
      return dto.toEntity();
    } catch (e) {
      // In case of error, we could search in cache
      final cached = await localStorageService.getCachedCharacters();
      try {
        return cached.firstWhere((element) => element.id == id);
      } catch (_) {
        return null;
      }
    }
  }
}
