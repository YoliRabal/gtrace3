import 'package:gtrace3/config/imports.dart';

class BotonreservaWidget extends StatelessWidget {

  const BotonreservaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 130),
          decoration: BoxDecoration(
            color: COLOR_ACCENT,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            "Reservar",
            style: estiloSubtitulo (),
            ),
          ),
        SizedBox(height: 5),
        Text(
          "42 asistentes confirmados",
          style: estiloSmall(color: COLOR_SUBTEXT),
        ),
      ],
    );
  }
}