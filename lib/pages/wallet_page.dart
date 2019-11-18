import 'package:flutter/material.dart';
import 'package:wallet/components/consolidated_position/consolidated_position.dart';
import 'package:wallet/components/investment_wallet/investment_wallet.dart';
import 'package:wallet/components/patrimonial_evolution/patrimonial_evolution.dart';
import 'package:wallet/components/wallet_money.dart/wallet_money.dart';
import 'package:wallet/components/wallet_profitability/wallet_profitability.dart';
import 'package:wallet/generated/i18n.dart';

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text(I18n.of(context).walletPageTitle),
        backgroundColor: Colors.indigo[800],
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.pushNamed(context, '/profile'),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('images/avatar.png'),
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          shrinkWrap: true,
          children: [
            WalletMoney(),
            InvestmentWallet(),
            ConsolidatedPosition(),
            // PatrimonialEvolution(),
            WalletProfitability(),
          ],
        ),
      ),
    );
  }
}
