import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final form = FormGroup({'query': FormControl<String>(value: '')});

  String? _query;

  @override
  Widget build(BuildContext context) {
    final results = ref.watch(searchProvider(_query));

    return Scaffold(
      appBar: AppBar(
        title: const Text("All Nations"),
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed('filters');
            },
            icon: const Icon(Icons.filter_list),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 96,
        ),
        child: ReactiveForm(
          formGroup: form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ReactiveTextField<String>(
                formControlName: 'query',
                decoration: InputDecoration(
                  hintText: "Italy...",
                  label: const Text("Search your favorite nation!"),
                  suffixIcon: IconButton(
                    onPressed: () {
                      form.control('query').value = null;
                      setState(() {
                        _query = null;
                      });
                    },
                    icon: const Icon(Icons.cancel),
                  ),
                ),
                onSubmitted: (control) {
                  setState(() {
                    _query = control.value;
                  });
                },
              ),
              Expanded(
                child: switch (results) {
                  AsyncData(:final value) => ListView(
                      children: [
                        for (final result in value)
                          Card(
                            margin: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(result.name),
                                const SizedBox(height: 12),
                                Image.network(result.image),
                              ],
                            ),
                          )
                      ],
                    ),
                  AsyncError() => const Center(
                      child: Text("you're out of the universe"),
                    ),
                  _ => const Center(
                      child: CircularProgressIndicator(),
                    )
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  ProviderListenable searchProvider(String? query) {
    return FutureProvider((ref) => Future.value([]));
  }
}
