import 'package:trackexpense/objectbox.g.dart';
import 'package:trackexpense/profile_object_data_model.dart';
import 'package:trackexpense/rupee_object_data_model.dart';

class ObjectBox {
  late final Store store;
  late final Box<ProfileObjectModel> profileBox;
  late final Box<RupeeObjectDataModel> rupeeBox;

  ObjectBox._create(this.store) {
    profileBox = Box<ProfileObjectModel>(store);
    rupeeBox = Box<RupeeObjectDataModel>(store);
  }

  /// Create an ObjectBox instance
  static Future<ObjectBox> create() async {
    final store = await openStore();
    return ObjectBox._create(store);
  }
}
