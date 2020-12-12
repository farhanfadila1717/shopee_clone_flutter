import 'package:bloc/bloc.dart';

class AppbarCubit extends Cubit<double> {
  AppbarCubit() : super(0);

  void scrollOffset(double offset) {
    emit(offset);
  }
}
