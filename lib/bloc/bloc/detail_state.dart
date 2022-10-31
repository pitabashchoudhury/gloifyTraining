part of 'detail_bloc.dart';

class DetailState {
  final String? name;
  final String? email;
  final String? movie;
  final String? location;

  DetailState({
    this.email,
    this.location,
    required this.movie,
    this.name,
  });

  DetailState copyWith({
    String? email,
    String? location,
    String? movie,
    String? name,
  }) {
    return DetailState(
      email: email,
      location: location,
      name: name,
      movie: movie,
    );
  }
}
