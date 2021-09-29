import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../providers/notes.dart';

class CreateScreen extends StatefulWidget {
  final http.Client client;
  static const String routeName = "/create";

  const CreateScreen({required this.client, Key? key}) : super(key: key);

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _bodyController,
              decoration: const InputDecoration(
                labelText: "Note Content",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<Notes>(context, listen: false)
                    .addNote(client: widget.client, body: _bodyController.text);
                Navigator.of(context).pop();
              },
              child: const Text("Create"),
            )
          ],
        ),
      ),
    );
  }
}
