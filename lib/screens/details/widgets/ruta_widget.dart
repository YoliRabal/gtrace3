import 'package:gtrace3/config/imports.dart';
import 'package:gtrace3/models/feed/feed_model.dart';

class RutaWidget extends StatelessWidget {
  final FeedModel feedModel;
  const RutaWidget({super.key, required this.feedModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Ruta",
            style: estiloSubtitulo(fontWeight: TEXTO_NEGRITA),
          ),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: COLOR_BACKGROUND_SECONDARY,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.location_on, color: COLOR_ACCENT, size: 14),
                            SizedBox(width: 4),
                            Text("Punto de salida",
                                style: estiloBody(fontWeight: TEXTO_NEGRITA)),
                          ],
                        ),
                        SizedBox(height:5),
                        TextoSmall(feedModel.puntoSalida)
                      ],
                    ),
                    TextoSmall(feedModel.infoSalida)
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  height: 30,
                  width: 2,
                  color: COLOR_ACCENT,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.route, color: COLOR_ACCENT, size: 14),
                        SizedBox(width: 4),
                        Text("Ruta", style: estiloBody(fontWeight: TEXTO_NEGRITA)),
                      ],
                    ),
                    Column(
                      children: [
                        TextoSmall(feedModel.distancia),
              //"120 Km"
                      ],
                    ),
                    Column(
                      children: [
                        TextoSmall(feedModel.duracion),
              //"1h Aprox.
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  height: 30,
                  width: 2,
                  color: COLOR_ACCENT,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.flag, color: COLOR_ACCENT, size: 14),
                            SizedBox(width: 4),
                            Text("Llegada",
                                style: estiloBody(fontWeight: TEXTO_NEGRITA)),
                          ],
                        ),
                        SizedBox(height:5),
                        TextoSmall(feedModel.puntoLlegada),
              //"Calle la Esperanza 23, Marbella"
                      ],
                    ),
                    TextoSmall(feedModel.infoLlegada),
              //"23:00 | 18 Abril"
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
