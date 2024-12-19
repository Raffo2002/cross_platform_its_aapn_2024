import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/src/provider/provider.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonList = ref.watch(pokemonListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Pokédex')),
      body: pokemonList.when(
        data: (list) => ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            final pokemon = list[index];
            return ListTile(
              title: Text('${pokemon.id} - ${pokemon.name}'),
              onTap: () => context.push('/pokemon/${pokemon.id}'),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
