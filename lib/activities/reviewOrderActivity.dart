import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../scopedModels/orderScopedModel.dart';
import '../widgets/quantityRemoveWidget.dart';

class ReviewOrderActivity extends StatefulWidget {
  @override
  _ReviewOrderActivityState createState() => _ReviewOrderActivityState();
}

class _ReviewOrderActivityState extends State<ReviewOrderActivity> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: OrderScopedModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width, child: itemListBuilder()),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(
            top: 2.0,
          ),
          height: 90.0,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              ScopedModelDescendant<OrderScopedModel>(
                builder: (context, child, model) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40.0,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 20.0, 8.0),
                      child: Text(
                        'Estimate:  Rs. ${model.calculateEstimate()}',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ScopedModelDescendant<OrderScopedModel>(
                      builder: (context, child, model) {
                    return GestureDetector(
                      onTap: () {
                        model.clearCart();
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2 - 2.5,
                        height: 50.0,
                        color: Colors.red[400],
                        child: Center(
                            child: Text(
                          'Cancel',
                          style: TextStyle(fontSize: 17.0, color: Colors.white),
                        )),
                      ),
                    );
                  }),
                  SizedBox(
                    width: 5.0,
                  ),
                  ScopedModelDescendant<OrderScopedModel>(
                    builder: (context, child, model) {
                      return GestureDetector(
                        onTap: () async {
                          // implement the scoped model funtion of adding order to dbList
                          model.placeOrder();
                          print('order place function called');
                          setState(() {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Order Placed'),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text('OK'),
                                        onPressed: () {
                                          Navigator.popAndPushNamed(
                                              context, '/home');
                                        },
                                      )
                                    ],
                                  );
                                  // show alert dialog with order id
                                  // go back to home screen
                                });
                          });
                        },
                        child: Container(
                          height: 50.0,
                          width: MediaQuery.of(context).size.width / 2 - 2.5,
                          color: Colors.green[400],
                          child: Center(
                              child: Text('Order',
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.white,
                                  ))),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemListBuilder() {
    return ScopedModelDescendant<OrderScopedModel>(
        builder: (BuildContext context, Widget child, OrderScopedModel model) {
      return ListView.builder(
          itemCount: OrderScopedModel.cartItemsList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: Material(
                elevation: 1.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        width: 70.0,
                        height: 70.0,

                        // container for image
                        color: Colors.grey,
                        child: Image.network(
                          OrderScopedModel.cartItemsList[index].imageURI,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Column(
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          OrderScopedModel.cartItemsList[index].itemName,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Previous Price: Rs ${OrderScopedModel.cartItemsList[index].pricePerUnit}',
                          style: TextStyle(fontSize: 15.0, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: QuantityRemoveWidget(
                          OrderScopedModel.cartItemsList[index]),
                    ),
                  ],
                ),
              ),
            );
            ;
          });
    });
  }
}
