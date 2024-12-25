import 'package:excercise/models/product.dart';
import 'package:flutter/material.dart';

class ProductsProvider extends ChangeNotifier{
  List<Product>? _ListOfProducts ;
  //setter
  void set ListOfProducts(List<Product>? list)
  {
    _ListOfProducts = list ;
    notifyListeners();
  }
  // getter
  List<Product>?  get ListOfProducts => _ListOfProducts;
  
  void clearProductList(){
    _ListOfProducts = [] ;
    notifyListeners();
    print('Numbers Of Products : ${_ListOfProducts!.length}');
  }
  
  


}