import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/colors.dart';
import 'package:food_delivery_app/dimensions.dart';
import 'package:food_delivery_app/widgets/app_column.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:food_delivery_app/widgets/icon_and_text_widget.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        //print("Current value is" + _currPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //slider section
    return Column(
      children: [
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            },
          ),
        ),
    new DotsIndicator(
    dotsCount: 5,
    position: _currPageValue,
    decorator: DotsDecorator(
    size: const Size.square(9.0),
    activeSize: const Size(18.0, 9.0),
    activeColor: AppColors.mainColor,
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    ),

    ),
        SizedBox(height: Dimensions.height30,),
        Container(
          margin: EdgeInsets.only(left:Dimensions.width30 ),
        child: Row(
          children: [
            BigText(text: "Popular"),
            SizedBox(width: Dimensions.width10,),
            Container(
              margin: const EdgeInsets.only(bottom: 3),
              child: BigText(text: ".", color:Colors.black26),
            ),
            SizedBox(width: Dimensions.width10,),
            Container(
              margin: const EdgeInsets.only(bottom: 2),
              child: SmallText(text: "Food Pairing", ),

            )
          ],
        ),
        ),
        //List of cards
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context,index){
              return Container(
                margin: EdgeInsets.only(left:Dimensions.width20,right: Dimensions.width20,bottom: Dimensions.height10),
                child: Row(
                  children: [
                    Container(
                      width:Dimensions.listViewImgSize,
                      height: Dimensions.listViewImgSize,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/image/food1.jpeg"))
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: Dimensions.listViewTextContSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(Dimensions.radius20),
                              topRight: Radius.circular(Dimensions.radius20)),
                          color: Colors.white
                        ),
                        child: Padding(
                          padding: EdgeInsetsGeometry.only(left: Dimensions.width10, right: Dimensions.width10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BigText(text: "Koshari Meat and Other Food",),
                              SizedBox(height: Dimensions.height10,),
                              SmallText(text: "this is food characteristics"),
                              SizedBox(height: Dimensions.height10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconAndTextWidget(
                                    icon: Icons.circle_sharp,
                                    text: "Normal",
                                    iconColor: AppColors.iconColor1,
                                  ),
                                  IconAndTextWidget(
                                    icon: Icons.location_on,
                                    text: "1.7KM",
                                    iconColor: AppColors.mainColor,
                                  ),
                                  IconAndTextWidget(
                                    icon: Icons.access_time_rounded,
                                    text: "32min",
                                    iconColor: AppColors.iconColor2,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          )
          ,

      ],
    );
  }

  Widget _buildPageItem(int index) {
    double distance = (_currPageValue - index).abs();

    // Scale calculation
    double scale = _scaleFactor + ((1 - _scaleFactor) * (1 - distance));
    scale = scale.clamp(_scaleFactor, 1.0);

    // Opacity calculation - adjacent items fade slightly
    double opacity = 1.0;
    if (distance > 0.5) {
      opacity = 1 - ((distance - 0.5) * 0.5);
    }
    opacity = opacity.clamp(0.5, 1.0);

    // Translation
    double translation = _height * (1 - scale) / 2;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Opacity(
        opacity: opacity,
        child: Transform(
          transform: Matrix4.diagonal3Values(1, scale, 1)
            ..setTranslationRaw(0, translation, 0),
          child: Stack(
            children: [
              Container(
                height: _height,
                margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/image/food1.jpeg"),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: Dimensions.pageViewTextContainer,
                  margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, bottom: Dimensions.width30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5,
                        offset: Offset(0, 5)
                      ), BoxShadow(
                          color: Colors.white,
                          offset: Offset(-5, 0)
                      ), BoxShadow(
                          color: Colors.white,
                          offset: Offset(5, 0)
                      ),

                    ]
                  ),
                  child: AppColumn(text: "Koshari",),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}