import 'package:flutter/material.dart';
import 'widgets/cabecera_widget.dart';
import 'widgets/imagen_widget.dart';
import 'widgets/descripcion_widget.dart';
import 'widgets/horario_widget.dart';
import 'widgets/ruta_widget.dart';
import 'widgets/botonreserva_widget.dart';
import 'widgets/espacio.dart';
import 'package:gtrace3/config/theme/theme.dart';

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
            EspacioFull(size: 10),
            HorarioWidget(),
            EspacioFull(size: 20),
            RutaWidget(),
            EspacioFull(size: 20),
            BotonreservaWidget(),
          ],
        ),
      ),
    );
  }
}
