import 'package:flutter/cupertino.dart';

class SalesWidget extends StatelessWidget {
   const SalesWidget({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
     return Container(
       width: double.infinity,
       height: size.height * 0.2,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(18),
       ),
       child: Row(
         children: [
           Flexible(
               flex: 3,
               child: Padding(
                 padding: const EdgeInsets.all(14),
                 child: Container(
                   height: double.infinity,
                   decoration: BoxDecoration(
                     color: const Color(0xFF9689CE)
                   ),
                 ),

               ),
           ),
         ],
       ),
     );
   }
 }
