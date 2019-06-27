import 'package:provider/provider.dart';

import 'services/resources/repository.dart';
import 'view_models/user_details_view_model.dart';
import 'view_models/user_list_view_model.dart';


List<SingleChildCloneableWidget> getProviders() {
  return [
    ...independentServices,
    ...dependentServices,
    ...uiConsumableProviders,
  ];
}

List<SingleChildCloneableWidget> independentServices = [
  Provider.value(value: Repository()),
];

List<SingleChildCloneableWidget> dependentServices = [
];

List<SingleChildCloneableWidget> uiConsumableProviders = [

  ChangeNotifierProvider.value(value: UserListViewModel(repository: Repository())),
  ChangeNotifierProvider.value(value: UserDetailsViewModel(repository: Repository())),


];
