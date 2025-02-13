import 'package:gtrace3/config/imports.dart';

Future checkUser({required User? user, required BuildContext context}) async {

  if (kDebugMode) {print("//// Comprobando usuario ////");}

  //Usuario no existe
  if (user == null) {

    if (kDebugMode) {print("· No hay usuario");}
    goToClear(context, IniciarSesionPage());

  }

  //Usuario existe
  else {

    USUARIO = await getUserById(user.uid);

    if(USUARIO.id.isNotEmpty){

      if (kDebugMode) {print("· ID correcto");}

      //ENVIAMOS EMAIL DE VERIFICACION
      if(user.emailVerified == false){

        if (kDebugMode) {print("· (-) Email no verificado");}
        //await FirebaseAuth.instance.currentUser!.sendEmailVerification();

      }

      if (USUARIO.onboarding) {

        if (kDebugMode) {print("· Onboarding finalizado");}

        //SI TUTORIAL
        if(USUARIO.tutorial){

          if (kDebugMode) {print("· Tutorial realizado");}
          if (!context.mounted) return;
          goToClear(context, HomePage());


        }else{

          if (kDebugMode) {print("· (-) No tutorial");}
          if (!context.mounted) return;
          goToClear(context, HomePage());

        }

      } else {

        //TODO REVISAR
        if (kDebugMode) {print("· (-) No onboarding");}
        if (!context.mounted) return;
        goToClear(context, OnBoardingPage());



      }


    }else{

      if (kDebugMode) {print("· (-) ID incorrecto");}
      goToClear(context, IniciarSesionPage());

    }


  }



}

Future checkUserExist({required User user}) async {

  QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
      .instance
      .collection(COLLECTION_NAME_USERS)
      .where("email", isEqualTo: user.email)
      .limit(1)
      .get();

  if (snapshot.docs.isEmpty) {
    return UsersModel(); // Devuelve una instancia vacía
  }

  return UsersModel.fromJson(snapshot.docs.first.data());

}