import 'package:excercise/Providers/Products_Provider.dart';
import 'package:excercise/pages/Log_in_Page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( ChangeNotifierProvider(create: (context) => ProductsProvider(),
  child:MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LogInPage(),
  ),
  ));
}