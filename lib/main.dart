import 'package:getx_1009/app_routes/appRoutes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppRoutes.homePage,
    routes: AppRoutes.define(),
  ));
}