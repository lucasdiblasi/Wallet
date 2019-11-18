import 'dart:ui';
import 'package:flutter/foundation.dart';

class ConsolidatedViewModel {
  const ConsolidatedViewModel(
      {@required this.quantity,
      @required this.grossBalance,
      @required this.type,
      @required this.color})
      : assert(quantity != null),
        assert(grossBalance != null),
        assert(type != null),
        assert(color != null);
  final int quantity;
  final double grossBalance;
  final String type;
  final Color color;
}
