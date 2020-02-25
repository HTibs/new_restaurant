import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

import '../services/connection.dart' as connection;
import '../scopedModels/itemsScopedModel.dart';

class CreateOrderActivity extends StatefulWidget {
  @override
  _CreateOrderActivityState createState() => _CreateOrderActivityState();
}

class _CreateOrderActivityState extends State<CreateOrderActivity> {
  @override
  Widget build(BuildContext context) {
    print('1');
    getAllItemsList();
    return Container();
  }

  static Future getAllItemsList() async {
    http.Response result = await http.get(connection.url);
    print(result.statusCode);
    print(result.body);
    print('hu');
  }
}
