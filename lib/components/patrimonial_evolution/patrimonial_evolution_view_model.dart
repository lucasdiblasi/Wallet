import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class PatrimonialEvolutionItemViewModel {
  const PatrimonialEvolutionItemViewModel({
    @required this.title,
    @required this.color,
    @required this.values,
  })  : assert(title != null),
        assert(values != null),
        assert(color != null);
  final String title;
  final Color color;
  final Iterable<PatrimonialEvolutionItemValue> values;
}

class PatrimonialEvolutionItemValue {
  PatrimonialEvolutionItemValue({
    @required this.month,
    @required this.value,
  })  : assert(month != null),
        assert(value != null);
  final String month;
  final int value;
}
