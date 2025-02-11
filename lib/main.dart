import 'package:gtrace3/config/imports.dart';
import 'package:gtrace3/functions/move_to.dart';
import 'package:gtrace3/screens/detailspage.dart';
import 'package:gtrace3/screens/home.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print("Firebase inicializado correctamente ✅");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GTRace',
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    inicializacaion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          goTo(context, const DetailPage());
        },
        child: Container(
          color: Colors.black,
          child: ListView(
            children: [

              TextoExtragrande("Hola")
            ],
          ),
        ),
      ),
    );
  }


  inicializacaion(){

    Future.delayed(Duration(seconds: 2), () {});

    goToClear(context, HomePage());

  }

}