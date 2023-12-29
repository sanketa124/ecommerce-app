import 'package:amazon_clone/models/product_model.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:amazon_clone/widget/cost_widget.dart';
import 'package:amazon_clone/widget/rating_star_widget.dart';
import 'package:flutter/material.dart';

class ResultsWidget extends StatelessWidget {
  final ProductModel product;
  const ResultsWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: screenSize.width / 3,
              child: Image.network(product.url),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                product.productName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                children: [
                  SizedBox(
                      width: screenSize.width / 5,
                      child: FittedBox(
                          child: RatingStarWidget(rating: product.rating))),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      product.noOfRating.toString(),
                      style: const TextStyle(
                        color: activeCyanColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
              child: FittedBox(
                child: CostWidget(
                    color: const Color.fromARGB(255, 247, 23, 23),
                    cost: product.cost),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
