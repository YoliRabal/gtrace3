import 'package:gtrace3/config/imports.dart';

Future updateUserLastConnection(User user) async {

  try{

    // Obtén una referencia a la colección 'Contacts' en Firestore
    await COLLECTION_USERS.doc(user.uid).update({

      "lastconnection": DateTime.now()

    });

  }catch(e){

    print("Error: $e");

  }

}

//USER
Future updateUser(UsersModel userModel) async {

  try{

    // Obtén una referencia a la colección 'Contacts' en Firestore
    await COLLECTION_USERS.doc(USUARIO.id).update(userModel.toJson());


  }catch(e){

    print("Error: $e");

  }

}

//ADD EVENT COUNT
Future addEventCount({bool decrement = false}) async {

  try{

    DocumentReference documentReference = COLLECTION_USERS.doc(USUARIO.id);
    await documentReference.update({
      "events_published": FieldValue.increment(decrement ? -1 : 1)
    });

    if (kDebugMode) {print("·(✅) Petición de eliminación creada con exito");}

  }catch(e){

    if (kDebugMode) {print("Error: $e");}

  }


}

//ADD RESERVA COUNT
Future addReservaCount({bool decrement = false}) async {

  try{

    DocumentReference documentReference = COLLECTION_USERS.doc(USUARIO.id);
    await documentReference.update({
      "events_booked": FieldValue.increment(decrement ? -1 : 1)
    });

    if (kDebugMode) {print(" · Contador de reservas (+1)");}

  }catch(e){

    if (kDebugMode) {print("Error: $e");}

  }

}
