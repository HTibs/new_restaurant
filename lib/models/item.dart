import 'dart:convert';

class Item {
  String code;
  String name;
  String imageURI;
  String costPrice;
  String sellPrice;
  String stock;
  String description;

  Item(
      {this.code,
      this.name,
      this.imageURI,
      this.costPrice,
      this.sellPrice,
      this.stock,
      this.description});

  factory Item.fromJson(Map<String, dynamic> parsedJson) {
    return Item(
        code: parsedJson['code'],
        name: parsedJson['name'],
        imageURI: parsedJson['imageURI'],
        costPrice: parsedJson['costPrice'],
        sellPrice: parsedJson['sellPrice'],
        // add the stock field and the description field in the server side

        stock: parsedJson['stock'],
        description: parsedJson['description']);
  }
}
