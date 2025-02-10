import 'package:flutter/material.dart';
import 'package:gtrace3/widgets/busqueda_widget.dart';
import 'package:gtrace3/widgets/cabecera_widget.dart';
import 'package:gtrace3/widgets/espacio.dart';
import 'package:gtrace3/widgets/feed_widget.dart';
import 'package:gtrace3/functions/move_to.dart';
import 'package:gtrace3/pages/detailspage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GTRace',
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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