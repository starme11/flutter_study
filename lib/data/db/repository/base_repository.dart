import 'package:objectbox/objectbox.dart';

abstract class BaseRepository<T> {
  final Box<T> box;

  BaseRepository(this.box);

  int create(T entity) => box.put(entity);

  List<int> createMany(List<T> entities) => box.putMany(entities);

  T? getById(int id) => box.get(id);

  List<T> getAll() => box.getAll();

  void update(T entity) => box.put(entity);

  bool delete(int id) => box.remove(id);

  void deleteMany(List<int> ids) => box.removeMany(ids);

  int count() => box.count();

  bool isEmpty() => box.isEmpty();

  void deleteAll() => box.removeAll();

  Stream<List<T>> watchAll() {
    return box
        .query()
        .watch(triggerImmediately: true)
        .map((query) => query.find());
  }
}
