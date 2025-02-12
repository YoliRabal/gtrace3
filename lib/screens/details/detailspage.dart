import 'package:flutter/material.dart';
import 'package:gtrace3/models/feed/feed_model.dart';
import 'package:gtrace3/config/imports.dart';

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
            ImagenWidget(feedModel: feedModel),
            DescripcionWidget(feedModel: feedModel),
            Espacio(ESPACIO_PEQUENO),
            HorarioWidget(feedModel: feedModel),
            Espacio(ESPACIO_MEDIANO),
            RutaWidget(feedModel: feedModel),
            Espacio(ESPACIO_MEDIANO),
            BotonreservaWidget(),
          ],
        ),
      ),
    );
  }
}
