import 'package:setting/data/db/repository/bolus_quick_delivery_preset_repository.dart';
import 'package:setting/data/db/repository/repository_manager.dart';
import 'package:setting/data/preference/app_preference.dart';

class ServiceLocator {
  static ServiceLocator? _instance;
  static ServiceLocator get instance =>
      _instance ??= ServiceLocator._internal();
  ServiceLocator._internal();

  RepositoryManager? _repositoryManager;
  AppPreference? _appPreference;

  void registerRepositoryManager(RepositoryManager repositoryManager) {
    _repositoryManager = repositoryManager;
  }

  void registerAppPreference(AppPreference appPreference) {
    _appPreference = appPreference;
  }

  RepositoryManager get repositoryManager {
    if (_repositoryManager == null) {
      throw Exception("RepositoryManager is not registered");
    }
    return _repositoryManager!;
  }

  AppPreference get appPreference {
    if (_appPreference == null) {
      throw Exception("AppPreference is not registered");
    }
    return _appPreference!;
  }

  BolusQuickDeliveryPresetRepository get bolusQuickDeliveryPresetRepository {
    return repositoryManager.bolusPresetRepository;
  }
}
