import 'package:excercise/Providers/Products_Provider.dart';
import 'package:excercise/components/Image_network_of_product.dart';
import 'package:excercise/components/Pricing&Buying_Widget.dart';
import 'package:excercise/components/Product_Details_Widget.dart';
import 'package:excercise/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProducDetailsPage extends StatefulWidget {
  int? productIndex;
  ProducDetailsPage({required this.productIndex});

  @override
  State<ProducDetailsPage> createState() => _ProducDetailsPageState();
}

class _ProducDetailsPageState extends State<ProducDetailsPage> {
 
  @override
  Widget build(BuildContext context) {
    Product thisProduct = Provider.of<ProductsProvider>(context)
        .ListOfProducts![widget.productIndex!];

    return Scaffold(
        //  backgroundColor:Colors.grey.shade200,
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // الصورة
              ImageNetworkOfProduct(productIndex: widget.productIndex!),
              // التفاصيل
               ProductDetailsWidget( productIndex: widget.productIndex!),
              // التسعير و الصف يلي تحت
              PricingBuyingWidget(productIndex: widget.productIndex!)
            ],
          ),
        ));
  }
}
