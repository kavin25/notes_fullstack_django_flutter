class Constants {
  static const bool development = true;
  static const String devUrl = 'localhost:8000';
  static const String prodUrl = '';
  static const String baseUrl = development ? devUrl : prodUrl;
  static const String getNotesUrl = "/notes";
  static const String createNoteUrl = "/notes/create/";
  static String getNoteUrl(int id) {
    return '/notes/$id';
  }

  static String updateNoteUrl(int id) {
    return '/notes/$id/update/';
  }

  static String deleteNoteUrl(int id) {
    return '/notes/$id/delete/';
  }

  static Uri generateUrl(String path) {
    return development ? Uri.http(baseUrl, path) : Uri.https(baseUrl, path);
  }
}
