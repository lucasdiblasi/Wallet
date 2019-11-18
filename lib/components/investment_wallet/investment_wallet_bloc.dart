import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'investment_wallet_view_model.dart';

class InvestmentWalletBloc {
  final BehaviorSubject<InvestmentWalletViewModel>
      _investmentAmountViewModelSubject = BehaviorSubject.seeded(
    InvestmentWalletViewModel(
      items: [
        InvestmentWalletItemViewModel(
          assets: 5,
          percent: 10,
          title: 'Renda Fixa',
          color: Colors.green[600],
        ),
        InvestmentWalletItemViewModel(
          assets: 5,
          percent: 10,
          title: 'Fundos',
          color: Colors.blue[200],
        ),
        InvestmentWalletItemViewModel(
          assets: 5,
          percent: 10,
          title: 'Previdência',
          color: Colors.blue[900],
        ),
        InvestmentWalletItemViewModel(
          assets: 5,
          percent: 10,
          title: 'Ações/Futuro',
          color: Colors.yellow[700],
        ),
        InvestmentWalletItemViewModel(
          assets: 2,
          percent: 10,
          title: 'Tesouro',
          color: Colors.pink[900],
        ),
      ],
      amount: 2000,
    ),
  );

  Observable<InvestmentWalletViewModel> get investmentAmountViewModel =>
      _investmentAmountViewModelSubject;
}
