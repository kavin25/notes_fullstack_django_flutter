import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:notes_app/screens/update_screen.dart';
import 'package:provider/provider.dart';

import './providers/notes.dart';
import './screens/create_screen.dart';
import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final http.Client client = http.Client();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Notes(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: HomeScreen(title: 'Notes', client: client),
        routes: {
          CreateScreen.routeName: (ctx) => CreateScreen(client: client),
          UpdateScreen.routeName: (ctx) => UpdateScreen(client: client),
        },
      ),
    );
  }
}
