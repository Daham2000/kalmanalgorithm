class HomeState {
  String? error;
  String? routeDropValue;
  String? startPoint;
  String? endPoint;
  bool? isSelectionPage;

  HomeState({
    this.error,
    this.routeDropValue,
    this.isSelectionPage,
    this.startPoint,
    this.endPoint,
  });

  HomeState.init()
      : this(
          error: "",
          routeDropValue: "",
          startPoint: "",
          endPoint: "",
          isSelectionPage: false,
        );

  HomeState clone({
    String? error,
    String? routeDropValue,
    String? startPoint,
    String? endPoint,
    bool? isSelectionPage,
  }) {
    return HomeState(
      error: error ?? this.error,
      routeDropValue: routeDropValue ?? this.routeDropValue,
      isSelectionPage: isSelectionPage ?? this.isSelectionPage,
      startPoint: startPoint ?? this.startPoint,
      endPoint: endPoint ?? this.endPoint,
    );
  }

  static HomeState get initialState => HomeState(
        error: "",
        routeDropValue: null,
        startPoint: null,
        endPoint: null,
        isSelectionPage: false,
      );
}
