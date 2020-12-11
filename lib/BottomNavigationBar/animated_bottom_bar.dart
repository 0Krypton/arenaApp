import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BarItem {
  String text;
  //IconData iconData;
  String iconData;
  Color color;

  BarItem({this.text, this.iconData, this.color});
}

class AnimatedBottomBar extends StatefulWidget {
  final List<BarItem> barItems;
  final Duration animationDuration;
  final Function onBarTap;

  const AnimatedBottomBar({
    Key key,
    this.barItems,
    this.animationDuration = const Duration(milliseconds: 500),
    this.onBarTap,
  }) : super(key: key);

//  final BarStyle barStyle;

  @override
  _AnimatedBottomBarState createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar>
    with TickerProviderStateMixin {
  int selectedBarIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 10.0,
          top: 10,
          left: 20,
          right: 20,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _buildBarItems(),
        ),
      ),
    );
  }

  List<Widget> _buildBarItems() {
    List<Widget> _barItems = List();

    for (int i = 0; i < widget.barItems.length; i++) {
      BarItem item = widget.barItems[i];
      bool isSelected = selectedBarIndex == i;
      _barItems.add(
        GestureDetector(
          // splashColor: Colors.transparent,
          onTap: () {
            setState(() {
              selectedBarIndex = i;
              widget.onBarTap(selectedBarIndex);
            });
          },
          child: AnimatedContainer(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            duration: widget.animationDuration,
            decoration: BoxDecoration(
              color: isSelected ? item.color : Colors.transparent,
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: isSelected ? item.color : Colors.transparent,
                  blurRadius: 30,
                ),
              ],
            ),
            child: SvgPicture.asset(
              item.iconData,
              color: isSelected ? Colors.white : Colors.black,
              width: 25,
              height: 25,
            ),
          ),
        ),
      );
    }
    return _barItems;
  }
}
