extension StringExtension on String {
  String kmbGenerator(String x) {
    try {
      double num = double.parse(x);
      if (num > 999 && num < 99999) {
        return "${(num / 1000).toStringAsFixed(1)} K";
      } else if (num > 99999 && num < 999999) {
        return "${(num / 1000).toStringAsFixed(0)} K";
      } else if (num > 999999 && num < 999999999) {
        return "${(num / 1000000).toStringAsFixed(1)} M";
      } else if (num > 999999999) {
        return "${(num / 1000000000).toStringAsFixed(1)} B";
      } else {
        return x;
      }
    } catch (e) {
      return '';
    }
  }
}
