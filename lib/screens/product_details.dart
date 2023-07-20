import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import '../consts/global_colors.dart';
import '../models/product_model.dart';
import '../services/api_handler.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key, required this.id}) : super(key: key);

  @override
  final String id;
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  ProductModel? productModel;
  Future<void> getProductInfo() async{
    productModel = await APIHandler.getProductById(id: widget.id);
    setState(() {

    });
  }
  @override
  void didChangeDependencies() {
    getProductInfo();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: productModel == null ? Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BackButton(),
                    Text(
                      productModel!.category!.name.toString(),
                      style:
                         GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w400)
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 3,
                          child: Text(
                            productModel!.title.toString(),
                            textAlign: TextAlign.start,
                            style: GoogleFonts.poppins(fontSize: 28,fontWeight: FontWeight.w700),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: RichText(
                            text: TextSpan(
                                text: '\₹',
                                style: const TextStyle(
                                  fontSize: 25,
                                  color: Color.fromRGBO(33, 150, 243, 1),
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: productModel!.price.toString(),
                                    style: TextStyle(
                                        color: lightTextColor,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: size.height * 0.25,
                  child: Swiper(
                    itemCount: 3,
                    itemBuilder: (ctx, index) {
                      return FancyShimmerImage(
                        height: size.height * 0.2,
                        width: double.infinity,
                        errorWidget: Icon(
                          IconlyBold.danger,
                          color: Colors.red,
                          size: 28,
                        ),
                        imageUrl:
                        productModel!.images![index].toString(),
                        boxFit: BoxFit.fill,
                      );
                    },
                    pagination: const SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      builder: DotSwiperPaginationBuilder(
                          color: Colors.white, activeColor: Colors.black87),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productModel!.description.toString(),
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 20)
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Center(
                      child: ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(primary: lightIconsColor),child: Text("Add to cart",style: GoogleFonts.poppins(fontSize: 18,),
                      ),),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
