import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet/generated/i18n.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:wallet/shared_widgets/title_component.dart';
import '../wallet_profitability/wallet_profitability_view_model.dart';
import '../wallet_profitability/wallet_profitabily_bloc.dart';

class WalletProfitability extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final WalletProfitabilityBloc bloc =
        Provider.of<WalletProfitabilityBloc>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TitleComponent(I18n.of(context).walletProfitabilityTitle),
        StreamBuilder(
          stream: bloc.profitabilityViewModel,
          builder: (BuildContext context,
              AsyncSnapshot<Iterable<WalletProfitabilityViewModel>> snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }
            return Card(
              child: Container(
                padding: EdgeInsets.only(top: 24),
                child: LineChart(mainData(snapshot.data)),
              ),
            );
          },
        ),
      ],
    );
  }

  LineChartData mainData(List<WalletProfitabilityViewModel> items) {
    List<Color> gradientColors = [const Color(0xff23b6e6), Colors.white];
    return LineChartData(
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
            color: const Color(0xff68737d),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          getTitles: (value) => items[value.toInt()].month,
          margin: 20,
          reservedSize: 48,
        ),
        leftTitles: SideTitles(showTitles: false),
      ),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: items.length.toDouble() - 1,
      minY: 0,
      maxY: items.map((item) => item.value).fold(0, max),
      lineBarsData: [
        LineChartBarData(
          spots: _itemToChartData(items),
          isCurved: true,
          colors: gradientColors,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            gradientFrom: Offset(0, 0),
            gradientTo: Offset(0, 1),
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  List<FlSpot> _itemToChartData(List<WalletProfitabilityViewModel> items) {
    double count = 0;
    List<FlSpot> data = List();
    for (WalletProfitabilityViewModel item in items) {
      data.add(FlSpot(count, item.value));
      count += 1;
    }
    return data;
  }
}
