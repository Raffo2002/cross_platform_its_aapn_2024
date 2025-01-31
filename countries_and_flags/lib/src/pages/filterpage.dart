import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SavedFlagsPage extends ConsumerWidget {
  const SavedFlagsPage({super.key});

  ProviderListenable? get savedFlagsProvider => null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedFlags =
        ref.watch(savedFlagsProvider!); // Leggiamo le bandiere salvate

    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved Flags"),
      ),
      body: savedFlags.isEmpty
          ? const Center(child: Text("No flags saved yet."))
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Mostra due bandiere per riga
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: savedFlags.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.network(
                            savedFlags[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            ref.read(savedFlagsProvider!.notifier!).state = [
                              ...savedFlags
                                  .where((flag) => flag != savedFlags[index])
                            ];
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}

extension on ProviderListenable? {
  ProviderListenable? get notifier => null;
}
