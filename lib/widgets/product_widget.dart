import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Material(
        child: InkWell(
          child: Column(
            children: [
              Row(children: [
                Flexible(child: RichText(
                  text: TextSpan(),
                ),
                ),
              ],
              ),
            ],
          ),
        ),
      ),);
  }
}
