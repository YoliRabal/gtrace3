import 'package:gtrace3/config/imports.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CabeceraWidget(),
      body: Container(
        color: COLOR_BACKGROUND,
        child: ListView(
          children: [

            ImagenWidget(),

            DescripcionWidget(),

            Espacio(ESPACIO_PEQUENO),

            HorarioWidget(),

            Espacio(ESPACIO_MEDIANO),

            RutaWidget(),

            Espacio(ESPACIO_MEDIANO),

            BotonreservaWidget(),

          ],
        ),
      ),
    );
  }
}
