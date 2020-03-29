import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../models/item.dart';
import '../models/cartItem.dart';
import '../models/order.dart';
import '../scopedModels/itemsScopedModel.dart';
import '../services/connection.dart';

class OrderScopedModel extends Model {
  static List<CartItem> cartItemsList = [];
  CartItem _cartItem = CartItem();
  Order order = Order();
  String cartEstimate = '0.0';

  addItemToCart(
    Item itemReceived,
  ) {
    // int index = _cartItemList.indexWhere((i) => i.itemID == itemReceived.code);

    //if (index != -1)
    // updateItemQty(itemReceived, 1.0);
    //else {
    // print(index);
    print('hi this is working');
    print(_cartItem);
    _cartItem.itemId = itemReceived.code;
    _cartItem.itemName = itemReceived.name;
    _cartItem.requestedQty = '1';
    _cartItem.fulfilledQty = '1';
    _cartItem.pricePerUnit = itemReceived.sellPrice;
    _cartItem.imageURI = itemReceived.imageURI;
    cartItemsList.add(_cartItem);
    print(_cartItem.requestedQty);

    //calculate estimate
    // check for qty
    calculateEstimate();
    notifyListeners();
  }

  removeItemFromCart(Item itemReceived) {
    //int index = _cartItemList.indexWhere((i) => i.itemID == itemReceived.code);
    cartItemsList.removeWhere((i) => i.itemId == itemReceived.code);
    // the first line is probably unsecceraty
    // now recalculate the estimate
    //udate oderdetails list
    notifyListeners();
  }

  removeCartItemFromCart(CartItem itemReceived) {
    //int index = _cartItemList.indexWhere((i) => i.itemID == itemReceived.code);
    cartItemsList.removeWhere((i) => i.itemId == itemReceived.itemId);
    // the first line is probably unsecceraty
    // now recalculate the estimate
    //udate oderdetails list
    calculateEstimate();
    notifyListeners();
  }

  updateItemQty(Item itemReceived, int requestedQty) {
    print('update function callede');

    int index = cartItemsList.indexWhere((i) => i.itemId == itemReceived.code);
    cartItemsList[index].requestedQty = requestedQty.toString();
    print(cartItemsList[index].requestedQty);
    if (requestedQty == 0) {
      removeItemFromCart(itemReceived);
    }
    // probably to create a new model of items
    notifyListeners();
  }

  updateCartItemQty(CartItem item, int requestedQty) {
    print('new update function called');

    int index = cartItemsList.indexWhere((i) => i.itemId == item.itemId);
    cartItemsList[index].requestedQty = requestedQty.toString();
    print(cartItemsList[index].requestedQty);
    if (requestedQty == 0) {
      removeCartItemFromCart(item);
    }
    calculateEstimate();
    notifyListeners();
  }

  String calculateEstimate() {
    double temp = 0.0;
    cartItemsList.forEach((f) {
      temp += double.parse(f.pricePerUnit) * double.parse(f.requestedQty);
    });
    cartEstimate = temp.toString();
    notifyListeners();
    return cartEstimate;
  }

  showCart() {
    print(cartItemsList);
  }
  // generate order id and place order

  clearCart() {
    cartItemsList.clear();
  }

  String placeOrder() {
    order.orderId = 'sample4';
    order.restaurantId = 'cartssj';
    order.dateTime = 'fdsfd';
    order.status = 'pending';
    order.cartItems = cartItemsList;
    order.total = cartEstimate;
    print(jsonEncode(order));

    createOrder();
  }

  createOrder() async {
    http.Response response = await http.post(orderurl,
        headers: {'Content-type': 'application/json'}, body: jsonEncode(order));
    var statusCode = response.statusCode;
    if (statusCode < 200 || statusCode > 400) {
      print(response.statusCode);
      throw new Exception("Error while fetching data ");
    } else {
      print('order should have been added');

      Order temp = jsonDecode(response.body);
      //return temp.orderId;
    }
  }

  // reset the cartItemList variable in the stack as outputs the values in the checkout screen again

}
