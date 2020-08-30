
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeInYCustom extends StatelessWidget {
  final double delay;
  final Widget child;
  final double transition;

  FadeInYCustom(this.delay,this.transition, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity")
          .add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      Track("translateY").add(
          Duration(milliseconds: 500), Tween(begin: transition.toDouble(), end: 0.0),
          curve: Curves.easeOut)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (300 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
            opacity: animation["opacity"],
            child: Transform.translate(
                offset: Offset(0,animation["translateY"]), child: child),
          ),
    );
  }
}