import 'package:flutter/foundation.dart';

class WalletProfitabilityViewModel {
  const WalletProfitabilityViewModel({
    @required this.value,
    @required this.month,
  })  : assert(value != null),
        assert(month != null);
  final double value;
  final String month;
}
