import 'package:flutter/material.dart';
import 'package:foodapp/constants/colors.dart';
import 'package:foodapp/widgets/BigText.dart';
import 'package:foodapp/widgets/iconandTextWidget.dart';
import 'package:foodapp/widgets/smallText.dart';
import 'package:dots_indicator/dots_indicator.dart';
class foodPageSlider extends StatefulWidget {
  @override
  State<foodPageSlider> createState() => _foodPageSliderState();
}

class _foodPageSliderState extends State<foodPageSlider> {
  PageController _pagecontroller = PageController(viewportFraction: 0.9);
  var _currentPage = 0.0;
  var _scaleFactor = 0.8;
  var _height = 240;

  @override
  void initState() {
    super.initState();
    _pagecontroller.addListener(() {
      setState(() {
        _currentPage = _pagecontroller
            .page!; //pagecontroller.page hold current slider page value
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pagecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          //  color: Colors.blueAccent,
          child: PageView.builder(
              controller: _pagecontroller,
              itemCount: 5,
              itemBuilder: (ctx, position) {
                return _pageBuilder(position);
              }),
        ),const SizedBox(height: 5,),
     DotsIndicator(
  dotsCount: 5,
  position: _currentPage,
  decorator: DotsDecorator(         //dot indicator package
    size: const Size.square(9.0),
    activeSize: const Size(18.0, 9.0),
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
  ),
) ],
    );
  }

  Widget _pageBuilder(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPage.floor()) //.floor gives rounded value
    {
      var currScale = 1 - (_currentPage - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPage.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPage - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currScale, 0);
    } else if (index == _currentPage.floor() - 1) {
      var currScale = 1 - (_currentPage - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currScale, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
            height: 240,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: index.isEven
                    ? const Color(0xFF69c5df)
                    : const Color(0xFF9294cc),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/image/food0.png'))),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
                height: 110,
                width: 280,
                decoration: 
                BoxDecoration(boxShadow: const [ BoxShadow(color: Color(0xFFe8e8e8),
                  blurRadius: 1,offset: Offset(0, 5))],
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    ),
                child: Container(
                  margin: const EdgeInsets.only(left: 15, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: 'Chinese',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                                5,
                                (index) => const Icon(
                                      Icons.star,
                                      color: Colors.brown,
                                      size: 15,
                                    )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          smallText(
                            text: '4.3',
                            size: 15,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          smallText(
                            text: '1280  comments',
                            size: 15,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          IconTextWidget(
                              text: 'Distance',
                              iconn: Icons.location_on,
                              color: AppColors.mainColor,
                              iconcolor: AppColors.iconColor1),
                          IconTextWidget(
                              text: 'Normal',
                              iconn: Icons.circle_sharp,
                              color: AppColors.iconColor1,
                              iconcolor: AppColors.iconColor1),
                          IconTextWidget(
                              text: 'Time',
                              iconn: Icons.access_alarms_sharp,
                              color: AppColors.iconColor2,
                              iconcolor: AppColors.iconColor1)
                        ],
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
