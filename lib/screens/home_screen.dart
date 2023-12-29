import 'package:amazon_clone/models/user_details_model.dart';
import 'package:amazon_clone/providers/resources/cloud_firestore_methods.dart';
import 'package:amazon_clone/widget/cat_hor_lvb.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/widget/adbanner.dart';
import 'package:amazon_clone/widget/banner_ad_widget.dart';
import 'package:amazon_clone/widget/loading.dart';
import 'package:amazon_clone/widget/products_showlv.dart';
import 'package:amazon_clone/widget/search_bar_widget.dart';
import 'package:amazon_clone/widget/simple_product_widget.dart';
import 'package:amazon_clone/widget/user_details_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();
  double offset = 0;
  List<Widget>? discount70;
  List<Widget>? discount60;
  List<Widget>? discount50;
  List<Widget>? discount0;

  @override
  void initState() {
    super.initState();
    getData();
    controller.addListener(() {
      setState(() {
        offset = controller.position.pixels;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void getData() async {
    List<Widget> temp70 =
        await CloudFirestoreClass().getProductsFromDiscount(70);
    List<Widget> temp60 =
        await CloudFirestoreClass().getProductsFromDiscount(60);
    List<Widget> temp50 =
        await CloudFirestoreClass().getProductsFromDiscount(50);
    List<Widget> temp0 = await CloudFirestoreClass().getProductsFromDiscount(0);
    print("everything is done");
    setState(() {
      discount70 = temp70;
      discount60 = temp60;
      discount50 = temp50;
      discount0 = temp0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(
        isReadOnly: true,
        hasBackButton: false,
      ),
      body: discount70 != null &&
              discount60 != null &&
              discount50 != null &&
              discount0 != null
          ? Stack(
              children: [
                SingleChildScrollView(
                  controller: controller,
                  child: Column(
                    children: [
                      SizedBox(
                        height: kAppBarHeight / 2,
                      ),
                      CategoriesHorizontalListViewBar(),
                      AdBannerWidget(),
                      ProductsShowcaseListView(
                          title: "Upto 70% Off", children: discount70!),
                      ProductsShowcaseListView(
                          title: "Upto 60% Off", children: discount60!),
                      ProductsShowcaseListView(
                          title: "Upto 50% Off", children: discount50!),
                      ProductsShowcaseListView(
                          title: "Explore", children: discount0!),
                    ],
                  ),
                ),
                UserDetailsBar(
                  offset: offset,
                ),
              ],
            )
          : const LoadingWidget(),
    );
  }
}
