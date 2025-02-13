import 'package:gtrace3/config/imports.dart';

botonSeleccion({required String title, required Function() onPressed, bool selected = false}){

  return Container(

    height: 55,

    decoration: BoxDecoration(

        border: Border.all(color: selected ? COLOR_ACCENT : COLOR_BORDER, width: selected ? 3 : 1),
        borderRadius: BorderRadius.circular(16)

    ),

    child: TextButton(

        style: estiloTransparente(),

        onPressed: (){
          onPressed();
        },

        child: Container(

          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: PADDING_DOUBLE),

          child: TextoBody(title, textAlign: TextAlign.start, color: selected ? COLOR_ACCENT : COLOR_TEXT, fontWeight: selected ? FontWeight.w700 : FontWeight.normal),
        )

    ),

  );


}