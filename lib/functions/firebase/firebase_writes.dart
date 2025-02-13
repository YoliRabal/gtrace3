import 'package:gtrace3/config/imports.dart';

//USERS
Future saveFirstUser(User user) async {

  if (kDebugMode) {print("· Creando usuario");}

  try{

    // Obtén una referencia a la colección 'Contacts' en Firestore
    DocumentReference documentReference = FirebaseFirestore.instance.collection("Users").doc(user.uid);

    UsersModel userModel = UsersModel(
        id: user.uid,
        email: user.email ?? "",
        emailVerified : user.emailVerified,
        tokens: [user.uid],
    );

    await documentReference.set(userModel.toJson());

    if (kDebugMode) {print("·(✅) Usuario creado con exito");}

  }catch(e){

    if (kDebugMode) {print("❌ Error creando el usuario: $e");}

  }

}
