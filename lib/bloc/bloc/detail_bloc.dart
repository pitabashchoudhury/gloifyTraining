import 'package:bloc/bloc.dart';
part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailState(movie: 'Thriller Movie')) {
    on<AddDetailEvent>(
      (event, emit) {
        emit(
          state.copyWith(
            email: event.email,
            name: event.name,
            movie: event.movie,
            location: event.location,
          ),
        );
      },
    );
  }
}
