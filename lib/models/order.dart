import '../models/cartItem.dart';

class Order {
  String orderID;
  String restaurantID;
  String dateTime;
  String status;
  List<CartItem> itemsList;

  String total;

  Order(
      {this.orderID = '0',
      this.restaurantID = '0',
      this.dateTime = '',
      this.status = '',
      this.itemsList,
      this.total = 0});

  void addOrdertoDB(Order order) {
    // for now printinfg all the values here
    // generate an order id
    print(order.orderID);
    print(order.restaurantID);
    print(order.dateTime);
    print(order.status);
    print(order.itemsList);
    print(total);
    // now save the data to DB
    // notify vendor app onDataChange in DB
  }
}
