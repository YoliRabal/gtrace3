import 'package:gtrace3/config/imports.dart';

class Loading extends StatelessWidget {

  final bool loading;
  final double opacity;
  final Color color;
  final Widget progressIndicator;
  final Offset? offset;
  final bool dismissible;
  final Widget child;

  const Loading({
    super.key,
    required this.loading,
    this.opacity = 0.3,
    this.color = Colors.black,
    this.progressIndicator = const CircularProgressIndicator(),
    this.offset,
    this.dismissible = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (!loading) return child;

    Widget layOutProgressIndicator;
    if (offset == null) {
      layOutProgressIndicator = Center(child: progressIndicator);
    } else {
      layOutProgressIndicator = Positioned(
        left: offset!.dx,
        top: offset!.dy,
        child: progressIndicator,
      );
    }

    return Stack(
      children: [
        child,
        Opacity(
          opacity: opacity,
          child: ModalBarrier(dismissible: dismissible, color: color),
        ),
        Center(

          child: Container(

            height: 90,
            width: 90,

            decoration: BoxDecoration(
                color: COLOR_BACKGROUND_SECONDARY,
                borderRadius: BorderRadiusAll(),
               boxShadow: [BoxShadowCustom()]
            ),
            child: layOutProgressIndicator,
          ),

        )
        ,
      ],
    );
  }
}


class LoadingWithText extends StatelessWidget {

  final bool inAsyncCall;
  final double opacity;
  final Color color;
  final Widget progressIndicator;
  final Offset? offset;
  final bool dismissible;
  final Widget child;
  final String text;

  const LoadingWithText({
    super.key,
    required this.inAsyncCall,
    this.opacity = 0.3,
    this.color = Colors.grey,
    this.progressIndicator = const CircularProgressIndicator(),
    this.offset,
    this.dismissible = false,
    required this.child,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    if (!inAsyncCall) return child;

    Widget layOutProgressIndicator;
    if (offset == null) {
      layOutProgressIndicator = Center(child: progressIndicator);
    } else {
      layOutProgressIndicator = Positioned(
        left: offset!.dx,
        top: offset!.dy,
        child: progressIndicator,
      );
    }

    return Stack(
      children: [
        child,
        Opacity(
          opacity: opacity,
          child: ModalBarrier(dismissible: dismissible, color: color),
        ),
        Center(

          child: Container(

            height: 110,
            width: 110,

            decoration: BoxDecoration(
                color: COLOR_BACKGROUND_SECONDARY,
                borderRadius: BorderRadiusAll(),
                boxShadow: [BoxShadowCustom()]
            ),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [

                layOutProgressIndicator,

                Espacio(10),

                TextoCaption(text, textAlign: TextAlign.center)

              ],

            )
          ),

        )
        ,
      ],
    );
  }
}