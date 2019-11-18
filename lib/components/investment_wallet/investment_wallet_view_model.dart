import 'dart:ui';

import 'package:flutter/foundation.dart';

class InvestmentWalletViewModel {
  const InvestmentWalletViewModel({@required this.items, @required this.amount})
      : assert(items != null),
        assert(amount != null);

  final Iterable<InvestmentWalletItemViewModel> items;
  final double amount;

  int get assets => items.fold(0, (sum, current) => sum + current.assets);
}

class InvestmentWalletItemViewModel {
  const InvestmentWalletItemViewModel(
      {@required this.assets,
      @required this.title,
      @required this.percent,
      @required this.color})
      : assert(assets != null),
        assert(percent != null),
        assert(color != null),
        assert(title != null);
  final String title;
  final int assets, percent;
  final Color color;
}
