import 'package:flutter_svg/flutter_svg.dart';

class SVGLoader {
  static Future<void> loadSVG(Map svgPictures) async {
    svgPictures.forEach((key, value) { 
      cachePictures(value);
    });
  }

  static Future<void> cachePictures(svgAssetProvider) async {
    await precachePicture(svgAssetProvider, null);
  }
}
