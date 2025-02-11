import 'package:flutter/material.dart';
import 'package:gtrace3/config/styles/text_styles.dart';
import 'package:gtrace3/config/theme/theme.dart';

class HorarioWidget extends StatelessWidget {
  const HorarioWidget({super.key});

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
                    Text(
                      "18:00",
                      style: TextStyle(
                          color: COLOR_TEXT,
                          fontSize: 22,
                          fontWeight: TEXTO_NEGRITA),
                    ),
                    Text(
                      "Hora de inicio",
                      style: estiloSmall(color: COLOR_SUBTEXT),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "18 Abril",
                      style: TextStyle(
                          color: COLOR_TEXT,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "2025",
                      style: estiloSmall(color: COLOR_SUBTEXT),
                    ),
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