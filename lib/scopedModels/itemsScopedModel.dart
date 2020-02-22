import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import '../models/item.dart';

class ItemsScopedModel extends Model {
  List<Item> allItemsList = [];

  static Future getAllItemsList() async {
    //this is the connections part
    var url = 'http://192.168.137.1:8000/search/';
    var result = await http.get(url);
    print(result);
  }
}
