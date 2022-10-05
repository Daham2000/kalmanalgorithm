class HomeState {
  String? error;
  String? routeDropValue;
  bool? isSelectionPage;

  HomeState({
    this.error,
    this.routeDropValue,
    this.isSelectionPage,
  });

  HomeState.init()
      : this(
          error: "",
          routeDropValue: "",
          isSelectionPage: false,
        );

  HomeState clone({
    String? error,
    String? routeDropValue,
    bool? isSelectionPage,
  }) {
    return HomeState(
      error: error ?? this.error,
      routeDropValue: routeDropValue ?? this.routeDropValue,
      isSelectionPage: isSelectionPage ?? this.isSelectionPage,
    );
  }

  static HomeState get initialState => HomeState(
        error: "",
        routeDropValue: null,
        isSelectionPage: false,
      );
}
