import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalmanalgorithm/screens/home_page.dart';

import 'home_bloc.dart';

class HomeProvider extends BlocProvider<HomeBloc> {
  HomeProvider({Key? key})
      : super(
    key: key,
    create: (context) => HomeBloc(context),
    child: const HomePage(),
  );
}
