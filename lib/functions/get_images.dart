import 'package:gtrace3/config/imports.dart';

pressedImage(
    context,
    {double cropResolution = 16 / 9,
      bool isCircular = false,
      required Function(FileModel)? onFinish}) async {

  getImage().then((value) {
    // Verifica que el valor no sea null y que dataUint8List contenga datos
    if (value.dataUint8List != null && value.dataUint8List!.isNotEmpty) {

      FileModel file = value;
      onFinish!(FileModel(dataUint8List: file.dataUint8List));

      /*
      goTo(context, CropPage(
          filemodel: file,
          resolution: isCircular ? 1 : cropResolution,
          isCircular: isCircular,
          onFinish: (bytes, path) {
            onFinish!(FileModel(dataUint8List: bytes));
            Navigator.pop(context);
          },
        ),
      );
       */

    }

  });
}

