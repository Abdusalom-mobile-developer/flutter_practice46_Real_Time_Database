// ignore_for_file: file_names

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_practice46_realtime_database/models/task_info.dart';
import 'package:flutter_practice46_realtime_database/services/log_service.dart';

class CRUDRealTimData {
  static Future<List<TaskInfo>?> getTasks() async {
    List<TaskInfo> list = [];
    try {
      DatabaseReference ref = FirebaseDatabase.instance.ref("tasks/");
      DataSnapshot snapshot = await ref.get();
      if (snapshot.exists) {
        LogService.d(snapshot.value.toString());
      }
    } catch (e) {
      Exception(e);
    }
    return list;
  }

  static Future<void> createTask(String id, Map<String, dynamic> taskInfos) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("tasks/$id");
    await ref.set(taskInfos);
  }

  static Future<void> removeTask(String id) async{
    DatabaseReference ref = FirebaseDatabase.instance.ref("tasks/$id");
    await ref.remove();
  }
}
