// For demo only

import 'package:equatable/equatable.dart';
import 'package:shopping_now/domain/models/product_model.dart';
import 'package:shopping_now/domain/models/user_model.dart';

class FavoriteModel extends Equatable {
  final String id;
  final UserModel user;
  final ProductModel product;

  const FavoriteModel(this.id, this.user, this.product);

  @override
  List<Object?> get props => [user, product];
}

List<FavoriteModel> demoListFavories = [
  FavoriteModel("fav001", demoUserModel, kFavorateProducts[0]),
  FavoriteModel("fav002", demoUserModel, kFavorateProducts[1]),
  FavoriteModel("fav003", demoUserModel, kFavorateProducts[2]),
  FavoriteModel("fav004", demoUserModel, kFavorateProducts[3]),
  FavoriteModel("fav005", demoUserModel, kFavorateProducts[4]),
  FavoriteModel("fav006", demoUserModel, kFavorateProducts[5]),
];
