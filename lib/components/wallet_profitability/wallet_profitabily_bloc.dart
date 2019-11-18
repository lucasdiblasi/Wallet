import 'package:rxdart/rxdart.dart';

import 'wallet_profitability_view_model.dart';

class WalletProfitabilityBloc {
  final BehaviorSubject<Iterable<WalletProfitabilityViewModel>>
      _profitabilityViewModel = BehaviorSubject.seeded(
    [
      WalletProfitabilityViewModel(month: '', value: 3),
      WalletProfitabilityViewModel(month: 'AGO', value: 5),
      WalletProfitabilityViewModel(month: 'SEP', value: 4),
      WalletProfitabilityViewModel(month: 'OCT', value: 7),
      WalletProfitabilityViewModel(month: 'NOV', value: 13),
      WalletProfitabilityViewModel(month: 'DEZ', value: 7),
      WalletProfitabilityViewModel(month: 'JAN', value: 8),
      WalletProfitabilityViewModel(month: 'FEB', value: 9),
      WalletProfitabilityViewModel(month: 'MAR', value: 11),
      WalletProfitabilityViewModel(month: 'APR', value: 10),
      WalletProfitabilityViewModel(month: '', value: 10),
    ],
  );

  Observable<Iterable<WalletProfitabilityViewModel>>
      get profitabilityViewModel => _profitabilityViewModel;
}
