import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet/generated/i18n.dart';
import 'package:wallet/shared_widgets/title_component.dart';

import 'patrimonial_evolution_bloc.dart';
import 'patrimonial_evolution_view_model.dart';

class PatrimonialEvolution extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PatrimonialEvolutionBloc bloc =
        Provider.of<PatrimonialEvolutionBloc>(context);
    return StreamBuilder(
      stream: bloc.patrimonialEvolutionViewModel,
      builder: (BuildContext context,
          AsyncSnapshot<Iterable<PatrimonialEvolutionItemViewModel>> snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }
        return TitleComponent(I18n.of(context).patrimonialEvolutionTitle);
      },
    );
  }
}
