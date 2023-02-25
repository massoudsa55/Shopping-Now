import 'constants/app_constants.dart';

extension NonNullString on String? {
  String orEmpty() => this == null ? AppConstants.empty : this!;
}

extension NonNullInteger on int? {
  int orZero() => this == null ? AppConstants.zero : this!;
}
