import 'package:flutter/material.dart';
import 'package:gtrace3/config/styles/text_styles.dart';
import 'package:gtrace3/config/theme/theme.dart';

class RutaWidget extends StatelessWidget {
  const RutaWidget({super.key});

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
                        Text("Calle la Esperanza 23, Marbella",
                            style: estiloSmall(color: COLOR_SUBTEXT)),
                      ],
                    ),
                    Text("20:00 | 18 Abril",
                        style: estiloBody(fontWeight: TEXTO_NEGRITA)),
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
                        Text("120 Km", style: estiloBody(fontWeight: TEXTO_NEGRITA)),
                      ],
                    ),
                    Column(
                      children: [
                        Text("1h Aprox.", style: estiloBody(fontWeight: TEXTO_NEGRITA)),
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
                        Text("Calle la Esperanza 23, Marbella",
                            style: estiloSmall(color: COLOR_SUBTEXT)),
                      ],
                    ),
                    Text("23:00 | 18 Abril",
                        style: estiloBody(fontWeight: TEXTO_NEGRITA)),
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
