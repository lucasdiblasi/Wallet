import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:provider/provider.dart';
import 'package:wallet/generated/i18n.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:wallet/shared_widgets/title_component.dart';

import 'investment_wallet_bloc.dart';
import 'investment_wallet_view_model.dart';

class InvestmentWallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final InvestmentWalletBloc bloc =
        Provider.of<InvestmentWalletBloc>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TitleComponent(I18n.of(context).investmentWalletTitle),
        Card(
          color: Colors.white,
          child: StreamBuilder(
            stream: bloc.investmentAmountViewModel,
            builder: (BuildContext context,
                AsyncSnapshot<InvestmentWalletViewModel> snapshot) {
              if (!snapshot.hasData) {
                return Container();
              }
              return Column(
                children: <Widget>[
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      Positioned(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              FlutterMoneyFormatter(
                                      amount: snapshot.data.amount)
                                  .output
                                  .symbolOnLeft,
                              style: Theme.of(context).textTheme.display1,
                            ),
                            Text(
                              I18n.of(context).assets(
                                snapshot.data.assets.toString(),
                              ),
                            )
                          ],
                        ),
                      ),
                      AnimatedCircularChart(
                        size: Size(
                          MediaQuery.of(context).size.width * 0.8,
                          MediaQuery.of(context).size.width * 0.8,
                        ),
                        initialChartData: _viewModelToChartData(snapshot.data),
                        chartType: CircularChartType.Radial,
                      ),
                    ],
                  ),
                  Wrap(
                    children: snapshot.data.items
                        .map((item) => InvestmentWalletItem(item: item))
                        .toList(),
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  List<CircularStackEntry> _viewModelToChartData(
      InvestmentWalletViewModel viewModel) {
    List<CircularStackEntry> data = [
      CircularStackEntry(
        viewModel.items
            .map(
              (item) => CircularSegmentEntry(
                item.percent.toDouble(),
                item.color,
                rankKey: item.title,
              ),
            )
            .toList(),
      ),
    ];

    return data;
  }
}

class InvestmentWalletItem extends StatelessWidget {
  const InvestmentWalletItem({Key key, @required this.item})
      : assert(item != null),
        super(key: key);

  final InvestmentWalletItemViewModel item;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: item.color,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(height: 4),
            Text(
              item.title,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .subtitle
                  .copyWith(color: Colors.black),
            ),
            SizedBox(height: 12),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    I18n.of(context).percent(
                      item.percent.toString(),
                    ),
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(width: 4),
                  Container(width: 1, color: Colors.black),
                  SizedBox(width: 4),
                  Text(
                    I18n.of(context).assets(item.assets.toString()),
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
