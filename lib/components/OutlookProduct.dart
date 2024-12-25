import 'package:excercise/Providers/Products_Provider.dart';
import 'package:excercise/models/product.dart';
import 'package:excercise/pages/Produc_Details_page.dart';
import 'package:excercise/services/Product_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Outlookproduct extends StatelessWidget {
  final int index;

  Outlookproduct({required this.index});

  @override
  Widget build(BuildContext context) {
    Product internalProduct =
        Provider.of<ProductsProvider>(context).ListOfProducts![index];
    String getProductName() {
      return internalProduct.productName!.length > 25
          ? internalProduct.productName!.substring(0, 25)
          : internalProduct.productName!;
    }

    return Padding(
      padding: const EdgeInsets.only(top: 5, right: 5, left: 5),
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(197, 90, 212, 94)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 250,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        getProductName(),
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text('Price : \$${internalProduct.price ?? '100'}',
                          style: TextStyle(fontSize: 20)),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ProducDetailsPage(
                            productIndex: index,
                          );
                        }));
                      },
                      icon: const Icon(
                        Icons.remove_red_eye_outlined,
                        size: 40,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.only(left: 30),
                    )
                  ]),
            ),
            Flexible(
              child: CircleAvatar(
                //   backgroundImage: NetworkImage(globalProduct!.image!,scale: 2),
                radius: 85,
                backgroundColor: Colors.white,
                child: SizedBox(
                  child: ClipOval(
                    child: Image.network(
                      internalProduct.image!,
                      fit: BoxFit.contain,
                      height: 160,
                      width: 160,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) 
                        {return child ;}
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes !=null 
                              ?loadingProgress.cumulativeBytesLoaded/
                              (loadingProgress.expectedTotalBytes?? 1):
                               null,
                               color: Colors.blueAccent,
                            ),
                          );
                        
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
