import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import './note_item.dart';
import '../providers/notes.dart';

class NotesList extends StatelessWidget {
  final http.Client client;

  const NotesList({
    required this.client,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          Provider.of<Notes>(context, listen: false).fetchAndSetNotes(client),
      builder: (ctx, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Consumer<Notes>(
                  builder: (context, notes, _) => notes.notes.isEmpty
                      ? const Center(
                          child: Text("No Note Yet"),
                        )
                      : RefreshIndicator(
                          onRefresh: () =>
                              Provider.of<Notes>(context, listen: false)
                                  .fetchAndSetNotes(client),
                          child: ListView.builder(
                            itemCount: notes.notes.length,
                            itemBuilder: (BuildContext context, int index) {
                              return NoteItem(
                                id: notes.notes[index].id,
                                body: notes.notes[index].body,
                                client: client,
                              );
                            },
                          ),
                        ),
                ),
    );
  }
}
