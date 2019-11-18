import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:wallet/components/wallet_money.dart/wallet_money_view_model.dart';
import 'package:wallet/generated/i18n.dart';
import 'package:intl/intl.dart';

class CurrencyView extends StatelessWidget {
  const CurrencyView({
    @required this.viewModel,
    @required this.onChangeVisibility,
    @required this.title,
  })  : assert(viewModel != null),
        assert(title != null),
        assert(onChangeVisibility != null);
  final WalletCurrencyViewModel viewModel;
  final String title;
  final void Function() onChangeVisibility;

  @override
  Widget build(BuildContext context) {
    final Locale locale = Localizations.localeOf(context);
    final NumberFormat format =
        NumberFormat.simpleCurrency(locale: locale.toString());
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.only(left: 16, right: 8, top: 8, bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Text(
                        format.currencySymbol,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: viewModel.hide
                            ? Row(
                                children: [
                                  _BlackDot(),
                                  SizedBox(width: 10),
                                  _BlackDot(),
                                  SizedBox(width: 10),
                                  _BlackDot(),
                                  SizedBox(width: 10),
                                  _BlackDot(),
                                  SizedBox(width: 10),
                                  _BlackDot()
                                ],
                              )
                            : Text(
                                FlutterMoneyFormatter(amount: viewModel.value)
                                    .output
                                    .withoutFractionDigits,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.start,
                              ),
                      ),
                    ],
                  ),
                ),
                FlatButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onPressed: onChangeVisibility,
                  child: Text(
                    viewModel.hide
                        ? I18n.of(context).show
                        : I18n.of(context).hide,
                    style: Theme.of(context).textTheme.headline.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: -8,
            left: 16,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline,
            ),
          ),
        ],
      ),
    );
  }
}

class _BlackDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
