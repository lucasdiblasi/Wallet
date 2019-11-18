import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'consolidated_position_view_model.dart';

class ConsolidatedPositionBloc {
  final BehaviorSubject<List<ConsolidatedViewModel>>
      _consolidatedViewModelSubject = BehaviorSubject.seeded(
    [
      ConsolidatedViewModel(
        grossBalance: 3860,
        quantity: 5,
        type: 'Fundos de Investimentos',
        color: Colors.blue[200],
      ),
      ConsolidatedViewModel(
        grossBalance: 3860,
        quantity: 5,
        type: 'Ações e Futuro',
        color: Colors.yellow[700],
      ),
      ConsolidatedViewModel(
        grossBalance: 3860,
        quantity: 5,
        type: 'Tesouro Direto',
        color: Colors.pink[900],
      ),
      ConsolidatedViewModel(
        grossBalance: 3860,
        quantity: 5,
        type: 'Renda Fixa',
        color: Colors.green[600],
      ),
      ConsolidatedViewModel(
        grossBalance: 3860,
        quantity: 5,
        type: 'Previdência Privada',
        color: Colors.blue[900],
      ),
    ],
  );

  Observable<List<ConsolidatedViewModel>> get consolidatedViewModel =>
      _consolidatedViewModelSubject;
}
