import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class WalletCurrencyViewModel {
  const WalletCurrencyViewModel({
    @required this.hide,
    @required this.value,
  })  : assert(hide != null),
        assert(value != null);
  final bool hide;
  final double value;
}
