import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_colors.dart';


class MyWidgets {
  static Widget textView(String text, Color colors, double fontSize,
          {FontWeight? fontWeight}) =>
      Text(
        text,
        style: TextStyle(
            color: colors, fontSize: fontSize, fontWeight: fontWeight),
      );


  static productsView(double cardSize, String image, double imageWidth, double imageHeight
      , String productName, String companyName, String price, String priceOff, var increament,
      var decreament, var qntyValue){

    return
    Card(
      elevation: 2,
      shadowColor: AppColors.themeColor,
      margin: const EdgeInsets.all(4),
      child: Container(
        height: cardSize,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 10),
            Image.asset(
              image,
              width: imageWidth,
              height: imageHeight,
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 2, bottom: 2, left: 6, right: 8),
                  child: Text(
                    productName,
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 2, bottom: 2, left: 6, right: 8),
                  child: Text(
                    companyName,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 11),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 6, bottom: 4, left: 6, right: 1),
                      child: Text(
                        '\$. $price ',
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: const TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 6, right: 8),
                      child: Text(
                        priceOff,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: const TextStyle(
                            fontFamily: 'JosefinSans',
                            color: Colors.green,
                            fontWeight: FontWeight.w800,
                            fontSize: 14),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      top: 2, bottom: 10, left: 6, right: 8),
                  child: Text(
                    'Out of Stock',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w400,
                        fontSize: 11),
                  ),
                ),
                Obx(() => Container(
                  child: Row(
                    children: [
                      GestureDetector(
                        child: const Card(
                          child: Icon(Icons.add_box_rounded,
                              color: Colors.white),
                          color: Colors.black54,
                        ),
                        onTap: (){
                          increament;
                        },
                      ),
                      MyWidgets.textView(' $qntyValue ', Colors.black87, 17, fontWeight: FontWeight.w800),
                      GestureDetector(
                        onTap: (){
                          decreament;
                        },
                        child: const Card(
                          child: Icon(Icons.indeterminate_check_box,
                              color: Colors.white),
                          color: Colors.black54,
                        ),
                      )
                    ],
                  ),
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
