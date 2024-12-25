import 'package:excercise/Providers/Products_Provider.dart';
import 'package:excercise/pages/Shop_page.dart';
import 'package:excercise/services/Product_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogInPage extends StatefulWidget {
  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Spacer(
        flex: 2,
      ),
      const CircleAvatar(
        // stroke color
        backgroundColor: Colors.green,
        radius: 105,
        child: CircleAvatar(
          radius: 100,
          backgroundImage: AssetImage('assets/images/localshop.png'),
        ),
      ),
      Divider(
        height: 8,
        color: Colors.white,
      ),
      Container(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              'Welcome To',
              style: TextStyle(fontSize: 26),
            ),
            Text(
              'SHOP LOCAL',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
      Spacer(
        flex: 1,
      ),
      ElevatedButton(
        onPressed: () async {
          await _checkInternetAndFetchProducts(context);
        },
        child: Text(
          'Shop now',
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green[400],
        ),
      ),
      Spacer(
        flex: 2,
      )
    ]));
  }

  Future<void> _checkInternetAndFetchProducts(BuildContext context) async {
    // تحقق من حالة الاتصال بالإنترنت
    /*  var connectivityResult = await connect. Connectivity().checkConnectivity(); */
    /*  if (connectivityResult == connect.ConnectivityResult.none) { */
    ///*    // إذا لم يكن هناك اتصال، أظهر رسالة للمستخدم */,الإنترنت والمحاولة مرة أخرى."),
    try {
      if (Provider.of<ProductsProvider>(context, listen: false)
              .ListOfProducts
              ?.isEmpty ??
          true) {
        ProductService service = ProductService();
        Provider.of<ProductsProvider>(context, listen: false).ListOfProducts =
            await service.getProductService();
      }
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ShopPage();
      }));
    } catch (e) {
      // التعامل مع الأخطاء أثناء جلب البيانات
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("خطأ"),
          content:
              Text("حدث خطأ أثناء جلب البيانات: تحقق من الاتصال بالأنترنت!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text("حسنًا"),
            ),
          ],
        ),
      );
    }
  }
}
