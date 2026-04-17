import 'package:get/get.dart';
class Dimensions {
  //Getting the screen Height & Width
static double screenHeight = Get.context!.height;
static double screenWidth = Get.context!.width;
//Divide the screen height:977.3 on the number of pixels
static double pageView = screenHeight/3.05;
static double pageViewContainer = screenHeight/4.44;
static double pageViewTextContainer = screenHeight/8.14;
//Dynamic Height
static double height10 = screenHeight/97.73;
static double height15 = screenHeight/65.15;
static double height20 = screenHeight/48.87;
static double height30 = screenHeight/32.58;
static double height45 = screenHeight/21.72;
static double bottomheight = screenHeight/8.14;
//Padding & Margin
static double width10 = screenHeight/97.73;
static double width15 = screenHeight/65.15;
static double width20 = screenHeight/48.87;
static double width30 = screenHeight/32.58;
static double width45 = screenHeight/21.72;


static double font20 = screenHeight/42.2;
static double font26 = screenHeight/32.46;

static double radius15 = screenHeight/56.27;
static double radius20 = screenHeight/42.2;
static double radius30 = screenHeight/28.13;

static double iconSize24 = screenHeight/35.17;
static double iconSize16 = screenHeight/52.75;

//list of size
static double listViewImgSize = screenWidth/3.5;
static double listViewTextContSize = screenWidth/3.9;

//popular food
static double popularFoodImgSize = screenHeight/2.71;
}