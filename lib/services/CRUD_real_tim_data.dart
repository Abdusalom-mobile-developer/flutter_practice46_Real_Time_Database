// ignore_for_file: file_names

import 'package:firebase_database/firebase_database.dart';

class CRUDRealTimData {
  static Future<Map<String, dynamic>?> getTasks() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("tasks/");

    DataSnapshot snapshot = await ref.get();
    if (snapshot.exists) {
      return snapshot.value as Map<String, dynamic>;
    }
    return {};
  }
}
