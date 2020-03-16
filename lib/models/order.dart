import 'dart:convert';

import '../models/cartItem.dart';

class Order {
  String orderId;
  String restaurantId;
  String dateTime;
  String status;
  List<CartItem> cartItems;
  String total;

  Order(
      {this.orderId = '0',
      this.restaurantId = '0',
      this.dateTime = 'now',
      this.status = 'pending',
      this.cartItems,
      this.total = '0'});
  // complex json parsiong referred form a medium document in bookmarks

  factory Order.fromJson(Map<String, dynamic> json) {
    var list = json['cartItems'] as List;
    print(list.runtimeType);
    List<CartItem> cartItemsLisst =
        list.map((i) => CartItem.fromJson(i)).toList();

    //var cartItemsFromJson = json['cartItems'];
    //List<CartItem> cartItemsLisst = new List<CartItem>.from(cartItemsFromJson);
    return Order(
        orderId: json['orderId'],
        restaurantId: json['restaurantId'],
        dateTime: json['dateTime'],
        status: json['status'],
        cartItems: cartItemsLisst,
        total: json['total']);
  }

  Map<String, dynamic> toJson() => {
        'orderId': orderId,
        'restaurantId': restaurantId,
        'dateTime': dateTime,
        'status': status,
        'cartItems': cartItems,
        'total': total
      };

  Map toMap() {
    var map = new Map<String, dynamic>();
    map['orderId'] = orderId;
    map['restaurantId'] = restaurantId;
    map['dateTime'] = dateTime;
    map['status'] = status;
    map['cartItems'] = cartItems;
    map['total'] = total;
    return map;
  }
//
//  List listofCartMaps(List<CartItem> cartItemsList) {
//    List list = [];
//
//    cartItemsList.forEach((i) => list.add(jsonEncode(i)));
//    //List teee = new List.from(list);
//    print(list);
//    return list.cast<String>();
//    // iterate the list and create map of cartitems
//  }
}
