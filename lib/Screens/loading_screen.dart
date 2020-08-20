import 'package:arena/Screens/ShopScreen/FortniteItemShop.dart';
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
          
          return FortniteItemShop(
            itemData: itemData,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SpinKitDoubleBounce(color: Color(0xFF008CCB).withOpacity(0.6), size: 50.0),
      ),
    );
  }
}
