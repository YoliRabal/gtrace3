import 'package:gtrace3/config/imports.dart';

Future<bool> openUrl(String url, {bool universal = false}) async {
  try {

    if (!url.startsWith("https://") && !url.startsWith("http://")) {
      url = "https://$url";
    }

    if (!await launchUrl(Uri.parse(url))) {
      return false; // No se pudo abrir la URL
    }
    return true; // La URL se abrió exitosamente
  } catch (e) {
    return false; // Hubo un error al intentar abrir la URL
  }
}
