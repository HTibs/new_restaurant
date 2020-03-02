class CartItem {
  String itemID;
  String requestedQty;
  String fulfilledQty;
  String pricePerUnit;

  CartItem(
      {this.itemID, this.requestedQty, this.fulfilledQty, this.pricePerUnit});
}
