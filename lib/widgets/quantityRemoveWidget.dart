import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../scopedModels/orderScopedModel.dart';
import '../models/cartItem.dart';

// this quantity widget is for order review screen
// this will recieve cart item

class QuantityRemoveWidget extends StatefulWidget {
  CartItem item;
  QuantityRemoveWidget(this.item);
  @override
  _QuantityRemoveWidgetState createState() => _QuantityRemoveWidgetState();
}

class _QuantityRemoveWidgetState extends State<QuantityRemoveWidget> {
  TextEditingController qtyController;
  @override
  Widget build(BuildContext context) {
    int a = int.parse(widget.item.requestedQty);
    //int a = widget.item.requestedQty.toInt();
    qtyController = TextEditingController(text: '$a');
    return ScopedModel(
      model: OrderScopedModel(),
      child: ScopedModelDescendant<OrderScopedModel>(
          builder: (BuildContext context, Widget child, model) {
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
                        double temp =
                            double.parse(widget.item.requestedQty) - 1;
                        widget.item.requestedQty = temp.toString();

                        model.updateCartItemQty(widget.item,
                            double.parse(widget.item.requestedQty));
                      });
                      qtyController.text = '${widget.item.requestedQty}';
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
                        model.updateCartItemQty(widget.item, req);
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
                        double temp =
                            double.parse(widget.item.requestedQty) + 1;
                        widget.item.requestedQty = temp.toString();
                        qtyController.text = '${widget.item.requestedQty}';
                        model.updateCartItemQty(widget.item,
                            double.parse(widget.item.requestedQty));
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
