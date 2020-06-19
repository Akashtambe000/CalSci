part of 'main.dart';

class MyColors {
  MyColors._(); // this basically makes it so you can instantiate this class
  static const MaterialColor primary = const MaterialColor(
    0xFF396177, const <int, Color>{
    50 : const Color(0xFF90b5ca),
    100: const Color(0xFF79a6bf),
    200: const Color(0xFF6297b4),
    300: const Color(0xFF4f86a5),
    400: const Color(0xFF44748e),
    500: const Color(0xFF396177),
    600: const Color(0xFF2e4e60),
    700: const Color(0xFF233c49),
    800: const Color(0xFF182932),
    900: const Color(0xFF0d161b)
  },
  );
  static const MaterialColor green = const MaterialColor(
    0xFF4C9141, const <int, Color>{
    50 : const Color(0xFF8AC680),
    100: const Color(0xFF7DC072),
    200: const Color(0xFF70B964),
    300: const Color(0xFF62B356),
    400: const Color(0xFF58A94C),
    500: const Color(0xFF4C9141),
    600: const Color(0xFF4A8D3F),
    700: const Color(0xFF427F39),
    800: const Color(0xFF3B7133),
    900: const Color(0xFF34632C)
  },
  );
  static const MaterialColor red = const MaterialColor(
    0xFFE73A23, const <int, Color>{
    50 : const Color(0xFFED6B5A),
    100: const Color(0xFFED6A5A),
    200: const Color(0xFFEB5A47),
    300: const Color(0xFFEB5A47),
    400: const Color(0xFFE94A35),
    500: const Color(0xFFE73A23),
    600: const Color(0xFFCA2B16),
    700: const Color(0xFFB82714),
    800: const Color(0xFFA52312),
    900: const Color(0xFF932010)
  },
  );
}