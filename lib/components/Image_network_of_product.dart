import 'package:excercise/Providers/Products_Provider.dart';
import 'package:excercise/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImageNetworkOfProduct extends StatelessWidget {
  int productIndex;
  ImageNetworkOfProduct({required this.productIndex});

  @override
  Widget build(BuildContext context) {
    Product thisProduct =
        Provider.of<ProductsProvider>(context).ListOfProducts![productIndex];
    return Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          width: double.infinity,
          height: 275,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            border: Border.all(
              color: Colors.grey.shade300, // لون الحدود (خفيف)
              width: 3,
              // سمك الحدود
            ),
            borderRadius: BorderRadius.circular(15), // يجعل الحواف دائرية
          ),
          child: Image.network(
            thisProduct.image!,
            fit: BoxFit.contain,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          (loadingProgress.expectedTotalBytes ?? 1)
                      : null,
                  color: Colors.blueAccent,
                ),
              );
            },
          ),
        ));
  }
}
