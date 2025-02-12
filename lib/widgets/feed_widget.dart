import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gtrace3/config/imports.dart';
import 'package:gtrace3/functions/move_to.dart';
import 'package:gtrace3/models/feed/feed_model.dart';
import 'package:gtrace3/screens/details/detailspage.dart';

class FeedWidget extends StatelessWidget {

  final FeedModel feedModel;
  const FeedWidget({super.key, required this.feedModel});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: (){
        goTo(context, DetailPage(feedModel: feedModel));
      },

      child: Container(
        color: Colors.black,
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [

                ClipOval(
                  child: Image.network(
                    'https://img.freepik.com/vector-premium/icono-carreras-coches-carreras-vehiculos-antiguos-paseos-velocidad-simbolo-vector-motores-antiguos-rally-coches-deportivos-campeonato-carreras-velocidad-o-arrastre-icono-club-deportivo_8071-5896.jpg',
                    width: 50,
                    height: 50,
                  ),
                ),

                Espacio(ESPACIO_PEQUENO),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "GT Race Marbella",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "@GTRaceMarbella",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),

              ],
            ),

            Espacio(ESPACIO_PEQUENO),

            Stack(
              children: [
                Image.network(feedModel.imagen,
                width: double.infinity,
                fit: BoxFit.cover,
                ),
                Positioned(
                  top: 10,
                  left:10,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2),
                    color: Colors.orange,
                    child: TextoCaption(feedModel.categoria1),
                  ),
                ),
              ],
            ),

            Espacio(ESPACIO_PEQUENO),

            Row(

              children: [

                Icon(Icons.location_on, color: Colors.orange, size: 16),

                Espacio(ESPACIO_PEQUENO),

                TextoCaption(feedModel.ubicacion),

                Espacio(ESPACIO_PEQUENO),

                Icon(Icons.calendar_today, color: Colors.orange, size: 16),

                Espacio(ESPACIO_PEQUENO),

                TextoCaption(feedModel.fecha,),
              ],
            ),

            Espacio(ESPACIO_PEQUENO),

            TextoTitulo(feedModel.titulo),

            Espacio(ESPACIO_EXTRAPEQUENO),

            TextoBody(feedModel.descripcion,
                maxlines: null,
                textOverflow: TextOverflow.visible),

            Espacio(ESPACIO_PEQUENO),

            TextoCaption("Ver más",),

          ],
        ),
      ),

    );

  }

}