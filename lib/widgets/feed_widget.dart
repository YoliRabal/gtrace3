import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


FirebaseFirestore firestore = FirebaseFirestore.instance;

class FeedWidget extends StatelessWidget {
  const FeedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              SizedBox(width: 10),
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
          SizedBox(height: 10),
          Stack(
            children: [
              Image.network(
                'https://motor.elpais.com/wp-content/uploads/2023/04/Bugatti-Chiron.jpg',
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
                  child: Text(
                    "Parade",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.orange, size: 16),
              SizedBox(width: 5),
              Text(
                "Marbella",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(width: 10),
              Icon(Icons.calendar_today, color: Colors.orange, size: 16),
              SizedBox(width: 5),
              Text(
                "Lunes 28 Abril",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "Bluewater Parade GT",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Vente a disfrutar a nuestro primer Parade de GT Race Marbella.",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 10),
          Text(
            "Ver más",
            style: TextStyle(color: Colors.orange, fontSize: 12),
          ),
        ],
      ),
    );
  }
}