import 'package:flutter/cupertino.dart';

//WIDGET
Widget Espacio (double size){

  return SizedBox(
    width: size,
    height: size,
  );

}


//STATEFULL
class EspacioFull extends StatefulWidget {

  final double size;
  const EspacioFull({super.key, required this.size});

  @override
  State<EspacioFull> createState() => _EspacioFullState();
}

class _EspacioFullState extends State<EspacioFull> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
    );
  }
}


//STATELESS
class EspacioLess extends StatelessWidget {

  final double size;
  const EspacioLess({super.key, this.size = 20});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
    );
  }
}
