abstract class HomeEvent {}

class ChangeRoute extends HomeEvent {
  final String value;

  ChangeRoute(this.value);
}
