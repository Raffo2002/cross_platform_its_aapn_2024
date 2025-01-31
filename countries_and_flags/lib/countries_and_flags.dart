import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/src/provider.dart';                  
import 'package:riverpod_annotation/riverpod_annotation.dart';

class CountriesAndFlags extends StatelessWidget {
  const CountriesAndFlags({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
          );
  }

  watch(AutoDisposeProvider<Dio> httpClientProvider) {}
}
