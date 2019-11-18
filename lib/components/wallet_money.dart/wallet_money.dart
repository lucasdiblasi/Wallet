import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet/generated/i18n.dart';
import 'currency_view.dart';

import 'wallet_money_bloc.dart';
import 'wallet_money_view_model.dart';

class WalletMoney extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final WalletMoneyBloc bloc = Provider.of<WalletMoneyBloc>(context);

    return Column(
      children: <Widget>[
        StreamBuilder(
          stream: bloc.incomeViewModel,
          builder: (context, AsyncSnapshot<WalletCurrencyViewModel> snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }
            return CurrencyView(
              title: I18n.of(context).avaibleToInvestTitle,
              viewModel: snapshot.data,
              onChangeVisibility: bloc.changeIncomeVisibility,
            );
          },
        ),
        SizedBox(height: 10),
        StreamBuilder(
          stream: bloc.incomeSettleViewModel,
          builder: (context, AsyncSnapshot<WalletCurrencyViewModel> snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }
            return CurrencyView(
              title: I18n.of(context).toSettleTitle,
              viewModel: snapshot.data,
              onChangeVisibility: bloc.changeIncomeSettleVisibility,
            );
          },
        ),
      ],
    );
  }
}
