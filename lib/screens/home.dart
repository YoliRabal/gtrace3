import 'package:flutter/material.dart';
import 'package:gtrace3/widgets/busqueda_widget.dart';
import 'package:gtrace3/widgets/cabecera_widget.dart';
import 'package:gtrace3/widgets/espacio.dart';
import 'package:gtrace3/widgets/feed_widget.dart';
import 'package:gtrace3/functions/move_to.dart';
import 'package:gtrace3/screens/detailspage.dart';
import 'package:firebase_core/firebase_core.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          goTo(context, const DetailPage());
        },
        child: Container(
          color: Colors.black,
          child: ListView(
            children: [
              CabeceraWidget(),
              EspacioFull(size: 20),
              BusquedaWidget(),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return FeedWidget();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Espacio(20);
                },
                itemCount: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}