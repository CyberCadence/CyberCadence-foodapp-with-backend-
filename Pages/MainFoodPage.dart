import 'package:flutter/material.dart';
import 'package:foodapp/Pages/foodPageslider.dart';
import 'package:foodapp/constants/colors.dart';
import 'package:foodapp/widgets/BigText.dart';
import 'package:foodapp/widgets/smallText.dart';

class MainFoodPage extends StatefulWidget {
  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 30, bottom: 5),
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: 'Kerala',
                        color: AppColors.mainColor,
                        size: 28,
                      ),
                      Row(
                        children: [
                          smallText(text: 'Thrissur'),const Icon(Icons.arrow_drop_down)
                        ],
                      )
                    ],
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(12)),
                  )
                ],
              ),
            )
          ,foodPageSlider()],
        ),
      ),
    );
  }
}
