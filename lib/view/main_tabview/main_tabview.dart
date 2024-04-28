import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shop_app/view/home/home_view.dart';

import '../../common/color_extension.dart';
import '../../view_model/favourite_view_model.dart';
import '../account/account_view.dart';
import '../explore/explore_view.dart';
import '../favourite/favourite_view.dart';
import '../my_cart/my_cart_view.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  int selectTab = 0;
  final favVM = Get.put(FavoriteViewModel());

  @override
  void initState() {
    super.initState();

    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    controller = TabController(length: 4, vsync: this);
    controller?.addListener(() {
      selectTab = controller?.index ?? 0;

      if (selectTab == 2) {
        favVM.serviceCalList();
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(controller: controller, children: const [
        HomeView(),
        // ExploreView(),
        MyCartView(),
        FavoritesView(),
        AccountView(),
      ]),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 3, offset: Offset(0, -2))
        ]),
        child: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: TabBar(
              controller: controller,
              indicatorColor: Colors.transparent,
              indicatorWeight: 1,
              labelColor: TColor.primary,
              labelStyle: const TextStyle(
                color: TColor.primary,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelColor: TColor.secondaryText,
              unselectedLabelStyle: const TextStyle(
                color: TColor.secondaryText,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              tabs: [
                Tab(
                  text: 'Trang chủ',
                  icon: Icon(
                    selectTab == 0 ? Iconsax.home_25 : Iconsax.home_2,
                    color:
                        selectTab == 0 ? TColor.primary : TColor.secondaryText,
                  ),
                ),
                // Tab(
                //   text: 'Khám phá',
                //   icon: Image.asset(
                //     "assets/img/explore_tab.png",
                //     width: 25,
                //     height: 25,
                //     color: selectTab == 1 ? TColor.primary : TColor.secondaryText,
                //   ),
                // ),
                Tab(
                  text: "Giỏ hàng",
                  icon: Icon(
                    selectTab == 1
                        ? Iconsax.shopping_bag5
                        : Iconsax.shopping_bag,
                    color:
                        selectTab == 1 ? TColor.primary : TColor.secondaryText,
                  ),
                ),
                Tab(
                  text: "Yêu thích",
                  icon: Icon(
                    selectTab == 2
                        ? Ionicons.heart_sharp
                        : Ionicons.heart_outline,
                    color:
                        selectTab == 2 ? TColor.primary : TColor.secondaryText,
                  ),
                ),
                Tab(
                  text: "Hồ sơ",
                  icon: Icon(
                    selectTab == 3
                        ? Ionicons.person_circle_sharp
                        : Ionicons.person_circle_outline,
                    color:
                        selectTab == 3 ? TColor.primary : TColor.secondaryText,
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
