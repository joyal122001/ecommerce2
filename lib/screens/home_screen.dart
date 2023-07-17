import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';
import 'package:store_api_flutter_course/widgets/product_widget.dart';

import '../widgets/sales_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _textEditingController;
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
          title: const Text('Home'),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(IconlyBold.category),
          ),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: const Icon(IconlyBold.user_2))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 18,
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
                  pagination: SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      builder: DotSwiperPaginationBuilder(
                          color: Colors.white, activeColor: Colors.red),
                  ),
                ),
              ),
              ProductWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
