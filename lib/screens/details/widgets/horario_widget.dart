import 'package:gtrace3/config/imports.dart';
import 'package:gtrace3/models/feed/feed_model.dart';


class HorarioWidget extends StatelessWidget {
  final FeedModel feedModel;
  const HorarioWidget({super.key, required this.feedModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Horario",
            style: estiloSubtitulo(
              fontWeight: TEXTO_NEGRITA,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: COLOR_BACKGROUND_SECONDARY,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextoTitulo(feedModel.horaInicio),
                      //"18:00",
                    Text(
                      "Hora de inicio",
                      style: estiloSmall(color: COLOR_SUBTEXT),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextoTitulo(feedModel.diaMes),
                      //"18 Abril",
                    TextoCaption(feedModel.anio),
                      //"2025",
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