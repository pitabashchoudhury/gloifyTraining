part of 'detail_bloc.dart';

abstract class DetailEvent {
  const DetailEvent();
}

class AddDetailEvent extends DetailEvent {
  String? name;

  String? email;

  String? location;

  String? movie;

  AddDetailEvent({
    this.name,
    this.email,
    this.location,
    this.movie,
  });
}
