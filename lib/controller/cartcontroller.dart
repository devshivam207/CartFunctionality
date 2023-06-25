import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/models/fmodel.dart';

class CartController extends GetxController {
  RxMap<int, CartItemModel> cartlist = RxMap<int, CartItemModel>();

  void additem(int quant, Product pro) {
    var totalquantity = 0;
    if (cartlist.containsKey(pro.id)) {
      cartlist.update(pro.id, (value) {
        totalquantity = value.quantity + quant;
        return CartItemModel(
          id: value.id,
          pid: value.pid,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity + quant,
        );
      });
      if (totalquantity <= 0) {
        cartlist.remove(pro.id);
      }
    } else {
      if (quant > 0) {
        cartlist.putIfAbsent(pro.id, () {
          return CartItemModel(
            pid: pro.pid,
            id: pro.id,
            name: pro.name,
            price: pro.price,
            img: pro.img,
            quantity: quant,
          );
        });
      } else {
        Get.snackbar(
          "Please add items!",
          "Quantity should be greater than zero.",
          backgroundColor: Colors.tealAccent,
        );
      }
    }
    update();
    print(cartlist.length);
  }
}
