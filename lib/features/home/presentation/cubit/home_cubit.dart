import 'package:doctor_final/core/uitls/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());

  HomeCubit getCubit(context) => BlocProvider.of(context);

  void changeTheme() {
    AppConstants.isCurrentThemeDark = !AppConstants.isCurrentThemeDark;
    emit(ChangeAppThemeState());
  }
}
