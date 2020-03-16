import 'dart:convert';

class CartItem {
  String itemId;
  String itemName;
  String requestedQty;
  String fulfilledQty;
  String pricePerUnit;

  CartItem(
      {this.itemId,
      this.itemName,
      this.requestedQty,
      this.fulfilledQty,
      this.pricePerUnit});

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
        itemId: json['itemId'],
        itemName: json['itemName'],
        requestedQty: json['requestedQty'],
        fulfilledQty: json['fulfilledQty'],
        pricePerUnit: json['pricePerUnit']);
  }

  Map<String, dynamic> toJson() => {
        'itemId': itemId,
        'itemName': itemName,
        'requestedQty': requestedQty,
        'fulfilledQty': fulfilledQty,
        'pricePerUnit': pricePerUnit
      };

  String toMap() {
    var map = new Map<String, dynamic>();
    map['itemId'] = itemId;
    map['itemName'] = itemName;
    map['requestedQty'] = requestedQty;
    map['fulfilledQty'] = fulfilledQty;
    map['pricePerUnit'] = pricePerUnit;
    return map.toString();
  }
}
