import 'package:rxdart/rxdart.dart';

import 'wallet_money_view_model.dart';

class WalletMoneyBloc {
  final BehaviorSubject<WalletCurrencyViewModel> _incomeSubject =
      BehaviorSubject.seeded(
    WalletCurrencyViewModel(hide: true, value: 500),
  );

  final BehaviorSubject<WalletCurrencyViewModel> _incomeSettleSubject =
      BehaviorSubject.seeded(
    WalletCurrencyViewModel(hide: true, value: 1000),
  );

  Observable<WalletCurrencyViewModel> get incomeViewModel => _incomeSubject;

  Observable<WalletCurrencyViewModel> get incomeSettleViewModel =>
      _incomeSettleSubject;

  void changeIncomeVisibility() {
    _incomeSubject.add(
      WalletCurrencyViewModel(
        hide: !_incomeSubject.value.hide,
        value: _incomeSubject.value.value,
      ),
    );
  }

  void changeIncomeSettleVisibility() {
    _incomeSettleSubject.add(
      WalletCurrencyViewModel(
        hide: !_incomeSettleSubject.value.hide,
        value: _incomeSettleSubject.value.value,
      ),
    );
  }
}
