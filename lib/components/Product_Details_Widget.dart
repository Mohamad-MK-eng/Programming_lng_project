import 'package:excercise/Providers/Products_Provider.dart';
import 'package:excercise/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsWidget extends StatefulWidget {
ProductDetailsWidget({ required this.productIndex});

int productIndex ;

  @override
  State<ProductDetailsWidget> createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
 bool _isDescreptionVisible = false;

  @override
  Widget build(BuildContext context) {
    Product thisProduct =
    Provider.of<ProductsProvider>(context).ListOfProducts![widget.productIndex];
    return              Padding(
               padding: const EdgeInsets.only(left: 20, top: 0, right: 20),
               child: Container(
                 width: 411.4 - 40,
                 // height: 293,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     const Text(
                       'Product Name :',
                       style: TextStyle(
                           fontSize: 23,
                           color: Colors.indigo,
                           fontWeight: FontWeight.bold),
                     ),
                     // Product Name
                     Text(
                       //getProductName(),
                       thisProduct.productName!,
                       style: TextStyle(fontSize: 18, color: Colors.black),
                     ),
                     //Product Id
                     Row(children: [
                       const Text(
                         'Product ID :',
                         style: TextStyle(
                             fontSize: 23,
                             color: Colors.indigo,
                             fontWeight: FontWeight.bold),
                       ),
                       //        ID
                       Text("${thisProduct.id}",
                           style: TextStyle(fontSize: 18, color: Colors.black))
                     ]),
                     //Product Category
                     Row(children: [
                       const Text('Product Category : ',
                           style: TextStyle(
                               fontSize: 23,
                               color: Colors.indigo,
                               fontWeight: FontWeight.bold)),
                       Text(
                         thisProduct.category!,
                         style: TextStyle(fontSize: 18, color: Colors.black),
                       )
                     ]),
                     Row(children: [
                       const Text('About Product ',
                           style: TextStyle(
                               fontSize: 23,
                               color: Colors.indigo,
                               fontWeight: FontWeight.bold)),
                       IconButton(
                           onPressed: () {
                           
                           // widget.updateUI();
                           setState(() {
                              _isDescreptionVisible = !_isDescreptionVisible;
                           });
                            print("Buy now clicked!");
                           },
                           icon: Icon(
                             !_isDescreptionVisible
                                 ? Icons.keyboard_double_arrow_up
                                 : Icons.keyboard_double_arrow_down,
                             size: 30,
                             color: Colors.blueAccent,
                           ))
                     ]),
                     Container(
                         // height: 100,
                         child: (_isDescreptionVisible)
                             ? Text(
                                 // getProductDescreption(),
                                 thisProduct.description!,
                                 style: TextStyle(
                                     fontSize: 16, color: Colors.black),
                               )
                             : null),
                   ],
                 ),
               ),
             ) ;
  }
}