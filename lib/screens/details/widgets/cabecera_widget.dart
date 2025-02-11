import 'package:flutter/material.dart';
import 'package:gtrace3/config/styles/text_styles.dart';
import 'package:gtrace3/config/theme/theme.dart';

class CabeceraWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  CabeceraWidget({Key? key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: COLOR_BACKGROUND,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Row(
        children: [
          ClipOval(
            child: Image.network(
              'https://img.freepik.com/vector-premium/icono-carreras-coches-carreras-vehiculos-antiguos-paseos-velocidad-simbolo-vector-motores-antiguos-rally-coches-deportivos-campeonato-carreras-velocidad-o-arrastre-icono-club-deportivo_8071-5896.jpg',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "GT Race Marbella",
                style: estiloBody(fontWeight: TEXTO_NEGRITA),
              ),
              Text(
                "@GTRaceMarbella",
                style: estiloBody(color: COLOR_SUBTEXT),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
