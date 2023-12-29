import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:amazon_clone/widget/cost_widget.dart';
import 'package:flutter/material.dart';

class ProductInformationWidget extends StatelessWidget {
  final String productName;
  final double cost;
  final String sellerName;

  const ProductInformationWidget(
      {super.key,
      required this.productName,
      required this.cost,
      required this.sellerName});

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    SizedBox spaceThingy = const SizedBox(
      height: 7,
    );

    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              productName,
              maxLines: 2,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  letterSpacing: 0.9,
                  overflow: TextOverflow.ellipsis),
            ),
          ),
          spaceThingy,
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CostWidget(color: Colors.black, cost: cost),
              )),
          spaceThingy,
          Align(
            alignment: Alignment.centerLeft,
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Sold by ",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 12,
                  )),
              TextSpan(
                  text: sellerName,
                  style: const TextStyle(
                    color: activeCyanColor,
                    fontSize: 14,
                  )),
            ])),
          ),
        ],
      ),
    );
  }
}
