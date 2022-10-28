import 'package:bloc/bloc.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit()
      : super(DetailState(
          address: '',
          email: '',
          name: '',
        ));

  void addDetail(String name, String email, String address) {
    state.name = name;
    state.email = email;

    state.address = address;

    emit(
      DetailState(
        name: state.name,
        email: state.email,
        address: state.address,
      ),
    );
  }
}
