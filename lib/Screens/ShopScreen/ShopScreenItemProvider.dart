import 'package:arena/Utilities/ShopScreenItemInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopScreenItemProvider extends ChangeNotifier {
  List<ShopScreenItemInfo> _storeItems = [
    ShopScreenItemInfo(
      off: false,
      title: 'Dark Fire Bundle',
      desc: 'Items:\n3 Skin, 3 Backblings\n3 PickeAxes, 3 Wraps\n1 Emote',
      bgImage: 'bundleimages/dark_fire_bundle/cube.jpg',
      bgSkinImage: 'bundleimages/dark_fire_bundle/darkpowerchord_bg.png',
      itemsImage: [
        'bundleimages/dark_fire_bundle/dark_power_chord.jpg',
        'bundleimages/dark_fire_bundle/molten_omen.jpg',
        'bundleimages/dark_fire_bundle/shadow_ark.jpg',
        'bundleimages/dark_fire_bundle/pickaxe_dark_strikers.jpg',
        'bundleimages/dark_fire_bundle/pickaxe_molten_strikers.jpg',
        'bundleimages/dark_fire_bundle/pickaxe_shadow_strikers.jpg',
        'bundleimages/dark_fire_bundle/dark_six_string.jpg',
        'bundleimages/dark_fire_bundle/molten_battle_shroud.jpg',
        'bundleimages/dark_fire_bundle/shadow_ark_wings.jpg',
        'bundleimages/dark_fire_bundle/dark_angular_shift.jpg',
        'bundleimages/dark_fire_bundle/molten_angular_shift.jpg',
        'bundleimages/dark_fire_bundle/shadow_angular_shift.jpg',
        'bundleimages/dark_fire_bundle/unification_emote.jpg',
      ],
      itemCount: 13,
      price: 19.99,
      isAvailable: true,
      color: Colors.purple[900],
    ),
    ShopScreenItemInfo(
      off: false,
      title: 'Deep Freeze Bundle',
      desc: 'Items:\n1 Skin, 1 Backblings\n1 PickeAxes, 1 Glider',
      bgImage: 'bundleimages/deep freeze bundle/happy_hamlet.jpg',
      bgSkinImage: 'bundleimages/deep freeze bundle/frostbite_bg.png',
      itemsImage: [
        'bundleimages/deep freeze bundle/frostbite.jpg',
        'bundleimages/deep freeze bundle/freezing_point.jpg',
        'bundleimages/deep freeze bundle/chill-axe.jpg',
        'bundleimages/deep freeze bundle/cold_glider.jpg',
      ],
      itemCount: 4,
      price: 19.99,
      isAvailable: true,
      color: Colors.blue[900],
    ),
    ShopScreenItemInfo(
      off: false,
      title: 'Derby Dynamo Pack',
      desc: 'Items:\n1 Skin, 1 Backbling\n1 Emote, x1000 Vbucks',
      bgImage: 'bundleimages/Derby Dynamo Challenge Pack/holly_hedges.jpg',
      bgSkinImage:
          'bundleimages/Derby Dynamo Challenge Pack/derbydynamo_bg.png',
      itemsImage: [
        'bundleimages/Derby Dynamo Challenge Pack/derby_dynamo.jpg',
        'bundleimages/Derby Dynamo Challenge Pack/quad-roller.jpg',
        'bundleimages/Derby Dynamo Challenge Pack/freewheelin.jpg',
        'bundleimages/Derby Dynamo Challenge Pack/vbucks_1000.png',
      ],
      itemCount: 4,
      price: 9.99,
      isAvailable: true,
      color: Colors.pink[400],
    ),
    ShopScreenItemInfo(
      off: false,
      title: 'Metal Team Leader',
      desc: 'Items:\n1 Skin, 1 Backbling\n1 x1000 Vbucks',
      bgImage: 'bundleimages/metal team leader pack/lake_side.jpg',
      bgSkinImage: 'bundleimages/metal team leader pack/metalteam_bg.png',
      itemsImage: [
        'bundleimages/metal team leader pack/metal_team_leader.jpg',
        'bundleimages/metal team leader pack/warning_bow.jpg',
        'bundleimages/metal team leader pack/vbucks_1000.png',
      ],
      itemCount: 3,
      price: 9.99,
      isAvailable: true,
      color: Colors.deepOrange[600],
    ),
    ShopScreenItemInfo(
      off: false,
      title: 'Shadow Rising Pack',
      desc: 'Items:\n3 Skins, 3 Backblings\n1 Wrap',
      bgImage: 'bundleimages/shadow rising pack/domsdomain.jpg',
      bgSkinImage: 'bundleimages/shadow rising pack/shadow_bg.png',
      itemsImage: [
        'bundleimages/shadow rising pack/shadow_skully.jpg',
        'bundleimages/shadow rising pack/stark_satche.jpg',
        'bundleimages/shadow rising pack/shadow_bird.jpg',
        'bundleimages/shadow rising pack/shadowbird_wings.jpg',
        'bundleimages/shadow rising pack/perfect_shadow.jpg',
        'bundleimages/shadow rising pack/perfect_wings.jpg',
        'bundleimages/shadow rising pack/array_wrap.jpg',
      ],
      itemCount: 7,
      price: 19.99,
      isAvailable: true,
      color: Colors.black87,
    ),
    ShopScreenItemInfo(
      off: false,
      title: 'Street Serpent Pack',
      desc: 'Items:\n1 Skin, 1 Backblings\n1 PickAxe, x600 Vbucks',
      bgImage: 'bundleimages/street serpent pack/grotto.png',
      bgSkinImage: 'bundleimages/street serpent pack/seeker_bg.png',
      itemsImage: [
        'bundleimages/street serpent pack/seeker_outfit.jpg',
        'bundleimages/street serpent pack/chainstick_backbling.jpg',
        'bundleimages/street serpent pack/street_blade_pickaxe.jpg',
        'bundleimages/street serpent pack/vbucks_600.png',
      ],
      itemCount: 4,
      price: 4.99,
      isAvailable: true,
      color: Colors.orange[900],
    ),
    ShopScreenItemInfo(
      off: false,
      title: 'Psycho Bundle',
      desc: 'Items:\n1 Skin, 1 Backblings\n1 PickAxe',
      bgImage: 'bundleimages/psycho_bundle/pandora.png',
      bgSkinImage: 'bundleimages/psycho_bundle/psycho_bg.png',
      itemsImage: [
        'bundleimages/psycho_bundle/psycho_skin.jpg',
        'bundleimages/psycho_bundle/pet_claptrap.jpg',
        'bundleimages/psycho_bundle/buzz_axes.jpg',
      ],
      itemCount: 3,
      price: 19.99,
      isAvailable: true,
      color: Color(0xFFE86839),
    ),
  ];

  List<ShopScreenItemInfo> get storeItems => _storeItems;

  List<InCartItemInfo> _inCart = [];
  List<InCartItemInfo> get inCart => _inCart;

  var _totalAmount;

  int get inCartItemTotal {
    _inCart.forEach(
      (element) {
        _totalAmount += element.price.toDouble();
      },
    );
    return _totalAmount;
  }

  void removeInCartItem(String title) {
    _inCart.removeWhere((element) => element.title == title);
    notifyListeners();
  }

  void addToCart(InCartItemInfo itemInfo) {
    int index =
        _inCart.indexWhere((element) => element.title == itemInfo.title);
    if (index == -1) {
      _inCart.add(
        InCartItemInfo(
          bgSkinImage: itemInfo.bgSkinImage,
          color: itemInfo.color,
          title: itemInfo.title,
          desc: itemInfo.desc,
          price: itemInfo.price,
          off: itemInfo.off,
          offPrice: itemInfo.offPrice,
          length: itemInfo.length,
        ),
      );
      notifyListeners();
    } else {
      var price = _inCart[index].price;
      var length = _inCart[index].length;
      price += _inCart[index].price.toDouble();
      length += _inCart[index].length;
      _inCart.removeAt(index);
      _inCart.add(
        InCartItemInfo(
          bgSkinImage: itemInfo.bgSkinImage,
          color: itemInfo.color,
          title: itemInfo.title,
          desc: itemInfo.desc,
          price: price,
          off: itemInfo.off,
          offPrice: itemInfo.offPrice,
          length: length,
        ),
      );
      notifyListeners();
    }

    // _inCart.map((e) {
    //   if (e.title == itemInfo.title) {
    //     var price = e.price;
    //     price += e.price.toDouble();
    //     var index = _inCart.indexWhere((element) => element.title == e.title);
    //     _inCart[index] = ShopScreenItemInfo(
    //       bgImage: itemInfo.bgImage,
    //       bgSkinImage: itemInfo.bgSkinImage,
    //       color: itemInfo.color,
    //       title: itemInfo.title,
    //       desc: itemInfo.desc,
    //       itemsImage: itemInfo.itemsImage,
    //       itemCount: itemInfo.itemCount,
    //       price: price,
    //       isAvailable: itemInfo.isAvailable,
    //       off: itemInfo.off,
    //       offPrice: itemInfo.offPrice,
    //     );
    //     notifyListeners();
    //   } else {
    //     _inCart.add(
    //       ShopScreenItemInfo(
    //         bgImage: itemInfo.bgImage,
    //         bgSkinImage: itemInfo.bgSkinImage,
    //         color: itemInfo.color,
    //         title: itemInfo.title,
    //         desc: itemInfo.desc,
    //         itemsImage: itemInfo.itemsImage,
    //         itemCount: itemInfo.itemCount,
    //         price: itemInfo.price,
    //         isAvailable: itemInfo.isAvailable,
    //         off: itemInfo.off,
    //         offPrice: itemInfo.offPrice,
    //       ),
    //     );
    //     notifyListeners();
    //   }
    // });
    // _inCart.add(
    //   ShopScreenItemInfo(
    //     bgImage: itemInfo.bgImage,
    //     bgSkinImage: itemInfo.bgSkinImage,
    //     color: itemInfo.color,
    //     title: itemInfo.title,
    //     desc: itemInfo.desc,
    //     itemsImage: itemInfo.itemsImage,
    //     itemCount: itemInfo.itemCount,
    //     price: itemInfo.price,
    //     isAvailable: itemInfo.isAvailable,
    //     off: itemInfo.off,
    //     offPrice: itemInfo.offPrice,
    //   ),
    // );
    // notifyListeners();
  }
}
