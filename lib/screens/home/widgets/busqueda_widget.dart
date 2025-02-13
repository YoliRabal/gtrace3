import 'package:gtrace3/config/imports.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BusquedaWidget extends StatelessWidget {
  const BusquedaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      color: Colors.black,
      child: Column(
          children: [
            Container(
              height: 40,
              color: Colors.black,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Buscar',
                    hintStyle: TextStyle(color: Colors.white70),
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.grey[850], // Fondo gris oscuro
                    filled: true,
                  ),
                ),
              ),
            ),

          Espacio(20),

          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 80,
                    color: COLOR_BACKGROUND,
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/amanecer.svg",
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Tiendas",
                          style: TextStyle(color: COLOR_ACCENT, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                /*          Espacio(20),

          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}*/

        ],
      ),
    ),
    ]
    ),
    );
  }
}