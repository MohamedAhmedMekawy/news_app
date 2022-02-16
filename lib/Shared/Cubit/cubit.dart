import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Shared/Cubit/state.dart';
import 'package:news_app/Shared/network/local/cach_helper.dart';

class AppCubit extends Cubit<AppState>{
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  bool isDark = false;

  void changeAppMode({bool? fromShared})
  {
    if (fromShared != null)
    {
      isDark = fromShared;
      emit(AppChangeModeState());
    } else
    {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }
  }
 /* bool isDark = false;

  void changeAppMode()
  {
    isDark =! isDark;
    emit(AppChangeModeState());
  }*/

}