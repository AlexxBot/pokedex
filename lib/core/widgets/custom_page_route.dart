/* import 'package:flutter/cupertino.dart';

class CustomPageRoute extends PageRouteBuilder {
  //final BuildContext context;
  final Widget child;

  CustomPageRoute(/* this.context, */ this.child)
      : super(
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return child;
            },
            transitionDuration: const Duration(milliseconds: 200),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              /* return Transform.scale(
                scale: animation.value,
                child: Transform.rotate(
                    angle: 9 - 9 * animation.value,
                    child: FadeTransition(opacity: animation, child: child)),
              ); */
              /* animation = CurvedAnimation(
      curve: curveList[index], parent: animation);
  return FadeTransition(
    opacity:animation,
    child: child, );*/
              return Transform.scale(
                  scale: animation.value,
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ));
            });
}
 */