abstract class HomeEvent {}

class ChangeRoute extends HomeEvent {
  final String value;

  ChangeRoute(this.value);
}

class ChangeStartPoint extends HomeEvent {
  final String value;

  ChangeStartPoint(this.value);
}

class ChangeEndPoint extends HomeEvent {
  final String value;

  ChangeEndPoint(this.value);
}
