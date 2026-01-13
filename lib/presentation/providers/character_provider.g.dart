// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$apiServiceHash() => r'73ad3c2e8c0d458c43bdd728c0f0fb75c5c2af98';

/// See also [apiService].
@ProviderFor(apiService)
final apiServiceProvider = AutoDisposeProvider<ApiService>.internal(
  apiService,
  name: r'apiServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$apiServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ApiServiceRef = AutoDisposeProviderRef<ApiService>;
String _$localStorageServiceHash() =>
    r'283fa688bf100dce044f2a2cfdf1c98a291d7d1c';

/// See also [localStorageService].
@ProviderFor(localStorageService)
final localStorageServiceProvider =
    AutoDisposeProvider<LocalStorageService>.internal(
  localStorageService,
  name: r'localStorageServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$localStorageServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocalStorageServiceRef = AutoDisposeProviderRef<LocalStorageService>;
String _$characterRepositoryHash() =>
    r'2239ada7e486636f73bc32349faccae30ca52b76';

/// See also [characterRepository].
@ProviderFor(characterRepository)
final characterRepositoryProvider =
    AutoDisposeProvider<CharacterRepository>.internal(
  characterRepository,
  name: r'characterRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$characterRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CharacterRepositoryRef = AutoDisposeProviderRef<CharacterRepository>;
String _$characterListHash() => r'3cb07a90b4f727fa2c8ec9cf3ab1c78ae5902690';

/// See also [CharacterList].
@ProviderFor(CharacterList)
final characterListProvider =
    AutoDisposeAsyncNotifierProvider<CharacterList, List<Character>>.internal(
  CharacterList.new,
  name: r'characterListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$characterListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CharacterList = AutoDisposeAsyncNotifier<List<Character>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
