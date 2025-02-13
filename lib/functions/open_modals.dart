import 'package:gtrace3/config/imports.dart';

Future openBottomSheetString(BuildContext context, Widget widget) async {
  return showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      barrierColor: Colors.black.withOpacity(0.1),
      backgroundColor: Colors.transparent,
      elevation: 50,

      builder: (context) {
        return widget;
      }
  ).then((value){

  });
}


//BOTTOMSHEET
openBottomSheet(BuildContext context, Widget widget, {bool noBarrierColor = false, Function()? onBack, double opacity = 0.1}) async {

  showModalBottomSheet(

      context: context,
      isScrollControlled: true,
      backgroundColor: COLOR_BACKGROUND_SECONDARY.withOpacity(0),
      barrierColor: Colors.black.withOpacity(0.1),
      elevation: 0,
      builder: (context) {
        return widget;
      }
  ).then((value){

    if(onBack!=null){
      onBack();
    }

  });


}

openBottomNoBack(BuildContext context, Widget widget, Function()? function) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: false,
    barrierColor: Colors.black.withOpacity(0.1),
    backgroundColor: Colors.transparent,
    elevation: 50,
    builder: (BuildContext context) {
      return PopScope(
        onPopInvoked: (value) async {
          // Impide que se realice "pop" al presionar el botón de atrás del teclado
          return;
        },
        child: Builder(
          builder: (context) {
            return widget;
          },
        ),
      );
    },
  ).then((value){

    if(function!=null){
      function();
    }

  });
}

//DIALOG
openDialog(BuildContext context, StatefulWidget widget, {Function()? function}) async {

  showDialog(

      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.2),
      context: context,

      builder: (BuildContext context) {

        return widget;

      }).then((value){

    if(function!=null){
      function();
    }

  });

}

//SNACKBAR
openSnackbar(BuildContext context, String texto, IconData icono, {bool error = true, Color color = Colors.pink, Color background = COLOR_BACKGROUND, Color colorText = COLOR_TEXT}){

  ScaffoldMessenger.of(context).showSnackBar(snackbar(color== Colors.pink ? error ? COLOR_ERROR : COLOR_ACCENT : color,texto, icono, background: background, colorText: colorText));

}