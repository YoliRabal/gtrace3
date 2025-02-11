import 'package:gtrace3/config/imports.dart';
import 'package:gtrace3/models/feed/feed_model.dart';

class DetailPage extends StatelessWidget {

  final FeedModel feedModel;
  const DetailPage({super.key, required this.feedModel});

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
