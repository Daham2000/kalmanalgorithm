import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalmanalgorithm/screens/bus_details_page/bus_details_view.dart';
import '../home_bloc.dart';

class BusDetailsProvider extends BlocProvider<HomeBloc> {
  BusDetailsProvider({Key? key})
      : super(
          key: key,
          create: (context) => HomeBloc(context),
          child: const BusDetailsView(),
        );
}
