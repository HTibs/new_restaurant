import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

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
    //this is the connections part
    print('2');
    // var url = 'localhost:8000/search/?format=json';
    print('3');
//    final client = new http.Client();
//    final result = await client.send(http.Request('get', Uri.parse(url)));
    //var result = await http.get(url);
    var client = new http.Client();
    var result = await client
        .get(new Uri.http("localhost:8000", "/search/?format=json"));
    print(result);
    print('hu');
  }
}
