import 'package:gtrace3/config/imports.dart';

class CheckboxPoliticas extends StatefulWidget {

  bool aceptado;
  final void Function() function;

  @override
  CheckboxPoliticasState createState() => CheckboxPoliticasState();

  CheckboxPoliticas({super.key, required this.function , required this.aceptado});

}

class CheckboxPoliticasState extends State<CheckboxPoliticas> {


  @override
  Widget build(BuildContext context) {

    return SizedBox(

      child: Row(

        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,

        children: <Widget>[


          Checkbox(

            activeColor: COLOR_ACCENT ,
            focusColor: COLOR_BACKGROUND,
            checkColor: COLOR_BACKGROUND,

            side: const BorderSide(color: COLOR_ACCENT),

            value: widget.aceptado,

            onChanged: (value) {

              setState(() {

                widget.aceptado = !widget.aceptado;

                widget.function();

              });

            },
          ),

          Expanded(

            child: RichText(
              maxLines: 5,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                style: estiloCaption(),
                children: <TextSpan>[

                  const TextSpan(text: 'Confirmas que aceptas nuestros '),

                  TextSpan(
                      text: 'Términos y Condiciones',
                      style: estiloCaption(color: COLOR_ACCENT),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {

                          openUrl(URL_CONDICIONES);

                        }),

                  const TextSpan(text: ' y nuestra '),

                  TextSpan(
                      text: 'Política de Privacidad.',
                      style: estiloCaption(color: COLOR_ACCENT),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {

                          openUrl(URL_POLITICAS);

                        }),
                ],
              ),
            ),
          ),

        ], //<Widget>[]
      ),
    );

  }

}