import 'package:gtrace3/config/imports.dart';
import 'package:gtrace3/models/feed/feed_model.dart';

class DescripcionWidget extends StatelessWidget {
  final FeedModel feedModel;
  const DescripcionWidget({super.key, required this.feedModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sobre el evento",
            style: estiloSubtitulo(
              fontWeight: TEXTO_NEGRITA,
            ),
          ),
          SizedBox(height: 5),
          TextoBody(feedModel.descripcionLarga,
          maxlines: null,
          textOverflow: TextOverflow.visible),
            //'"Embárcate en un emocionante recorrido por carretera desde Málaga hasta Cádiz, explorando la impresionante Costa del Sol. La ruta incluye paradas clave en destinos como Torremolinos y Ronda, donde podrás disfrutar de paisajes únicos, gastronomía local y puntos de interés histórico. Con una duración aproximada de 3 horas y 45 minutos, esta experiencia combina comodidad y aventura, ofreciéndote una forma perfecta de descubrir el sur de España en tu coche. ¡Prepárate para una jornada inolvidable en la carretera!"',
        ],
      ),
    );
  }
}