import 'package:flutter/material.dart';

class DataUserReqresPage extends StatelessWidget {
  DataUserReqresPage({super.key});

  final TextEditingController idC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data User Reqres"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 50),
          const Text("No data"),
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
                  onPressed: () {},
                  child: const Text("Get Data By Id"),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Get Data Random"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
