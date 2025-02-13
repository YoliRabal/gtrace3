import 'package:gtrace3/config/imports.dart';

Future<UserCredential?> firebaseLogin(BuildContext context, String email, String password) async {

  try {

    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.replaceAll(' ', '').toLowerCase(), password: password);

    final user = userCredential.user;

    if (user != null) {

      print("· Actualizando conexiones");
      await updateUserLastConnection(user);

    }

    return userCredential;

  } on FirebaseAuthException catch (e) {

    showFirebaseException(context, e);

  }
  return null;
}

Future<UserCredential?> firebaseRegister(BuildContext context, String email, String password) async {

  try {

    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.replaceAll(' ', '').toLowerCase(), password: password);

    //Guardamos datos del usuario en Firestore
    final user = userCredential.user;

    if (user != null) {

      //CREATE USER
      print("· Creando user en Firebase");
      await saveFirstUser(user).onError((error, stackTrace){

        print("Error creando el usuario");

      });

    }

    return userCredential;

  } on FirebaseAuthException catch (e) {

    showFirebaseException(context, e);

  }

  return null;
}

Future<UserCredential?> firebaseGoogleLogin(BuildContext context) async {


  if (kDebugMode) {print("//// Inicio con Google ////");}

  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  try {

    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

    if (googleSignInAccount != null) {

      if (kDebugMode) {print("· Cuenta google correcta");}

      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential = await auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {

        if (kDebugMode) {print("· Usuario no null");}

        USUARIO = await checkUserExist(user: user);

        if(USUARIO.id.isNotEmpty){

          if (kDebugMode) {print("· Ya existe el usuario");}
          return userCredential;

        }else{

          if (kDebugMode) {print("· No existe aún el usuario");}

          //CREATE ACCOUNT
          await saveFirstUser(user).onError((error, stackTrace){

            print("Error creando el usuario");

          });


        }

      }else{

        goToClear(context, IniciarSesionPage());
        openSnackbar(context, "Error al iniciar sesión", Icons.clear);

      }

      return userCredential;

    }else{

      if (kDebugMode) {print("· (-) Error en la cuenta de Google");}
      openSnackbar(context, "Error al iniciar sesión", Icons.clear);

    }

  } on FirebaseAuthException catch (e) {

    showFirebaseException(context, e);

  }
  return null;
}

Future<UserCredential?> firebaseAppleLogin(BuildContext context) async {
  if (kDebugMode) {
    print("//// Inicio con Apple ////");
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  try {
    // Inicia sesión con Apple
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    if (appleCredential.identityToken != null) {
      if (kDebugMode) {
        print("· Token de Apple recibido correctamente");
      }

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      if(oauthCredential.appleFullPersonName != null){
        onboarding_name.text = oauthCredential.appleFullPersonName!.familyName!;
        FIRSTNAME  = oauthCredential.appleFullPersonName!.familyName!;
      }

      final UserCredential userCredential = await auth.signInWithCredential(oauthCredential);
      final User? user = userCredential.user;

      if (user != null) {
        if (kDebugMode) {
          print("· Usuario no null");
        }

        USUARIO = await checkUserExist(user: user);

        if (USUARIO.id.isNotEmpty) {
          if (kDebugMode) {
            print("· Ya existe el usuario");
          }
          return userCredential;
        } else {
          if (kDebugMode) {
            print("· No existe aún el usuario");
          }

          // Crear cuenta
          await saveFirstUser(user).onError((error, stackTrace) {
            print("Error creando el usuario");
          });
        }
      } else {
        goToClear(context, IniciarSesionPage());
        openSnackbar(context, "Error al iniciar sesión", Icons.clear);
      }

      return userCredential;
    } else {
      if (kDebugMode) {
        print("· (-) Error en la cuenta de Apple");
      }
      openSnackbar(context, "Error al iniciar sesión", Icons.clear);
    }
  } on FirebaseAuthException catch (e) {
    showFirebaseException(context, e);
  } on SignInWithAppleAuthorizationException catch (e) {
    if (kDebugMode) {
      print("· (-) Error de autorización de Apple: ${e.message}");
    }
    openSnackbar(context, "Error al iniciar sesión con Apple", Icons.clear);
  }

  return null;
}



Future<void> logOut() async {

 //await FirebaseMessaging.instance.unsubscribeFromTopic(USUARIO.id);
  await FirebaseAuth.instance.signOut();

}

showFirebaseException(context, e){

  switch (e.code) {
    case "invalid-email":
      openSnackbar(context, "Email no válido, contacta con $EMAILSOPORTE",
          Icons.warning_amber_outlined);
      break;

    case "invalid-custom-token":
      openSnackbar(
          context,
          "Token incorrecto. Ponte en contacto con $EMAILSOPORTE",
          Icons.warning_amber_outlined);
      break;

    case "custom-token-mismatch":
      openSnackbar(
          context,
          "Token incorrecto. Ponte en contacto con $EMAILSOPORTE",
          Icons.warning_amber_outlined);
      break;

    case "operation-not-allowed":
      openSnackbar(context, "No es posible entrar anónimamente",
          Icons.warning_amber_outlined);
      break;

    case "weak-password":
      openSnackbar(context, "Contraseña demasiado débil",
          Icons.warning_amber_outlined);
      break;

    case "user-not-found":
      openSnackbar(
          context,
          "No hay ningún usuario con este email. Regístrate",
          Icons.warning_amber_outlined);
      break;

    case "email-already-in-use":
      openSnackbar(
          context,
          "Ya existe una cuenta con este email. Inicia sesión",
          Icons.warning_amber_outlined);
      break;

    case "invalid-credential":
      openSnackbar(context, "Esta cuenta no existe. Revisa los datos introducidos o crea una nueva", Icons.warning_amber_outlined);
      break;

    case "not-allowed":
      openSnackbar(context, "No es posible iniciar sesión con email",
          Icons.warning_amber_outlined);
      break;

    case "disable":
      openSnackbar(context, "Cuenta suspendida, contacta con $EMAILSOPORTE",
          Icons.warning_amber_outlined);
      break;

    case "invalid":
      openSnackbar(context, "Email no válido, contacta con $EMAILSOPORTE",
          Icons.warning_amber_outlined);
      break;

    case "wrong-password":
      openSnackbar(
          context, "Contraseña incorrecta", Icons.warning_amber_outlined);
      break;

    case "user-disable":
      openSnackbar(context, "Este usuario ha sido deshabilitado",
          Icons.warning_amber_outlined);
      break;

    case "too-many-requests":
      openSnackbar(
          context,
          "Has intentado entrar demasiadas veces, espera unos minutos",
          Icons.warning_amber_outlined);
      break;

    case "account-exist-with-different-credential":
      openSnackbar(context, "Has usado otro tipo de inicio de sesión",
          Icons.warning_amber_outlined);
      break;

    case "invalid-action-code":
      openSnackbar(
          context,
          "Link de registro no válido, contacta con $EMAILSOPORTE",
          Icons.warning_amber_outlined);
      break;

    default:
      openSnackbar(context, "Error en registro, contacta con $EMAILSOPORTE",
          Icons.warning_amber_outlined);
  }


}