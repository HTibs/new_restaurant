import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../scopedModels/itemsScopedModel.dart';

class CreateOrderActivity extends StatefulWidget {
  @override
  _CreateOrderActivityState createState() => _CreateOrderActivityState();
}

class _CreateOrderActivityState extends State<CreateOrderActivity> {
  @override
  Widget build(BuildContext context) {
    print('1');
    return SafeArea(
      child: ScopedModel(
        model: ItemsScopedModel(),
        child: Scaffold(
            appBar: AppBar(
              title: Text('Create Order'),
            ),
            drawer: Drawer(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    title: Text('Current Orders'),
                    onTap: () {
                      // send to current orders page
                    },
                  ),
                  ListTile(
                    title: Text('Previous Orders'),
                    onTap: () {
                      // send to Previous order page
                    },
                  ),
                  ListTile(
                    title: Text('My Account'),
                    onTap: () {
                      // send to account page just a statice page with restaurant details no data formayting
                    },
                  )
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60.0,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          // controller: searchController,
                          onChanged: (value) {
                            // filterSearchResults(value);
                            print('is this working');
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintText: "Search",
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)))),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        bottom: 8.0,
                      ),
                      height: MediaQuery.of(context).size.height - 190.0,
                      child: ScopedModelDescendant<ItemsScopedModel>(builder:
                          (BuildContext context, Widget child,
                              ItemsScopedModel model) {
                        return model.allItemsFutureBuilder(context);
                      }),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50.0,
                      child: Container(
                        color: Colors.amber,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/reviewOrder');
                          },
                          color: Colors.amber,
                          child: Text(
                            'Checkout',
                            style: TextStyle(
                                fontSize: 17.0,
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        // for checkout button),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
