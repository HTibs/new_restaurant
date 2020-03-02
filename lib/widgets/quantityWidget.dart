import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../models/item.dart';
import '../scopedModels/orderScopedModel.dart';

class QuantityWidget extends StatefulWidget {
  Item item;
  QuantityWidget(this.item);
  @override
  _QuantityWidgetState createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  var itemQty = 0;
  TextEditingController qtyController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (itemQty == 0) {
      return ScopedModel(
        model: OrderScopedModel(),
        child: ScopedModelDescendant<OrderScopedModel>(
            builder: (context, child, model) {
          return Container(
            width: 82.0,
            height: 32.0,
            padding: EdgeInsets.symmetric(vertical: 0.5, horizontal: 0.5),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                border: Border.all(
                    color: Theme.of(context).primaryColor, width: 0.5),
                borderRadius: BorderRadius.circular(8.0)),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    print('gesture detecctor working');
                    // call add to itme function
                    model.addItemToCart(widget.item);
                    itemQty = 1;
                    qtyController.text = '$itemQty';
                  });
                },
                child: Text(
                  'Add',
                  style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          );
        }),
      );
    } else {
      return ScopedModel<OrderScopedModel>(
        model: OrderScopedModel(),
        child: ScopedModelDescendant<OrderScopedModel>(
            builder: (context, child, model) {
          return Container(
              width: 82.0,
              height: 32.0,
              padding: EdgeInsets.symmetric(vertical: 0.5, horizontal: 0.5),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 0.5),
                  borderRadius: BorderRadius.circular(8.0)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 20.0,
                    height: 30.0,
                    child: IconButton(
                      color: Theme.of(context).primaryColor,
                      iconSize: 20.0,
                      padding: EdgeInsets.all(0.0),
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          itemQty--;
                          qtyController.text = '$itemQty';
                          model.updateItemQty(
                              widget.item, double.parse(itemQty.toString()));
                        });
                      },
                    ),
                  ),
                  Container(
                    width: 40.0,
                    color: Colors.grey,
                    child: TextFormField(
                      controller: qtyController,
                      cursorColor: Theme.of(context).primaryColor,
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                      onChanged: (value) {
                        setState(() {
                          double req = double.parse(value);
                          // call update product function
                          model.updateItemQty(widget.item, req);
                        });
                      },
                    ),
                  ),
                  Container(
                    width: 20.0,
                    height: 30.0,
                    child: IconButton(
                      color: Theme.of(context).primaryColor,
                      iconSize: 20.0,
                      padding: EdgeInsets.all(0.0),
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          itemQty++;
                          qtyController.text = '$itemQty';
                          model.updateItemQty(
                              widget.item, double.parse(itemQty.toString()));
                        });
                      },
                    ),
                  ),
                ],
              ));
        }),
      );
    }
  }
}
