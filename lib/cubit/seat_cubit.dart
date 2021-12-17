import 'package:bloc/bloc.dart';

class SeatCubit extends Cubit<List<String>> {
  SeatCubit() : super([]);

  void selectSeat(String id) {
    print('prev state $state');
    if (!isSelected(id)) {
      state.add(id);
    } else {
      state.remove(id);
    }
    emit(List.from(state));
    print('new state $state');
  }

  bool isSelected(String id) {
    int index = state.indexOf(id);
    return index == -1 ? false : true;
  }
}
