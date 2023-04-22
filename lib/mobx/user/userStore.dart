import 'package:mobx/mobx.dart';

part 'userStore.g.dart';

class UserStore = _UserStore with _$UserStore;

final UserStore userStore = UserStore();

abstract class _UserStore with Store {
  @observable
  Map<String, dynamic> user = {};

  @action
  void setUser(Map<String, dynamic> data) => user = data;
}
