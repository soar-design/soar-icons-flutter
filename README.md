# soar_icons (Flutter)

Soar Icons for Flutter.

## Install

Flutter natively supports installing a subdirectory of a Git repo. Add this to your app's `pubspec.yaml`:

```yaml
dependencies:
  soar_icons:
    git:
      url: https://github.com/soar-design/soar-icons.git
      path: packages/flutter
      ref: main
```

Then `flutter pub get`.

The package depends on `flutter_svg` — it's pulled in transitively, no extra setup needed.

## Usage

```dart
import 'package:flutter/material.dart';
import 'package:soar_icons/soar_icons.dart';

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SoarIcon(SoarIcons.home01),
        SoarIcon(SoarIcons.home01, style: SoarIconStyle.solid, color: Colors.blue),
        SoarIcon(SoarIcons.home01, style: SoarIconStyle.bulk, size: 32),
      ],
    );
  }
}
```

Field names are camelCase. When several variants exist for one concept, they're numbered: `SoarIcons.home01` through `SoarIcons.home13`, `SoarIcons.sofa01` through `SoarIcons.sofa03`, etc. The full map is `SoarIcons.all`.

## Props

| Prop            | Type                                       | Default                              |
| --------------- | ------------------------------------------ | ------------------------------------ |
| `data`          | `SoarIconData`                             | required (positional, e.g. `SoarIcons.home01`) |
| `style`         | `SoarIconStyle?` (`line`/`solid`/`bulk`)   | the icon's default style (`line`)    |
| `size`          | `double`                                   | `24`                                 |
| `color`         | `Color?`                                   | `IconTheme.of(context).color`        |
| `semanticLabel` | `String?`                                  | —                                    |

### Notes

- **Color**: defaults to `IconTheme.of(context).color`, so Material/Cupertino theming inherits without configuration. Pass `color: ...` to override.
- **Bulk**: the secondary tone derives from your single `color` at 40% opacity (baked into the SVG via `fill-opacity`). You don't pass two colors.
- **Rendering**: `SvgPicture.asset` under the hood. The icons are bundled as assets within this package, so consumers don't declare them in their own `pubspec.yaml`.
