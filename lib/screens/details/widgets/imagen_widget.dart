import 'package:gtrace3/config/imports.dart';
import 'package:gtrace3/models/feed/feed_model.dart';

class ImagenWidget extends StatelessWidget {
  final FeedModel feedModel;
  const ImagenWidget({super.key, required this.feedModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(feedModel.imagen,
          width: double.infinity,
          height: 350,
          fit: BoxFit.cover,
        ),
        Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextoTitulo(feedModel.titulo),
              SizedBox(height: 4),
              TextoBody(feedModel.descripcion,
                  maxlines: null,
                  textOverflow: TextOverflow.visible),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.location_on, color: COLOR_ACCENT, size: 14),
                  SizedBox(width: 2),
                  TextoSmall(feedModel.ubicacion),
                  SizedBox(width: 10),
                  Icon(Icons.calendar_today, color: COLOR_ACCENT, size: 14),
                  SizedBox(width: 2),
                  TextoSmall(feedModel.fecha),
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
                    child: TextoBody(feedModel.categoria1,
                    color: Colors.black),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: COLOR_ACCENT,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextoBody(feedModel.categoria2,
                        color: Colors.black),
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