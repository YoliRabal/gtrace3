import 'package:gtrace3/config/imports.dart';

Future<FileModel> getImage({bool galeria = true}) async {

  final picker = ImagePicker();
  FileModel fileModal = FileModel(dataUint8List: Uint8List(0));

  final pickedFile = await picker.pickImage(source: galeria ? ImageSource.gallery : ImageSource.camera, maxHeight: 650, maxWidth: 650);

  if(pickedFile!=null){

    fileModal = FileModel(dataUint8List: await pickedFile.readAsBytes());

  }

  return fileModal;

}

Future<String> uploadFileModal(FileModel filemodal, {String coleccion = ""}) async {

  DateTime ahora = DateTime.now();
  String metadatos = "";

  String url = "";
  late Reference ref;

  metadatos = "image/jpg";
  ref = FirebaseStorage.instance.ref().child(coleccion).child('images').child(ahora.toString());

  try {

    SettableMetadata metadata = SettableMetadata(contentType: metadatos,);
    await ref.putData(filemodal.dataUint8List!, metadata);
    url = await ref.getDownloadURL();

  } on FirebaseException catch (e) {

    print(e.message);

  }
  return url;
}

Future<String> uploadVCF_Storage(Uint8List uint8list) async {

  DateTime ahora = DateTime.now();
  String metadatos = "";

  String url = "";
  late Reference ref;

  metadatos = "vcf";
  ref = FirebaseStorage.instance.ref().child("Contacts").child('vcf').child(ahora.toString());

  try {

    SettableMetadata metadata = SettableMetadata(contentType: metadatos,);
    await ref.putData(uint8list, metadata);
    url = await ref.getDownloadURL();

  } on FirebaseException catch (e) {

    print(e.message);

  }
  return url;
}

Future<String> uploadVideoToStorage(Uint8List videoBytes) async {
  // Obtener la fecha y hora actual para generar un nombre único para el archivo
  DateTime now = DateTime.now();
  String fileName = 'video_${now.toIso8601String()}.mp4';  // Nombre del archivo

  String url = "";
  late Reference ref;

  try {
    // Creamos la referencia en Firebase Storage
    ref = FirebaseStorage.instance.ref().child("videos").child(fileName);

    // Subir el archivo al Storage con los bytes y metadatos
    SettableMetadata metadata = SettableMetadata(
      contentType: 'video/mp4',
    );

    await ref.putData(videoBytes, metadata);  // Subimos los datos
    url = await ref.getDownloadURL();  // Obtenemos la URL del video subido

  } on FirebaseException catch (e) {
    print("Error al subir el video: ${e.message}");
  }

  return url;  // Devolvemos la URL de descarga
}



Future<String> uploadSVGAsset(String assetPath, {String collection = ""}) async {
  DateTime now = DateTime.now();
  String metadata = "image/svg+xml"; // Tipo de contenido para SVG
  String url = "";
  late Reference ref;

  // Crear una referencia en Firebase Storage
  ref = FirebaseStorage.instance.ref().child(collection).child('images').child(now.toString());

  try {
    // Cargar el contenido del archivo SVG desde el asset
    String svgContent = await rootBundle.loadString("assets/socials/$assetPath.svg");

    // Subir el contenido del archivo SVG a Firebase Storage
    SettableMetadata metadataObj = SettableMetadata(contentType: metadata);
    await ref.putString(svgContent, metadata: metadataObj);

    // Obtener la URL de descarga del archivo subido
    url = await ref.getDownloadURL();
  } catch (e) {
    // Manejar cualquier error que pueda ocurrir durante el proceso de carga
    print("Error al subir el archivo SVG: $e");
  }

  return url;
}
