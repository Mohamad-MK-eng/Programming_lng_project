import 'dart:convert';

import 'package:excercise/Providers/Products_Provider.dart';
import 'package:excercise/models/product.dart';
import 'package:http/http.dart' as http ;
import 'package:provider/provider.dart';
Product? globalProduct ;
  
class ProductService {
  ProductService();

Future<List<Product>> getProductService() async
{
  Uri url = Uri.parse('https://fakestoreapi.com/products#');
  
http.Response response = await http.get(url) ;
List data = jsonDecode(response.body) ;
List<Product> ProductList = [] ;
// initializing the Model List
for(int i=0;i<data.length;i++)
{
  ProductList.add( await Product.fromjson(data,i));
}

return ProductList ;
}
}