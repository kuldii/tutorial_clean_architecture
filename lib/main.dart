// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:my_ca/features/profile/data/datasources/local_datasource.dart';
// import 'package:my_ca/features/profile/data/repositories/profile_repository_implementation.dart';
// import 'package:my_ca/features/profile/domain/usecases/get_all_user.dart';
// import 'package:my_ca/features/profile/presentation/bloc/profile_bloc.dart';

// import 'core/routes/my_router.dart';
// import 'observer.dart';

// void main() async {
//   Bloc.observer = MyObserver();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ..... pakai dependency injection <----,
//       child: MaterialApp.router(
//         routerConfig: MyRouter().router, // pasang go router
//       ),
//     );
//   }
// }
