import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../models/item.dart';
import '../services/connection.dart' as connection;

class ItemsScopedModel extends Model {
  List<Item> _allItemsList = [];

  Future<List<Item>> getAllItemsListFuture() async {
    // create the list of all items here and then return it to future builder
    // in thew future builder use this list for listview builder
    http.Response result = await http.get(connection.url);
    print(result.statusCode);
    print(result.body);
    print('if printing the json text then working fine');
    return parseItem(result.body);
  }

  List<Item> parseItem(String responseBody) {
    // referred the official docs
    // A function that converts a response body into a List<Item>.
    // this function is used in the above future
    // here an isolate can also be created such that the working of slower devices is better
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    _allItemsList = parsed.map<Item>((json) => Item.fromJson(json)).toList();
    return _allItemsList;
  }

  Widget allItemsFutureBuilder(BuildContext context) {
    return FutureBuilder<List<Item>>(
        future: getAllItemsListFuture(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? allItemsListBuilder(snapshot.data)
              : Center(child: CircularProgressIndicator());
        });
  }

  Widget allItemsListBuilder(List<Item> all) {
    return ListView.builder(itemBuilder: null);
  }
}
