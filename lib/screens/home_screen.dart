import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:store_api_flutter_course/screens/cart_screen.dart';

import '../consts/global_colors.dart';
import '../models/product_model.dart';
import '../services/api_handler.dart';
import '../widgets/product_grid.dart';
import '../widgets/sales_widget.dart';
import 'categories_screen.dart';
import 'product_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _textEditingController;
  // List<ProductModel> productsList = [];
  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Home',
            style: GoogleFonts.poppins(
                textStyle:
                    TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                    child: const CategoriesScreen(),
                    type: PageTransitionType.fade),
              );
            },
            icon: const Icon(IconlyBold.category),
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: CartScreen(), type: PageTransitionType.fade));
                },
                icon: const Icon(Icons.shopping_cart))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 6, top: 0, right: 6, bottom: 3),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 3,
                ),
                TextField(
                  controller: _textEditingController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Search",
                      filled: true,
                      fillColor: Theme.of(context).cardColor,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Theme.of(context).cardColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              width: 1,
                              color: Theme.of(context).colorScheme.secondary)),
                      suffixIcon: Icon(
                        IconlyLight.search,
                        color: lightIconsColor,
                      )),
                ),
                SizedBox(
                  height: size.height * 0.25,
                  child: Swiper(
                    itemCount: 3,
                    itemBuilder: (ctx, index) {
                      return const SalesWidget();
                    },
                    pagination: const SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      builder: DotSwiperPaginationBuilder(
                          color: Colors.white, activeColor: Colors.black87),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Text(
                        'Latest Products',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.w600)),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                  child: const ProductScreen(),
                                  type: PageTransitionType.fade),
                            );
                          },
                          icon: const Icon(Icons.arrow_forward_ios_rounded)),
                    ],
                  ),
                ),
                FutureBuilder<List<ProductModel>>(
                    future: APIHandler.getAllProducts(limit: "4"),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(
                            child: Text("An error occured ${snapshot.error}"));
                      } else if (snapshot.data == null) {
                        return const Center(child: Text("No Products"));
                      }
                      return ProductGridWidget(productsList: snapshot.data!);
                    })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
