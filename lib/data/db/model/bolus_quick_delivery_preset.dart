import 'package:objectbox/objectbox.dart';

@Entity()
class BolusQuickDeliveryPreset {
  @Id()
  int no;

  String name;

  double doseU;

  BolusQuickDeliveryPreset({
    this.no = 0,
    required this.name,
    required this.doseU,
  });
}
