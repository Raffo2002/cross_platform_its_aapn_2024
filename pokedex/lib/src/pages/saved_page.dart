import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SavedPage extends ConsumerWidget {
  const SavedPage({super.key});

  ProviderListenable? get savedpokeProvider => null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final saved = ref.watch(savedpokeProvider!);
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          for (final s in saved)
            ListTile(
              title: Text(s.title),
            ),
        ],
      ),
    );
  }
}
