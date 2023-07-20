import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import '../services/api_handler.dart';
import '../widgets/product_widget.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final ScrollController scrollController= ScrollController();
  List<ProductModel> productsList = [];
  int limit=10;
  bool isLoading=false;
  bool isLimit=false;
  @override
  void didChangeDependencies() {
    getProducts();
    super.didChangeDependencies();
    scrollController.addListener(() async{
      if(scrollController.position.pixels==scrollController.position.maxScrollExtent)
    {
      isLoading=true;
      limit=limit+10;
      await getProducts();
      isLoading=false;
    }});
  }
@override
    void dispose(){
    scrollController.dispose();
    super.dispose();
}

  Future<void> getProducts() async {
    productsList = await APIHandler.getAllProducts(limit: limit.toString());
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),
      ),
      body: productsList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        controller: scrollController,
            child: Column(
              children: [
                GridView.builder(
                    controller: scrollController,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: productsList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                        childAspectRatio: 0.6),
                    itemBuilder: (ctx, index) {
                      return ChangeNotifierProvider.value(
                        value: productsList[index],
                        child: const ProductWidget(
                        ),
                      );
                    },
                  ),
                if(isLoading)
                  const Center(child: CircularProgressIndicator(),),

              ],
            ),
          ),
    );
  }
}
