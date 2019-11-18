import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'components/consolidated_position/consolidated_position_bloc.dart';
import 'components/investment_wallet/investment_wallet_bloc.dart';
import 'components/patrimonial_evolution/patrimonial_evolution_bloc.dart';
import 'components/wallet_money.dart/wallet_money_bloc.dart';
import 'components/wallet_profitability/wallet_profitabily_bloc.dart';

Widget injectWalletDependencies(Widget child) {
  return MultiProvider(
    providers: [
      Provider.value(value: WalletMoneyBloc()),
      Provider.value(value: InvestmentWalletBloc()),
      Provider.value(value: WalletProfitabilityBloc()),
      Provider.value(value: ConsolidatedPositionBloc()),
      Provider.value(value: PatrimonialEvolutionBloc())
    ],
    child: child,
  );
}
