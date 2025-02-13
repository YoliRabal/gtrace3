import 'package:gtrace3/config/imports.dart';

//GENERAL
String VERSION = "";
String languaje = "es";
String IMAGE_DEFAULT = "https://firebasestorage.googleapis.com/v0/b/citascerebros.appspot.com/o/Perfiles%20Predeterminados%2F2.jpg?alt=media&token=a015ca4b-4a03-4c1b-b076-3126e6688dc5";
String IMAGE_NADA = "";
String ID_SALA_RECHAZO_NOTIFICACIONES = "";
Duration DURATION = Duration(milliseconds: 300);

//MODALS
DefaultModel DEFAULT = DefaultModel();
UsersModel USUARIO = UsersModel();

//FIREBASE REFERENCES
CollectionReference COLLECTION_USERS = FirebaseFirestore.instance.collection(COLLECTION_NAME_USERS);
CollectionReference COLLECTION_FEEDBACK = FirebaseFirestore.instance.collection(COLLECTION_NAME_FEEDBACK);
CollectionReference COLLECTION_EMPRESAS = FirebaseFirestore.instance.collection(COLLECTION_NAME_EMPRESAS);
CollectionReference COLLECTION_RESPUESTAS = FirebaseFirestore.instance.collection(COLLECTION_NAME_RESPUESTAS);
CollectionReference COLLECTION_DELETE = FirebaseFirestore.instance.collection(COLLECTION_NAME_DELETE);

//APPLE
String FIRSTNAME = "";





















//FULLSCREEN
double FROMTOP = 90;


String DOCUMENT_NOCATEGORYNAME = "nocategory";
String SUBCOLLECTION_GROUPS = "Groups";
String SUBCOLLECTION_CONTACTS = "Contacts";



