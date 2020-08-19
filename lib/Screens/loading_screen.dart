import 'package:arena/Screens/ShopScreen/ItemsScreen.dart';
import 'package:arena/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  static const id = 'Loading_Screen';

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    NetworkHelper networkHelper =
        NetworkHelper('https://fortniteapi.io/shop?lang=en');

    var itemData = await networkHelper.getData();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return MyItemsScreen(
            itemData: itemData,
          );
        },
      ),
    );
//    Navigator.push(
//      context,
//      MaterialPageRoute(
//        builder: (context) {
//          return MyItemsScreen(itemData: itemData,);
//        },
//      ),
//    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF131339),
      body: Center(child: SpinKitDoubleBounce(color: Colors.white, size: 50.0)),
    );
  }
}
