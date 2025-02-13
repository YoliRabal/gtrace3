import 'package:gtrace3/config/imports.dart';

class OlvidadoPage extends StatefulWidget {

  const OlvidadoPage({super.key});

  @override
  State<OlvidadoPage> createState() => _OlvidadoPageState();
}

class _OlvidadoPageState extends State<OlvidadoPage> {


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

          decoration: BoxDecoration(
            color: COLOR_BACKGROUND,
            borderRadius: BorderRadiusAll()
          ),

          child: ListView(

            padding: PADDING,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),

            children: [

              Espacio(ESPACIO_EXTRAGRANDE),

              TextoTitulo("¿Has olvidado tu contraseña?", textAlign: TextAlign.center, maxlines: 5),

              Espacio(ESPACIO_PEQUENO),

              TextoBody("Indícanos tu email y te enviaremos un email para que la puedas recuperar", maxlines: 10, textAlign: TextAlign.center),

              Espacio(ESPACIO_MEDIANO),

              TextFormFieldCustom(controller: controllerEmail, labelText: "Correo electrónico", errorText: "Introduce un email", textInputType: TextInputType.emailAddress, filled: false,),

              Espacio(ESPACIO_MEDIANO),

              ButtonCustom(texto: "Recuperar contraseña", onPressed: (){

                recuperarPass();

              }),

              Espacio(ESPACIO_EXTRAGRANDE),

              Espacio(MediaQuery.of(context).viewInsets.bottom),





            ],

          ),


        )

      ],
    );


  }


  recuperarPass(){

    if(controllerEmail.text.isNotEmpty){

      setState(() {cargando = true;});


      try{

        FirebaseAuth.instance.sendPasswordResetEmail(email: controllerEmail.text).whenComplete((){

          setState(() {cargando = false;});
          openSnackbar(context, "Email de recuperación enviado", Icons.email_outlined, color: COLOR_ACCENT, error: false);
          Navigator.pop(context);


        });


      }catch(error){

        print(error);
        setState(() {cargando = false;});

      }

    }else{

      openSnackbar(context, "Introduce un email", Icons.email_outlined);

    }


  }

}
