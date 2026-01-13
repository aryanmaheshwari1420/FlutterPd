import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../providers/character_provider.dart';
import 'character_detail_screen.dart';

class CharacterListScreen extends ConsumerStatefulWidget {
  const CharacterListScreen({super.key});

  @override
  ConsumerState<CharacterListScreen> createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends ConsumerState<CharacterListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      ref.read(characterListProvider.notifier).fetchNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(characterListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick & Morty Characters'),
        centerTitle: true,
      ),
      body: state.when(
        data: (characters) {
          if (characters.isEmpty) {
            return const Center(child: Text('No characters found.'));
          }
          return RefreshIndicator(
            onRefresh: () => ref.refresh(characterListProvider.future),
            child: ListView.builder(
              controller: _scrollController,
              itemCount: characters.length + (ref.watch(characterListProvider.notifier).hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < characters.length) {
                  final character = characters[index];
                  return ListTile(
                    leading: Hero(
                      tag: 'char-${character.id}',
                      child: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(character.image),
                      ),
                    ),
                    title: Text(character.name),
                    subtitle: Text('${character.species} - ${character.status}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CharacterDetailScreen(character: character),
                        ),
                      );
                    },
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text('Error: ${error.toString()}'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.refresh(characterListProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
