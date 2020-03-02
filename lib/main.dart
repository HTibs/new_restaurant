import 'package:flutter/material.dart';

import 'activities/loginActivity.dart';
import 'activities/createOrderActivity.dart';
import 'activities/reviewOrderActivity.dart';
//import 'activities/myOrdersActivity.dart';
//import 'activities/orderDetailsActivity.dart';
//import 'widgets/quantityAddWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.red,
          brightness: Brightness.light,
          accentColor: Colors.amber),
      routes: {
        '/': (BuildContext context) => CreateOrderActivity(),
//        '/home': (BuildContext context) => CreateOrderActivity(),
        '/reviewOrder': (BuildContext context) => ReviewOrderActivity(),
//        '/myOrders': (BuildContext context) => MyOrdersActivity(),
//        '/orderDetails': (BuildContext context) => OrderDetailsActivity(),
      },
    );
  }
}
