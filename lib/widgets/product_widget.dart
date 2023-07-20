import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';
import 'package:store_api_flutter_course/models/product_model.dart';
import 'package:store_api_flutter_course/screens/product_details.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ProductModel productModelProvider = Provider.of<ProductModel>(context);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).cardColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    child: ProductDetails(id: productModelProvider.id.toString(),), type: PageTransitionType.fade),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                            text: '\₹',
                            style: const TextStyle(
                              color: Color.fromRGBO(33, 150, 243, 1),
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: "${productModelProvider.price}",
                                style: TextStyle(
                                    color: lightTextColor,
                                    fontWeight: FontWeight.w600),
                              ),
                            ]),
                      ),
                    ),
                    const Icon(Icons.favorite_outline_rounded),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FancyShimmerImage(
                  height: size.height * 0.2,
                  width: double.infinity,
                  errorWidget: const Icon(
                    IconlyBold.danger,
                    color: Colors.red,
                    size: 28,
                  ),
                  imageUrl:
                     productModelProvider.images![0],
                  boxFit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  productModelProvider.title.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                ),
              ),
                          ],
          ),
        ),
      ),
    );
  }
}
