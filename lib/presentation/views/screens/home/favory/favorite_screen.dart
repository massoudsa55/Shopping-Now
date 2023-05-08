import 'package:flutter/material.dart';

import '../../../../../app/resources/colors/color_manager.dart';
import '../../../../../app/resources/values/app_size.dart';
import '../../../../../domain/models/favorate_model.dart';
import '../../../widgets/home/product/favorie_card.dart';
import '../../../widgets/home/product/order_product.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final listKey = GlobalKey<AnimatedListState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSize.s20),
          /*child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: demoListFavories.length,
            itemBuilder: (context, index) => Dismissible(
              key: Key(demoListFavories[index].toString()),
              background: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete, color: ColorManager.error),
                ),
              ),
              onDismissed: (direction) {
                setState(() {
                  demoListFavories.removeAt(index);
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppSize.s8,
                  horizontal: AppSize.s20,
                ),
                child: OrderCard(
                  image: demoListFavories[index].product.image,
                  brandName: demoListFavories[index].product.brandName,
                  title: demoListFavories[index].product.title,
                  price: demoListFavories[index].product.price,
                  priceAfetDiscount:
                      demoListFavories[index].product.priceAfetDiscount,
                  dicountpercent:
                      demoListFavories[index].product.dicountpercent,
                  press: () {},
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        demoListFavories.removeAt(index);
                      });
                    },
                    icon: Icon(Icons.delete, color: ColorManager.error),
                  ),
                ),
              ),
            ),
          ),*/
          child: AnimatedList(
            key: listKey,
            initialItemCount: demoListFavories.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index, animation) => Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppSize.s8,
                horizontal: AppSize.s20,
              ),
              child: FavoriteCard(
                productModel: demoListFavories[index].product,
                animation: animation,
                press: () => removeItem(index),
              ),
            ),
          ),
        ),
      ),
    );
  }

  removeItem(int index) {
    final removedItem = demoListFavories[index];
    demoListFavories.removeAt(index);
    listKey.currentState!.removeItem(
      index,
      (context, animation) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.s20,
        ),
        child: FavoriteCard(
          productModel: removedItem.product,
          press: () {},
          animation: animation,
        ),
      ),
      duration: const Duration(milliseconds: 600),
    );
  }
}
