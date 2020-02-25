import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import '../models/item.dart';

class ItemsScopedModel extends Model {
  List<Item> allItemsList = [];

  static Future getAllItemsList() async {
    //this is the connections part
  }
}
