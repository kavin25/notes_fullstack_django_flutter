import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:notes_app/models/note.dart';
import 'package:provider/provider.dart';

import '../providers/notes.dart';

class UpdateScreen extends StatefulWidget {
  final http.Client client;
  static const String routeName = "/update";

  const UpdateScreen({required this.client, Key? key}) : super(key: key);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final _bodyController = TextEditingController();

  var isInit = true;
  var id = 0;
  var body = "";

  @override
  void didChangeDependencies() {
    if (isInit) {
      final arguments = ModalRoute.of(context)!.settings.arguments as Map;
      id = arguments['id'];
      body = arguments['body'];
      _bodyController.text = arguments['body'];
      isInit = false;
    }
    super.didChangeDependencies();
  }

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
                Provider.of<Notes>(context, listen: false).updateNote(
                  client: widget.client,
                  id: id,
                  body: _bodyController.text,
                );
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
