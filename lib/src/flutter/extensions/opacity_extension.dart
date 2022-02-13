import 'package:flutter/material.dart';

///Opacity extension to extend widget functionality
extension OpacityExtension on Widget {
  ///Create a widget that makes its child partially transparent
  ///
  ///The [Opacity] argument must not be null and must be between 0.0 and 1.0
  Opacity opacity(double opacity) => _opacity(opacity);

  ///Get 0% [Opacity] which means fully invisible
  Opacity get opacity0 => _opacity(0.0);

  ///Get 10% [Opacity] which means slightly visible
  Opacity get opacity10 => _opacity(0.10);

  ///Get 20% [Opacity] which means slightly visible
  Opacity get opacity20 => _opacity(0.20);

  ///Get 25% [Opacity] which means paritally visible
  Opacity get opacity25 => _opacity(0.25);

  ///Get 50% [Opacity] which means half visible
  Opacity get opacity50 => _opacity(0.50);

  ///Get 75% [Opacity] which means paritally invisible
  Opacity get opacity75 => _opacity(0.75);

  ///Get 100% [Opacity] which means fully visible
  Opacity get opacity100 => _opacity(1.0);

  Opacity _opacity(double opacity) => Opacity(child: this, opacity: opacity);
}
