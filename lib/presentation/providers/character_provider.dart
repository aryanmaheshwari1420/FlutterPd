import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/character.dart';
import '../../data/datasources/api_service.dart';
import '../../data/datasources/local_storage_service.dart';
import '../../data/repositories/character_repository_impl.dart';
import '../../domain/repositories/character_repository.dart';

part 'character_provider.g.dart';

@riverpod
ApiService apiService(ApiServiceRef ref) => ApiService();

@riverpod
LocalStorageService localStorageService(LocalStorageServiceRef ref) => LocalStorageService();

@riverpod
CharacterRepository characterRepository(CharacterRepositoryRef ref) {
  return CharacterRepositoryImpl(
    apiService: ref.watch(apiServiceProvider),
    localStorageService: ref.watch(localStorageServiceProvider),
  );
}


@riverpod
class CharacterList extends _$CharacterList {
  int _page = 1;
  bool _hasMore = true;
  bool _isLoadingMore = false;

  bool get hasMore => _hasMore;
  bool get isLoadingMore => _isLoadingMore;

  @override
  Future<List<Character>> build() async {
    _page = 1;
    _hasMore = true;
    return _fetchCharacters();
  }

  Future<List<Character>> _fetchCharacters() async {
    final repo = ref.read(characterRepositoryProvider);
    final results = await repo.getCharacters(page: _page);
    if (results.length < 20) {
      _hasMore = false;
    }
    return results;
  }

  Future<void> fetchNextPage() async {
    if (_isLoadingMore || !_hasMore) return;
    
    _isLoadingMore = true;
    state = AsyncValue.data(state.value ?? []); // Keep current data
    
    try {
      _page++;
      final nextCharacters = await _fetchCharacters();
      final currentCharacters = state.value ?? [];
      state = AsyncValue.data([...currentCharacters, ...nextCharacters]);
    } catch (e) {
      // In a real app, we might want to show a snackbar instead of failing the whole state
      // but for this task, we'll just log or handle it.
      _page--; // Rollback page count
      _isLoadingMore = false;
      // Optionally rethrow or set error if it's critical
    } finally {
      _isLoadingMore = false;
    }
  }
}
