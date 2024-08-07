import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tutorial_clean_architecture/features/profile/data/models/profile_model.dart';

import 'core/routes/my_router.dart';
import 'observer.dart';

void main() async {
  // Initialize hive flutter
  await Hive.initFlutter();
  Hive.registerAdapter(ProfileModelAdapter());

  Bloc.observer = MyObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: MyRouter().router, // pasang go router
    );
  }
}
