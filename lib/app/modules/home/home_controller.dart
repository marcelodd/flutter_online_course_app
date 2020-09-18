import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  @observable
  int day = 1;

  @observable
  int page = 1;

  @action
  setDaY(value) => day = value;

  @action
  setPage(value) => page = value;



}
