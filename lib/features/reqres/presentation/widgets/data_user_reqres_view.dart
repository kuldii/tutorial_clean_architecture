import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/data_user_reqres_bloc/data_user_reqres_bloc.dart';

class DataUserReqresView extends StatelessWidget {
  DataUserReqresView({super.key});

  final TextEditingController idC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const SizedBox(height: 50),
        BlocBuilder<DataUserReqresBloc, DataUserReqresState>(
          builder: (context, state) {
            if (state is DataUserReqresStateLoaded) {
              return Text(state.dataUserReqres.toString());
            } else if (state is DataUserReqresStateLoading) {
              return const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              );
            } else if (state is DataUserReqresStateError) {
              return Text(state.message);
            } else {
              return const Text("No data");
            }
          },
        ),
        const SizedBox(height: 50),
        TextField(
          autocorrect: false,
          controller: idC,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  if (idC.text.isNotEmpty) {
                    int id = int.tryParse(idC.text) ?? 0;
                    context.read<DataUserReqresBloc>().add(DataUserReqresEventGetByIdDataUserReqres(id: id));
                    idC.text = "";
                  }
                },
                child: const Text("Get Data By Id"),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  context.read<DataUserReqresBloc>().add(DataUserReqresEventGetRandomDataUserReqres());
                },
                child: const Text("Get Data Random"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
