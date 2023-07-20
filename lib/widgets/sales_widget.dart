import 'package:flutter/cupertino.dart';

import '../consts/global_colors.dart';


class SalesWidget extends StatelessWidget {
   const SalesWidget({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
     return Container(
       width: double.infinity,
       height: size.height * 0.2,
       decoration: BoxDecoration(
       ),
       child: Row(
         children: [
           Flexible(
               flex: 3,
               child: Padding(
                 padding: const EdgeInsets.all(5),
                 child: Container(
                   height: double.infinity,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(6),
                     color: lightTextColor,
                   ),
                 ),

               ),
           ),
         ],
       ),
     );
   }
 }
