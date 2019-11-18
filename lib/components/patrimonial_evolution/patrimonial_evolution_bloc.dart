import 'package:rxdart/rxdart.dart';

import 'patrimonial_evolution_view_model.dart';

class PatrimonialEvolutionBloc {
  final BehaviorSubject<Iterable<PatrimonialEvolutionItemViewModel>>
      _patrimonialEvolutionViewModelSubject = BehaviorSubject.seeded([]);

  Observable<Iterable<PatrimonialEvolutionItemViewModel>>
      get patrimonialEvolutionViewModel =>
          _patrimonialEvolutionViewModelSubject;
}
