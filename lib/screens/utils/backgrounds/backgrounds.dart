import 'package:gtrace3/config/imports.dart';
//import 'package:flame_lottie/flame_lottie.dart';

class BackgroundAnimated extends StatelessWidget {

  final double opacity;
  const BackgroundAnimated({super.key, this.opacity = 0});

  @override
  Widget build(BuildContext context) {

    return Hero(

      tag: "background",
      child: Opacity(

        opacity: opacity,
        child: Stack(

          fit: StackFit.expand,

          /*children: [

            Lottie.asset(
              "assets/lottie/background1.json",
              fit: BoxFit.fill,
            ),

            Lottie.asset(
              "assets/lottie/background2.json",
              fit: BoxFit.fill,
            ),

            Lottie.asset(
              "assets/lottie/blob.json",
            ),

            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
                child: Container(
                  color: Colors.transparent, // Necesario para que el desenfoque se aplique
                ),
              ),
            ),

          ],*/

        ),

      ),
    );
  }
}
