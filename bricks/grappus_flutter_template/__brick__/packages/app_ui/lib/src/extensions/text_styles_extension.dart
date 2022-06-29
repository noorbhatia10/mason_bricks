import 'package:flutter/material.dart';

/*
 * Created by Nimish Nandwana on 13/01/2022.
 * Description -
 */

extension TextStyleExtension on TextStyle {
  TextStyle withOpacity(double opacity) {
    return copyWith(color: color!.withOpacity(opacity));
  }

  TextStyle withColor(Color newColor) {
    return copyWith(color: newColor);
  }
}
