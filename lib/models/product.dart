import 'package:flutter/material.dart';

class Product {
  

String? productName;
String? description ;
String? category ;
dynamic ? price ;
int? id ;
int? count ;
String? image ;


Product.fromjson(List data, int index )
{
    
    productName = data[index]['title'];
    description = data[index]['description'];
    category = data[index]['category'] ;
    price = (data[index]['price']) ;
    id = data[index]['id'] ;
    count = data[index]['rating']['count'] ;
    image = data[index]['image'] ;
    

}
}