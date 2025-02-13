import 'package:gtrace3/config/imports.dart';

class ShowUpAnimationCustom extends StatelessWidget {

  final Widget child;
  final int order;
  final int duration;

  const ShowUpAnimationCustom({
    super.key,
    required this.child,
    this.order = 0,
    this.duration = 300,
  });

  @override
  Widget build(BuildContext context) {

    return ShowUpAnimation(
      delayStart: Duration(milliseconds: order * 100),
      animationDuration: Duration(milliseconds: duration),
      curve: Curves.easeInOut,
      direction: Direction.vertical,
      offset: 0.5,
      child: child,
    );

  }
}

