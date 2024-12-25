import 'package:excercise/Providers/Products_Provider.dart';
import 'package:excercise/components/OutlookProduct.dart';
import 'package:excercise/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(onPressed: (){
          // wipping data
          //Provider.of<ProductsProvider>(context,listen: false).clearProductList();
          Navigator.pop(context);
        },
         icon: Icon(Icons.arrow_back,color: Colors.white,size: 36,)),
        backgroundColor: Colors.black,
        title: Center(
          child: Container(
            padding: EdgeInsets.only(right: 40),
            child: Text(
              'Local Shop Products',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      body: ListView(
        children: getWidgetList(
            Provider.of<ProductsProvider>(context).ListOfProducts!),
      ),
    );
  }

  List<Widget> getWidgetList(List<Product> products) {
    List<Widget> Containers = [];
    for (int i = 0; i < products.length; i++) {
      Containers.add(Outlookproduct(index: i));
    }
    print('Numbers Of Products :${Containers.length}') ;
    return Containers;
  }
}
