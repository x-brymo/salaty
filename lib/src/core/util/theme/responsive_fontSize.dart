import 'package:flutter/material.dart';


class ResponsiveFontSize{

  double getResponsiveFontSize (BuildContext context , {required double fontSize}){ 
    double scaleFactor = getScaleFactor(context);
    double responsiveFontSize = fontSize * scaleFactor;
    return responsiveFontSize;
  }

  double getScaleFactor(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if(width < 600){
      return 400;
    }else if (width < 900){
      return 700;
    }else{
      return 1000;
    }
  }
  // END Responsive Font Size
  // START Responsive Font Size (Responsive Font Size) PART 2
//    double getFontSize(BuildContext context) {
//   double screenWidth = ScreenUtil().screenWidth;
  
//   if (screenWidth <= 550) {
//     return 14.sp; // Small font size for screens <= 550
//   } else if (screenWidth <= 840) {
//     return 16.sp; // Medium font size for screens between 551 and 840
//   } else if (screenWidth <= 1200) {
//     return 18.sp; // Larger font size for screens between 841 and 1200
//   } else {
//     return 20.sp; // Extra large font size for screens > 1200
//   }
// }

  // END Responsive Font Size
    double getResponsiveFontSizeNormal(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  if (screenWidth <= 550) {
    return 11.0; // Small font size for screens <= 550
  } else if (screenWidth <= 840) {
    return 13.5; // Medium font size for screens between 551 and 840
  } else if (screenWidth <= 1200) {
    return 14.0; // Large font size for screens between 841 and 1200
  } else {
    return 16.0; // Extra large font size for screens > 1200
  }
}
// CREATE : extensions
 

}
extension ResponsiveFontSizeEX on BuildContext{
    double getResponsiveFontSizeNormal( ) {
  double screenWidth = MediaQuery.of(this).size.width;

  if (screenWidth <= 550) {
    return 11.0; // Small font size for screens <= 550
  } else if (screenWidth <= 840) {
    return 13.5; // Medium font size for screens between 551 and 840
  } else if (screenWidth <= 1200) {
    return 14.0; // Large font size for screens between 841 and 1200
  } else {
    return 16.0; // Extra large font size for screens > 1200
  }
}
}

