import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/injection/dependency_injection.dart';
import '../bloc/data_user_reqres_bloc/data_user_reqres_bloc.dart';
import '../widgets/data_user_reqres_view.dart';

class DataUserReqresPage extends StatelessWidget {
  const DataUserReqresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data User Reqres"),
      ),
      body: BlocProvider<DataUserReqresBloc>(
        create: (context) => serviceLocator<DataUserReqresBloc>(),
        child: DataUserReqresView(),
      ),
    );
  }
}
