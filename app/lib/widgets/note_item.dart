import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:notes_app/screens/update_screen.dart';
import 'package:provider/provider.dart';

import '../providers/notes.dart';

class NoteItem extends StatelessWidget {
  final String body;
  final int id;
  final http.Client client;

  const NoteItem({
    required this.body,
    required this.id,
    required this.client,
    Key? key,
  }) : super(key: key);

  void _deleteNote(BuildContext context, int id) async {
    Provider.of<Notes>(context, listen: false)
        .deleteNote(client: client, id: id);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(body),
      onTap: () => Navigator.of(context).pushNamed(UpdateScreen.routeName,
          arguments: {'id': id, 'body': body}),
      trailing: IconButton(
        onPressed: () => _deleteNote(context, id),
        icon: const Icon(Icons.delete),
      ),
    );
  }
}
