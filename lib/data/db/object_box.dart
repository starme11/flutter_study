import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:setting/data/db/model/bolus_quick_delivery_preset.dart';
import 'package:setting/objectbox.g.dart';

class ObjectBox {
  late final Store _store;

  late final Box<BolusQuickDeliveryPreset> _bolusPresetBox;

  ObjectBox._create(this._store) {
    _bolusPresetBox = Box<BolusQuickDeliveryPreset>(_store);
  }

  static Future<ObjectBox> create() async {
    final store = await openStore(
      directory: path.join(
        (await getApplicationDocumentsDirectory()).path,
        "objectbox",
      ),
    );
    return ObjectBox._create(store);
  }
}
