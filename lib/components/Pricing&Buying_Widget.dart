import 'package:excercise/Providers/Products_Provider.dart';
import 'package:excercise/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PricingBuyingWidget extends StatelessWidget {
  PricingBuyingWidget({required this.productIndex});
  int productIndex;
  @override
  Widget build(BuildContext context) {
    Product thisProduct =
        Provider.of<ProductsProvider>(context).ListOfProducts![productIndex];
    return Padding(
        padding: EdgeInsets.only(top: 40, left: 15, right: 15),
        child: Container(
          width: double.infinity,
          height: 95,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Total Price',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      Text(
                        '\$${thisProduct.price}',
                        style: TextStyle(fontSize: 36, color: Colors.teal),
                      )
                    ],
                  ),
                ),
              ),
              Row(children: [
                // عدد المنتجات
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8))),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.shopping_bag_rounded,
                        size: 25,
                        color: Colors.white,
                      ),
                      Text(
                        '${thisProduct.count}',
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                // زر الشراء
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo, // اللون الأزرق ا
                    fixedSize: Size(120, 45),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                  ),
                  onPressed: () {
                    // أضف الوظيفة عند النقر
                    print("Buy Now button clicked!");
                  },
                  child: const Text(
                    'Buy Now',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ])
            ],
          ),
        ));
  }
}
