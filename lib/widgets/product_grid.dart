import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import 'product_widget.dart';

class ProductGridWidget extends StatelessWidget {
  const ProductGridWidget({Key? key, required this.productsList}) : super(key: key);
  final  List<ProductModel> productsList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 3,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          childAspectRatio: 0.6),
      itemBuilder: (ctx, index) {
        return ChangeNotifierProvider.value(
          value: productsList[index],
          child: ProductWidget(

          ),
        );
      },
    );
  }
}
