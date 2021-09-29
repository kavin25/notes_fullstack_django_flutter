import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/note.dart';
import '../utils/constants.dart';

class Notes with ChangeNotifier {
  List<Note> _notes = [];

  List<Note> get notes {
    return [..._notes];
  }

  void addNote({required http.Client client, required String body}) async {
    Map<String, dynamic> newNote = json.decode((await client.post(
      Constants.generateUrl(Constants.createNoteUrl),
      body: {
        'body': body,
      },
    ))
        .body);
    _notes.insert(0, Note(id: newNote['id'], body: newNote['body']));
    notifyListeners();
  }

  void updateNote(
      {required http.Client client,
      required int id,
      required String body}) async {
    Map<String, dynamic> updateNote = json.decode((await client.put(
      Constants.generateUrl(Constants.updateNoteUrl(id)),
      body: {
        'body': body,
      },
    ))
        .body);
    _notes.removeWhere((element) => element.id == id);
    _notes.insert(0, Note(id: updateNote['id'], body: updateNote['body']));
    notifyListeners();
  }

  void deleteNote({required http.Client client, required int id}) {
    client.delete(Constants.generateUrl(Constants.deleteNoteUrl(id)));
    _notes.removeWhere((note) => note.id == id);
    notifyListeners();
  }

  Future<void> fetchAndSetNotes(http.Client client) async {
    List<Note> rNotes = [];
    List response = json.decode(
        (await client.get(Constants.generateUrl(Constants.getNotesUrl))).body);
    for (var note in response) {
      rNotes.add(Note.fromMap(note));
    }
    _notes = rNotes;
    notifyListeners();
  }
}
