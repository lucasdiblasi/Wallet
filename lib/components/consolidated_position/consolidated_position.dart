import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:provider/provider.dart';
import 'package:wallet/generated/i18n.dart';

import 'package:wallet/shared_widgets/title_component.dart';
import '../consolidated_position/consolidated_position_bloc.dart';

import 'consolidated_position_view_model.dart';

class ConsolidatedPosition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ConsolidatedPositionBloc bloc =
        Provider.of<ConsolidatedPositionBloc>(context);
    return StreamBuilder(
      stream: bloc.consolidatedViewModel,
      builder: (BuildContext context,
          AsyncSnapshot<List<ConsolidatedViewModel>> snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TitleComponent(I18n.of(context).consolidatedPositionTitle),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(height: 1),
              itemBuilder: (BuildContext context, int index) {
                return ConsolidatedPositionItem(
                  backgroundColor:
                      index % 2 == 0 ? Colors.blueGrey[50] : Colors.white,
                  viewModel: snapshot.data[index],
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class ConsolidatedPositionItem extends StatelessWidget {
  const ConsolidatedPositionItem({
    Key key,
    @required this.backgroundColor,
    @required this.viewModel,
  })  : assert(backgroundColor != null),
        assert(viewModel != null),
        super(key: key);

  final Color backgroundColor;
  final ConsolidatedViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: 5,
              color: viewModel.color,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(viewModel.type,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle
                                .copyWith(color: Colors.black, fontSize: 15))),
                    Column(
                      children: [
                        Text(I18n.of(context).quantity,
                            style: Theme.of(context)
                                .textTheme
                                .headline
                                .copyWith(color: Colors.grey[600])),
                        Text(
                          I18n.of(context)
                              .assets(viewModel.quantity.toString())
                              .toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headline
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(width: 16),
                    Column(
                      children: [
                        Text(I18n.of(context).grossBalance,
                            style: Theme.of(context)
                                .textTheme
                                .headline
                                .copyWith(color: Colors.grey[600])),
                        Text(
                            FlutterMoneyFormatter(
                                    amount: viewModel.grossBalance)
                                .output
                                .symbolOnLeft,
                            style: Theme.of(context)
                                .textTheme
                                .headline
                                .copyWith(color: Colors.black))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 40,
              child: FlatButton(
                padding: EdgeInsets.zero,
                child: Center(
                  child: Icon(
                    Icons.add,
                    size: 20,
                    color: Colors.blue,
                  ),
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
