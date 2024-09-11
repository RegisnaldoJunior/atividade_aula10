import 'package:flutter/material.dart';
import 'package:getx_1009/view/home_page.dart';

class AppRoutes {
  static const homePage = '/homePage';

  static Map<String, WidgetBuilder> define() {
    return {
      homePage: (BuildContext context) => HomePage(),
    };
  }
}