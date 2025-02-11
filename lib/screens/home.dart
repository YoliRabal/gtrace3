import 'package:flutter/material.dart';
import 'package:gtrace3/functions/firebase/firebase_reads.dart';
import 'package:gtrace3/models/feed/feed_model.dart';
import 'package:gtrace3/widgets/busqueda_widget.dart';
import 'package:gtrace3/widgets/cabecera_widget.dart';
import 'package:gtrace3/widgets/espacio.dart';
import 'package:gtrace3/widgets/feed_widget.dart';
import 'package:gtrace3/functions/move_to.dart';
import 'package:gtrace3/screens/details/detailspage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<FeedModel> list_feed = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(

        color: Colors.black,

        child: ListView(

          children: [

            CabeceraWidget(),

            EspacioFull(size: 20),

            BusquedaWidget(),

            ListView.separated(
              shrinkWrap: true,
              itemCount: list_feed.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return FeedWidget(feedModel: list_feed[index],);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Espacio(20);
              },

            ),

          ],
        ),
      ),

    );

  }

  loadData() async {

    list_feed = await getFeed();
    setState(() {});

  }


}