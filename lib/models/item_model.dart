import 'package:flutter/material.dart';


class ItemModel {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  String get name => nameController.text;
  String get price => priceController.text;
  String get quantity => quantityController.text;

  void dispose() {
    nameController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }

  // 선택된 시점의 snapshot을 넘길 때 유용
  ItemSnapshot toSnapshot() {
    return ItemSnapshot(
      name: name,
      price: price,
      quantity: quantity,
    );
  }
}


class ItemSnapshot {
  final String name;
  final String price;
  final String quantity;

  ItemSnapshot({required this.name, required this.price, required this.quantity});
}
