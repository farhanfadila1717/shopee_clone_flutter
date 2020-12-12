import 'package:bloc/bloc.dart';

class BottomnavCubit extends Cubit<int> {
  BottomnavCubit() : super(0);

  void bottomNavSelectedIndex(int selectedIndex) {
    emit(selectedIndex);
  }
}
