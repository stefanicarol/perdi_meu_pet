import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:perdimeupet/core/model/pet.model.dart';
import '../../core/app_response/app_response.model.dart';
import '../../core/repository/pet.repository.dart';

part 'lost_store.g.dart';

class LostStore = _LostStoreBase with _$LostStore;

abstract class _LostStoreBase with Store {
  final _repo = Modular.get<PetRepository>();

  @observable
  AppResponse<List<PetModel>> response = AppResponse();

  @observable
  List<PetModel>? petList;

  @action
  Future<List<PetModel>> fecth() async {
    response = AppResponse.loading(message: "logando");
    petList = await _repo.fetch();
    response = AppResponse.completed(petList, message: "logando");
    return petList!;
  }
}
