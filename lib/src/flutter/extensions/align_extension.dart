import 'package:flutter/material.dart';

///Align extension to extend widget functionality
extension AlignExtension on Widget {
  ///How to align the child.
  ///
  ///The x and y values of the [Alignment] control the horizontal and vertical alignment, respectively
  ///[Align] has some properties like [Alignment.bottomCenter][Alignment.topRight]
  Align align([Alignment alignment = Alignment.center]) => _align(alignment);

  ///[Align] child to Bottom Right of parent widget
  Align get bottomRight => _align(Alignment.bottomRight);

  ///[Align] child to Bottom Left of parent widget
  Align get bottomLeft => _align(Alignment.bottomLeft);

  ///[Align] child to Bottom Center of parent widget
  Align get bottomCenter => _align(Alignment.bottomCenter);

  ///[Align] child to Top Right of parent widget
  Align get topRight => _align(Alignment.topRight);

  ///[Align] child to Top Left of parent widget
  Align get topLeft => _align(Alignment.topLeft);

  ///[Align] child to Top Center of parent widget
  Align get topCenter => _align(Alignment.topCenter);

  ///[Align] child to Center Right of parent widget
  Align get centerRight => _align(Alignment.centerRight);

  ///[Align] child to Center Left of parent widget
  Align get centerLeft => _align(Alignment.centerLeft);

  Align _align(Alignment alignment) => Align(child: this, alignment: alignment);
}
