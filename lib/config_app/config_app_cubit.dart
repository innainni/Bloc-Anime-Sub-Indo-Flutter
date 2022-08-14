import 'package:bloc/bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:meta/meta.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:repository_anime_sub_indo/anime_sub_indo.dart';
import 'package:repository_anime_sub_indo/domain/model/config_app.dart';

part 'config_app_state.dart';

class ConfigAppCubit extends Cubit<ConfigAppState> {
  ConfigAppCubit() : super(ConfigAppInitial());

  AnimeSubIndo animeSubIndo = Injector().get<AnimeSubIndo>();

  getData() async {
    try {
      emit(ConfigAppLoading());
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      var result = await animeSubIndo.getConfigApp(packageInfo.packageName);
      emit(ConfigAppSuccess(configApp: result));
    } catch (e) {
      emit(ConfigAppError(message: e.toString()));
    }
  }
}
