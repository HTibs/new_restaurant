class CartItem {
  String itemID;
  String itemName;
  String requestedQty;
  String fulfilledQty;
  String pricePerUnit;

  CartItem(
      {this.itemID,
      this.itemName,
      this.requestedQty,
      this.fulfilledQty,
      this.pricePerUnit});
}
