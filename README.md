# Light and dark theme with custom color.


In this demo you can find add custom color in theme for light and dark theming. We this demo ThemeExtension to add customise colors.
Riverpod state management is use for handling app theme data.


![20230130_203347-COLLAGE_2](https://user-images.githubusercontent.com/25680329/215519691-3dd8654b-85b5-4e46-bb10-cbf9755c384e.jpg)

Use ThemeExtension for add custom color and attribute in ThemeData

```dart
class AppColors extends  ThemeExtension<AppColors> {
  final Color? color1;
  final Color? color2;
  final Color? color3;

  const AppColors({
    required this.color1,
    required this.color2,
    required this.color3,
  });

  @override
  AppColors copyWith({
    Color? color1,
    Color? color2,
    Color? color3,
  }) {
    return AppColors(
      color1: color1 ?? this.color1,
      color2: color2 ?? this.color2,
      color3: color3 ?? this.color3,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      color1: Color.lerp(color1, other.color1, t),
      color2: Color.lerp(color2, other.color2, t),
      color3: Color.lerp(color3, other.color3, t),
    );
  }
}
```

