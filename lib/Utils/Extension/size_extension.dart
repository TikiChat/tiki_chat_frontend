import 'package:tikichat_app/Utils/utils.dart';

extension SizeExtension on num {
  double get w => getWidth(this);

  double get h => getHeight(this);

  double get sp => getTextSize(this);

  double get pw => getPercentWidth(this);

  double get ph => getPercentHeight(this);

  double get px => getPixel(this);
}
