import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';
import 'package:store_api_flutter_course/models/categories_model.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CategoriesModel categoryModelProvider = Provider.of<CategoriesModel>(context);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        color: lightScaffoldColor,
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FancyShimmerImage(
              height: size.width * 0.45,
              width: size.width * 0.45,
              errorWidget: Icon(
                IconlyBold.danger,
                color: Colors.red,
                size: 28,
              ),
              imageUrl:
              categoryModelProvider.image.toString(),
              boxFit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(categoryModelProvider.name.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(backgroundColor: Colors.white),),
          )
        ],),
      ),
    );
  }
}
