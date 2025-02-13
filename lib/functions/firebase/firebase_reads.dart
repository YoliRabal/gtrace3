import '../../config/imports.dart';

//FEED
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

//GET DATA
Future<DefaultModel> getDefault() async {
  print("Obteniendo default");

  QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
      .instance
      .collection("Default")
      .where("id", isEqualTo: "default")
      .limit(1)
      .get();

  if (snapshot.docs.isNotEmpty) {
    // Usa el método fromJSON para obtener el modelo
    DEFAULT = snapshot.docs
        .map((docSnapshot) => DefaultModel.fromJson(docSnapshot.data()))
        .first;
  } else {
    // Si no se encuentra, retorna un modelo por defecto
    DEFAULT = DefaultModel();
  }

  return DEFAULT;
}

//USUARIOS
Future<List<UsersModel>> getUsers({String search = "", String sportID = ""}) async {
  if (kDebugMode) {print("· Obteniendo usuarios");}

  try {
    Query<Map<String, dynamic>> query = FirebaseFirestore
        .instance
        .collection(COLLECTION_NAME_USERS);

    // Si sportID no está vacío, se filtra por el sportID en info_deporte
    if (sportID.isNotEmpty) {
      query = query.where('sportsIDs', arrayContains: sportID);
    } else {
      // Si no, se realiza la búsqueda por name o filter
      if (search.isNotEmpty) {
        query = query
            .where("name", isGreaterThanOrEqualTo: search)
            .where("name", isLessThanOrEqualTo: search + '\uf8ff');
      }
    }

    QuerySnapshot<Map<String, dynamic>> snapshot = await query.get();

    // Convertir los documentos a una lista de UsersModel
    List<UsersModel> list = snapshot.docs
        .map((docSnapshot) => UsersModel.fromJson(docSnapshot.data()))
        .toList();

    if (kDebugMode) {print("·(✅) Usuarios obtenidos con éxito");}

    return list;
  } catch (e) {
    if (kDebugMode) {print("(❌) Error obteniendo usuarios: $e");}
    return [];
  }
}

//GET BY
Future<UsersModel> getUserById(String id) async {

  if (kDebugMode) {print("· Obteniendo usuarios por ID");}

  QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
      .instance
      .collection(COLLECTION_NAME_USERS)
      .where("id", isEqualTo: id)
      .limit(1)
      .get();

  if (snapshot.docs.isEmpty) {
    return UsersModel(); // Devuelve una instancia vacía
  }

  return UsersModel.fromJson(snapshot.docs.first.data());

}