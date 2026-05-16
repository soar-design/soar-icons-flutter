library soar_icons;

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'src/icons.g.dart';

enum SoarIconStyle { line, solid, remix, duo, flat }

class SoarIconData {
  const SoarIconData({
    required this.name,
    required this.defaultStyle,
    required this.paths,
  });

  final String name;
  final SoarIconStyle defaultStyle;
  final Map<SoarIconStyle, String> paths;

  SoarIconData call(SoarIconStyle style) => _Variant(this, style)._asData();
}

class _Variant {
  _Variant(this.data, this.style);
  final SoarIconData data;
  final SoarIconStyle style;
  SoarIconData _asData() => SoarIconData(
        name: data.name,
        defaultStyle: style,
        paths: data.paths,
      );
}

class SoarIcon extends StatelessWidget {
  const SoarIcon(
    this.data, {
    super.key,
    this.size = 24,
    this.color,
    this.style,
    this.semanticLabel,
  });

  final SoarIconData data;
  final double size;
  final Color? color;
  final SoarIconStyle? style;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? IconTheme.of(context).color ?? const Color(0xFF000000);
    final pickedStyle = style ?? data.defaultStyle;
    final assetPath = data.paths[pickedStyle];
    if (assetPath == null) {
      throw FlutterError('SoarIcon "${data.name}" has no variant for style $pickedStyle');
    }
    return SvgPicture.asset(
      assetPath,
      package: 'soar_icons',
      width: size,
      height: size,
      semanticsLabel: semanticLabel,
      colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
    );
  }
}
