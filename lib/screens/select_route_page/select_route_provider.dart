import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalmanalgorithm/screens/select_route_page/select_route_page.dart';

import '../home_bloc.dart';

class SelectRouteProvider extends BlocProvider<HomeBloc> {
  SelectRouteProvider({Key? key, required String mainRoute})
      : super(
          key: key,
          create: (context) => HomeBloc(context),
          child: SelectRoutePage(
            mainRoute: mainRoute,
          ),
        );
}
