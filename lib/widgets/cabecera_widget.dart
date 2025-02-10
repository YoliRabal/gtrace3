import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CabeceraWidget extends StatelessWidget {
  const CabeceraWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.black,
      padding: EdgeInsets.only(
        left: 15,
        right:15,
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            color: Colors.black,
            child: IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {
              },
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Container(
              color: Colors.black,
              child: Center(
                child: ClipOval(
                  child: Image.network(
                    'https://img.freepik.com/vector-premium/icono-carreras-coches-carreras-vehiculos-antiguos-paseos-velocidad-simbolo-vector-motores-antiguos-rally-coches-deportivos-campeonato-carreras-velocidad-o-arrastre-icono-club-deportivo_8071-5896.jpg',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          Container(
            width: 50,
            height: 50,
            color: Colors.black,
            child: ClipOval(
              child: Image.network(
                'https://cdn-icons-png.flaticon.com/512/9368/9368284.png',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}