import 'package:setting/data/db/model/bolus_quick_delivery_preset.dart';
import 'package:setting/data/db/repository/bolus_quick_delivery_preset_repository.dart';
import 'package:setting/objectbox.g.dart';

class RepositoryManager {
  final Store _store;
  late final BolusQuickDeliveryPresetRepository bolusPresetRepository;

  RepositoryManager(this._store) {
    bolusPresetRepository = BolusQuickDeliveryPresetRepository(_store.box<BolusQuickDeliveryPreset>());
  } 
}
