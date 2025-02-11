import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gtrace3/config/imports.dart';
import 'package:gtrace3/models/feed/feed_model.dart';

Future<List<FeedModel>> getFeed() async {

  if (kDebugMode) {print("· Obteniendo Feed");}

  try {

    QuerySnapshot<Map<String, dynamic>> snapshot;

    snapshot = await FirebaseFirestore.instance
        .collection("Feed")
        .get();

    List<FeedModel> list = snapshot.docs
        .map((docSnapshot) => FeedModel.fromJson(docSnapshot.data()))
        .toList();

    if (kDebugMode) {print("·(✅) Feed obtenidos con exito");}
    return list;

  } catch (e) {

    if (kDebugMode) {print("(❌) Error obteniendo Feed: $e");}
    return [];

  }
}