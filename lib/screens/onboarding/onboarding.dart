import 'package:gtrace3/config/imports.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {

  //VARIABLES
  GlobalKey<ScaffoldState> key = GlobalKey();

  int pagina = 0;
  PageController paginasController = PageController(viewportFraction: 1, keepPage: true, initialPage:0);
  int numeroPaginas= 2;

  bool cargando = false;
  bool finished = false;

  bool puedeContinuar = true;


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      key: key,
      extendBody: false,
      extendBodyBehindAppBar: false,

      appBar: PreferredSize(

        preferredSize: const Size(double.infinity, 90),

        child: Visibility(

          visible: !cargando,
          child: pagina != 0
              ? AnimatedContainer(

              duration: const Duration(milliseconds: 500),
              height: 90,
              padding: PADDING,
              alignment: Alignment.bottomCenter,

              child: Container(

                height: 8,
                child: LinearProgressIndicator(

                  value: pagina/(numeroPaginas+1),
                  backgroundColor: COLOR_BORDER,
                  borderRadius: BorderRadius.circular(100),

                ),
              )

          )
              : Espacio(90),

        )

      ),

      bottomNavigationBar: Visibility(

        visible: !cargando,
        child: pagina != 0
            ? Container(

          height: 130,
          padding: PADDING,

          child: Column(

            children: [

              Row(

                children: [

                  Visibility(

                    visible: pagina!=0,

                    child: Expanded(

                      child: ButtonCustom(
                          texto: "Atras",

                          textColor: COLOR_TEXT,
                          border: true,
                          borderColor: COLOR_TEXT,
                          onPressed: (){
                            atras();
                          }),

                    ),

                  ),

                  Visibility(

                    visible: pagina!=0,

                    child: Espacio(ESPACIO_PEQUENO),

                  ),

                  Expanded(

                    child: ButtonCustom(
                        texto: "Continuar",
                        color: puedeContinuar ? COLOR_ACCENT : COLOR_ACCENT.withOpacity(0.3),
                        onPressed: (){
                          siguiente();
                        }),

                  )

                ],

              ),

              Espacio(ESPACIO_MEDIANO),

            ],

          ),

        )
            : Espacio(130)

      ),

      body: Container(

        child: Stack(

          fit: StackFit.expand,

          children: [

            const SafeArea(

              child: BackgroundAnimated(),

            ),

            //DATOS
            SafeArea(

              child:  PageView(


                allowImplicitScrolling: false,
                physics: const NeverScrollableScrollPhysics(),

                controller: paginasController,
                children: [

                  bienvenida(context, function: () {setState(() {siguiente();});}),

                  onboarding_datos(function: () {setState(() {siguiente();});}),

                  onboarding_foto(function: (){setState(() {});}),


                ],

              ),

            ),

            //CARGANDO
            Visibility(

                visible: cargando && !finished,
                child: Container(

                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: COLOR_BACKGROUND,
                  child: loadingOnBoarding(context),
                )

            ),

          ],

        ),

      )

    );

  }


  //PAGEVIEW
  siguiente() async {

    print("On boarding " +  pagina.toString());
    bool activo = false;

    switch(pagina){

      case 1:
        if(onboarding_name.text.isEmpty){
          openSnackbar(context, "Debes indicar tu nombre", Icons.clear);
        }else{
          activo = true;
        }

      case 2:
        guardarDatos();
        break;

      default:
        activo = true;
        break;

    }

    if(activo){

      if(pagina<numeroPaginas){
        pagina++;
      }else{
        pagina = numeroPaginas;
      }
      paginasController.animateToPage(pagina, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
      setState(() { });

    }


  }

  atras() async {

    pagina--;
    paginasController.animateToPage(pagina, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    setState(() {});

  }


  //SAVEDATA
  guardarDatos() async {

    setState(() {cargando = true;});

    //Imagen
    if(onboarding_image.dataUint8List != null){
      USUARIO.image = await uploadFileModal(onboarding_image);
    }else{
      USUARIO.image = DEFAULT.image_profile;
    }

    USUARIO.name = onboarding_name.text;
    USUARIO.bio = onboarding_bio.text;
    USUARIO.onboarding = true;

    await updateUser(USUARIO);

    goToClear(context, const HomePage());


  }


}



