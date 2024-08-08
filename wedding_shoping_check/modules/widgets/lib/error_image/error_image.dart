import 'package:flutter_svg/svg.dart';
import 'package:gen/gen/assets.gen.dart';

class ErrorImage {
  static ErrorImage? _instance;
  static ErrorImage get instance {
    _instance ??= ErrorImage._init();
    return _instance!;
  }

  ErrorImage._init();

  SvgPicture show() {
    return Assets.image.errorSvg.svg(package: 'gen');
  }
}
