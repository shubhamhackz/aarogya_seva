import 'package:flutter_svg/flutter_svg.dart';
import 'package:covid/constants/constants.dart';

class OnboardImage {
  static Map<String, ExactAssetPicture> svgImages = {
    'onboardOne': ExactAssetPicture((SvgPicture.svgStringDecoder), svgs[0]),
    'onboardTwo': ExactAssetPicture((SvgPicture.svgStringDecoder), svgs[1]),
    'onboardThree': ExactAssetPicture((SvgPicture.svgStringDecoder), svgs[2]),
    'onboardFour': ExactAssetPicture((SvgPicture.svgStringDecoder), svgs[3]),
  };
}
