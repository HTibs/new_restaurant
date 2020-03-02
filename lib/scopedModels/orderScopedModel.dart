import 'package:scoped_model/scoped_model.dart';

import '../models/item.dart';
import '../models/cartItem.dart';
import '../models/order.dart';
import '../scopedModels/itemsScopedModel.dart';

class OrderScopedModel extends Model {
  static List<CartItem> cartItemsList = [];
  CartItem _cartItem = CartItem();
  Order _order = Order();
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
    _cartItem.itemID = itemReceived.code;
    _cartItem.itemName = itemReceived.name;
    _cartItem.requestedQty = '1';
    _cartItem.fulfilledQty = '1';
    _cartItem.pricePerUnit = itemReceived.sellPrice;
    cartItemsList.add(_cartItem);
    print(_cartItem.requestedQty);

    //calculate estimate
    // check for qty
    calculateEstimate();
    notifyListeners();
  }

  removeItemFromCart(Item itemReceived) {
    //int index = _cartItemList.indexWhere((i) => i.itemID == itemReceived.code);
    cartItemsList.removeWhere((i) => i.itemID == itemReceived.code);
    // the first line is probably unsecceraty
    // now recalculate the estimate
    //udate oderdetails list
    notifyListeners();
  }

  removeCartItemFromCart(CartItem itemReceived) {
    //int index = _cartItemList.indexWhere((i) => i.itemID == itemReceived.code);
    cartItemsList.removeWhere((i) => i.itemID == itemReceived.itemID);
    // the first line is probably unsecceraty
    // now recalculate the estimate
    //udate oderdetails list
    calculateEstimate();
    notifyListeners();
  }

  updateItemQty(Item itemReceived, double requestedQty) {
    print('update function callede');

    int index = cartItemsList.indexWhere((i) => i.itemID == itemReceived.code);
    cartItemsList[index].requestedQty = requestedQty.toString();
    print(cartItemsList[index].requestedQty);
    if (requestedQty == 0) {
      removeItemFromCart(itemReceived);
    }
    // probably to create a new model of items
    notifyListeners();
  }

  updateCartItemQty(CartItem item, double requestedQty) {
    print('new update function called');

    int index = cartItemsList.indexWhere((i) => i.itemID == item.itemID);
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

//  String getCartItemName(int index) {
//    String code = cartItemsList[index].itemID;
//    int temp = allItemsList.indexWhere((i) => i.code == code);
//    return allItemsList[temp].name;
//  }

  placeOrder() {
    var now = DateTime.now();
    _order.orderID = '050001';
    // TODO: get restaurant id based on login info
    _order.restaurantID = '20001';
    _order.dateTime = now.toString();
    _order.status = 'pending';
    // TODO: the total is given a value of cartestimate neseccarty to update in vendor side app
    _order.total = cartEstimate;
    _order.itemsList = [];
    _order.itemsList.addAll(cartItemsList);

    // geneerate token and go back to homescreen
    _order.addOrdertoDB(_order);
    cartItemsList.clear();
    return _order.orderID;

    // reset the cartItemList variable in the stack as outputs the values in the checkout screen again
  }
}
