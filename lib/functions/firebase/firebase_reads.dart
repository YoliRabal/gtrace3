import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gtrace3/models/feed/feed_model.dart';
import '../../config/imports.dart';

Future<List<FeedModel>> getFeed() async {
  if (kDebugMode) {
    print("· Obteniendo Feed");
  }

  try {
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
        .collection("feedModel")
        .get();


    List<FeedModel> list = snapshot.docs
        .map((docSnapshot) => FeedModel.fromJson(docSnapshot.data()))
        .toList();

    if (kDebugMode) {
      print("·(✅) Feed obtenidos con éxito. Total: ${list.length}");
    }

    return list;
  } catch (e) {
    if (kDebugMode) {
      print("(❌) Error obteniendo Feed: $e");
    }
    return [];
  }
}