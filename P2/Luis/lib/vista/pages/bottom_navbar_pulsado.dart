import 'package:flutter_bloc/flutter_bloc.dart';
class BottomNavBarPulsado extends Cubit<int>{

  BottomNavBarPulsado() : super(0);
  void selectTab(int index) => emit(index);
}