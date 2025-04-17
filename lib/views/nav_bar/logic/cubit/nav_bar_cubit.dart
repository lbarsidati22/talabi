import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabi/views/nav_bar/logic/cubit/nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(NavBarInitial());
  int currentIndex = 0;
  void changCurrentIndex(int index) {
    currentIndex = index;
    emit(IndexChanged());
  }
}
