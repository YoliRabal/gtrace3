import 'package:gtrace3/config/imports.dart';

class VerificarPage extends StatefulWidget {

  const VerificarPage({super.key});

  @override
  State<VerificarPage> createState() => _VerificarPageState();
}

class _VerificarPageState extends State<VerificarPage> {


  GlobalKey<ScaffoldState> key = GlobalKey();
  bool cargando = false;

  final controllerEmail = TextEditingController();

  ScrollController scrollController = ScrollController();


  @override
  void initState() {
    super.initState();

    WidgetsFlutterBinding.ensureInitialized();

  }

  @override
  void dispose() {

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {


    return Wrap(

      children: [

        Container(

          color: COLOR_BACKGROUND_SECONDARY,

          child: ListView(

            padding: PADDING,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),

            children: [

              Espacio(ESPACIO_EXTRAGRANDE),

              TextoExtragrande("Verificar email", textAlign: TextAlign.center, maxlines: 5),

              Espacio(ESPACIO_PEQUENO),

              TextoBody("Te hemos enviado un email para verificar tu correo electrónico", maxlines: 10, textAlign: TextAlign.center),

              Espacio(ESPACIO_MEDIANO),

              ButtonCustom(texto: "Continuar", onPressed: (){

                Navigator.pop(context);

              }),

              Espacio(ESPACIO_EXTRAGRANDE),

              Espacio(MediaQuery.of(context).viewInsets.bottom),


            ],

          ),

        )

      ],

    );

  }

}
