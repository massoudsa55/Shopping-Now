// For demo only

import 'package:equatable/equatable.dart';
import 'package:shopping_now/domain/models/product_model.dart';
import 'package:shopping_now/domain/models/user_model.dart';

class OrderModel extends Equatable {
  final String id;
  final UserModel user;
  final ProductModel product;

  const OrderModel(this.id, this.user, this.product);

  @override
  List<Object?> get props => [user, product];
}

List<OrderModel> demoListOrders = [
  OrderModel("ord001", demoUserModel, demoFlashSaleProducts[0]),
  OrderModel("ord001", demoUserModel, demoFlashSaleProducts[1]),
  OrderModel("ord001", demoUserModel, demoFlashSaleProducts[2]),
];
