import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/common_widget/app_bar.dart';
import 'package:shop_app/common_widget/round_button.dart';

import '../../common/color_extension.dart';
import '../../common_widget/filter_row.dart';

class FilterView extends StatefulWidget {
  const FilterView({super.key});

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  List selectArr = [];

  List filterCatArr = [
    {
      "id": "1",
      "name": "Quần dài",
    },
    {
      "id": "2",
      "name": "Áo thun",
    },
    {
      "id": "3",
      "name": "Áo hoodie",
    },
    {
      "id": "4",
      "name": "Áo khoác",
    },
  ];

  List filterBrandArr = [
    {
      "id": "1",
      "name": "Nike",
    },
    {
      "id": "2",
      "name": "Gucci",
    },
    {
      "id": "3",
      "name": "Hermès",
    },
    {
      "id": "4",
      "name": "Louis Vuitton",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: TAppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          showBackArrow: true,
          title: const Text(
            "Bộ lọc",
            style: TextStyle(
                color: TColor.primaryText,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
          onPressed: () {
            Get.back();
          },
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              color: Color(0xffF2F3F2),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          "Danh mục",
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Column(
                        children: filterCatArr.map((fObj) {
                          return FilterRow(
                            fObj: fObj,
                            isSelect: selectArr.contains(fObj),
                            onPressed: () {
                              if (selectArr.contains(fObj)) {
                                selectArr.remove(fObj);
                              } else {
                                selectArr.add(fObj);
                              }
                              setState(() {});
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          "Thương hiệu",
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Column(
                        children: filterBrandArr.map((fObj) {
                          return FilterRow(
                            fObj: fObj,
                            isSelect: selectArr.contains(fObj),
                            onPressed: () {
                              if (selectArr.contains(fObj)) {
                                selectArr.remove(fObj);
                              } else {
                                selectArr.add(fObj);
                              }
                              setState(() {});
                            },
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ),
              ),
              RoundButton(title: "Áp dụng", onPressed: () {})
            ],
          ),
        ));
  }
}
