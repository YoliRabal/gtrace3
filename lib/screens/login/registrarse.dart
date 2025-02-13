import 'package:gtrace3/config/imports.dart';
import 'package:gtrace3/screens/utils/backgrounds/backgrounds.dart';
import 'package:gtrace3/widgets/logo.dart';

class RegistrarsePage extends StatefulWidget {
  const RegistrarsePage({super.key});

  @override
  State<RegistrarsePage> createState() => _RegistrarsePageState();
}

class _RegistrarsePageState extends State<RegistrarsePage> {

  GlobalKey<ScaffoldState> key = GlobalKey();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();

  bool cargando = false;
  bool aceptado = false;

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

                      TextoExtragrande("Crear cuenta", textAlign: TextAlign.center, maxlines: 5),

                      //TextoBody("Crea tu cuenta en Events", textAlign: TextAlign.center, maxlines: 5),

                      Espacio(ESPACIO_MEDIANO),

                      TextFormFieldCustom(controller: controllerEmail, labelText: "Correo electrónico", errorText: "Introduce un email", textInputType: TextInputType.emailAddress, filled: false,),

                      Espacio(ESPACIO_PEQUENO),

                      TextFormFieldCustom(controller: controllerPassword, labelText: "Contraseña", errorText: "Introduce una contraseña", textInputType: TextInputType.text, password: true, filled: false,),

                      Espacio(ESPACIO_EXTRAPEQUENO),

                      CheckboxPoliticas(
                        function: () {
                          setState(() {
                            aceptado = !aceptado;
                          });
                        },
                        aceptado: aceptado,

                      ),

                      Espacio(ESPACIO_EXTRAPEQUENO),

                      ButtonCustom(
                          texto: "Crear cuenta",
                          onPressed: (){
                            registrarse(password: true);
                          }),

                      Espacio(ESPACIO_MEDIANO),


                      ButtonCustom(
                          onlyText: true,
                          richTexts: [
                            {"": "¿Ya tienes una cuenta? "},
                            {"destacado": "Inicia sesión"}
                          ],
                          onPressed: (){
                            Navigator.pop(context);

                          }),

                      const Divider(),

                      Espacio(ESPACIO_PEQUENO),

                      Row(

                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [

                          Column(

                            children: [

                              ButtonsDown(context,
                                  icon: "",
                                  iconNoColor: "google",

                                  function: (){
                                    registrarse(google: true);
                                  }),

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

                                ButtonsDown(context,
                                    icon: "",
                                    iconNoColor: "apple",
                                    function: (){
                                      //updateStats(view: "entradas_google");
                                      registrarse(apple: true);
                                    }),

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


  registrarse({bool google = false, bool password = false, bool apple = false}) async {



    if(aceptado){

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

        if(controllerEmail.text.isNotEmpty && controllerPassword.text.isNotEmpty && aceptado){

          setState(() {cargando = true;});

          try {

            userCredential = await firebaseRegister(context, controllerEmail.text, controllerPassword.text);

          }catch (error) {

            setState(() {cargando = false;});
            print(error);

          }

        }else{

          if(controllerEmail.text.isEmpty){

            controllerEmail.text = " ";
            controllerEmail.clear();

          }

          if(controllerPassword.text.isEmpty){

            controllerPassword.text = " ";
            controllerPassword.clear();

          }

          if(!aceptado){

            openSnackbar(
                context,
                "Debes aceptar los términos y condiciones",
                Icons.warning_amber_outlined);

          }



        }

      }

      //COMPROBAMOS CREDENCIALES
      if(userCredential==null){

        print("Error en las credenciales");
        setState(() {cargando = false;});

      }else{

        if(mounted){
          await checkUser(context: context, user: userCredential.user);
        }

      }

    }else{

      openSnackbar(context, "Debes aceptar los términos y condiciones", Icons.close);

    }



  }

}

