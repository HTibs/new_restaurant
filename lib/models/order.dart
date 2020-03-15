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

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
        orderId: json['orderId'],
        restaurantId: json['restaurantId'],
        dateTime: json['dateTime'],
        status: json['status'],
        cartItems: json['cartItems'],
        total: json['total']);
  }

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
}
