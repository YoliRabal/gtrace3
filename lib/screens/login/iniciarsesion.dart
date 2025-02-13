import 'package:gtrace3/config/imports.dart';
import 'package:gtrace3/screens/utils/backgrounds/backgrounds.dart';
import 'package:gtrace3/widgets/logo.dart';

class IniciarSesionPage extends StatefulWidget {
  const IniciarSesionPage({super.key});

  @override
  State<IniciarSesionPage> createState() => _IniciarSesionPageState();
}

class _IniciarSesionPageState extends State<IniciarSesionPage> {

  GlobalKey<ScaffoldState> key = GlobalKey();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();

  bool cargando = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {

    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: COLOR_BACKGROUND,

      extendBody: true,

        body: Loading(

          loading: cargando,

          child: Stack(

            children: [

              BackgroundAnimated(),

              Center(

                child: ListView(

                  padding: PADDING,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),

                  children: [

                    logo(size: 120),

                    TextoExtragrande("Iniciar sesión", textAlign: TextAlign.center, maxlines: 5),

                    //TextoBody("Inicia sesión en Events", textAlign: TextAlign.center, maxlines: 5),

                    Espacio(ESPACIO_MEDIANO),

                    TextFormFieldCustom(controller: controllerEmail, labelText: "Correo electrónico", errorText: "Introduce un email", textInputType: TextInputType.emailAddress, filled: false,),

                    Espacio(ESPACIO_PEQUENO),

                    TextFormFieldCustom(controller: controllerPassword, labelText: "Contraseña", errorText: "Introduce una contraseña", textInputType: TextInputType.text, password: true, filled: false,),

                    Espacio(ESPACIO_EXTRAPEQUENO),

                    ButtonCustom(
                        texto: "¿Has olvidado tu contraseña?",
                        onlyText: true,
                        onPressed: (){
                          openBottomSheet(context, const OlvidadoPage(), opacity: 0.5);
                        }),

                    Espacio(ESPACIO_EXTRAPEQUENO),

                    ButtonCustom(
                        texto: "Iniciar sesión",
                        onPressed: (){
                          iniciarSesion(password: true);
                        }),

                    Espacio(ESPACIO_MEDIANO),

                    ButtonCustom(
                        onlyText: true,
                        richTexts: [
                          {"": "¿Aún no tienes cuenta? "},
                          {"destacado": "Crear cuenta"}
                        ],
                        onPressed: (){
                          goTo(context, const RegistrarsePage());
                        }),

                    const Divider(),

                    Espacio(ESPACIO_PEQUENO),

                    Row(

                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [

                        Column(

                          children: [

                            ButtonCustomIcon(

                              size: 65,
                              iconSvgNoColor: "google",
                              padding: 20,
                              onPressed: () {iniciarSesion(google: true);},

                            ),

                            Espacio(ESPACIO_EXTRAPEQUENO),

                            TextoCaption("Google")


                          ],
                        ),

                        Espacio(ESPACIO_PEQUENO),

                        Visibility(

                          visible: Platform.isIOS,
                          child: Espacio(ESPACIO_PEQUENO),

                        ),

                        Visibility(

                          visible: Platform.isIOS,
                          child:  Column(

                            children: [

                              ButtonCustomIcon(

                                size: 65,
                                iconSvg: "apple",
                                padding: 20,
                                onPressed: () {iniciarSesion(google: true);},

                              ),

                              Espacio(ESPACIO_EXTRAPEQUENO),

                              TextoCaption("Apple")


                            ],
                          ),

                        ),


                      ],

                    ),

                  ],

                ),

              )

            ],
          )

        )


    );

  }


  //FUNCTION
  iniciarSesion({bool google = false, bool password = false, bool apple = false}) async {

    UserCredential? userCredential;

    //GOOGLE SIGN IN
    if(google){

      setState(() {cargando = true;});

      try{

        userCredential = await firebaseGoogleLogin(context);

      }catch (error) {

        setState(() {cargando = false;});
        print(error);

      }


    }

    //APPLE SIGN IN
    if(apple){

      setState(() {cargando = true;});

      try{

        userCredential = await firebaseAppleLogin(context);

      }catch (error) {

        setState(() {cargando = false;});
        print(error);

      }


    }

    //PASSWORD
    if(password){

      if(controllerEmail.text.isNotEmpty && controllerPassword.text.isNotEmpty){

        setState(() {cargando = true;});

        try {

          userCredential = await firebaseLogin(context, controllerEmail.text, controllerPassword.text);


        }catch (error) {

          setState(() {cargando = false;});
          print(error);

        }

      }else{

        if(controllerEmail.text.isEmpty){
          setState(() {
            controllerEmail.text = " ";
            controllerEmail.clear();
          });
        }

        if(controllerPassword.text.isEmpty){
          setState(() {
            controllerPassword.text = " ";
            controllerPassword.clear();
          });
        }


      }

    }

    //GENERATE CREDENTIALS
    if(userCredential==null){

      print("Error en las credenciales");
      setState(() {cargando = false;});

    } else{

      if(mounted){
        await checkUser(context: context, user: userCredential.user);
      }

    }


  }

}

