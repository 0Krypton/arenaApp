import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kShopScreenLabelTextStyle =
    GoogleFonts.nunito(color: Colors.black, fontSize: 30);
//////////////////////////////////////////////////////////////////

final kShopScreenFunkoPopTheme = GoogleFonts.nunito(
    color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900);

final kShopScreenFunkoPopPriceTheme = GoogleFonts.nunito(
    color: Colors.white, fontSize: 30, fontWeight: FontWeight.w900);

//////////////////////////////////////////////////////////////////

TextStyle kShopScreenItemNameTheme(Color textColor, double sizeFont) {
  return GoogleFonts.nunito(
    color: textColor,
    fontSize: sizeFont,
    fontWeight: FontWeight.w900,
  );
}


final TextStyle kStoreItemDetailPageTitle = GoogleFonts.nunito(
  color: Colors.white,
  fontSize: 25,
  fontWeight: FontWeight.w800
);
