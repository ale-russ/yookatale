import 'dart:developer';

import 'package:flutter/material.dart';

class SliderMenuController extends ValueNotifier<bool> {
  SliderMenuController() : super(false);

  void toggleSliderMenu({required bool value}) {
    log('Menu: $value');
    value = !value;
  }
}
