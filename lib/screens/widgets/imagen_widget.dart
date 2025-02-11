import 'package:flutter/material.dart';
import 'package:gtrace3/config/styles/text_styles.dart';
import 'package:gtrace3/config/theme/theme.dart';

class ImagenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          'https://motor.elpais.com/wp-content/uploads/2023/04/Bugatti-Chiron.jpg',
          width: double.infinity,
          height: 350,
          fit: BoxFit.cover,
        ),
        Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bluewater Parade GT",
                style: estiloTitulo(fontWeight: TEXTO_NEGRITA),
              ),
              SizedBox(height: 4),
              Text(
                "Vente a disfrutar a nuestro Parade de GT Race Marbella",
                style: estiloBody(color: COLOR_SUBTEXT),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.location_on, color: COLOR_ACCENT, size: 14),
                  SizedBox(width: 2),
                  Text("Marbella", style: estiloSmall()),
                  SizedBox(width: 10),
                  Icon(Icons.calendar_today, color: COLOR_ACCENT, size: 14),
                  SizedBox(width: 2),
                  Text("Lunes 28 Abril", style: estiloSmall()),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: COLOR_ACCENT,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "Parade",
                      style: estiloBody(
                        color: Colors.black,
                        fontWeight: TEXTO_NEGRITA,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: COLOR_ACCENT,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "Ruta",
                      style: estiloBody(
                        color: Colors.black,
                        fontWeight: TEXTO_NEGRITA,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
