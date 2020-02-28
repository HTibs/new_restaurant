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
    return Container(
      child: ScopedModel(model: ItemsScopedModel(), child: null),
    );
  }
}
